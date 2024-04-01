<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<link href="${path}/resources/css/mypage_info.css" rel="stylesheet"/>
<script type="text/javascript">
	function mypage_changepwd_go() {
		location.href = "mypage_changepwd.do";
	}
</script>
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