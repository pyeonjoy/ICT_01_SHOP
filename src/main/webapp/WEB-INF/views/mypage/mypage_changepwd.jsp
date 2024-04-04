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
	width: 300px
}

.mypage_changepwd_check table {
	margin: 20px 0px;
}

.mypage_changepwd_check input {
	padding: 5px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		let pwdchk = "${pwdchk}";
		if (pwdchk == 'fail') {
			alert("기존 비밀번호가 틀렸습니다.");
			pwdchk = "";
			return;
		}
		if (pwdchk == 'chkfail') {
			alert("비밀번호 확인이 틀렸습니다.");
			pwdchk = "";
			return;
		}
	})

	function mypage_changepwd_go(f) {
		const pwd1 = f.pwd1.value;
		const pwd2 = f.pwd2.value;
		const c_pwd = f.c_pwd.value;
	    for (var i = 0; i < f.elements.length; i++) {
	    	if (f.elements[i].value == "") {
	    		alert("입력 정보를 모두 입력하세요");
	            return;//수행 중단
	        }
	  	}

		f.action = "mypage_changepwd_ok.do";
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
					<td>신규 비밀번호</td>
					<td><input class="info" type="password" id="pwd1"name="user_pwd" placeholder="비밀번호를 입력 해 주세요"  /></td>
				</tr>
				<tr>
					<td>비빌번호 확인</td>
					<td><input class="info" type="password" id="pwd2" placeholder="다시 입력 해 주세요"  /></td>
				</tr>
			</table>
		</div>
		<input class="button" id="login" type="submit" value="저장" onclick="mypage_changepwd_go(this.form)" />
	</form>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>