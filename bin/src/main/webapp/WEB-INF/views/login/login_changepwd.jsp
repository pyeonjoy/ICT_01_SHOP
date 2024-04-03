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

<script type="text/javascript">
	function reset_pwd(f) {
		const pwd1 = document.getElementById("pwd1").value;
		const pwd2 = document.getElementById("pwd2").value;
		if (pwd1 !== pwd2) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		f.action="login_changepwd.do";
		f.submit();
	}
</script>
</head>
<body>
	<form method="Get">
		<%@include file="../main/header.jsp"%>
		<div class="login_changepwd_wrapper">
			<div class="mypage_tilte">
				<h2>비밀번호 재설정</h2>
				<div class="login_changepwd_tilte"></div>
			</div>
			<div class="password_check">
				<table>
					<tr>
						<td>비밀번호</td>
						<td><input class="info" type="password" id="pwd1" name="user_pwd"
							placeholder="비밀번호를 입력 해 주세요" /></td>
							
						<td rowspan=2><input class="button" type="button"
							value="설정" onclick="reset_pwd(this.form)" />
							<input type="hidden" name="user_id" value="${user_id}"></td>
					</tr>
					<tr>
						<td>비빌번호 확인</td>
						<td><input class="info" type="password" id="pwd2"
							placeholder="다시 입력 해 주세요" /></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
	<%@include file="../main/footer.jsp"%>
</body>
</html>