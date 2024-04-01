package com.ict.shop.service;

import java.util.List;

import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.HeartVO;
import com.ict.shop.dao.vo.OrderVO;
import com.ict.shop.dao.vo.ProductVO;
import com.ict.shop.dao.vo.UserVO;

public interface ShopService {

	
//로그인 ============================================================
	int getShop_Insert(UserVO vo); // 회원가입

	UserVO getShop_Login(UserVO vo); // 로그인

	UserVO find_id(UserVO vo); // 아이디찾기
	
//마이페이지 =========================================================


	//=======

	OrderVO getOrderDetail(String order_idx);

	UserVO getUserDetail(String idx);

	// 관심상품 리스트
	public List<HeartVO> getShopHeartList();

	// 주문 내역 리스트
	public List<OrderVO> getShopOrderList();

	UserVO firstchk(String user_id);
	 
	List<UserVO> getUserList();

	int getChangePwd(UserVO uvo);

	List<OrderVO> getOrderList(String order_idx, String product_idx);


	//mypage_addr
	int getAddrInsert(AddrVO vo);
	
	List<AddrVO> getAddrList();
	
	int getAddrEdit(AddrVO avo);
	//mypage_addr+order_pay
	AddrVO getAddrDetail(AddrVO avo);


	//오더  ============================================================
	//order-pay
	OrderVO getAddrProductOrder(String user_idx);
	
//프로덕 ============================================================






	 
}
