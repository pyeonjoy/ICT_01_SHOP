<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<link href="${path}/resources/css/signup.css" rel="stylesheet"/>
<script type="text/javascript">
	function SignUp_go(f) {
		f.action="congratulation.do";
		f.submit();
	}
</script>
</head>
<body>
<form method="post" action="congratulation.do">
	<div class="sign_header">
		<%@include file="header.jsp"%>
	</div>
	<div class="sign_aside_mypage">
		<%@include file="aside_mypage.jsp"%>
	</div>
	<div class="sign_body">
		<div class="sign_wrap">
		<h2 style="margin-bottom: 30px;">회원 가입</h2>
		<div class="sign_stroke" ></div>
			<div class="sign_left">
				<p>아이디</p>
				<p>비밀번호</p>
				<p>비밀번호 확인</p>
				<p>이름</p>
				<p>전화번호</p>
				<p>이메일</p>
				<p>주소</p>
				<p>&nbsp;</p>
				<p>성별</p>
			</div>
			<div class="sign_right">
				<!-- 파일 변경으로 인해 수정해야할 부분 -->
				<input class="sign_info_input" type="text" name="user_id">
				<input class="sign_info_input" type="text" name="user_pwd">
				<input class="sign_info_input" type="text"> 
				<input class="sign_info_input" type="text"> 
				<input class="sign_addr_input" type="text">
				<button class="sign_addr">본인인증</button>
				<input class="sign_email_input" type="text">
				<select class="sign_email">
					<option value="">-선택-</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="korea.com">korea.com</option>
					<option value="nate.com">nate.com</option>
					<option value="yahoo.com">yahoo.com</option>
				</select>
				<input class="sign_addr_input" type="text">
				<button class="sign_addr">주소검색</button>
				<input class="sign_info_input" type="text">
				<button class="sign_gender">여자</button>
				<button class="sign_gender">남자</button>
			</div>
			<div class="sign_bottom">
				<input type="checkbox">
				<p style="display: inline-block;">개인정보 약관에 동의하시겠습니까?</p>
				<button class="sign_btn1" type="submit">회원가입</button>
			</div>
		</div>
	</div>
	<div class="sign_footer">
		<%@include file="footer.jsp"%>
	</div>
		</form>
</body>
</html>