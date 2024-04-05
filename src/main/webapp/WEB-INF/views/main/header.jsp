<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=DM+Serif+Text:ital@0;1&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=DM+Serif+Text:ital@0;1&family=Noto+Serif:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/header.css" rel="stylesheet"/>
<title>header</title>
<script type="text/javascript">
function board_go() {
	location.href="board_list.do";
}
function mypage_firstchk() {
	location.href="mypage_firstchk.do";
}
</script>

</head>
<body>
	<header id="header" class="header">
		<div class="header_el header_left">
			<p class="logo">
				<a href="main.do">perfume</a>
			</p>
			<ul class="menu">
				<li><a class="menu_tilte" href="product_list.do">PERFUME</a>
					<ul class="submenu">
						<li>Perfume</li>
						<li>Perfume balm</li>
						
					</ul></li>

				<li><a class="menu_tilte" href="product_list.do">HAND</a>
					<ul class="submenu">
						<li>Hand Cream</li>
						<li>Soap</li>
						<li>Hand sanitizer</li>
					</ul></li>

				<li><a class="menu_tilte" href="product_list.do">LIP</a>
					<ul class="submenu">
						<li>BODY</li>
						<li>Shower Re body</li>
						<li>Perfume De Body</li>
					</ul></li>

				<li><a class="menu_tilte" onclick="board_go()">Candle</a></li>

			</ul>
		</div>

		<div class="header_el header_right">
			<!--오른쪽 -->
			<!-- 사진이 없어서 유니코드로 대체했습니다. 후에 span은 삭제-->
			<div class="himage search">
				<span id="serch_icon">
				<img alt="search" src="resources/image/search-01.png" title="search">
				</span>
				<input class="search_input" type="text">
			</div>
			<c:choose>
				<c:when test="${empty user_idx}">
			<div>
				<p><a href="login_main.do">로그인</a>  /  <a href="signup.do">회원가입</a></p>
			</div>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${user_idx > 1}">
					<div class="himage my">
						<a onclick="mypage_firstchk();"><img alt="people" src="resources/image/people-01.png" title="my"></a>
					</div>
					<div class="himage cart">
						<a href="cart_list.do"><img alt="cart" src="resources/image/cart-01.png" title="cart"></a>
					</div>
					<p><a href="logout.do">로그아웃</a></p>
				</c:when>
			</c:choose>
		</div>
	</header>
	<div class="header_space"></div>
</body>
</html>