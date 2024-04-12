package com.ict.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.HeartVO;
import com.ict.shop.dao.vo.ProductVO;
import com.ict.shop.dao.vo.UserVO;
import com.ict.shop.service.login.ShopLoginService;
import com.ict.shop.service.mypage.ShopMypageService;
import com.ict.shop.service.product.ShopProductService;

@RestController
public class AjaxController {

	@Autowired
	private ShopLoginService shoploginservice;
	@Autowired
	private ShopMypageService shopmypageservice;
	@Autowired
	private ShopProductService shopproductservice;

	@RequestMapping(value = "Signup_idchk.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String getAjaxIdChk(String user_id) {
		String result = shoploginservice.getShopIdChk(user_id);
		return result;
	}

	@RequestMapping(value = "removeHeart.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String getAjaxHeartRemove(@RequestParam("heart_idx")String heart_idx) {
	        int result = shopmypageservice.getRemoveHeart(heart_idx) ;
	        return String.valueOf(result);
	    }
	
	@RequestMapping(value="addHeart.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String getAjaxHeartAdd(@RequestParam("product_idx") String product_idx,
								  HttpServletRequest request,
								  @RequestParam("user_idx")String user_idx){
	    HeartVO hvo = shopproductservice.getHeartChk(product_idx,user_idx);
	    if (hvo == null) {
	        int result = shopmypageservice.getAddHeart(product_idx, user_idx) ;
	        return String.valueOf(result);           
	    } else {
	        return "error";
	    }
	}

	@RequestMapping(value = "product_list_add_cart.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String ProductAddCart(@ModelAttribute("product_idx") String product_idx, HttpServletRequest request,
			@ModelAttribute("product_price") String product_price) throws Exception {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");
		String user_idx = uvo.getUser_idx();
		ProductVO pvo = shopproductservice.getShopDetail(product_idx);
		CartListVO cvo = shopproductservice.getCartChk(user_idx, pvo.getProduct_idx());
		if (cvo == null) {
			int result = shopproductservice.ProductAddCart(product_idx, user_idx, product_price);
			return String.valueOf(result);
		} else {
			cvo.setCartlist_count("1");
			int result = shopproductservice.cartUpdate(cvo);
			return String.valueOf(result);
		}
	}

	@PostMapping(value = "detail_cart_add.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String productDetailCartAdd(String product_idx, String product_count, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			UserVO uvo = (UserVO) session.getAttribute("uvo");

			ProductVO pvo = shopproductservice.getShopDetail(product_idx);
			CartListVO cvo = shopproductservice.getCartChk(uvo.getUser_idx(), product_idx);
			pvo.setUser_idx(uvo.getUser_idx());
			pvo.setProduct_count(product_count);
			
			int result = 0;
			if (cvo == null) {
				result = shopproductservice.getProductDetailAddCart(pvo);
			} else {
				cvo.setCartlist_count(product_count);
				result = shopproductservice.cartUpdate(cvo);
			}
			
			return String.valueOf(result);
			
		} catch (Exception e) {
			System.out.println(e);
		} 
		return null;
	}

}
