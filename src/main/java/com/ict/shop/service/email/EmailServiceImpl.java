package com.ict.shop.service.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.shop.dao.EmailDAO;
import com.ict.shop.dao.vo.UserVO;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private EmailDAO edao;

	@Override
	public int findPwCheck(UserVO uvo) throws Exception {
		return edao.findPwCheck(uvo);
	}

	@Override
	public int findPw(UserVO uvo) throws Exception {
		return edao.findPw(uvo);
	}
}
