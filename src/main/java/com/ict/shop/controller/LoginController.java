package com.ict.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shop.dao.vo.UserVO;
import com.ict.shop.service.login.ShopLoginService;

@Controller
public class LoginController {

	@Autowired
	private ShopLoginService shoploginservice;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private HttpSession session;

	@GetMapping("main.do") // 메인화면으로 되돌아가기
	public ModelAndView Main_Go() {

		return new ModelAndView("home");
	}

//login===============================================================================================================================================
	@PostMapping("congratulation.do") // 회원가입 처리 완료
	public ModelAndView congratulation(UserVO vo) {
		try {

			String encodedPassword = passwordEncoder.encode(vo.getUser_pwd());
			vo.setUser_pwd(encodedPassword);

			int result = shoploginservice.getShop_Insert(vo);
			int result2 = shoploginservice.getShop_Insert_addr(vo);

			if (result > 0) {
				ModelAndView mv = new ModelAndView("login/congratulation");
				mv.addObject("user_name", vo.getUser_name());
				return mv;
			} else {
				return new ModelAndView("login/signup_fail");
			}
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("main/signup_fail");
		}
	}

	@GetMapping("login_findinfo.do") // 아이디/비밀번호 진입 페이지 완료
	public ModelAndView Login_Findinfo() {

		return new ModelAndView("login/login_findinfo");
	}

	@GetMapping("login_main.do") // 로그인 페이지 완료
	public ModelAndView Login_Main() {

		ModelAndView mv = new ModelAndView("login/login_main");
		return mv;
	}


	@RequestMapping("login_ok.do") // 로그인 완료
	public ModelAndView Login_OK(UserVO uvo,HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView();
		UserVO result = shoploginservice.getShop_Login(uvo);
	    if (result != null && passwordEncoder.matches(uvo.getUser_pwd(), result.getUser_pwd())) {
	    	session.setAttribute("user_idx", result.getUser_idx());
			session.setAttribute("user_id", result.getUser_id());
			session.setAttribute("user_pwd", result.getUser_pwd());
			session.setAttribute("user_name", result.getUser_name());
			session.setAttribute("user_birth", result.getUser_birth());
			session.setAttribute("user_email", result.getUser_email());
			session.setAttribute("user_phone", result.getUser_phone());
			session.setAttribute("user_addr", result.getUser_addr());
			session.setAttribute("user_point", result.getUser_point());
			session.setAttribute("loginchk", "ok");
			session.setAttribute("uvo", result);
			mv.setViewName("redirect:main.do");
		} else {
			session.setAttribute("loginchk", "fail");
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			out.println("<script> alert('아이디 또는 비밀번호가 틀립니다. ');");
			out.println("history.go(-1); </script>");
			out.close();
			mv.setViewName("redirect:login_main.do");
		}
		return mv;
	}

	@GetMapping("signup.do") // 회원가입 페이지 완료
	public ModelAndView SignUp(UserVO vo) {
		return new ModelAndView("login/signup");
	}
	
	@RequestMapping("find_id.do") // 아이디 찾기 완료
	public ModelAndView Find_id(HttpServletRequest request, UserVO uvo, HttpServletResponse response)throws IOException {
	    ModelAndView mv = new ModelAndView();

	    uvo.setUser_name(request.getParameter("user_name"));
	    uvo.setUser_email(request.getParameter("user_email"));


	    UserVO result = shoploginservice.find_id(uvo);

	    if (result != null) {
	        mv.addObject("user_id", result.getUser_id());
	        mv.setViewName("login/login_findinfo");
	        return mv;
	    }else {
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			out.println("<script> alert('잘못 입력하셨습니다 다시 입력 해 주세요. ');");
			out.println("history.go(-1); </script>");
			out.close();
			mv.setViewName("redirect:login_findinfo.do");
	    }
	    return new ModelAndView("login/signup_fail");
	}
	@RequestMapping("logout.do")
	public ModelAndView Logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("home");
	}
}
