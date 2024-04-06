package com.ict.shop.service;

import com.ict.shop.dao.vo.UserVO;

public interface EmailService {

	int findPwCheck(UserVO uvo) throws Exception;

	int findPw(UserVO uvo) throws Exception;
}
