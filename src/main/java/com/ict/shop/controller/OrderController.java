package com.ict.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.OrderVO;
import com.ict.shop.dao.vo.UserVO;
import com.ict.shop.service.order.ShopOrderService;

@Controller
public class OrderController {

	@Autowired
	private ShopOrderService shoporderservice;

//order===================================================================================================================================================================
	@GetMapping("cart_list.do")
	public ModelAndView cart_List(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("order/cart_list");
		try {
			HttpSession session = request.getSession();
			UserVO uvo = (UserVO) session.getAttribute("uvo");

			CartListVO cvo = new CartListVO();
			List<CartListVO> cartlist = shoporderservice.getCartList(uvo.getUser_idx());
			if (cartlist != null) {
				mv.addObject("cartlist", cartlist);
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("login/singup_fail");
	}

	@PostMapping("cartlist_delete.do")
	public ModelAndView cartlistDelete(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:cart_list.do");
		String[] cart_check_idx = request.getParameterValues("cart_check_idx");

		int result = 0;
		if (cart_check_idx != null) {
			for (String cartlist_idx : cart_check_idx) {
				result = shoporderservice.getCartlistDelete(cartlist_idx);
			}
			if (result > 0) {
				return mv;
			} else {
				return mv;
			}
		}
		return new ModelAndView("login/singup_fail");
	}

	@PostMapping("cartlist_edit.do")
	public ModelAndView cartlistEdit(CartListVO cvo, @RequestParam("cartlist_idx") String[] cartlist_idx,
			@RequestParam("cartlist_count") String[] cartlist_count, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");

		ModelAndView mv = new ModelAndView("redirect:cart_list.do");
		int result = shoporderservice.getCartlistEdit(cvo);
		if (result > 0) {
			return mv;
		}
		return new ModelAndView("login/singup_fail");
	}

	@PostMapping("cartlist_select_pay.do")
	public ModelAndView cartlistSelectPay(@RequestParam("cart_check_idx") String[] cart_check_idx,
			@RequestParam("check_number") String[] check_number, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");

		if (cart_check_idx == null) {
			mv.setViewName("redirect:cart_list.do?cartlist_status=check_none");
			return mv;
		}

		List<CartListVO> orderlist = shoporderservice.getCartlistOrderIdx();
		int maxIdx = 0;

		for (int i = 0; i < orderlist.size(); i++) {
			int cIdx = Integer.parseInt(orderlist.get(i).getOrder_idx());
			if (cIdx > maxIdx) {
				maxIdx = cIdx;

			}
		}
		maxIdx++;
		CartListVO cvo = new CartListVO();
		CartListVO cvo2 = shoporderservice.getCartListAddr(uvo.getUser_idx());
		int result = 0;
		int result2 = 0;

		for (int j = 0; j < cart_check_idx.length; j++) {
			cvo = shoporderservice.getCartlistSelect(cart_check_idx[j]);

			int su = Integer.parseInt(cvo.getCartlist_count());
			int price = Integer.parseInt(cvo.getCartlist_number());
			cvo.setOrder_number(String.valueOf(su * price));

			cvo.setAddr_idx(cvo2.getAddr_idx());
			cvo.setOrder_idx(String.valueOf(maxIdx));

			result = shoporderservice.getCartlistPass(cvo);

		}
		if (result > 0) {
			for (String k : cart_check_idx) {
				result2 = shoporderservice.getCartlistDelete(k);
			}
			mv.setViewName("redirect:order_pay.do?order_idx=" + maxIdx);
			return mv;
		}

		mv.setViewName("redirect:cart_list.do?cartlist_status=error");
		return mv;
	}

	@RequestMapping("order_pay.do")
	public ModelAndView Order_Pay(String order_idx, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("order/order_pay");
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");
		OrderVO ovo = new OrderVO();
		ovo.setUser_idx(uvo.getUser_idx());
		ovo.setOrder_idx(order_idx);
		List<OrderVO> list = shoporderservice.orderaddrproduct(ovo);
		if (list != null) {
			mv.addObject("vo", list);
			mv.addObject("uvo", uvo);
			return mv;
		}
		return new ModelAndView("main/signup_fail");
	}

	@RequestMapping("mypage_addr_select.do")
	public ModelAndView Mypage_addr_Select(@RequestParam("order_idx") String order_idx, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mypage/mypage_addr_select");
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");

		OrderVO ovo = new OrderVO();
		ovo.setUser_idx(uvo.getUser_idx());
		ovo.setOrder_idx(order_idx);

		if (uvo.getUser_idx() != null) {
			List<OrderVO> list = shoporderservice.getAddrList(ovo);
			if (list != null) {
				mv.addObject("list", list);
				return mv;
			}
		}
		return new ModelAndView("mypage/error");
	}

	@RequestMapping("addr_checked.do")
	public ModelAndView AddrChecked(@RequestParam("addr_idx") String addr_idx,
			@RequestParam("order_idx") String order_idx, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");
		OrderVO ovo = new OrderVO();
		ovo.setUser_idx(uvo.getUser_idx());
		ovo.setOrder_idx(order_idx);
		AddrVO avo = new AddrVO();
		avo.setAddr_idx(addr_idx);
		avo.setUser_idx(uvo.getUser_idx());

		List<OrderVO> list = shoporderservice.orderaddrproduct(ovo);
		int result = shoporderservice.getaddrchecked(avo);
		if (result > 0) {
			mv.addObject("vo", list);
			mv.setViewName("redirect:order_pay.do?order_idx=" + order_idx);
			return mv;
		} else {
			return new ModelAndView("main/signup_fail");
		}
	}

	@RequestMapping("addr_checked2.do")
	public ModelAndView AddrChecked(@RequestParam("addr_idx") String addr_idx, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");
		AddrVO avo = new AddrVO();
		avo.setAddr_idx(addr_idx);
		avo.setUser_idx(uvo.getUser_idx());
		int result = shoporderservice.getaddrchecked(avo);
		if (result > 0) {
			mv.setViewName("redirect:mypage_addr.do");
			return mv;
		} else {
			return new ModelAndView("main/signup_fail");
		}
	}

	@RequestMapping("order_success.do")
	public ModelAndView orderSuccess(String order_idx, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("product/order_success");
		int delivery = 3000;

		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");

		List<OrderVO> order = shoporderservice.getOrderSuccessPage(order_idx);

		if (order != null) {
			int order_total = 0;
			int order_number = 0;
			//int order_count = 0;
			for (int i = 0; i < order.size(); i++) {
				order_number = Integer.parseInt(order.get(i).getOrder_number());
				//order_count = Integer.parseInt(order.get(i).getOrder_count());

				order_total += order_number;
			}
			order_total += delivery;

			String order_num = order.get(0).getOrder_date().replaceAll("[-: ]", "") + order_idx;
			mv.addObject("order_addr", order.get(0).getAddr_addr());
			mv.addObject("order_num", order_num);
			mv.addObject("order_total", order_total);
			mv.addObject("order_phone", order.get(0).getAddr_phone());
			mv.addObject("order", order);

			int result = shoporderservice.getOrderSuccess(order_idx);
			int result1 = shoporderservice.orderupdate1(order_idx);
			int result2 = shoporderservice.getOrderMinusPoint(order_total, uvo.getUser_idx());

			if (result2 > 0 && result > 0 && result1 > 0) {
				return mv;
			}
		}

		return new ModelAndView("home");
	}

}
