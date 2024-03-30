<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>적립금 페이지</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<link href="${path}/resources/css/mypage_stack.css" rel="stylesheet"/>
</head>
<body>
		<div class="mypage_stack_aside">
		<%@include file="../main/aside_mypage.jsp"%>
		</div>

	<div class="mypage_stack_header">
	<%@include file="../main/header.jsp"%>
	</div>
	<div class="stack_title">
		<div style="font-size: 24px;">
			<h2>마이페이지</h2>
<div class="mypage_stack_stroke"></div>
		</div>
	</div>
	<div class="container">
		<div class="mypage_stack_main">
			<div class="profile">
				<span>${user_name} 님
					안녕하세요</span><br>
			</div>

			<div class="points">
				<div style="font-size: 24px;">포인트: 5,000</div>
			</div>
			<div class="coupons">
				<div style="font-size: 24px;">배송 현황</div>
				<p>
					배송중 <span>1</span>
				</p>
			</div>
		</div>
	</div>

	<div class="mypage_stack_footer">
<%@include file="../main/footer.jsp"%>
</div>
</body>
</html>

