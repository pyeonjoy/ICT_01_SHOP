package com.ict.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
			List<ProductVO> pvoList = shopService.productDetailList();
			
			mv.addObject("pvoList", pvoList);
			mv.addObject("pvo", pvo);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;

	}

	@GetMapping("product_list.do") // 상품리스트 페이지
	public ModelAndView Product_List(ProductVO pvo) throws Exception {
		ModelAndView mv = new ModelAndView("product/product_list");
		List<ProductVO> shop_list = shopService.getShopList(pvo);
		mv.addObject("shop_list", shop_list);
		return mv;
	}

	@GetMapping("shop_detail.do")
	public ModelAndView getShopDetail(String product_idx) {
		try {
			ModelAndView mv = new ModelAndView("shop/shop_detail");
			ProductVO pvo = shopService.getShopDetail(product_idx);
			if (pvo != null) {
				mv.addObject("pvo", pvo);
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("shop/error");
	}

	@GetMapping("shop_addCart.do")
	public ModelAndView getAddCart(@ModelAttribute("shop_idx") String shop_idx, HttpSession session) {
		try {
			String loginChk = (String) session.getAttribute("loginChk");
			if (loginChk != null && loginChk.equals("ok")) { // 로그인 확인
				ModelAndView mv = new ModelAndView("redirect:shop_detail.do");

				// 세션에서 사용자 정보를 가져옵니다.
				UserVO userVO = (UserVO) session.getAttribute("userVO");
				String user_id = userVO.getUser_id();

				// shop_idx로 제품 정보를 가져옵니다.
				ProductVO productVO = shopService.getShopDetail(shop_idx);

				// 사용자가 해당 제품을 카트에 추가했는지 체크합니다.
				CartListVO cartListVO = shopService.getCartChk(user_id, shop_idx);
				if (cartListVO == null) { // 카트에 해당 제품이 없으면 추가합니다.
					CartListVO newCart = new CartListVO();
					newCart.setUser_idx(userVO.getUser_idx());
					newCart.setProduct_idx(shop_idx);
					newCart.setProduct_price(productVO.getProduct_price());
					newCart.setCartlist_count("1"); // 초기 개수는 1로 설정
					int result = shopService.cartInsert(productVO);
				} else { // 카트에 해당 제품이 있으면 수량을 증가시킵니다.
					int count = Integer.parseInt(cartListVO.getCartlist_count()) + 1;
					cartListVO.setCartlist_count(String.valueOf(count));
					int result = shopService.cartEdit(cartListVO);
				}
				return mv;
			} else {
				return new ModelAndView("member/login_error");
			}
		} catch (Exception e) {
			return new ModelAndView("member/login_error");
		}
	}

	@GetMapping("shop_showCart.do")
	public ModelAndView getCartList(HttpSession session) {
		try {
			String loginChk = (String) session.getAttribute("loginChk");
			if (loginChk == null) {
				return new ModelAndView("member/login_error");
			} else if (loginChk.equals("ok")) {
				ModelAndView mv = new ModelAndView("shop/cart_list");

				UserVO userVO = (UserVO) session.getAttribute("userVO");
				String user_idx = userVO.getUser_idx();

				List<CartListVO> cartList = shopService.getCartList(user_idx);
				if (cartList != null) {
					mv.addObject("cart_list", cartList);
					return mv;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("shop/error");
	}

	@PostMapping("cart_edit.do")
	public ModelAndView cartEdit(CartListVO cartListVO) {
		try {
			ModelAndView mv = new ModelAndView("redirect:shop_showCart.do");
			int result = shopService.cartEdit(cartListVO);
			if (result > 0) {
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("shop/error");
	}

	@GetMapping("shop_cart_delete.do")
	public ModelAndView cartDelete(String cartlist_idx) {
		try {
			ModelAndView mv = new ModelAndView("redirect:shop_showCart.do");
			int result = shopService.cartDelete(cartlist_idx);
			if (result > 0) {
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("shop/error");
	}

	@GetMapping("shop_product_insertForm.do")
	public ModelAndView getProductInsertForm() {
		ModelAndView modelAndView = new ModelAndView("shop/product_insertForm");
		modelAndView.addObject("productVO", new ProductVO()); // 폼 데이터를 바인딩할 빈 ProductVO 객체를 모델에 추가합니다.
		return modelAndView;
	}
}
