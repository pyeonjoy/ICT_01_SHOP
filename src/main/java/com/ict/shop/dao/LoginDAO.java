package com.ict.shop.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.shop.dao.vo.UserVO;

@Repository
public class LoginDAO {

	private static final Logger logger = LoggerFactory.getLogger(LoginDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
//login==================================================================================================
	public int getShopInsert(UserVO uvo) {
		try {
			return sqlSessionTemplate.insert("login.login_insert", uvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public UserVO getShopLogin(UserVO uvo) {
		try {
			System.out.println(uvo.getUser_pwd()+"DAO에서");
			return sqlSessionTemplate.selectOne("login.logingo", uvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public UserVO find_id(UserVO vo) {
		try {
			System.out.println(vo.getUser_name() + "여기는어디징");
			System.out.println(vo.getUser_email() + "dao");
			return sqlSessionTemplate.selectOne("login.findid", vo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public UserVO find_pwd(UserVO uvo) {
		try {
			System.out.println("user_id는?"+uvo.getUser_id());
			System.out.println("user_phone는?"+uvo.getUser_phone());			
			return sqlSessionTemplate.selectOne("login.find_pwd", uvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public int reset_pwd(UserVO uvo) {
		try {
			return sqlSessionTemplate.update("login.reset_pwd",uvo);			
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

}
