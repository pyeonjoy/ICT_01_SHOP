package com.ict.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.ProductVO;
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
	public ModelAndView Cart_List() {
		return new ModelAndView("order/cart_list");
	}
	
	@GetMapping("order_pay.do")
	public ModelAndView Order_Pay(AddrVO avo, ProductVO pvo) {
		ModelAndView mv = new ModelAndView("order/order_pay");
		AddrVO avo1 = shopservice.getAddrDetail(avo);
		ProductVO pvo1 = shopservice.getProductDetail(pvo);
		System.out.println("avo: "+avo.getAddr_addr());
		System.out.println("pvo: "+pvo.getProduct_content());
		if (avo1 != null && pvo1 != null) {
			mv.addObject("avo", avo1);
			mv.addObject("pvo", pvo1);
			return mv;
		}
		return new ModelAndView("main/signup_fail");
	}
}
