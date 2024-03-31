<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addr</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<link href="${path}/resources/css/mypage_addr.css" rel="stylesheet" />
<script type="text/javascript">
function addr_edit(f) {
	f.action ="mypage_addr_edit.do?addr_idx=${addr_idx}";
	//f.action ="mypage_addr_edit.do?addr_idx=${addr_idx}";
	f.submit();
}
</script>
<!--css파일 죽어도 못먹어서 복붙해 -->
<style type="text/css">

.mypage_addr_wrap {
	line-height: 35px;
	width: 500px;
}

.mypage_addr_body {
	display: flex;
	justify-content: center;
	margin: 200px auto 200px;
	width: 80%;
}

.mypage_addr_wrap h2 {
	text-align: center;
}

.mypage_addr_wrap p {
	font-size: 14px;
	width: 470px;
	margin: -10px 0px 0px 10px;
}

.mypage_addr_inner {
	margin: 30px 0px;
}

.mypage_addr_btn1 {
	font-size: 10px;
	color: black;
	width: 500px;
	height: 30px;
	margin: 0;
	text-align: center;
	line-height: 15px;
}

.mypage_addr_btn2 {
	width: 50px;
	height: 30px;
	border-radius: 5px;
	line-height: 15px;
	float:right;
}

.mypage_addr_aside_mypage {
	float: left;
	margin-top: 0px;
}

.mypage_tilte {
	margin-top: 50px;
	position: absolute;
    top: 170px;
}

#footer{
	position: static;
}
.mypage_tilte_stroke{
background-color: black;
color: black;
height: 5px;
font-size: 15px;
line-height: 35px;
margin: 0px auto 0px;
width: 114px;
}
</style>

</head>
<body>
	<div class="mypage_addr_header">
		<%@include file="../main/header.jsp"%>
	</div>
	<div class="mypage_addr_aside_mypage">
		<%@include file="../main/aside_mypage.jsp"%>
	</div>
	<div class="mypage_addr_body">
		<div class="mypage_tilte">
			<h2>배송지 목록</h2>
		<div class="mypage_tilte_stroke"></div>
		</div>
		
		
		<div class="mypage_addr_wrap">
			<c:choose>
				<c:when test="${empty list }">
					<h3>원하는 정보가 존재하지 않습니다.</h3>
				</c:when>
				<c:otherwise>
					<br>
					<button class="mypage_addr_btn1" onclick="location.href='mypage_addr_add.do'">배송지추가</button>
					<c:forEach var="k" items="${list}">
						<div class="mypage_addr_inner">
							<form action="post">
								<input type = "hidden" name="addr_idx" value="${k.addr_idx}">
								<input type = "hidden" name="addr_phone" value="${k.addr_phone}">
								<input type = "hidden" name="addr_name" value="${k.addr_name}">
								<input type = "hidden" name="addr_addr" value="${k.addr_addr}">
								<button class="mypage_addr_btn2" onclick="addr_edit(this.form)">수정</button>
								<p>${k.addr_name}</p>
								<p>${k.addr_phone}</p>
								<p>${k.addr_addr}</p>
							</form>
							<hr>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>