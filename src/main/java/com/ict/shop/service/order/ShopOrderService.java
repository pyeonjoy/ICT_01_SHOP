package com.ict.shop.service.order;

import java.util.List;

import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.OrderVO;

public interface ShopOrderService {
	int orderupdate1(String order_idx);

	List<CartListVO> getCartList(String user_idx);

	int getCartlistDelete(String cartlist_idx);

	int getCartlistEdit(CartListVO cvo);

	int getCartlistPass(CartListVO cvo2);

	List<CartListVO> getCartlistOrderIdx();

	CartListVO getCartlistSelect(String cartlist_idx);

	CartListVO getCartListAddr(String user_idx);

	List<OrderVO> orderaddrproduct(OrderVO ovo);

	List<OrderVO> getOrderSuccessPage(String order_idx);
	
	List<OrderVO> getAddrList(OrderVO ovo);
	
	int getaddrchecked(AddrVO avo);

	int getOrderSuccess(String order_idx);

	int getOrderMinusPoint(int order_total, String string);

}
