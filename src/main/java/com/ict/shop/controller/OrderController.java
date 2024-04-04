package com.ict.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.OrderVO;
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
	
	@RequestMapping("order_pay.do")
	public ModelAndView Order_Pay (String order_idx,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("order/order_pay");
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");
		List<OrderVO> list =shopservice.orderaddrproduct(order_idx);
		if (list != null) {
			System.out.println("유저 idx: "+order_idx);
			mv.addObject("vo", list);
			System.out.println("list"+list);
			return mv;
		}
		return new ModelAndView("main/signup_fail");
	}
}


