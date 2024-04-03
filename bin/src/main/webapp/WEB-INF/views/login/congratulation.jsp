<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<title>회원가입 완료</title>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<link href="${path}/resources/css/congratulation.css" rel="stylesheet"/>
<link rel="stylesheet" href="${path}/resources/congratulation.css">

</head>
<body>
<form method="post">
	<%@include file="../main/header.jsp"%>
	<div class="cong_wrapper">
		<div class="mypage_tilte"><h2>회원가입완료</h2></div>
		<div class="mypage_tilte_tilte" ></div>
		<img src="resources/image/good.png" alt="축하이미지" />
		<p>
			${user_name}님 <br>
			PERFUME 회원이 되신것을 축하합니다.
			<!-- DB에서 이름 값 가져와야함  -->
		</p>
		<input type="button" value="상품둘러보기" onclick="location.href='product_list.do'" />
		<!-- 추후 경로 -->
	</div>
	<%@include file="../main/footer.jsp"%>
	</form>
</body>
</html>