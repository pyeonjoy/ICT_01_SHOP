package com.ict.shop.service.login;

import com.ict.shop.dao.vo.UserVO;

public interface ShopLoginService {
	// 회원가입
	int getShop_Insert(UserVO vo);

	// 회원가입 아이디 유효성 검사
	String getShopIdChk(String user_id);

	// 로그인
	UserVO getShop_Login(UserVO uvo);

	// 아이디찾기
	UserVO find_id(UserVO vo);

	// 회원가입 시 주소 기본배송지 설정
	int getShop_Insert_addr(UserVO vo);
}
