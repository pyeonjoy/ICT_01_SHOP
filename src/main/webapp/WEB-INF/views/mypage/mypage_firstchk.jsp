<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 확인</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<link href="${path}/resources/css/mypage_firstchk.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<script type="text/javascript">
	// gpt 짱
	$(document).ready(function() {
	    $('.mypage_firstchk_chk i').on('click', function() {
	        var input = $(this).closest('.mypage_firstchk_chk').find('.pwd_box');
	        input.attr('type', input.attr('type') === 'password' ? 'text' : 'password');
	        $(this).toggleClass('fa-eye-slash fa-eye');
	    });
	});
	
	$(document).ready(function() {
		let pwdchk = "${pwdchk}";
		if (pwdchk == 'fail') {
			alert("비밀번호가 틀렸습니다.");
			return;
		}
	})

	function mypage_firstchk_ok(f) {
		f.action = "mypage_firstchk_ok.do";
		f.submit();
	}
</script>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<div class="mypage_firstchk_wrapper">
	<h2>비밀번호 확인${user_id}</h2>
	<div class="mypage_pwdchk_tilte" ></div>
	
	<form method="post">
		<div class="mypage_firstchk_chk">
	    <input class="pwd_box" type="password" id="password" name="user_pwd" placeholder="비밀번호를 입력하세요">
	    <span class="mypage_pwdchk_icon">
	        <i class="fa fa-eye-slash fa-lg"></i>
	    </span>
		<div class="check_btn">
			<input  type="button" value="확인" onclick="mypage_firstchk_ok(this.form)"></div>
		</div>
	</form>
	</div>
<%@include file="../main/footer.jsp"%>
</body>
</html>