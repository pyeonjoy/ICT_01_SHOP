package com.ict.shop.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.AsyncHandlerInterceptor;

public class LoginInterceptor implements AsyncHandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception{
		HttpSession session = request.getSession(true);
		Object obj =  session.getAttribute("loginchk");
		if(obj == null) {
			request.getRequestDispatcher("/WEB-INF/views/login/login_main.jsp").forward(request, response);
			return false;
		}
		return true;
	}
	
	

}
