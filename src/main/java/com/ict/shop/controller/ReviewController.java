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
import com.ict.shop.dao.vo.ReviewVO;
import com.ict.shop.dao.vo.UserVO;
import com.ict.shop.service.review.ShopReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ShopReviewService reviewService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private Paging paging;

	@RequestMapping("review_list.do")
	public ModelAndView reviewList(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("review/review_list");
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");
		// 페이징 기법
		// 전체 게시물의 수
		int count = reviewService.getTotalCount();
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
		List<ReviewVO> review_list = reviewService.getReviewList(paging.getOffset(), paging.getNumPerPage(),uvo.getUser_idx());
		if (review_list != null) {
			mv.addObject("review_list", review_list);
			System.out.println(review_list);
			mv.addObject("paging", paging);
			return mv;
		}
		return new ModelAndView("review/error");
	}

	@GetMapping("review_write.do")
	public ModelAndView getReviewWrite() {
		return new ModelAndView("review/write");
	}

	@PostMapping("review_write_ok.do")
	public ModelAndView getReviewWriteOK(ReviewVO rvo, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:review_list.do");
			HttpSession session = request.getSession();
			UserVO uvo = (UserVO) session.getAttribute("uvo");
			System.out.println(uvo.getUser_idx());
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = rvo.getFile();
			if (file.isEmpty()) {
				rvo.setF_name("");
			} else {
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + file.getOriginalFilename();
				rvo.setF_name(f_name);

				byte[] in = file.getBytes();
				File out = new File(path, f_name);
				FileCopyUtils.copy(in, out);
			}

			rvo.setPwd(passwordEncoder.encode(rvo.getPwd()));
			int result = reviewService.getReviewInsert(rvo);
			System.out.println(result);
			if (result > 0) {
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("review/error");
	}

	@GetMapping("review_detail.do")
	public ModelAndView getReviewDetail(@ModelAttribute("cPage") String cPage, 
			String re_idx) {
		ModelAndView mv = new ModelAndView("review/detail");
		// hit 업데이트
		int result = reviewService.getReviewHit(re_idx);

		// 상세보기
		ReviewVO rvo = reviewService.getReviewDetail(re_idx);

		if (result > 0 && rvo != null) {
			mv.addObject("rvo", rvo);
			return mv;
		}
		return new ModelAndView("review/error");
	}

	@GetMapping("review_down.do")
	public void reviewDown(HttpServletRequest request, HttpServletResponse response) {
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

	@PostMapping("review_ans_write.do")
	public ModelAndView postReviewAnswerForm(@ModelAttribute("cPage") String cPage, @ModelAttribute("re_idx") String re_idx) {
	    // 구현 코드
	    return new ModelAndView("review/ans_write");
	}


	@PostMapping("review_ans_write_ok.do")
	public ModelAndView getReviewAnsWriteOK(@ModelAttribute("cPage") String cPage, ReviewVO rvo,
			HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			UserVO uvo = (UserVO) session.getAttribute("uvo");
			// 답글에서만 처리 할 일
			// 원글의 groups, step, lev를 가져와라
			ReviewVO rvo2 = reviewService.getReviewDetail(rvo.getRe_idx());

			int groups = Integer.parseInt(rvo2.getGroups());
			int step = Integer.parseInt(rvo2.getStep());
			int lev = Integer.parseInt(rvo2.getLev());
			String uvo2 = uvo.getUser_idx();
			// step, lev를 하나씩 올리자
			step++;
			lev++;
			
			// DB에서 lev를 업데이트 하자
			// ** groups이 같은 글을 찾아서 기존데이터의 레벨이 같거나 크면 기존 데이터의 레벨 증가
			Map<String, Integer> map = new HashMap<>();
			map.put("groups", groups);
			map.put("lev", lev);

			int result = reviewService.getLevUpdate(map);
			rvo.setGroups(String.valueOf(groups));
			rvo.setStep(String.valueOf(step));
			rvo.setLev(String.valueOf(lev));

			ModelAndView mv = new ModelAndView("redirect:review_list.do");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = rvo.getFile();
			if (file.isEmpty()) {
				rvo.setF_name("");
			} else {
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + file.getOriginalFilename();
				rvo.setF_name(f_name);

				byte[] in = file.getBytes();
				File out = new File(path, f_name);
				FileCopyUtils.copy(in, out);
			}

			rvo.setPwd(passwordEncoder.encode(rvo.getPwd()));

			int result2 = reviewService.getAnsInsert(rvo);
			if (result2 > 0) {
				
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("review/error");
	}

	@PostMapping("review_delete.do")
	public ModelAndView getReviewDelete(@ModelAttribute("cPage") String cPage, @ModelAttribute("re_idx") String re_idx) {
		return new ModelAndView("review/delete");
	}


	@PostMapping("review_delete_ok.do")
	public ModelAndView getReviewDeleteOk(@ModelAttribute("cPage") String cPage,
			@ModelAttribute("re_idx")String re_idx,
			ReviewVO rvo) {
		ModelAndView mv = new ModelAndView();

		// 비밀번호 체크
		ReviewVO rvo2 = reviewService.getReviewDetail(rvo.getRe_idx());
		String dpwd = rvo2.getPwd();

		if (!passwordEncoder.matches(rvo.getPwd(), dpwd)) {
			mv.setViewName("review/delete");
			mv.addObject("pwdchk", "fail");
			return mv;
		} else {
			// active 컬럼의 값을 1로 변경하자.
			int result = reviewService.getReviewDelete(rvo2);
			if (result > 0) {
				mv.setViewName("redirect:review_list.do");
				return mv;
			}
		}
		return new ModelAndView("review/error");
	}
	
	@PostMapping("review_update.do")
	public ModelAndView getReviewUpdate(@ModelAttribute("cPage") String cPage, 
			@ModelAttribute("re_idx") String re_idx) {
		ModelAndView mv = new ModelAndView("review/update");
		ReviewVO rvo = reviewService.getReviewDetail(re_idx);
		if(rvo != null) {
			mv.addObject("rvo", rvo);
			return mv;
		}
		return new ModelAndView("review/error");
	}
	@PostMapping("review_update_ok.do")
	public ModelAndView getReviewUpdateOK(
			@ModelAttribute("cPage")String cPage,
			@ModelAttribute("re_idx")String re_idx,
			ReviewVO rvo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		ReviewVO rvo2 = reviewService.getReviewDetail(rvo.getRe_idx());
		String dpwd = rvo2.getPwd();
		
		if(! passwordEncoder.matches(rvo.getPwd(), dpwd)) {
			rvo.setF_name(rvo.getOld_f_name());
			mv.addObject("pwchk", "fail");
			mv.addObject("rvo", rvo);
			mv.setViewName("review/update");
			return mv;
		}else {
			try {
				String path = request.getSession().getServletContext().getRealPath("/resources/upload");
				MultipartFile file = rvo.getFile();
				if(file.isEmpty()) {
					rvo.setF_name(rvo.getOld_f_name());
				}else {
					UUID uuid = UUID.randomUUID();
					String f_name = uuid.toString()+"_"+ file.getOriginalFilename();
					rvo.setF_name(f_name);
					
					byte[] in = file.getBytes();
					File out = new File(path, f_name);
					FileCopyUtils.copy(in, out);
				}
				int result = reviewService.getReviewUpdate(rvo);
				if(result>0) {
					mv.setViewName("redirect:review_detail.do");
					return mv;
				}
				
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return new ModelAndView("review/error");
	}
}













