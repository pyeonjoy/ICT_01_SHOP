package com.ict.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.shop.common.MailUtils;
import com.ict.shop.common.TempKey;
import com.ict.shop.dao.vo.UserVO;
import com.ict.shop.service.EmailService;

@Controller
public class EmailController {
    @Autowired
    private EmailService emailService;
	@Autowired
	private JavaMailSender mailSender;

    @RequestMapping("login_findpwd.do")
    public ModelAndView findPw(UserVO uvo, Model model) throws Exception {
    	int result = emailService.findPwCheck(uvo);
    	System.out.println(result);
        if (result > 0) {
            return new ModelAndView("login/login_findinfo");
        } else {
    	    String memberKey = new TempKey().getKey(6, false);
    	    String user_pwd = BCrypt.hashpw(memberKey, BCrypt.gensalt());
    	    uvo.setUser_pwd(user_pwd);
    	    emailService.findPw(uvo);
    	        MailUtils sendMail = new MailUtils(mailSender);
    	        sendMail.setSubject("[임시 비밀번호 입니다.]");
    	        sendMail.setText("<h1>임시비밀번호 발급</h1>" +
    	                "<br/>" + uvo.getUser_id() + "님 "+
    	                "<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
    	                "<br/>임시비밀번호 :   <h2>"+memberKey+"</h2>"+
    	                "<br/>로그인 후 비밀번호 변경을 해주세요."+
    	                "<a href='http://localhost:8090/shop/login_main.do'>로그인 페이지</a>");
    	        sendMail.setFrom("joj506091@gmail.com", "Perfume");
    	        sendMail.setTo(uvo.getUser_email());
    	        sendMail.send();
            return new ModelAndView("login/login_main");
        }
    }
}
