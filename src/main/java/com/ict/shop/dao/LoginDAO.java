package com.ict.shop.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.shop.dao.vo.UserVO;

@Repository
public class LoginDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 회원가입
	public int getShopInsert(UserVO uvo) {
		try {
			return sqlSessionTemplate.insert("login.login_insert", uvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	// 로그인
	public UserVO getShopLogin(UserVO uvo) {
		try {
			return sqlSessionTemplate.selectOne("login.logingo", uvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	// 아이디찾기
	public UserVO find_id(UserVO vo) {
		try {
			return sqlSessionTemplate.selectOne("login.findid", vo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}


	public String getShopIdChk(String user_id) {
		try {
		  	int result = sqlSessionTemplate.selectOne("login.idchk", user_id);
		  	if(result>0) {
		  		return "0";
		  	}
		  	return "1" ;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public int getShop_Insert_addr(UserVO vo) {
			try {
				return sqlSessionTemplate.insert("login_addr_insert",vo);
			} catch (Exception e) {
				System.out.println(e);
			}
		return -1;
	}

}
