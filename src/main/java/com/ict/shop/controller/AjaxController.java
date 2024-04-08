package com.ict.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.ProductVO;
import com.ict.shop.dao.vo.UserVO;
import com.ict.shop.service.ShopService;

@RestController
public class AjaxController {

	@Autowired
	private ShopService shopservice;
	
	
	
	@RequestMapping(value="Signup_idchk.do",produces="text/plain; charset=utf-8")
	@ResponseBody
	public String getAjaxIdChk(String user_id) {
		String result = shopservice.getShopIdChk(user_id);
		System.out.println(result);
		return result;
	}


	@RequestMapping(value="removeHeart.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String getAjaxHeartRemove(@RequestParam("product_idx") String product_idx, HttpServletRequest request, @RequestParam("user_idx")String user_idx, @RequestParam("heart_idx")String heart_idx) {
	        int result = shopservice.getRemoveHeart(product_idx, user_idx,heart_idx) ;
	        HttpSession session = request.getSession();
	        session.setAttribute("product_idx", product_idx);
	        session.setAttribute("user_idx", user_idx);
	        session.setAttribute("heart_idx", heart_idx);
	       System.out.println(product_idx);
	       System.out.println(user_idx);
	       System.out.println(heart_idx);

	        return String.valueOf(result);
	    }
	
	@RequestMapping(value="addHeart.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String getAjaxHeartAdd(@RequestParam("product_idx") String product_idx, HttpServletRequest request, @RequestParam("user_idx")String user_idx) {
		int result = shopservice.getAddHeart(product_idx, user_idx) ;
		HttpSession session = request.getSession();
		session.setAttribute("product_idx", product_idx);
		session.setAttribute("user_idx", user_idx);
		System.out.println(product_idx);
		System.out.println(user_idx);
		
		return String.valueOf(result);
	}
	
	@RequestMapping(value="product_list_add_cart.do", produces="text/plain; charset=utf-8")
	@ResponseBody
	public String ProductAddCart(@ModelAttribute("product_idx")String product_idx,
							  	 HttpServletRequest request,
							  	 @ModelAttribute("product_price")String product_price) throws Exception {
	    HttpSession session = request.getSession();
	    UserVO uvo = (UserVO) session.getAttribute("uvo");
	    String user_idx = uvo.getUser_idx();
	    ProductVO pvo = shopservice.getShopDetail(product_idx);
	    CartListVO cvo = shopservice.getCartChk(user_idx, pvo.getProduct_idx());
	    if (cvo == null) {
	    	int result = shopservice.ProductAddCart(product_idx,user_idx,product_price);
	    	System.out.println("새롭게추가~");
	    	return String.valueOf(result);
		}else {
			System.out.println("중복추가~");
			int result = shopservice.cartUpdate(cvo);
			return String.valueOf(result);
		}

	}
	
	
	
}
