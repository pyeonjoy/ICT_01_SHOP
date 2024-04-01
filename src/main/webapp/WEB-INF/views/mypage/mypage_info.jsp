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
<style>
.mypage_info {
    width: 100%;
    margin: auto;
    text-align: center;
    margin-top: 50px; 
}

.mypage_info_table {
    width: 50%;
    border-collapse: separate;
    border-spacing: 0; 
    margin: auto;
}

.mypage_info_table th, .mypage_info_table td {
    padding: 10px;
    white-space: nowrap; 
    text-align: center; 
}

.mypage_info_table th:first-child, .mypage_info_table td:first-child {
    border-left: none;
}

.mypage_info_table th:last-child, .mypage_info_table td:last-child {
    border-right: none;
}

.info_input {
    width: calc(100% - 20px); 
    margin-right: 10px; 
    padding: 10px; 
    border: 2px solid #ccc; 
    border-radius: 5px;
    font-size: 16px;
    box-sizing: border-box; 
    text-align: center; 
    outline: none; 
}

.info_input:focus {
    border-color: #007bff; 
}

.email_wrapper, .address_wrapper {
    display: flex;
    align-items: center;
    justify-content: center;
}

.email_select, .address_button {
    margin-left: 5px; 
    font-size: 16px; 
}

.right_align {
    text-align: right !important;
}
</style>
</head>
<body>
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
					<p>비밀번호</p>
					<p>이름</p>
					<p>전화번호</p>
					<p>이메일</p>
					<p>주소</p>
				</div>
				<div class="mypage_info_right">
					<input class="info_input" type="text">
					 <input
						class="info_input" type="text"> <input class="info_input"
						type="text"> <input class="info_input" type="text">
					<input class="email_input" type="text">@<select>
						<option value="">-선택-</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="korea.com">korea.com</option>
						<option value="nate.com">nate.com</option>
						<option value="yahoo.com">yahoo.com</option>
					</select> <input class="mypage_info_addr_input" type="text">
					<button class="mypage_info_addr">주소검색</button>
					<input class="info_input" type="text">
					<div class="mypage_info_bottom">
						<button class=mypage_info_btn1>저장</button>
						<button class="mypage_info_btn1" onclick="mypage_changepwd_go()">비밀번호 변경</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="mypage_info_footer">
		<%@include file="../main/footer.jsp"%>
	</div>
</body>
</html>
