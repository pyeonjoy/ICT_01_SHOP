<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<div class="mypage_notice_aside">
		<%@include file="../main/aside_mypage.jsp"%>
	</div>
	<div class="mypage_notice mypage_notice_flex">
		<div class="mypage_notice_flex">
			<h2>공지사항</h2>
			<div class="mypage_notice_tilte" ></div>
			<table class="mypage_notice_table">
				<tr>
					<th>NO</th>
					<th>제목</th>
					<th>작성일</th>
					<th>작성자</th>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="#" class="mypage_notice_title">공지사항 제목</a></td>
					<td>24.03.14</td>
					<td>관리자</td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="#" class="mypage_notice_title">공지사항 제목</a></td>
					<td>24.03.14</td>
					<td>관리자</td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="#" class="mypage_notice_title">공지사항 제목</a></td>
					<td>24.03.14</td>
					<td>관리자</td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="#" class="mypage_notice_title">공지사항 제목</a></td>
					<td>24.03.14</td>
					<td>관리자</td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="#" class="mypage_notice_title">공지사항 제목</a></td>
					<td>24.03.14</td>
					<td>관리자</td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="#" class="mypage_notice_title">공지사항 제목</a></td>
					<td>24.03.14</td>
					<td>관리자</td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="#" class="mypage_notice_title">공지사항 제목</a></td>
					<td>24.03.14</td>
					<td>관리자</td>
				</tr>
			</table>

			<!-- wrapper 끝 -->
			<div class="mypage_notice_container">
				<div class="mypage_notice_flex">
					<select>
						<option>제목</option>
						<option>내용</option>
						<option>작성자</option>
						<option>아이디</option>
					</select>
					<input type="text" name="search" placeholder="Search" class="mypage_notice_search">
				</div>
			</div>
		</div>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>
