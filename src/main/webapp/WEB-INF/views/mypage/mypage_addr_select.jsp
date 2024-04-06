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
    <!-- 
<script>
function clickBtn() {
    var arr = [];
    var check = document.getElementsByName("check");
    for (let i = 0; i < check.length; i++) {
        if (check[i].checked == true) {
         	location.href = "addr_checked.do?${addr_idx}";
        }
    }
}
</script> -->

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
					<c:forEach var="k" items="${list}">
						<div class="mypage_addr_inner">
							<form method="post" action="order_pay.do">
								<input type="button" value="배송지 선택하기" onclick="location.href='addr_checked.do?addr_idx=${k.addr_idx}'" class="mypage_addr_btn1" />
								<input type="radio"  name="check" value="0">
							    <input type="hidden" name="addr_idx" value="${k.addr_idx}">
							    <input type="hidden" name="addr_phone" value="${k.addr_phone}">
							    <input type="hidden" name="addr_name" value="${k.addr_name}">
							    <input type="hidden" name="addr_addr" value="${k.addr_addr}">
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