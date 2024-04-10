package com.ict.shop.common;

import java.io.PrintWriter;

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
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('로그인 후 이용 부탁드립니다.');");
			out.println("window.location.href = 'login_main.do'; </script>");
			return false;
		}
		return true;
	}
	
	

}
