package com.ict.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
	public String getAjaxHeartAdd(@RequestParam("product_idx") String product_idx, HttpServletRequest request, @RequestParam("user_idx")String user_idx, @RequestParam("heart_idx")String heart_idx) {
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
	
	
	
}
