package com.ict.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.HeartVO;
import com.ict.shop.dao.vo.OrderVO;
import com.ict.shop.dao.vo.UserVO;
import com.ict.shop.service.ShopService;

@Controller
public class MypageController {

	@Autowired
	private ShopService shopservice;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private HttpSession session;

//mypage==============================================================================================================================================
	@RequestMapping("mypage_addr_add.do") // 마이페이지 주소록 추가 페이지
	public ModelAndView Mypage_Addr_Add() {
		//ModelAndView mv = new ModelAndView("mypage/mypage_addr_add");
		return new ModelAndView("mypage/mypage_addr_add");
	}

	@PostMapping("mypage_addr_add_ok.do")
	public ModelAndView Mypage_Addr_Add_OK(AddrVO avo) {
		ModelAndView mv = new ModelAndView("redirect:mypage_addr.do");

		int result = shopservice.getAddrInsert(avo);
		if (result > 0) {
			return mv;
		} else {
			return new ModelAndView("mypage/error");
		}
	}

	@GetMapping("mypage_addr_edit.do") // 마이페이지 주소록 추가 페이지
	public ModelAndView Mypage_Addr_Edit(AddrVO avo) {
		ModelAndView mv = new ModelAndView("mypage/mypage_addr_edit");
		AddrVO avo1 = shopservice.getAddrDetail(avo);
		if (avo1 != null) {
			mv.addObject("avo", avo1);
			return mv;
		}
		return new ModelAndView("mypage/mypage_addr_edit");
	}

	@PostMapping("mypage_addr_edit_ok.do")
	public ModelAndView Mypage_Addr_Edit_OK(AddrVO avo) {
		ModelAndView mv = new ModelAndView();
			int result = shopservice.getAddrEdit(avo);
			if (result > 0) {
				mv.setViewName("redirect: mypage_addr.do");
				return mv;
			} else {
				return new ModelAndView("mypage/error");
			}
	}

	@RequestMapping("mypage_addr.do") // 마이페이지 주소록 페이지
	public ModelAndView Mypage_Addr() {
		ModelAndView mv = new ModelAndView("mypage/mypage_addr");
		List<AddrVO> list = shopservice.getAddrList();
		if (list != null) {
			mv.addObject("list", list);
			System.out.println("list222 : " + list);
			return mv;
		}
		return new ModelAndView("mypage/error");
	}

	@RequestMapping("mypage_changepwd.do") // 마이페이지 회원정보 내 비밀번호변경 페이지
	public ModelAndView Mypage_Changepwd() {
		return new ModelAndView("mypage/mypage_changepwd");
	}
	
	@PostMapping("mypage_changepwd_ok.do") // 마이페이지 회원정보 내 비밀번호변경 페이지
	public ModelAndView Mypage_ChangepwdOk(UserVO uvo, HttpServletRequest request, @RequestParam("pwd") String pwd,
			@RequestParam("pwd2") String pwd2, @RequestParam("c_pwd") String c_pwd) {
		ModelAndView mv = new ModelAndView();

		uvo.setUser_id("user1");

		UserVO vo2 = shopservice.firstchk(uvo.getUser_id());
		String dpwd = vo2.getUser_pwd();

		// 암호화 비교
		// if(passwordEncoder.matches(cpwd, dpwd)) {
		if (pwd.equals(pwd2)) { // 비밀번호 확인 확인
			if (dpwd.equals(c_pwd)) { // 입력한 비번 확인 후에 암호화

				uvo.setUser_pwd(pwd);
				int result = shopservice.getChangePwd(uvo);
				if (result > 0) {
					mv.setViewName("mypage/mypage_info");
					return mv;
				}
			} else {
				mv.setViewName("mypage/mypage_changepwd");
				mv.addObject("pwdchk", "fail");
				return mv;
			}
		} else {
			mv.setViewName("mypage/mypage_changepwd");
			mv.addObject("pwdchk", "chkfail");
			return mv;
		}
		return new ModelAndView("mypage/error");
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
	public ModelAndView Mypage_FirstChkOk(UserVO vo) {
		ModelAndView mv = new ModelAndView();

		String cpwd = vo.getUser_pwd();
		vo.setUser_id("user1"); // user1

		UserVO vo2 = shopservice.firstchk(vo.getUser_id());
		String dpwd = vo2.getUser_pwd();

		// 암호화 비교
		// if(passwordEncoder.matches(cpwd, dpwd)) {

		if (cpwd.equals(dpwd)) {
			mv.setViewName("mypage/mypage_stack");
			System.out.println("mv");
			return mv;
		} else {
			mv.setViewName("mypage/mypage_firstchk");
			mv.addObject("pwdchk", "fail");
			return mv;
		}

	}

	@GetMapping("mypage_heart.do") // 마이페이지 찜상품 페이지
	public ModelAndView Mypage_Heart() {
		ModelAndView mv = new ModelAndView("mypage/mypage_heart");
		List<HeartVO> vo_heart = shopservice.getShopHeartList();
		if (vo_heart != null) {
			mv.addObject("vo_heart", vo_heart);
			return mv;
		}
		return new ModelAndView("main/signup_fail");
	}

	@GetMapping("mypage_info.do") // 마이페이지 회원정보 페이지
	public ModelAndView Mypage_Info() {

		return new ModelAndView("mypage/mypage_info");
	}

	@GetMapping("mypage_notice.do") // 마이페이지 공지사항 페이지
	public ModelAndView Mypage_Notice() {

		return new ModelAndView("mypage/mypage_notice");
	}

	@GetMapping("mypage_order_after.do") // 마이페이지 결제 내역 페이지
	public ModelAndView Mypage_Order_After( String order_idx, String product_idx) {
	    ModelAndView mv = new ModelAndView("mypage/mypage_order_after");
	    List<OrderVO> orderList = shopservice.getOrderList(order_idx, product_idx);
	    if (orderList != null) {
	    	 mv.addObject("order_idx", order_idx);
	         mv.addObject("product_idx", product_idx);
	        mv.addObject("ovo", orderList);
	        System.out.println(orderList);
	        return mv;
	    }
	    return new ModelAndView("main/signup_fail");
	}
	
	@GetMapping("mypage_order.do") // 마이페이지 주문내역 페이지
	public ModelAndView Mypage_Order() {
		ModelAndView mv = new ModelAndView("mypage/mypage_order");
		List<OrderVO> order_list = shopservice.getShopOrderList();
		if (order_list != null) {
			mv.addObject("order_list", order_list);
			return mv;
		}
		return new ModelAndView("main/signup_fail");
	}
	
	@GetMapping("mypage_pwdchk.do") // 1:1 문의 하는 페이지
	public ModelAndView Mypage_Pwdchk() {
		
		return new ModelAndView("mypage/mypage_pwdchk");
	}
	
	@GetMapping("mypage_qna_update.do") // 1:1 문의 하는 페이지
	public ModelAndView Mypage_Qna_Update() {
		return new ModelAndView("mypage/mypage_qna_update");
	}
	
	@GetMapping("mypage_qna_write.do") // 1:1 문의 하는 페이지
	public ModelAndView Mypage_Qna_Write() {
		return new ModelAndView("mypage/mypage_qna_write");
	}
	
	@GetMapping("mypage_qna.do") // 1:1 문의 하는 페이지
	public ModelAndView Mypage_Qna() {
		return new ModelAndView("mypage/mypage_qna");
	}

	@RequestMapping("mypage_stack.do") // 마이페이지 메인페이지
	public ModelAndView Mypage_Stack() {
		return new ModelAndView("mypage/mypage_stack");
	}

}
