<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<meta charset="UTF-8">
<head>
<title>결제 완료</title>
<style type="text/css">

.order_success_wrapper {
	margin-top:90px;
	text-align: center;
	justify-content: center;
	line-height:30px;
}

.order_success_wrapper p {
	font-size: 20px;
	font-weight: bold;
}

.order_success_wrapper input[type="button"] {
	padding: 10px 50px;
	margin: 3px;

}

.order_success_table{
	width: 90%;
	height: 50%;
	margin: auto;
	table-layout: fixed;
	border-collapse: collapse;
	
}

.order_success_table td:nth-child(4){
	border-bottom: 1px solid black;
	padding: 3px;
}
.order_success_table td:nth-child(3){
	border-bottom: 1px solid black;
	padding: 3px;
}

.order_sucess_right{
	text-align: right;
	margin-right: 10px;
}
.order_sucess_left{
	text-align: left;
}
.order_success_bottom{
	margin-top: 15px; 

}
</style>
</head>
<body>

	<%@include file="../main/header.jsp"%>
	<div class="order_success_wrapper">
			<h2>노조영님, 주문이 완료되었습니다.</h2>
			<img src="resources/image/success.png" alt="주문완료" />
			<h4>주문번호 : 20240317190755</h4>
			<!-- 주문번호 랜덤값 보단 오늘날짜+시간 분 초 이런식으로 하는게 좋아보임 -->
			<br>
			<h4>주문정보</h4>
			<br>
			<table class="order_success_table">
				<tr>
					<td></td>
					<td></td>
					<td class="order_sucess_right">상품이름 &nbsp&nbsp&nbsp&nbsp</td>
					<td class="order_sucess_left">퍼퓸 밤 홀리메탈</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="order_sucess_right">주문자 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
					<td class="order_sucess_left">편조이</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="order_sucess_right">배송지 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
					<td class="order_sucess_left">서울특별시 강서구 까치산로4다길 34 (화곡동, 황제파크빌) A(101)동 402호 (07730)</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="order_sucess_right">연락처 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
					<td class="order_sucess_left">010-6800-4220</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="order_sucess_right">주문금액 &nbsp&nbsp&nbsp&nbsp</td>
					<td class="order_sucess_left">55,400원</td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<div class="order_success_bottom">
			<input type="button" value="주문내역 조회" onclick="location.href='mypage_order.do'" />
			<input type="button" value="메인화면 이동" onclick="location.href='main.do'" />
			</div>
	</div>

	<%@include file="../main/footer.jsp"%>

</body>
</html>
