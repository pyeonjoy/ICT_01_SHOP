package com.ict.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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
}
