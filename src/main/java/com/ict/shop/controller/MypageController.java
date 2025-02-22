package com.ict.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.OrderVO;
import com.ict.shop.dao.vo.UserVO;
import com.ict.shop.service.mypage.ShopMypageService;

@SessionAttributes("UserVO")

@Controller
public class MypageController {

	@Autowired
	private ShopMypageService shopmypageservice;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private HttpSession session;

//mypage==============================================================================================================================================
	@PostMapping("mypage_delete.do")
	public ModelAndView Mypage_Addr_Delete(String addr_idx, HttpServletResponse response) throws IOException {
	    ModelAndView mv = new ModelAndView();
	    int result = shopmypageservice.getAddrDelete(addr_idx);
	    if (result >0) {
	        mv.setViewName("redirect:mypage_addr.do") ;
	        return mv;
	    }
	    if(result<0) {
	    	PrintWriter out = response.getWriter();
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=utf-8");
            out.println("<script> alert('기본 배송지는 삭제할 수 없습니다..');");
            out.println("history.go(-1); </script>");
            out.close();

	    }
	    mv.setViewName("error");
	    return mv;
	}

	@RequestMapping("mypage_addr_add.do") // 마이페이지 주소록 추가 페이지
	public ModelAndView Mypage_Addr_Add() {
		return new ModelAndView("mypage/mypage_addr_add");
	}

	@PostMapping("mypage_addr_add_ok.do")
	public ModelAndView Mypage_Addr_Add_OK(AddrVO avo) {
		ModelAndView mv = new ModelAndView("redirect:mypage_addr.do");
		int result = shopmypageservice.getAddrInsert(avo);
		if (result > 0) {
			return mv;
		} else {
			return new ModelAndView("mypage/error");
		}
	}

	@RequestMapping("mypage_addr_edit.do") // 마이페이지 주소록 추가 페이지
	public ModelAndView Mypage_Addr_Edit(AddrVO avo) {
		ModelAndView mv = new ModelAndView("mypage/mypage_addr_edit");
		AddrVO avo1 = shopmypageservice.getAddrDetail(avo);
		if (avo1 != null) {
			mv.addObject("avo", avo1);
			return mv;
		}
		return new ModelAndView("mypage/mypage_addr_edit");
	}

	@PostMapping("mypage_addr_edit_ok.do")
	public ModelAndView Mypage_Addr_Edit_OK(AddrVO avo) {
		ModelAndView mv = new ModelAndView("");
			int result = shopmypageservice.getAddrEdit(avo);
			if (result > 0) {
				mv.setViewName("redirect: mypage_addr.do");
				return mv;
			} else {
				return new ModelAndView("mypage/error");
			}
	}

	@GetMapping("mypage_addr.do") // 마이페이지 주소록 페이지
	public ModelAndView Mypage_Addr(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView("mypage/mypage_addr");
	    // 세션에서 사용자 ID 가져오기
	    HttpSession session = request.getSession();
	    UserVO uvo = (UserVO) session.getAttribute("uvo");
	    
	    if (uvo.getUser_idx() != null) {
	        List<AddrVO> list = shopmypageservice.getMyAddrList(uvo.getUser_idx());
	        if (list != null) {
	        	System.out.println("컨트롤러1"+list);
	            mv.addObject("list", list);
	            return mv;
	        }
	    }

	    return new ModelAndView("mypage/error");
	}


	@RequestMapping("mypage_changepwd.do") // 마이페이지 회원정보 내 비밀번호변경 페이지
	public ModelAndView Mypage_Changepwd() {
		return new ModelAndView("mypage/mypage_changepwd");
	}

	@RequestMapping("mypage_changepwd_go.do") // 완료
	public ModelAndView Login_Changepwd(HttpServletRequest request,UserVO uvo) {
		try {
			String encodedPassword = passwordEncoder.encode(uvo.getUser_pwd());
			uvo.setUser_pwd(encodedPassword);
			uvo.setUser_id(request.getParameter("user_id"));
			int result = shopmypageservice.reset_pwd(uvo);
			if (result > 0) {
				ModelAndView mv = new ModelAndView("mypage/mypage_info");
				return mv;
			}else {
				return new ModelAndView("main/signup_fail"); 				
			}
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("main/signup_fail"); 
		}
		
		
	}

	@GetMapping("mypage_faq.do") // 마이페이지 자주 묻는 질문 페이지
	public ModelAndView Mypage_Faq() {
		return new ModelAndView("mypage/mypage_faq");
	}

	@RequestMapping("mypage_firstchk.do") // 마이페이지 진입 시 비밀번호 확인 페이지
	public ModelAndView Mypage_FirstChk() {
		return new ModelAndView("mypage/mypage_firstchk");
	}

	@RequestMapping("mypage_firstchk_ok.do")
	public ModelAndView Mypage_FirstChkOk(@RequestParam("user_pwd") String user_pwd, HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView();

		String user_id = (String) session.getAttribute("user_id");

		UserVO vo2 = shopmypageservice.firstchk(user_id);
		String dpwd = vo2.getUser_pwd();

		// 암호화 비교
		if (passwordEncoder.matches(user_pwd, dpwd)) {
			session.setAttribute("mypage_ok","ok");
			return new ModelAndView("redirect:mypage_stack.do");
		} else {
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			out.println("<script> alert('비밀번호가 틀립니다.');");
			out.println("history.go(-1); </script>");
			out.close();
			mv.setViewName("mypage_firstchk.do");
		}
		return null;
	}

	@GetMapping("mypage_heart.do") // 마이페이지 찜상품 페이지
	public ModelAndView Mypage_Heart(String user_idx, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mypage/mypage_heart");
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");
		List<OrderVO> vo_heart = shopmypageservice.getShopHeartList(user_idx);
		    if (vo_heart != null) {
		         mv.addObject("vo_heart", vo_heart);
		        return mv;
		    }
		    return new ModelAndView("main/signup_fail");
	}
	

	@RequestMapping("heart_cartlist_ok.do")
	public ModelAndView Heart_CartlistOK(String user_idx, HttpServletRequest request, OrderVO ovo) {
		ModelAndView mv = new ModelAndView("redirect:cart_list.do");
		UserVO uvo = (UserVO) session.getAttribute("uvo");
		
		ovo.setUser_idx(uvo.getUser_idx());
		int result = shopmypageservice.getCartListAdd(ovo);
		
		if (result > 0) {
			return mv;
		} else {
			return new ModelAndView("main/signup_fail");
		}
	}
	@GetMapping("mypage_info.do") // 마이페이지 회원정보 페이지
	public ModelAndView Mypage_Info() {
		return new ModelAndView("mypage/mypage_info");
	}

	@PostMapping("mypage_info_change_go.do")
	public ModelAndView Mypage_Info_Change(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();
	    UserVO uvo = (UserVO) session.getAttribute("uvo");
	    uvo.setUser_phone(request.getParameter("user_phone"));
	    uvo.setUser_email(request.getParameter("user_email"));
	    uvo.setUser_addr(request.getParameter("user_addr"));
	    
	    int res = shopmypageservice.Mypage_Info_Change(uvo);

	    if (res > 0) {
	    	session.setAttribute("uvo", uvo);
	        mv.setViewName("redirect:mypage_info.do");
	    } else {
	        return new ModelAndView("main/signup_fail");
	    }
	    return mv;
	}


	@GetMapping("mypage_notice.do") // 마이페이지 공지사항 페이지
	public ModelAndView Mypage_Notice() {

		return new ModelAndView("mypage/mypage_notice");
	}

	@GetMapping("mypage_order_after.do") // 마이페이지 결제 내역 페이지
	public ModelAndView Mypage_Order_After( String user_idx,HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView("mypage/mypage_order_after");
	    HttpSession session = request.getSession();
	    UserVO uvo = (UserVO) session.getAttribute("uvo");
	    List<OrderVO> orderList = shopmypageservice.getOrderList2(uvo.getUser_idx());
	    if (orderList != null) {
	        mv.addObject("ovo", orderList);
	        return mv;
	    }
	    return new ModelAndView("main/signup_fail");
	}

	@GetMapping("mypage_order.do") // 마이페이지 주문내역 페이지
	public ModelAndView Mypage_Order( String user_idx,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mypage/mypage_order");
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");
		List<OrderVO> orderList = shopmypageservice.getShopOrderList(uvo.getUser_idx());
		
		//구매내역, 구매 시간에 따른 배송 상태 변경
		
		int result = shopmypageservice.getDeliveryStatus(orderList);
		
		if(result > 0) {
			 if (orderList != null) {
		         mv.addObject("uvo", uvo);
				 mv.addObject("ovo", orderList);
				 return mv;
			}
		}
			return new ModelAndView("main/signup_fail");
		}
		 
	@GetMapping("confirm.do") // 마이페이지 주문내역 페이지
	public ModelAndView Confirm( String order_idx) {
		ModelAndView mv = new ModelAndView("redirect:mypage_order.do");
		 int result = shopmypageservice.orderupdate4(order_idx);
			if (result > 0) {
				return mv;
			}
				return new ModelAndView("main/signup_fail");
		}
	

	@RequestMapping("mypage_stack.do") // 마이페이지 메인페이지
	public ModelAndView Mypage_Stack(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mypage/mypage_stack");
		 HttpSession session = request.getSession();
		 UserVO uvo = (UserVO) session.getAttribute("uvo");
		
		
		UserVO uvo2 = shopmypageservice.getMypage_Info(uvo.getUser_id());
		mv.addObject("point", uvo2.getUser_point());
		return mv;
	}
}
