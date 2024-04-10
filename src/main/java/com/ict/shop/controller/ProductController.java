package com.ict.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shop.dao.vo.CartListVO;
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
			
			// 다른 상품들
			List<ProductVO> pvoList = shopService.productDetailList();

			// 다른 상품 4개를 뽑아 가져오기
			List<ProductVO> otherList = new ArrayList<ProductVO>();
			int pvoList_idx = Integer.valueOf(product_idx) - 1;
			for (int i = -2; i <= 2; i++) {
				if (pvoList_idx + i < 0) {
					otherList.add(pvoList.get(pvoList.size() + i));
				} else if (i == 0) {
					continue;
				} else if ((pvoList_idx + i) > (pvoList.size() - 1)) {
					otherList.add(pvoList.get(pvoList_idx - 8));
				} else {
					otherList.add(pvoList.get(pvoList_idx + i));
				}
			}
			

			mv.addObject("otherList", otherList);
			mv.addObject("pvo", pvo);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;

	}

	@PostMapping("product_detail_pay.do") // 상품 상세페이지
	public ModelAndView getProductDatailPay(HttpServletRequest request, @RequestParam("product_idx") String product_idx,
			@RequestParam("product_count") String product_count) {
		try {
			ModelAndView mv = new ModelAndView("redirect:cart_list.do");
			HttpSession session = request.getSession();
			UserVO uvo = (UserVO) session.getAttribute("uvo");

			ProductVO pvo = shopService.getShopDetail(product_idx);
			CartListVO cvo = shopService.getCartChk(uvo.getUser_idx(), product_idx);
			pvo.setUser_idx(uvo.getUser_idx());
			pvo.setProduct_count(product_count);

			int result = 0;
			if (cvo == null) {
				result = shopService.getProductDetailAddCart(pvo);
				System.out.println("새롭게 구매 추가");
			} else {
				cvo.setCartlist_count(product_count);
				result = shopService.cartUpdate(cvo);
				System.out.println("중복 구매 추가");
			}
			if (result > 0) {
				return mv;
			}
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
