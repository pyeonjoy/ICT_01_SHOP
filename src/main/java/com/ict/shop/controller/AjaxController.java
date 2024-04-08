package com.ict.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shop.dao.vo.HeartVO;
import com.ict.shop.dao.vo.ProductVO;
import com.ict.shop.dao.vo.UserVO;
import com.ict.shop.service.ShopService;

@RestController
public class AjaxController {

	@Autowired
	private ShopService shopservice;

	@RequestMapping(value = "Signup_idchk.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String getAjaxIdChk(String user_id) {
		String result = shopservice.getShopIdChk(user_id);
		System.out.println(result);
		return result;
	}

	@PostMapping("/add_to_heart_ajax")
	@ResponseBody
	public String addToHeartAjax(@RequestParam("user_idx") String user_idx,
			@RequestParam("product_idx") String product_idx) {
		try {
			int result = shopservice.add_to_heart(user_idx, product_idx);
			if (result == 1) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}
	}

	@PostMapping("/check_heart_ajax")
	@ResponseBody
	public String checkHeartAjax(@RequestParam("user_idx") String user_idx,
			@RequestParam("product_idx") String product_idx) {
		try {
			int result = shopservice.check_heart_item(user_idx, product_idx);
			if (result > 0) {
				return "exists";
			} else {
				return "noexists";
			}
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}
	}

	@GetMapping("/getHeartItems")
	public List<HeartVO> getHeartItems(@RequestParam String user_idx) {
		try {
			return shopservice.get_heart_items(user_idx);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	@PostMapping("/remove_from_heart_ajax")
	@ResponseBody
	public String removeFromHeartAjax(@RequestParam("user_idx") String user_idx,
			@RequestParam("product_idx") String product_idx) {
		try {
			int result = shopservice.remove_from_heart(user_idx, product_idx);
			if (result == 1) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}
	}

	
	
	@PostMapping(value = "detail_cart_add.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public ModelAndView productDetailCartAdd(@RequestParam("product_idx")String product_idx, HttpServletRequest request) {
		try {
			
			HttpSession session = request.getSession();
			UserVO uvo = (UserVO) session.getAttribute("uvo");
			
			
			//int result = shopservice.porductDetailCart(product_idx, uvo. getUser_idx());
			
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;

	}
}
