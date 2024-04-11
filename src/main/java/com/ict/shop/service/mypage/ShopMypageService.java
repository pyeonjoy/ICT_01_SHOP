package com.ict.shop.service.mypage;

import java.util.List;

import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.OrderVO;
import com.ict.shop.dao.vo.UserVO;

public interface ShopMypageService {

	int reset_pwd(UserVO uvo);

	int getAddrInsert(AddrVO vo);

	List<AddrVO> getMyAddrList(String user_idx);

	int getAddrDelete(String addr_idx);
	int getAddrDelete1(String addr_idx);

	OrderVO getOrderDetail(String order_idx);

	public List<OrderVO> getShopHeartList(String user_idx);

	public int getCartListAdd(OrderVO ovo);

	public List<OrderVO> getShopOrderList(String user_idx);

	UserVO firstchk(String user_id);

	int getChangePwd(UserVO uvo);

	List<OrderVO> getOrderList(String order_idx);

	List<OrderVO> getOrderList2(String order_idx);

	int getDeliveryStatus(List<OrderVO> ovo);

	int getAddrEdit(AddrVO avo);

	AddrVO getAddrDetail(AddrVO avo);

	UserVO getMypage_Info(String user_id);

	int Mypage_Info_Change(UserVO uvo);

	int getRemoveHeart(String product_idx, String user_idx, String heart_idx);

	int getAddHeart(String product_idx, String user_idx);

	int orderupdate2(String order_idx);

	int orderupdate3(String order_idx);

	int orderupdate4(String order_idx);
}
