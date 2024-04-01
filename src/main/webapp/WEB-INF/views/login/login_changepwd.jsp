<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<link href="${path}/resources/css/login_changepwd.css" rel="stylesheet"/>

</head>
<body>
	<%@include file="../main/header.jsp"%>
	<div class="login_changepwd_wrapper">
		<div class="mypage_tilte">
			<h2>비밀번호 재설정</h2>
			<div class="login_changepwd_tilte" ></div>
		</div>
		<div class="password_check">
		<table>
			<tr>
				<td>비밀번호</td>
				<td> <input class="info" type="text" id="pwd1" name="pwd" placeholder="비밀번호를 입력 해 주세요" /></td>
				<td rowspan=2><input class="button" id="login" type="submit" value="설정" /></th>
			</tr>
			<tr>
				<td>비빌번호 확인</td>
				<td> <input class="info" type="password" id="pwd2" name="pwd" placeholder="다시 입력 해 주세요" /></td>
				<td></td>
			</tr>
		</table>
		</div>
		
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>