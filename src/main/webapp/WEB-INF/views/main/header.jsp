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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<title>header</title>
<script type="text/javascript">
	function addHover(f) {
	    f.classList.add('hovered');
	}
	
	function removeHover(f) {
	    f.classList.remove('hovered');
	}
	
	function mypage_firstchk() {
		location.href = "mypage_firstchk.do";
	}
	function not_connect() {
		alert("준비중입니다.");
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
				<li><a class="menu_title" href="product_list.do" onmouseout="removeHover(this)">PERFUME</a>
					<ul class="submenu">
						<li><a href="product_list.do">Perfume</a></li>
						<li><a href="product_balm.do">Perfume balm</a></li>
					</ul>
				</li>
				<li><a class="menu_title" onclick="not_connect()">HAND</a>
					<%-- <ul class="submenu">
						<li>Hand Cream</li>
						<li>Soap</li>
						<li>Hand sanitizer</li>
					</ul> --%>
				</li>
				<li><a class="menu_title" onclick="not_connect()">LIP</a>
					<%--<ul class="submenu">
						 <li>BODY</li>
						<li>Shower Re body</li>
						<li>Perfume De Body</li> 
					</ul>--%>
				</li>
				<li><a href="board_list.do" class="menu_title">Board</a></li>

			</ul>
		</div>

		<div class="header_el header_right">
			<c:choose>
				<c:when test="${empty user_idx}">
					<div class="header_login">
						<a href="login_main.do">로그인</a>
					</div>
					<div class="header_signup">
						<a href="signup.do">회원가입</a>
					</div>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${user_idx > 0}">
					<div class="welcome">${user_name}님, 환영합니다.</div>
					<div class="logout"><a href="logout.do">로그아웃</a></div>
					<div class="himage my">
						<a onclick="mypage_firstchk();"><img alt="people" src="resources/image/people-01.png" title="my"></a>
					</div>
					<div class="himage cart">
						<a href="cart_list.do"><img alt="cart"src="resources/image/cart-01.png" title="cart"></a>
					</div>
				</c:when>
			</c:choose>
		</div>
	</header>
	<div class="header_space"></div>
</body>
</html>