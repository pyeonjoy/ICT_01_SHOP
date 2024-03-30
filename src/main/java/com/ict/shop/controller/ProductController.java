package com.ict.shop.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shop.service.ShopService;

@Controller
public class ProductController {

	@Autowired
	private ShopService shopservice;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private HttpSession session;
	
//product=================================================================================================================================================================
	@GetMapping("order_success.do") // 주문 완료 후 페이지
	public ModelAndView Order_Success() {
		return new ModelAndView("order/order_success");
	}
	
	@GetMapping("product_detail.do") // 상품 상세페이지
	public ModelAndView Product_Detail() {
		return new ModelAndView("product/product_detail");
	}

	@GetMapping("product_list.do") // 상품리스트 페이지
	public ModelAndView Product_List() {
		return new ModelAndView("product/product_list");
	}
}
