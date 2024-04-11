<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/login_main.css" rel="stylesheet" />
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script type="text/javascript">
$(document).ready(function(){
    $('.login_main_pwdchk i').on('click', function(){
        let $input = $(this).closest('.login_main_pwdchk').prev('input');
        if ($input.attr('type') === 'password') {
            $input.attr('type', 'text');
            $(this).removeClass('fa-eye').addClass('fa-eye-slash');
        } else {
            $input.attr('type', 'password');
            $(this).removeClass('fa-eye-slash').addClass('fa-eye');
        }
    });
});
	function sign_up() {
		location.href = 'signup.do';
	}
	function login_go(f) {
				f.action = "login_ok.do";
				f.submit();
	}
	function find_go() {
		location.href = 'login_findinfo.do';
	}
</script>
</head>
<body>
	<form method="post" action="login_ok.do">
		<%@include file="../main/header.jsp"%>
		<div class="login_main_wrapper">
			<div class="mypage_tilte">
				<h2>로그인</h2>
			</div>
			<div class="login_main_tilte"></div>

			<table class="wrap_table_login">
				<tr>
					<td>아이디</td>
					<td><input class="inputbox" type="text" id="id" name="user_id"
						placeholder="아이디를 입력해 주세요" autocomplete="off"></td>
					<td rowspan="2"><input class="login_main_button" id="login"
						type="button" value="로그인" onclick="login_go(this.form)"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input class="inputbox" type="password" name="user_pwd"
						placeholder="비밀번호를 입력 해 주세요" autocomplete="off"> 
						<span class="login_main_pwdchk"> <i class="fa fa-eye fa-lg"></i></span>
					</td>
				</tr>
			</table>
			<hr>
			<table class="login_main_accfind">
				<tr>
					<td class="acc_text">계정을 잊으셨습니까?</td>
					<td class="acc_button"><input class="button_under"
						type="button" value="아이디 찾기/비밀번호 찾기" onclick="find_go(this.form)"></td>
				</tr>
				<tr>
					<td class="acc_text">아직 PERFUME 고객이 아니십니까?</td>
					<td class="acc_button"><input class="button_under"
						type="button" value="회원가입" onclick="sign_up(this.form)"></td>
			</table>
		</div>
	</form>
	<footer><%@include file="../main/footer.jsp"%></footer>
</body>
</html>