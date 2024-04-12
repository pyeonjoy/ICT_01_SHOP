<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>회원정보 찾기</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/login_findinfo.css" rel="stylesheet"/>
<link href="resources/css/mypage.css" rel="stylesheet" />
<script type="text/javascript">
	function find_id(f) {
		f.action="find_id.do";
		f.submit();
	}
	function find_pwd(f) {
		f.action="login_findpwd.do";
		f.submit();
	}
</script>
</head>
<body>
<%@include file="../main/header.jsp"%>
<div class="login_findinfo_wrapper mypage_wrapper_Atype margin_top_10">
	<div class="mypage_tilte"  style="width: 148px;"><h2>회원 정보 찾기</h2>
		<div class="mypage_title_line"></div>
	</div>
	<div class="login_findinfo_container">
	<form method="post" name="findid">
		<h4>아이디 찾기</h4>
		<table>
			<tr>
				<td>이름 </td> 
				<td> <input class="login_findinfo_inputbox" type="text" name="user_name" placeholder="이름를 입력해 주세요" autocomplete="off"/></td>
				<td rowspan="2"><input class="login_findinfo_button" type="button" value="찾기" onclick="find_id(findid)" /></td>
			</tr>
			<tr>
				<td>이메일 </td>
				<td><input class="login_findinfo_inputbox" type="text" name="user_email" placeholder="이메일을 입력 해 주세요" autocomplete="off"/></td>
			</tr>
		</table>
	</form>
	<c:if test="${user_id != null}">
		<p>고객님의 아이디는 <b>${user_id}</b> 입니다.</p>
	</c:if>
	<hr style="margin: 20px auto;">
	<form method="post" name="findpwd">
		<h4>비밀번호 찾기</h4>
		<table>
			<tr>
				<td>아이디</td>
				<td><input class="login_findinfo_inputbox" type="text" name="user_id" placeholder="아이디를 입력해 주세요"autocomplete="off" /></td>
				<td rowspan="2"><input class="login_findinfo_button" type="button" value="찾기" onclick="find_pwd(findpwd)"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td> <input class="login_findinfo_inputbox" type="text" name="user_email" placeholder="이메일을 입력 해 주세요"autocomplete="off" /></td>
			</tr>
		</table>
	</form>
	</div>
</div>
<%@include file="../main/footer.jsp"%>
</body>
</html>
