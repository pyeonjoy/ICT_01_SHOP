<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/order_pay.css">
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<link href="${path}/resources/css/order_pay.css" rel="stylesheet" />
<script type="text/javascript">
	function addr_edit(f) {
		f.action = "mypage_addr_edit.do?addr_idx=${addr_idx}";
		f.submit();
	}
</script>
</head>
<body>
	<div class="order_pay_header">
		<%@include file="../main/header.jsp"%>
	</div>
	<div class="order_pay_wrap" style="height=5000px;">
		<h2>결제 확인</h2>
		<div class="order_pay_stroke"></div>
		<div class="order_pay_one">
			<h2>배송지</h2>
			<hr>
			<c:choose>
			<c:when test="${not empty vo}">
					<c:forEach var="v" items="${vo}" varStatus="status">
						<c:if test="${status.index == 0}">
							  <button class="order_pay_btn1" onclick="location.href='mypage_addr_select.do?order_idx=${v.order_idx}'">선택</button>
							<p>${v.addr_name}</p>
							<p>${v.addr_phone}</p>
							<p>${v.addr_addr}</p>
						</c:if>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>

		<div class="order_pay_one">
			<h2>주문자</h2>
			<hr>
			<c:choose>
				<c:when test="${not empty vo}">
					<c:forEach var="v" items="${vo}" varStatus="status">
							<p>${v.user_name}</p>
							<p>${v.user_phone}</p>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>




		<div class="order_pay_one">
			<h2>주문 상품</h2>
			<hr>
			<c:choose>
				<c:when test="${not empty vo}">
					<c:forEach var="v" items="${vo}" varStatus="status">
						<p>${v.product_name }</p>
						<h3>${v.product_price } * ${v.order_count }</h3>
						<br>
					</c:forEach>


				</c:when>
			</c:choose>
		</div>

		<div class="order_pay_one">
			<h2>결제 상세</h2>
			<hr>
			<div class="order_pay_left">
				<p>주문 금액</p>
				<p>배송비</p>
				<h3>총 주문 금액</h3>
			</div>
		<div class="order_pay_right">
		<c:set var="totalOrderPrice" value="0" />
			<c:forEach var="k" items="${vo}">
			    <c:set var="totalPrice" value="${k.product_price * k.order_count}" />
			    <c:set var="totalOrderPrice" value="${totalOrderPrice + totalPrice}" />
			</c:forEach>
			
			<div class="order_pay_right">
			    <h2><fmt:formatNumber value="${totalOrderPrice}" pattern="#,##0" />원</h2>
			    <p>3,000원</p>
			    <h2><fmt:formatNumber value="${totalOrderPrice + 3000}" pattern="#,##0" />원</h2>
			</div>
			<div class="order_pay_btn2_p">
			    <button class="order_pay_btn2" onclick="location.href='order_success.do?order_idx=${vo[0].order_idx}'">
			        <h2>결제하기</h2>
			    </button>
			</div>
	</div>
		</div>
		<div class="order_pay_footer" style="width: auto;">
			<%@include file="../main/footer.jsp"%>
		</div>
</body>
</html>