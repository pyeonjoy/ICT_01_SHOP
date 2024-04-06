package com.ict.shop.service;

import java.util.List;

import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.HeartVO;
import com.ict.shop.dao.vo.OrderVO;
import com.ict.shop.dao.vo.UserVO;

public interface ShopService {

	
//로그인 ============================================================
	int getShop_Insert(UserVO vo); // 회원가입

	String getShopIdChk(String user_id);

	UserVO getShop_Login(UserVO uvo); // 로그인

	UserVO find_id(UserVO vo); // 아이디찾기

	UserVO getUser_id(String user_id);
	
	UserVO find_pwd(UserVO uvo);

	int reset_pwd(UserVO uvo);
	//마이페이지 =========================================================
	//mypage_addr
	int getAddrInsert(AddrVO vo);

	List<AddrVO> getAddrList(String user_idx);

	
//마이페이지 =========================================================


	//=======
	int getAddrDelete(String addr_idx);

	OrderVO getOrderDetail(String order_idx);

	UserVO getUserDetail(String idx);

	// 관심상품 리스트
	public List<OrderVO> getShopHeartList(String user_idx);
	
	public int getUpdateHeartStatus(OrderVO ovo);
	
	public int getCartListAdd(OrderVO ovo);

	// 주문 내역 리스트
	public List<OrderVO> getShopOrderList(String user_idx);

	UserVO firstchk(String user_id);
	 

	int getChangePwd(UserVO uvo);

	List<OrderVO> getOrderList(String order_idx);
	
	int getAddrEdit(AddrVO avo);
	//mypage_addr+order_pay
	AddrVO getAddrDetail(AddrVO avo);

	UserVO getMypage_Info(String user_id);

	int Mypage_Info_Change(UserVO uvo);






	//오더  ============================================================
	// cart list
	List<CartListVO> getCartList(String user_idx);
	
	int getCartlistDelete(String cartlist_idx);
	
	int getCartlistEdit(CartListVO cvo);
	
	int getCartlistPass(CartListVO cvo2);
	
	List<OrderVO> getCartlistOrderIdx();

	CartListVO getCartlistSelect(String cartlist_idx);

       //order-pay

	List<OrderVO> orderaddrproduct(OrderVO ovo);
	

	int getaddrchecked(AddrVO avo);




	
//프로덕 ============================================================







	 
}
