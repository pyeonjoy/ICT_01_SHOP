<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.mypage_changepwd_wrapper {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 90vh;
	/* 위치 조절 */
	padding-bottom: 100px;
}

.mypage_tilte {
	text-align: center;
	width: 300px;
}

.mypage_changepwd_wrapper td {
	padding: 5px;
}

.mypage_changepwd_check {
	display: flex;
	justify-content: center;
}

.mypage_changepwd_wrapper .button {
	padding: 5px;
	width: 370px
}

.mypage_changepwd_check table {
	margin: 20px 0px;
}

.mypage_changepwd_check input {
	padding: 5px;
}
.mypage_changepwd_reset input[type="button"]{
}
</style>
<script type="text/javascript">
	function reset_pwd(f) {
		const pwd1 = document.getElementById("pwd1").value;
		const pwd2 = document.getElementById("pwd2").value;
		if (pwd1 !== pwd2) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		f.action="mypage_changepwd_go.do";
		alert("성공적으로 변경되었습니다.");
		f.submit();
	}
</script>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<div class="mypage_changepwd_wrapper">
		<div class="mypage_tilte">
			<h2>비밀번호 변경</h2>
			<hr>
		</div>
		<form method="post">
		<div class="mypage_changepwd_check">
				<table>
					<tr>
						<td>비밀번호</td>
						<td><input class="info" type="password" id="pwd1" name="user_pwd"
							placeholder="비밀번호를 입력 해 주세요" /></td>
					</tr>
					<tr>
						<td>비빌번호 확인</td>
						<td><input class="info" type="password" id="pwd2"
							placeholder="다시 입력 해 주세요" /></td>
					</tr>
					<tr>
					<td colspan="2">
					<input type="button" class="button"
							value="설정" onclick="reset_pwd(this.form)" />
							<input type="hidden" name="user_id" value="${user_id}">
					</td>
					<td></td>
					</tr>
				</table>
		</div>
	</form>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>