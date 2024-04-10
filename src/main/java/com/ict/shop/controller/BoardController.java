package com.ict.shop.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shop.common.Paging;
import com.ict.shop.dao.vo.BoardVO;
import com.ict.shop.dao.vo.UserVO;
import com.ict.shop.service.board.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private Paging paging;

	@RequestMapping("board_list.do")
	public ModelAndView boardList(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("board/board_list");
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");
		// 페이징 기법
		// 전체 게시물의 수
		int count = boardService.getTotalCount();
		paging.setTotalRecord(count);
		
		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		// 현재 페이지 구함
		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		// begin, end 구하기 (Oracle)
		// offset 구하기
		// offset = limit * (현재페이지-1);
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		// 시작 블록 // 끝블록
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		List<BoardVO> board_list = boardService.getBoardList(paging.getOffset(), paging.getNumPerPage(),uvo.getUser_idx());
		if (board_list != null) {
			mv.addObject("board_list", board_list);
			System.out.println(board_list);
			mv.addObject("paging", paging);
			return mv;
		}
		return new ModelAndView("board/error");
	}

	@GetMapping("board_write.do")
	public ModelAndView getBoardWrite() {
		return new ModelAndView("board/write");
	}

	@PostMapping("board_write_ok.do")
	public ModelAndView getBoardWriteOK(BoardVO bovo, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:board_list.do");
			HttpSession session = request.getSession();
			UserVO uvo = (UserVO) session.getAttribute("uvo");
			System.out.println(uvo.getUser_idx());
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = bovo.getFile();
			if (file.isEmpty()) {
				bovo.setF_name("");
			} else {
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + file.getOriginalFilename();
				bovo.setF_name(f_name);

				byte[] in = file.getBytes();
				File out = new File(path, f_name);
				FileCopyUtils.copy(in, out);
			}

			bovo.setPwd(passwordEncoder.encode(bovo.getPwd()));
			int result = boardService.getBoardInsert(bovo);
			System.out.println(result);
			if (result > 0) {
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("board/error");
	}

	@GetMapping("board_detail.do")
	public ModelAndView getBoardDetail(@ModelAttribute("cPage") String cPage, 
			String bo_idx) {
		ModelAndView mv = new ModelAndView("board/detail");
		// hit 업데이트
		int result = boardService.getBoardHit(bo_idx);

		// 상세보기
		BoardVO bovo = boardService.getBoardDetail(bo_idx);

		if (result > 0 && bovo != null) {
			mv.addObject("bovo", bovo);
			return mv;
		}
		return new ModelAndView("board/error");
	}

	@GetMapping("board_down.do")
	public void boardDown(HttpServletRequest request, HttpServletResponse response) {
		try {
			String f_name = request.getParameter("f_name");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/" + f_name);
			String r_path = URLEncoder.encode(path, "UTF-8");
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + r_path);

			File file = new File(new String(path.getBytes(), "UTF-8"));
			FileInputStream in = new FileInputStream(file);
			OutputStream out = response.getOutputStream();
			FileCopyUtils.copy(in, out);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	@PostMapping("ans_write.do")
	public ModelAndView getBoardAnsWrite(@ModelAttribute("cPage") String cPage,
			@ModelAttribute("bo_idx") String bo_idx) {
		return new ModelAndView("board/ans_write");
	}

	@PostMapping("board_ans_write_ok.do")
	public ModelAndView getBoardAnsWriteOK(@ModelAttribute("cPage") String cPage, BoardVO bovo,
			HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			UserVO uvo = (UserVO) session.getAttribute("uvo");
			// 답글에서만 처리 할 일
			// 원글의 groups, step, lev를 가져와라
			BoardVO bovo2 = boardService.getBoardDetail(bovo.getBo_idx());

			int groups = Integer.parseInt(bovo2.getGroups());
			int step = Integer.parseInt(bovo2.getStep());
			int lev = Integer.parseInt(bovo2.getLev());
			String uvo2 = uvo.getUser_idx();
			// step, lev를 하나씩 올리자
			step++;
			lev++;

			// DB에서 lev를 업데이트 하자
			// ** groups이 같은 글을 찾아서 기존데이터의 레벨이 같거나 크면 기존 데이터의 레벨 증가
			Map<String, Integer> map = new HashMap<>();
			map.put("groups", groups);
			map.put("lev", lev);

			int result = boardService.getLevUpdate(map);
			bovo.setGroups(String.valueOf(groups));
			bovo.setStep(String.valueOf(step));
			bovo.setLev(String.valueOf(lev));

			ModelAndView mv = new ModelAndView("redirect:board_list.do");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = bovo.getFile();
			if (file.isEmpty()) {
				bovo.setF_name("");
			} else {
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + file.getOriginalFilename();
				bovo.setF_name(f_name);

				byte[] in = file.getBytes();
				File out = new File(path, f_name);
				FileCopyUtils.copy(in, out);
			}

			bovo.setPwd(passwordEncoder.encode(bovo.getPwd()));

			int result2 = boardService.getAnsInsert(bovo);
			if (result2 > 0) {
				
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("board/error");
	}

	@PostMapping("board_delete.do")
	public ModelAndView getBoardDelete(@ModelAttribute("cPage") String cPage, @ModelAttribute("bo_idx") String bo_idx) {
		return new ModelAndView("board/delete");
	}


	@PostMapping("board_delete_ok.do")
	public ModelAndView getBoardDeleteOk(@ModelAttribute("cPage") String cPage,
			@ModelAttribute("bo_idx")String bo_idx,
			BoardVO bovo) {
		ModelAndView mv = new ModelAndView();

		// 비밀번호 체크
		BoardVO bovo2 = boardService.getBoardDetail(bovo.getBo_idx());
		String dpwd = bovo2.getPwd();

		if (!passwordEncoder.matches(bovo.getPwd(), dpwd)) {
			mv.setViewName("board/delete");
			mv.addObject("pwdchk", "fail");
			return mv;
		} else {
			// active 컬럼의 값을 1로 변경하자.
			int result = boardService.getBoardDelete(bovo2);
			if (result > 0) {
				mv.setViewName("redirect:board_list.do");
				return mv;
			}
		}
		return new ModelAndView("board/error");
	}
	
	@PostMapping("board_update.do")
	public ModelAndView getBoardUpdate(@ModelAttribute("cPage") String cPage, 
			@ModelAttribute("bo_idx") String bo_idx) {
		ModelAndView mv = new ModelAndView("board/update");
		BoardVO bovo = boardService.getBoardDetail(bo_idx);
		if(bovo != null) {
			mv.addObject("bovo", bovo);
			return mv;
		}
		return new ModelAndView("board/error");
	}
	@PostMapping("board_update_ok.do")
	public ModelAndView getBoardUpdateOK(
			@ModelAttribute("cPage")String cPage,
			@ModelAttribute("bo_idx")String bo_idx,
			BoardVO bovo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		BoardVO bovo2 = boardService.getBoardDetail(bovo.getBo_idx());
		String dpwd = bovo2.getPwd();
		
		if(! passwordEncoder.matches(bovo.getPwd(), dpwd)) {
			bovo.setF_name(bovo.getOld_f_name());
			mv.addObject("pwchk", "fail");
			mv.addObject("bovo", bovo);
			mv.setViewName("board/update");
			return mv;
		}else {
			try {
				String path = request.getSession().getServletContext().getRealPath("/resources/upload");
				MultipartFile file = bovo.getFile();
				if(file.isEmpty()) {
					bovo.setF_name(bovo.getOld_f_name());
				}else {
					UUID uuid = UUID.randomUUID();
					String f_name = uuid.toString()+"_"+ file.getOriginalFilename();
					bovo.setF_name(f_name);
					
					byte[] in = file.getBytes();
					File out = new File(path, f_name);
					FileCopyUtils.copy(in, out);
				}
				int result = boardService.getBoardUpdate(bovo);
				if(result>0) {
					mv.setViewName("redirect:board_detail.do");
					return mv;
				}
				
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return new ModelAndView("board/error");
	}
}













