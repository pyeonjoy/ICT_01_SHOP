package com.ict.shop.service.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ict.shop.dao.OrderDAO;
import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.OrderVO;

@Service
public class ShopOrderServiceImpl implements ShopOrderService {

	@Autowired
	private OrderDAO odao;

	@Override
	public int orderupdate1(String order_idx) {
		return odao.orderupdate1(order_idx);
	}

	@Override
	public List<CartListVO> getCartList(String user_idx) {
		return odao.getCartList(user_idx);
	}

	@Override
	public int getCartlistDelete(String cartlist_idx) {
		return odao.getCartlistDelete(cartlist_idx);
	}

	@Override
	public int getCartlistEdit(CartListVO cvo) {
		return odao.getCartlistEdit(cvo);
	}

	@Override
	public int getCartlistPass(CartListVO cvo) {
		return odao.getCartlistPass(cvo);
	}

	@Override
	public List<CartListVO> getCartlistOrderIdx() {
		return odao.getCartlistOrderIdx();
	}

	@Override
	public CartListVO getCartListAddr(String user_idx) {
		return odao.getCartListAddr(user_idx);
	}

	@Override
	public CartListVO getCartlistSelect(String cartlist_idx) {
		return odao.getCartlistSelect(cartlist_idx);
	}

	@Override
	public List<OrderVO> orderaddrproduct(OrderVO ovo) {
		return odao.orderaddrproduct(ovo);
	}

	@Transactional
	@Override
	public int getaddrchecked(AddrVO avo) {
		int result2 = odao.getaddrcheckedmin(avo); // 1을 0으로
		int result1 = odao.getaddrchecked(avo); // addr_idx의 base를 1로
		// 각 데이터베이스 작업이 성공하면 1을 반환, 그렇지 않으면 -1을 반환
		if (result1 == 1 && result2 == 1) {
			return 1; // 성공
		} else {
			return -1; // 실패
		}
	}

	@Override
	public int getOrderSuccess(String order_idx) {
		return odao.getOrderSuccess(order_idx);
	}

	@Override
	public List<OrderVO> getOrderSuccessPage(String order_idx) {
		return odao.getOrderSuccessPage(order_idx);
	}
	// 옮겨
	public List<OrderVO> getAddrList(OrderVO ovo) {
		return odao.getAddrlist(ovo);
	}

}
