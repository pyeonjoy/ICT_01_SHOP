package com.ict.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.OrderVO;
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
	public ModelAndView cart_List() {
			ModelAndView mv = new ModelAndView("order/cart_list");
			CartListVO cvo = new CartListVO();
			cvo.setUser_idx("8");
			List<CartListVO> cartlist = shopservice.getCartList(cvo.getUser_idx());
			if(cartlist != null) {
				mv.addObject("cartlist",cartlist);
				return mv;
			}
		
		return new ModelAndView("login/singup_fail");
	}
	
	@PostMapping("cartlist_delete.do") // 장바구니 페이지
	public ModelAndView cartlistDelete(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:cart_list.do");
		String[] cart_checkbox = request.getParameterValues("cart_checkbox");
		
		int result = 0;
		if (cart_checkbox != null) {
			for (String cartlist_idx : cart_checkbox) {
				result = shopservice.getCartlistDelete(cartlist_idx);
			}
			if (result > 0) {
				return mv;
			}else {
				return mv;
			}
		} 
		return new ModelAndView("login/singup_fail");
	}
	
	@PostMapping("cartlist_edit.do") // 수량 변경
	public ModelAndView cartlistEdit(CartListVO cvo, @RequestParam("cartlist_idx")String[] cartlist_idx, 
            @RequestParam("cartlist_count") String[] cartlist_count) {
		ModelAndView mv = new ModelAndView("redirect:cart_list.do");
		int result = shopservice.getCartlistEdit(cvo);
		if (result > 0) {
			return mv;
		}
		return new ModelAndView("login/singup_fail");
	}
	
	@PostMapping("select_pay.do") // 선택구매시
	public ModelAndView cartlistPay(CartListVO cvo, String[] cart_checkbox) {
		
		// 가장 큰 수 가져오기
		List<OrderVO> orderlist = shopservice.getCartlistOrderIdx();
		int maxIdx = 0;

		for (int i = 0; i < orderlist.size(); i++) {
			int cIdx = Integer.parseInt(orderlist.get(i).getOrder_idx());
			if (cIdx > maxIdx) {
				maxIdx = cIdx;
			}
		}
		maxIdx++; // order_idx 값 중복 안 되게
		CartListVO cvo2 = new CartListVO();
		
		ModelAndView mv = new ModelAndView("redirect:order_pay.do?order_idx=" + maxIdx);
		
		int result = 0;
		for (String cartlist_idx : cart_checkbox) {
			cvo2 = shopservice.getCartlistSelect(cartlist_idx);
			System.out.println(cvo2.getCartlist_count() + "  ddasd  " + cvo2.getProduct_price());
			cvo2.setOrder_number(String.valueOf(Integer.parseInt(cvo2.getCartlist_count()) * Integer.parseInt(cvo2.getProduct_price())));
			cvo2.setOrder_idx(String.valueOf(maxIdx));
			cvo2.setAddr_idx("1"); // 주소 값은 넘어갈 게 없어서 1로 지정... 다른 방법 있을까요
			result = shopservice.getCartlistPass(cvo2);
		}
		
		return mv;
	}

	
	@RequestMapping("order_pay.do")
	public ModelAndView Order_Pay(String order_idx) {
		System.out.println(order_idx);
		ModelAndView mv = new ModelAndView("order/order_pay");
		OrderVO ovo = shopservice.getAddrProductOrder(order_idx);
		if (ovo != null) {
			mv.addObject("ovo", ovo);
			return mv;
		}
		return new ModelAndView("main/signup_fail");
	}
}
