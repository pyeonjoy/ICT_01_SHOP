<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<link href="resources/css/mypage.css" rel="stylesheet" />
<link href="resources/css/order_pay.css" rel="stylesheet" />
 
<script>
function addr_addr_ok(f) {
	f.action = "addr_checked.do";
	alert("추가 되었습니다.");
	f.submit();
}
</script>

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
				<c:when test="${empty list}">
					<h3>원하는 정보가 존재하지 않습니다.</h3>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${list}">
						<div class="mypage_addr_inner" style="border-bottom: 1px solid black; padding:20px;">
							<form method="post" action="order_pay.do">
							    <input type="hidden" name="addr_idx" value="${k.addr_idx}">
							    <input type="hidden" name="order_idx" value="${k.order_idx}">
							    <input type="hidden" name="addr_phone" value="${k.addr_phone}">
							    <input type="hidden" name="addr_name" value="${k.addr_name}">
							    <input type="hidden" name="addr_addr" value="${k.addr_addr}">
							    <button class="mypage_addr_btn2"  value="배송지 선택하기"  onclick="addr_addr_ok(this.form)">선택</button>
							    <p>${k.addr_name}</p>
							    <p>${k.addr_phone}</p>
							    <p>${k.addr_addr}</p>
							</form>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>