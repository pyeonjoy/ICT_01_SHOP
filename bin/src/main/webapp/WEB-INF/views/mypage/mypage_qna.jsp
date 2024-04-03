<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="icon" href="/img/logo.favicon.png"/>
<link rel="apple-touch-icon" href="/img/logo.favicon.png"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<link href="${path}/resources/css/mypage_qna.css" rel="stylesheet"/>
<title>1대1 문의하기</title>

</head>
<body>
		<%@include file="../main/header.jsp"%>
<div class="mypage_qna_aside">
		<%@include file="../main/aside_mypage.jsp"%>
</div>
	<div class="mypage_qna">
	<form action="" method="post">
<div class="mypage_qna_wrapper">
<h2>1대1 문의하기</h2>
<div class="mypage_qna_stroke"></div>
<br>
	<table class="mypage_qna_table">
		<tr><th>NO</th><th>제목</th><th>작성일</th><th>작성자</th></tr>
		<tr><td>1</td><td><a href="">문의글 (누르면 비밀번호 확인 페이지)</a></td><td>24.03.14</td><td>관리자</td></tr>	
		<tr><td>1</td><td><a href="#">답변 RE ..(누르면 비밀번호 확인 페이지)</a></td><td>24.03.14</td><td>관리자</td></tr>	
		<tr><td>1</td><td><a href="#">문의글 (누르면 비밀번호 확인 페이지)</a></td><td>24.03.14</td><td>관리자</td></tr>	
		<tr><td>1</td><td><a href="#">답변 RE ..(누르면 비밀번호 확인 페이지)</a></td><td>24.03.14</td><td>관리자</td></tr>	
		<tr><td>1</td><td><a href="#">문의글 (누르면 비밀번호 확인 페이지)</a></td><td>24.03.14</td><td>관리자</td></tr>	
		<tr><td>1</td><td><a href="#">답변 RE ..(누르면 비밀번호 확인 페이지)</a></td><td>24.03.14</td><td>관리자</td></tr>	
		<tr><td>1</td><td><a href="#">문의글 (누르면 비밀번호 확인 페이지)</a></td><td>24.03.14</td><td>관리자</td></tr>				
	</table>
</div>
		
		<!-- wrapper 끝 -->
		<div class="mypage_qna_container">
			<select>
				<option>제목</option>
				<option>내용</option>
				<option>작성자</option>
				<option>아이디</option>
			</select>
			<input type="text" name="search" placeholder="Search" class="mypage_qna_search">
			<input type="submit" value="작성" class="mypage_qna_submit" onclick="location.href='mypage_qna_write'">
		</div>
		</form>
	</div>
	
		<%@include file="../main/footer.jsp"%>
</body>
</html>