package com.ict.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shop.dao.vo.ProductVO;
import com.ict.shop.dao.vo.UserVO;
import com.ict.shop.service.ShopService;

@Controller
public class ProductController {

	@Autowired
	private ShopService shopService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private HttpSession session;

//product=================================================================================================================================================================

	// product detail
	@GetMapping("product_detail.do") // 상품 상세페이지
	public ModelAndView getProductDatailInfo(HttpServletRequest request,
			@RequestParam("product_idx") String product_idx) {
		try {
			ModelAndView mv = new ModelAndView("product/product_detail");
			HttpSession session = request.getSession();
			UserVO uvo = (UserVO) session.getAttribute("uvo");

			ProductVO pvo = shopService.productDetailInfo(product_idx);
			List<ProductVO> pvoList = shopService.productDetailList();
			
			mv.addObject("pvoList", pvoList);
			mv.addObject("pvo", pvo);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;

	}

	@GetMapping("product_list.do") // 상품리스트 향수 페이지
	public ModelAndView Product_List(ProductVO pvo) throws Exception {
		ModelAndView mv = new ModelAndView("product/product_list");
		List<ProductVO> shop_list = shopService.getShopList(pvo);
		mv.addObject("shop_list", shop_list);
		return mv;
	}

	@GetMapping("product_balm.do") // 상품리스트 비누 페이지
	public ModelAndView Product_balm_List(ProductVO pvo) throws Exception {
		ModelAndView mv = new ModelAndView("product/product_list");
		List<ProductVO> shop_list = shopService.getShopListbalm(pvo);
		mv.addObject("shop_list", shop_list);
		return mv;
	}
	
}
