<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<link href="resources/css/mypage.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		 $("#mypage_btn1").click(function() {
			
		        let phone = $("#user_phone").val();
		        let email = $("#user_email").val();
		        let addr = $("#user_addr").val();
		        let email_pattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
				let phone_pattern = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})[0-9]{3,4}[0-9]{4}$/;

		        if (phone === "" || email === "" || addr === "") {
		            alert("입력칸을 모두 채워주세요.");
		            return false;
		        }
		        if (!email_pattern.test(email)) {
		            alert("올바른 이메일 형식이 아닙니다.");
		            return false;
		        }
		        if (!phone_pattern.test(phone)) {
		            alert("올바른 전화번호가 아닙니다. (- 금지)");
		            return false;
		        }
		        mypage_info_change_go(this.form);
		 });
	});

	function mypage_info_change_go(f) {
		f.action="mypage_info_change_go.do";
		f.submit();
		alert("수정이 완료되었습니다!");
	}
	
	function mypage_changepwd_go(f) {
		f.action="mypage_changepwd.do";
	}

</script>
</head>
<body>
    <div class="mypage_info_header">
        <%@include file="../main/header.jsp"%>
    </div>
    <div class="mypage_info_aside_mypage">
        <%@include file="../main/aside_mypage.jsp"%>
    </div>

    <div class="mypage_info_body">
	    <div class="mypage_info_wrap mypage_wrapper_Atype">
	        <div class="mypage_title">
	            <h2>회원 정보</h2>
	         	<div class="mypage_title_line"></div>
	        </div>
			<form method="post">
	            <div class="mypage_info_inner">
	                <div class="mypage_info_left">
	                    <p>아이디</p>
	                    <p>이름</p>
	                    <p>전화번호</p>
	                    <p>이메일</p>
	                    <p>주소</p>
	                </div>
	                <div class="mypage_info_right mypage_input">
	                    <input class="info_input" type="text" name="user_id" value="${uvo.user_id}" disabled> 
	                    <input class="info_input" type="text" name="user_name" value="${uvo.user_name}" disabled> 
	                    <input class="info_input" type="text" id="user_phone"name="user_phone" value="${uvo.user_phone}">
	                    <input class="info_input" type="text" id="user_email"name="user_email" value="${uvo.user_email}">
	                    <input class="info_input" type="text" id="user_addr" name="user_addr" value="${uvo.user_addr}">
	                    <div class="mypage_info_bottom">
	                        <button class=mypage_info_btn1  id="mypage_btn1" >저장</button>
	                        <input type="hidden" name="user_id" value="${user_id}">
	                        <button class="mypage_info_btn1" onclick="mypage_changepwd_go(this.form)">비밀번호 변경</button>
	                    </div>
	                </div>
	            </div>
		    </form>
        </div>
    </div>
    <div class="mypage_info_footer">
        <%@include file="../main/footer.jsp"%>
    </div>
</body>
</html>