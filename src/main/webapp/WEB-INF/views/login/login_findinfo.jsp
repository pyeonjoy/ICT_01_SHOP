<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>회원정보 찾기</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/login_findinfo.css" rel="stylesheet"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<script type="text/javascript">
	function find_id(f) {
		f.action="find_id.do";
		f.submit();
	}
	function find_pwd(f) {
		f.action="find_pwd.do";
		f.submit();
	}
</script>
</head>
<body>
<form method="get">
	<%@include file="../main/header.jsp"%>
	<div class="login_findinfo_wrapper">
		<div><h2>회원정보찾기</h2></div>
		<div class="login_findinfo__tilte" ></div>

		<h4>아이디 찾기</h4>
		<table>
		<tr>
			<td>이름 </td> 
			<td> <input class="login_findinfo_inputbox" type="text" name="user_name" placeholder="이름를 입력해 주세요" /></td>
			<td rowspan="2"><input class="login_findinfo_button" type="button" value="찾기" onclick="find_id(this.form)" /></td>
		</tr>
		<tr>
			<td>이메일 </td>
			<td><input class="login_findinfo_inputbox" type="text" name="user_email" placeholder="이메일을 입력 해 주세요" /></td>
		</tr>
		</table>
		<c:if test="${user_id != null}">
					<p>고객님의 아이디는 <b>${user_id}</b> 입니다.</p>
		</c:if>
		<hr style="margin: 20px auto;">
		<h4>비밀번호 찾기</h4>
		<table>
		<tr>
			<td>아이디</td>
			<td><input class="login_findinfo_inputbox" type="text" name="user_id" placeholder="아이디를 입력해 주세요" /></td>
			<td rowspan="2"><input class="login_findinfo_button" type="button" value="찾기" onclick="find_pwd(this.form)"/></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td> <input class="login_findinfo_inputbox" type="text" name="user_phone" placeholder="전화번호 입력 해 주세요" /></td>
		</tr>
		</table>
	</div>
	</form>
	<%@include file="../main/footer.jsp"%>
</body>
</html>