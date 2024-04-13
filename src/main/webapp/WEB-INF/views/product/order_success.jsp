<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<meta charset="UTF-8">
<head>
<title>결제 완료</title>
<style type="text/css">
.order_success_wrapper {
	margin-top: 90px;
	text-align: center;
	justify-content: center;
	line-height: 30px;
}

.order_success_wrapper p {
	font-size: 20px;
	font-weight: bold;
}

.order_success_wrapper input[type="button"] {
	padding: 10px 50px;
	margin: 3px;
}

.order_success_table {
	width: 380px;
	height: 50%;
	margin: auto;
	table-layout: fixed;
	border-collapse: collapse;
}

.order_success_table tr {
	border-bottom: 1px solid #888;
}

.order_success_table td {
	padding: 3px;
}

.order_success_table td:nth-of-type(2) {
	width: 30px;
}

.order_sucess_right {
	text-align: center;
	margin-right: 10px;
}

.order_sucess_left {
	text-align: left;
}

.order_success_bottom {
	margin-top: 15px;
}
</style>
</head>
<body>

	<%@include file="../main/header.jsp"%>
	<div class="order_success_wrapper">
		<h2>${user_name}님,주문이 완료되었습니다.</h2>
		<img src="resources/image/success.png" alt="주문완료" />
		<h4>주문번호 : ${order_num}</h4>
		<%--	오늘날짜+시간분초+order_idx --%>
		<br>
		<h4>주문정보</h4>
		<br>
		<table class="order_success_table">
			<tr>
				<td class="order_sucess_right">주문 상품</td>
				<td></td>
				<td colspan="2" class="order_sucess_left">
				<c:forEach items="${order}" var="k">
					${k.product_name} * ${k.order_count}<br>
				</c:forEach></td>
			</tr>
			<tr>
				<td class="order_sucess_right">주문자</td>
				<td></td>
				<td colspan="2" class="order_sucess_left">${user_name}</td>
			</tr>
			<tr>
				<td class="order_sucess_right">배송지</td>
				<td></td>
				<td colspan="2" class="order_sucess_left">${order_addr}</td>
			</tr>
			<tr>
				<td class="order_sucess_right">연락처</td>
				<td></td>
				<td colspan="2" class="order_sucess_left">${order_phone}</td>
			</tr>
			<tr>
				<td class="order_sucess_right">결제 금액</td>
				<td></td>
				<td colspan="2" class="order_sucess_left">
					<fmt:formatNumber value="${order_total}" pattern="#,##0" />원
				</td>
			</tr>
		</table>
		<div class="order_success_bottom">
			<input type="button" value="주문내역 조회"
				onclick="location.href='mypage_order.do'" /> <input type="button"
				value="메인화면 이동" onclick="location.href='main.do'" />
		</div>
	</div>

	<%@include file="../main/footer.jsp"%>

</body>
</html>
