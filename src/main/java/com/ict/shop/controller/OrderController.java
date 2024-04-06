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
import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.OrderVO;
import com.ict.shop.dao.vo.UserVO;
import com.ict.shop.service.ShopService;

@Controller
public class OrderController {

	@Autowired
	private ShopService shopservice;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private HttpSession session;

//order===================================================================================================================================================================
	@GetMapping("cart_list.do") // 장바구니 페이지
	public ModelAndView cart_List(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("order/cart_list");
		try {
			HttpSession session = request.getSession();
			UserVO uvo = (UserVO) session.getAttribute("uvo");

			CartListVO cvo = new CartListVO();
			List<CartListVO> cartlist = shopservice.getCartList(uvo.getUser_idx());
			if (cartlist != null) {
				mv.addObject("cartlist", cartlist);
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("login/singup_fail");
	}

	@PostMapping("cartlist_delete.do")
	public ModelAndView cartlistDelete(HttpServletRequest request) { // 장바구니 삭제
		ModelAndView mv = new ModelAndView("redirect:cart_list.do");
		String[] cart_check_idx = request.getParameterValues("cart_check_idx");

		int result = 0;
		if (cart_check_idx != null) {
			for (String cartlist_idx : cart_check_idx) {
				result = shopservice.getCartlistDelete(cartlist_idx);
			}
			if (result > 0) {
				return mv;
			} else {
				return mv;
			}
		}
		return new ModelAndView("login/singup_fail");
	}

	@PostMapping("cartlist_edit.do") // 수량 변경
	public ModelAndView cartlistEdit(CartListVO cvo, @RequestParam("cartlist_idx") String[] cartlist_idx,
			@RequestParam("cartlist_count") String[] cartlist_count, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");

		ModelAndView mv = new ModelAndView("redirect:cart_list.do");
		int result = shopservice.getCartlistEdit(cvo);
		if (result > 0) {
			return mv;
		}
		return new ModelAndView("login/singup_fail");
	}

	@PostMapping("cartlist_select_pay.do") // 선택구매시
	public ModelAndView cartlistSelectPay(@RequestParam("cart_check_idx") String[] cart_check_idx,
			@RequestParam("check_number") String[] check_number, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");

		// 선택한 주문이 없을 때
		if (cart_check_idx == null) {
			mv.setViewName("redirect:cart_list.do?cartlist_status=check_none");
			return mv;
		}

		// 가장 큰 수 가져오기
		List<CartListVO> orderlist = shopservice.getCartlistOrderIdx();
		int maxIdx = 0;

		// order_idx 값 중복 안 되게
		for (int i = 0; i < orderlist.size(); i++) {
			int cIdx = Integer.parseInt(orderlist.get(i).getOrder_idx());
			if (cIdx > maxIdx) {
				maxIdx = cIdx;

			}
		}
		maxIdx++;
		CartListVO cvo = new CartListVO();
		// 주소 가져오기
		CartListVO cvo2 = shopservice.getCartListAddr(uvo.getUser_idx());
		int result = 0;
		int result2 = 0;

		for (int j = 0; j < cart_check_idx.length; j++) {
			// 선택한 제품
			cvo = shopservice.getCartlistSelect(cart_check_idx[j]);

			// order_number 계산
			int su = Integer.parseInt(cvo.getCartlist_count());
			int price = Integer.parseInt(cvo.getCartlist_number());
			cvo.setOrder_number(String.valueOf(su * price));

			cvo.setAddr_idx(cvo2.getAddr_idx());
			cvo.setOrder_idx(String.valueOf(maxIdx)); // order_idx 같게

			result = shopservice.getCartlistPass(cvo);

		}
		if (result > 0) {
			for (String k : cart_check_idx) {
				result2 = shopservice.getCartlistDelete(k); // 결제로 넘어간 건 삭제
			}
			mv.setViewName("redirect:order_pay.do?order_idx=" + maxIdx);
			return mv;
		}

		mv.setViewName("redirect:cart_list.do?cartlist_status=error");
		return null;
	}

	@RequestMapping("order_pay.do")
	public ModelAndView Order_Pay(String order_idx, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("order/order_pay");
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");
		OrderVO ovo = new OrderVO();
		ovo.setUser_idx(uvo.getUser_idx());
		ovo.setOrder_idx(order_idx);
		List<OrderVO> list = shopservice.orderaddrproduct(ovo);
		if (list != null) {
			mv.addObject("vo", list);
			mv.addObject("uvo", uvo);
			return mv;
		}
		return new ModelAndView("main/signup_fail");
	}

	@RequestMapping("mypage_addr_select.do")
	public ModelAndView Mypage_addr_Select(@RequestParam("order_idx") String order_idx, HttpServletRequest request) {
		System.out.println("여기 : " + order_idx); // 성공
		ModelAndView mv = new ModelAndView("mypage/mypage_addr_select");
		// 세션에서 사용자 ID 가져오기
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");

		OrderVO ovo = new OrderVO();
		ovo.setUser_idx(uvo.getUser_idx());
		ovo.setOrder_idx(order_idx);

		if (uvo.getUser_idx() != null) {
			List<OrderVO> list = shopservice.getAddrList(ovo);
			if (list != null) {
				mv.addObject("list", list);
				return mv;
			}
		}
		return new ModelAndView("mypage/error");
	}

	@RequestMapping("addr_checked.do")
	public ModelAndView AddrChecked(@RequestParam("addr_idx") String addr_idx,
			@RequestParam("order_idx") String order_idx, HttpServletRequest request) {
		System.out.println("order_idx : " + order_idx); // 성공
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");
		OrderVO ovo = new OrderVO();
		ovo.setUser_idx(uvo.getUser_idx());
		ovo.setOrder_idx(order_idx);
		AddrVO avo = new AddrVO();
		avo.setAddr_idx(addr_idx);
		avo.setUser_idx(uvo.getUser_idx());

		List<OrderVO> list = shopservice.orderaddrproduct(ovo);
		System.out.println("avo.user_idx : " + avo.getUser_idx());
		System.out.println("avo.addr_idx : " + avo.getAddr_addr());
		int result = shopservice.getaddrchecked(avo); // 실패
		System.out.println("result: " + result);
		if (result > 0) {
			mv.addObject("vo", list);
			mv.setViewName("redirect:order_pay.do?order_idx=" + order_idx);
			return mv;
		} else {
			return new ModelAndView("main/signup_fail");
		}
	}

}
