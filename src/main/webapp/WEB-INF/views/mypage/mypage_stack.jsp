<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="resources/css/mypage.css" rel="stylesheet" />
</head>
<body>
	<div class="mypage_stack_aside">
		<%@include file="../main/aside_mypage.jsp"%>
	</div>

	<div class="mypage_stack_header">
		<%@include file="../main/header.jsp"%>
	</div>
	<div class="mypage_stack_container mypage_wrapper_Atype">
		<div class="mypage_title">
	    	<h2>마이페이지</h2>
	      	<div class="mypage_title_line"></div>
	   </div>
		<div class="mypage_stack_main">
			<div class="profile">
				<span><b>${user_name}</b>님 안녕하세요</span>
			</div>

			<div class="points">
				<p><b>포인트</b></p>
				<p><fmt:formatNumber value="${user_point}" pattern="#,###" /></p>
			</div>
			<div class="coupons">
				<p><b>진행 중인 이벤트</b></p>
				<p><span>0</span></p>
			</div>
		</div>
	</div>
	<div class="mypage_stack_footer">
		<%@include file="../main/footer.jsp"%>
	</div>
</body>
</html>

