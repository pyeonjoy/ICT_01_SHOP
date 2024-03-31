<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	f.action ="mypage_addr_edit.do?addr_idx=2";
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
        <c:when test="${not empty list2}">
            <c:forEach var="k" items="${list2}" varStatus="vs">
            <form action="post">
                <button class="order_pay_btn1" onclick="addr_edit(this.form)">변경</button>
                 	<input type="hidden" name="user_idx" value="2" />
                    <p>${k.user_name }</p>
                    <p>${k.user_phone }</p>
                    <p>${k.user_addr }</p>
            </form>
            </c:forEach>
        </c:when>
    </c:choose>
		</div>

<div class="order_pay_one">
    <h2>주문자</h2>
    <hr>
    <c:choose>
        <c:when test="${not empty list2}">
            <c:forEach var="k" items="${list2}" varStatus="vs">
    <button class="order_pay_btn1" onclick="addr_edit(this.form)">변경</button>
                    <p>${k.user_name }</p>
                    <p>${k.user_phone }</p>
                    <p>${k.user_addr }</p>
            </c:forEach>
        </c:when>
    </c:choose>
</div>




		<div class="order_pay_one">
			<h2>주문 상품</h2>
			<hr><c:choose>
        <c:when test="${not empty list1}">
            <c:forEach var="k" items="${list1}" varStatus="vs">
			<p>${k.product_name }</p>
			<h3>${k.product_price }</h3>
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
				<p>52,400원</p>
				<p>3,000원</p>
				<h3>55,400원</h3>
			</div>
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
</body>
</html>