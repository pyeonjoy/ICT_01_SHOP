package com.ict.shop.service;

import java.util.List;

import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.HeartVO;
import com.ict.shop.dao.vo.OrderVO;
import com.ict.shop.dao.vo.ProductVO;
import com.ict.shop.dao.vo.UserVO;

public interface ShopService {

	
	
	int getShop_Insert(UserVO vo); // 회원가입

	UserVO getShop_Login(UserVO uvo); // 로그인

	UserVO find_id(UserVO vo); // 아이디찾기

	UserVO getUser_id(String user_id);
	
	UserVO find_pwd(UserVO uvo);
	
	int reset_pwd(UserVO uvo);
	//마이페이지 =========================================================
	//mypage_addr
	int getAddrInsert(AddrVO vo);

	List<AddrVO> getAddrList();
	
	int getAddrEdit(AddrVO avo);

	AddrVO getAddrDetail(AddrVO avo);

	//=======
	// cart list
	List<CartListVO> getCartList(String user_idx);
	
	int getCartlistDelete(String cartlist_idx);
	
	ProductVO getProductDetail(ProductVO pvo);

	OrderVO getOrderDetail(String order_idx);

	UserVO getUserDetail(String idx);

	// 관심상품 리스트
	public List<HeartVO> getShopHeartList();

	// 주문 내역 리스트
	public List<OrderVO> getShopOrderList();

	UserVO firstchk(String user_id);
	 
	List<ProductVO> getProductList();

	List<UserVO> getUserList();

	int getChangePwd(UserVO uvo);

	List<OrderVO> getOrderList(String order_idx, String product_idx);

	UserVO getMypage_Info(String user_id);

	int Mypage_Info_Change(String user_id);











	 
}
