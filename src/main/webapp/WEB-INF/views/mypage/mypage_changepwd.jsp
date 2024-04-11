<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<link href="resources/css/mypage.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	<div class="mypage_changepwd_wrapper mypage_wrapper_Atype margin-top_20">
		<div class="mypage_title">
			<h2>비밀번호 변경</h2>
			<div class="mypage_title_line"></div>
		</div>
		<form method="post">
		<div class="mypage_changepwd_check mypage_input">
				<table>
					<tr>
						<td>비밀번호</td>
						<td><input class="info" type="password" id="pwd1" name="user_pwd" placeholder="비밀번호를 입력 해 주세요" /></td>
						<td colspan="2" rowspan="2">
							<input type="button" class="button buttonAtype" value="설정" onclick="reset_pwd(this.form)" />
							<input type="hidden" name="user_id" value="${user_id}">
						</td>
					</tr>
					<tr>
						<td>비빌번호 확인</td>
						<td><input class="info" type="password" id="pwd2" placeholder="다시 입력 해 주세요" /></td>
				</table>
		</div>
	</form>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>