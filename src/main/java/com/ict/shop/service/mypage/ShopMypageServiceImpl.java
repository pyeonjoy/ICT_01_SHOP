package com.ict.shop.service.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.shop.dao.MypageDAO;
import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.OrderVO;
import com.ict.shop.dao.vo.UserVO;

@Service
public class ShopMypageServiceImpl implements ShopMypageService {
	@Autowired
	private MypageDAO mdao;

	@Override
	public int reset_pwd(UserVO uvo) {
		return mdao.reset_pwd(uvo);
	}

	@Override
	public OrderVO getOrderDetail(String order_idx) {
		return mdao.getOrderDetail(order_idx);
	}

	@Override
	public int getChangePwd(UserVO uvo) {
		return mdao.getChangePwd(uvo);
	}

	public List<OrderVO> getShopOrderList(String user_idx) {
		return mdao.getShopOrderList(user_idx);
	}

	@Override
	public List<OrderVO> getOrderList(String user_idx) {

		return mdao.getOrderList(user_idx);
	}

	@Override
	public int getDeliveryStatus(List<OrderVO> ovo) {
		return mdao.getDeliveryStatus(ovo);
	}

	@Override
	public List<OrderVO> getOrderList2(String user_idx) {
		return mdao.getOrderList2(user_idx);
	}

	@Override
	public UserVO firstchk(String user_id) {

		return mdao.firstchk(user_id);
	}

	@Override
	public List<OrderVO> getShopHeartList(String user_idx) {
		return mdao.getShopHeartList(user_idx);
	}

	@Override
	public int getAddrInsert(AddrVO avo) {
		return mdao.getAddrInsert(avo);
	}

	@Override
	public AddrVO getAddrDetail(AddrVO avo) {
		return mdao.getAddrDetail(avo);
	}

	@Override
	public int getAddrDelete(String addr_idx) {
		return mdao.getAddrDelete(addr_idx);
	}

	@Override
	public UserVO getMypage_Info(String user_id) {
		return mdao.getMypage_Info(user_id);
	}

	@Override
	public int Mypage_Info_Change(UserVO uvo) {
		return mdao.Mypage_Info_Change(uvo);
	}

	public List<AddrVO> getMyAddrList(String user_idx) {
		return mdao.getMyAddrlist(user_idx);
	}

	@Override
	public int getAddrEdit(AddrVO avo) {
		return mdao.getAddrEdit(avo);
	}

	@Override
	public int getCartListAdd(OrderVO ovo) {
		return mdao.getCartListAdd(ovo);
	}

	@Override
	public int orderupdate2(String order_idx) {
		return mdao.orderupdate2(order_idx);
	}

	@Override
	public int orderupdate3(String order_idx) {
		return mdao.orderupdate3(order_idx);
	}

	@Override
	public int orderupdate4(String order_idx) {
		return mdao.orderupdate4(order_idx);
	}

	@Override
	public int getRemoveHeart(String product_idx, String user_idx, String heart_idx) {
		return mdao.getRemoveHeart(product_idx, user_idx, heart_idx);
	}

	@Override
	public int getAddHeart(String product_idx, String user_idx) {
		return mdao.getAddHeart(product_idx, user_idx);
	}

}
