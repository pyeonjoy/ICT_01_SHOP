package com.ict.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	@GetMapping("cart_list.do") // �옣諛붽뎄�땲 �럹�씠吏�
	public ModelAndView cart_List(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("order/cart_list");
		try {
			HttpSession session = request.getSession();
			UserVO uvo = (UserVO) session.getAttribute("uvo");

			CartListVO cvo = new CartListVO();
			List<CartListVO> cartlist = shopservice.getCartList(uvo.getUser_idx());
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
	public ModelAndView cartlistDelete(HttpServletRequest request) { // �옣諛붽뎄�땲 �궘�젣
		ModelAndView mv = new ModelAndView("redirect:cart_list.do");
		String[] cart_check_idx = request.getParameterValues("cart_check_idx");

		int result = 0;
		if (cart_check_idx != null) {
			for (String cartlist_idx : cart_check_idx) {
				result = shopservice.getCartlistDelete(cartlist_idx);
			}
			if (result > 0) {
				return mv;
			} else {
				return mv;
			}
		}
		return new ModelAndView("login/singup_fail");
	}

	@PostMapping("cartlist_edit.do") // �닔�웾 蹂�寃�
	public ModelAndView cartlistEdit(CartListVO cvo, @RequestParam("cartlist_idx") String[] cartlist_idx,
			@RequestParam("cartlist_count") String[] cartlist_count, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");

		ModelAndView mv = new ModelAndView("redirect:cart_list.do");
		int result = shopservice.getCartlistEdit(cvo);
		if (result > 0) {
			return mv;
		}
		return new ModelAndView("login/singup_fail");
	}

	@PostMapping("cartlist_select_pay.do") // �꽑�깮援щℓ�떆
	public ModelAndView cartlistSelectPay(@RequestParam("cart_check_idx") String[] cart_check_idx,
			@RequestParam("check_number") String[] check_number, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");

		// �꽑�깮�븳 二쇰Ц�씠 �뾾�쓣 �븣
		if (cart_check_idx == null) {
			mv.setViewName("redirect:cart_list.do?cartlist_status=check_none");
			return mv;
		}

		// 媛��옣 �겙 �닔 媛��졇�삤湲�
		List<CartListVO> orderlist = shopservice.getCartlistOrderIdx();
		int maxIdx = 0;

		// order_idx 媛� 以묐났 �븞 �릺寃�
		for (int i = 0; i < orderlist.size(); i++) {
			int cIdx = Integer.parseInt(orderlist.get(i).getOrder_idx());
			if (cIdx > maxIdx) {
				maxIdx = cIdx;

			}
		}
		maxIdx++;
		CartListVO cvo = new CartListVO();
		// 二쇱냼 媛��졇�삤湲�
		CartListVO cvo2 = shopservice.getCartListAddr(uvo.getUser_idx());
		int result = 0;
		int result2 = 0;

		for (int j = 0; j < cart_check_idx.length; j++) {
			// �꽑�깮�븳 �젣�뭹
			cvo = shopservice.getCartlistSelect(cart_check_idx[j]);

			// order_number 怨꾩궛
			int su = Integer.parseInt(cvo.getCartlist_count());
			int price = Integer.parseInt(cvo.getCartlist_number());
			cvo.setOrder_number(String.valueOf(su * price));

			cvo.setAddr_idx(cvo2.getAddr_idx());
			cvo.setOrder_idx(String.valueOf(maxIdx)); // order_idx 媛숆쾶

			result = shopservice.getCartlistPass(cvo);

		}
		if (result > 0) {
			for (String k : cart_check_idx) {
				result2 = shopservice.getCartlistDelete(k); // 寃곗젣濡� �꽆�뼱媛� 嫄� �궘�젣
			}
			mv.setViewName("redirect:order_pay.do?order_idx=" + maxIdx);
			return mv;
		}

		mv.setViewName("redirect:cart_list.do?cartlist_status=error");
		return null;
	}

	@RequestMapping("order_pay.do")
	public ModelAndView Order_Pay(String order_idx, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("order/order_pay");
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");
		OrderVO ovo = new OrderVO();
		ovo.setUser_idx(uvo.getUser_idx());
		ovo.setOrder_idx(order_idx);
		List<OrderVO> list = shopservice.orderaddrproduct(ovo);
		if (list != null) {
			mv.addObject("vo", list);
			mv.addObject("uvo", uvo);
			return mv;
		}
		return new ModelAndView("main/signup_fail");
	}

	@RequestMapping("mypage_addr_select.do")
	public ModelAndView Mypage_addr_Select(@RequestParam("order_idx") String order_idx, HttpServletRequest request) {
		System.out.println("�뿬湲� : " + order_idx); // �꽦怨�
		ModelAndView mv = new ModelAndView("mypage/mypage_addr_select");
		// �꽭�뀡�뿉�꽌 �궗�슜�옄 ID 媛��졇�삤湲�
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");

		OrderVO ovo = new OrderVO();
		ovo.setUser_idx(uvo.getUser_idx());
		ovo.setOrder_idx(order_idx);

		if (uvo.getUser_idx() != null) {
			List<OrderVO> list = shopservice.getAddrList(ovo);
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
		System.out.println("order_idx : " + order_idx);
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("uvo");
		OrderVO ovo = new OrderVO();
		ovo.setUser_idx(uvo.getUser_idx());
		ovo.setOrder_idx(order_idx);
		AddrVO avo = new AddrVO();
		avo.setAddr_idx(addr_idx);
		avo.setUser_idx(uvo.getUser_idx());

		List<OrderVO> list = shopservice.orderaddrproduct(ovo);
		System.out.println("avo.user_idx : " + avo.getUser_idx());
		System.out.println("avo.addr_idx : " + avo.getAddr_addr());
		int result = shopservice.getaddrchecked(avo);
		System.out.println("result: " + result);
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
		int result = shopservice.getaddrchecked(avo);
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

		List<OrderVO> order = shopservice.getOrderSuccessPage(order_idx);
		if (order != null) {
			String order_num = order.get(0).getOrder_date().replaceAll("[-: ]", "") + order_idx;
			mv.addObject("order_num", order_num);
			mv.addObject("order_addr", order.get(0).getAddr_addr());
			mv.addObject("order_phone", order.get(0).getAddr_phone());
			mv.addObject("order", order);
		}

		int result = shopservice.getOrderSuccess(order_idx);
		int result1 = shopservice.orderupdate1(order_idx);

		System.out.println(result);
		if (result > 0 && result1 > 0) {
			return mv;
		}

		return new ModelAndView("home");
	}

}
