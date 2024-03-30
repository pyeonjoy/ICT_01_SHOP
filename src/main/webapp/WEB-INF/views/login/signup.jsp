<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<link href="${path}/resources/css/signup.css" rel="stylesheet"/>
<script type="text/javascript">
function SignUp_go(f) {
	/* 비밀번호 재입력 확인 */
	const pwd1 = document.getElementById("pwd1").value;
	const pwd2 = document.getElementById("pwd2").value;
	
	if (pwd1 !== pwd2) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	f.action="congratulation.do";
	f.submit();
}

</script>
</head>
<body>
<form method="post" action="congratulation.do">
	<div class="sign_header">
		<%@include file="../main/header.jsp"%>
	</div>
	<div class="sign_body">
		<div class="sign_wrap">
		<h2 style="margin-bottom: 30px;">회원 가입</h2>
		<div class="sign_stroke" ></div>
			<div class="sign_left">
				<p>아이디</p>
				<p>비밀번호</p>	
				<p>비밀번호 확인</p>
				<p>이름</p>
				<p>전화번호</p>
				<p>생년월일</p>
				<p>이메일</p>
				<p>주소</p>
			</div>
			<div class="sign_right">
				<!-- 파일 변경으로 인해 수정해야할 부분 -->
				<input class="sign_info_input" type="text" name="user_id" placeholder="아이디를 입력해주세요." required>
				<input class="sign_info_input" type="password" id="pwd1" name="user_pwd" placeholder="비밀번호를 입력해주세요." required>
				<input class="sign_info_input" type="password" id="pwd2" placeholder="다시한번 입력해주세요." required> 
				<input class="sign_info_input" type="text" name="user_name" placeholder="이름을 입력해주세요." required> 
				<input class="sign_info_input" type="text" name="user_phone" placeholder="전화번호를 입력해주세요." required>
				<input class="sign_info_input" type="text" name="user_birth" placeholder="생년월일 ex)980331" required>
				<input class="sign_info_input" type="text" name="user_email" placeholder="이메일을 입력해주세요." required>
				<input class="sign_info_input" type="text" name="user_addr" placeholder="주소를 입력해주세요." required>
			</div>
			<div class="sign_bottom">
				<input type="checkbox">
				<p style="display: inline-block;">개인정보 약관에 동의하시겠습니까?</p>
				<button class="sign_btn1" type="button" onclick="SignUp_go(this.form)">회원가입</button>
			</div>
		</div>
	</div>
	<div class="sign_footer">
		<%@include file="../main/footer.jsp"%>
	</div>
		</form>
</body>
</html>