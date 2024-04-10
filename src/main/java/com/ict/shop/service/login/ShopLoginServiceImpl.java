package com.ict.shop.service.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.shop.dao.LoginDAO;
import com.ict.shop.dao.vo.UserVO;
@Service
public class ShopLoginServiceImpl implements ShopLoginService {
	@Autowired
	private LoginDAO ldao;

	// 회원가입
	@Override
	public int getShop_Insert(UserVO vo) {
		return ldao.getShopInsert(vo);
	}

	// 회원가입 아이디 유효성 검사
	@Override
	public UserVO getShop_Login(UserVO vo) {
		return ldao.getShopLogin(vo);
	}

	// 로그인
	@Override
	public UserVO find_id(UserVO vo) {
		return ldao.find_id(vo);
	}

	// 아이디찾기
	@Override
	public String getShopIdChk(String user_id) {
		return ldao.getShopIdChk(user_id);
	}

	// 회원가입 시 주소 기본배송지 설정
	@Override
	public int getShop_Insert_addr(UserVO vo) {
		return ldao.getShop_Insert_addr(vo);
	}
}
