package com.ict.shop.controller;

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
import com.ict.shop.service.ShopService;

@Controller
public class LoginController {

	@Autowired
	private ShopService shopservice;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private HttpSession session;

	@GetMapping("main.do") // 메인화면으로 되돌아가기
	public ModelAndView Main_Go() {

		return new ModelAndView("home");
	}

//login===============================================================================================================================================
	@PostMapping("congratulation.do") // 회원가입 처리
	public ModelAndView congratulation(UserVO vo) {
		try {

			String encodedPassword = passwordEncoder.encode(vo.getUser_pwd());
			vo.setUser_pwd(encodedPassword);

			int result = shopservice.getShop_Insert(vo);

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

	@GetMapping("login_changepwd.do") // 아이디/비밀번호 찾기 진입 후 비밀번호 찾기 페이지
	public ModelAndView Login_Changepwd() {

		return new ModelAndView("login/login_changepwd");
	}

	@GetMapping("login_findinfo.do") // 아이디/비밀번호 진입 페이지
	public ModelAndView Login_Findinfo() {

		return new ModelAndView("login/login_findinfo");
	}

	@RequestMapping("login_ok.do") // 로그인 완료
	public ModelAndView Login_OK(HttpServletRequest request, HttpServletResponse response, UserVO uvo) {
		ModelAndView mv = new ModelAndView();
	
		UserVO result = shopservice.getShop_Login(uvo);
	
		if (result != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user_id", result.getUser_id());
			session.setAttribute("user_pwd", result.getUser_pwd());
			session.setAttribute("uvo", result);
			mv.setViewName("redirect:main.do");
		} else {
			mv.setViewName("login/signup_fail");
		}
	
		return mv;
	}

	@GetMapping("login_main.do") // 로그인 페이지
	public ModelAndView Login_Main() {

		ModelAndView mv = new ModelAndView("login/login_main");
		return mv;
	}

	@GetMapping("signup.do") // 회원가입 페이지
	public ModelAndView SignUp(UserVO vo) {
		return new ModelAndView("login/signup");
	}
	
	@RequestMapping("find_id.do") // 아이디 찾기
	public ModelAndView Find_id(HttpServletRequest request, UserVO uvo) {
	    ModelAndView mv = new ModelAndView();

	    uvo.setUser_name(request.getParameter("user_name"));
	    uvo.setUser_email(request.getParameter("user_email"));

	    System.out.println(uvo.getUser_name() + "이름입력칸 컨트롤러");
	    System.out.println(uvo.getUser_email() + "이메일입력칸 컨트롤러");

	    UserVO result = shopservice.find_id(uvo);

	    if (result != null) {
	        System.out.println(result.getUser_id() + "내 아이디는 !?");
	        System.out.println(uvo.getUser_id()+"uvo");
	        mv.addObject("user_id", result.getUser_id());
	        mv.setViewName("login/login_findinfo");
	        return mv;
	    }
	    return new ModelAndView("login/signup_fail");
	}
}
