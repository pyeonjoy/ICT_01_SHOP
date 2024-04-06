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
	<div class="order_pay_aside">
		<%@include file="../main/aside_mypage.jsp"%>
	</div>
	<div class="order_pay_wrap">
		<h2>결제 확인</h2>
		<div class="order_pay_stroke"></div>
		<div class="order_pay_one">
			<h2>배송지</h2>
			<hr>
			<c:choose>
			<c:when test="${not empty vo}">
			    <c:forEach var="v" items="${vo}" varStatus="status">
			        <c:if test="${status.index == 0}">
			        	    <button class="order_pay_btn1" onclick="location.href='mypage_addr_select.do?order_idx=${order_idx}'">선택</button>
			    	        <p>${v.addr_name}</p>
				            <p>${v.addr_phone}</p>
				            <p>${v.addr_addr}</p>
			        </c:if>
			    </c:forEach>
			</c:when>

				<c:otherwise>
					<button onclick="location.href='mypage_addr_add.do?user_idx=${uvo.user_idx }'">
							배송지 추가하기
						</button>		
				</c:otherwise>
			</c:choose>
		</div>

		<div class="order_pay_one">
			<h2>주문자</h2>
			<hr>
							<p>${uvo.user_name}</p>
							<p>${uvo.user_phone}</p>
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
    <c:set var="totalPrice" value="0" />
    <c:forEach var="k" items="${vo}" varStatus="vs">
        <c:set var="totalPrice" value="${totalPrice + (k.product_price * k.order_count)}" />
    </c:forEach>
        <p><fmt:formatNumber value="${totalPrice}" pattern="#,##0" />원</p>
        <p>3,000원</p>
    <tr>
        <td colspan="3">
            <h2><fmt:formatNumber value="${totalPrice+3000}" pattern="#,##0" />원</h2>
        </td>
    </tr>
</div>


			<div class="order_pay_btn2_p">
				<button class="order_pay_btn2"
					onclick="location.href='order_success.do'">
					<h2>결제하기</h2>
				</button>
			</div>
		</div>
		<div class="order_pay_footer">
			<%@include file="../main/footer.jsp"%>
		</div>
	</div>
</body>
</html>