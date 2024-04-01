package com.ict.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.ProductVO;
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
			cvo.setUser_idx("7");
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
		String[] checkbox = request.getParameterValues("checkbox");
		
		int result = 0;
		if (checkbox != null) {
			for (String cartlist_idx : checkbox) {
				result = shopservice.getCartlistDelete(cartlist_idx);
			}
			if (result > 0) {
				return mv;
			}
		} else {
			return mv;
		}
		
		return new ModelAndView("login/singup_fail");
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
