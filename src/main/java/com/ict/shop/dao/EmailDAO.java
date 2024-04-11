package com.ict.shop.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.shop.dao.vo.UserVO;

@Repository
public class EmailDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int findPwCheck(UserVO uvo) {
		try {			
			return sqlSessionTemplate.selectOne("email.findcheck", uvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public int findPw(UserVO uvo) throws Exception {
		try {
			return sqlSessionTemplate.update("email.changepwd",uvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
}
