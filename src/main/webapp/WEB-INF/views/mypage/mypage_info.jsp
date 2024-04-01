<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<link href="${path}/resources/css/mypage_info.css" rel="stylesheet" />
<script type="text/javascript">
	function mypage_info_change_go(f) {
		f.action="mypage_info_change_go.do";
		f.submit();
	}

</script>
</head>
<body>
<form method="post">
	<div class="mypage_info_header">
		<%@include file="../main/header.jsp"%>
	</div>
	<div class="mypage_info_aside_mypage">
		<%@include file="../main/aside_mypage.jsp"%>
	</div>

	<div class="mypage_info_body">
		<div class="mypage_info_wrap">
			<div class="mypage_tilte">
				<h2>회원 정보</h2>
			</div>
			<div class="mypage_info_tilte"></div>
			<div class="mypage_info_inner">
				<div class="mypage_info_left">
					<p>아이디</p>
					<p>이름</p>
					<p>전화번호</p>
					<p>이메일</p>
					<p>주소</p>
				</div>
				<div class="mypage_info_right">
					<input class="info_input" type="text" name="user_id" value="${user_id}" disabled> 
					<input class="info_input" type="text" name="user_name" value="${user_name}" disabled> 
					<input class="info_input" type="text" name="user_phone" value="${user_phone}">
					<input class="info_input" type="text" name="user_email" value="${user_email}">
					<input class="info_input" type="text" name="user_addr" value="${user_addr}">
					<div class="mypage_info_bottom">
						<button class=mypage_info_btn1 onclick="mypage_info_change_go(this.form)">저장</button>
						<input type="hidden" name="user_id" value="${user_id}">
						<button class="mypage_info_btn1" onclick="mypage_changepwd_go(this.form)">비밀번호 변경</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
	<div class="mypage_info_footer">
		<%@include file="../main/footer.jsp"%>
	</div>
</body>
</html>
