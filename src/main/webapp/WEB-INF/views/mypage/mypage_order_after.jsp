<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<link href="${path}/resources/css/mypage_order_after.css" rel="stylesheet" />
<script type="text/javascript">
	function delivery_go() {
		location.href = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=운송장번호들어갈곳 "

	}
	function reorder_go() {
		location.href = "order_pay.do"

	}
</script>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<%@include file="../main/aside_mypage.jsp"%>
	<div class="mypage_order_body">
		<div class="mypage_order_wrap">
			<h2 class="mypage_title">결제 내역</h2>
			<div class="login_changepwd_tilte"></div>

			<c:choose>
				<c:when test="${empty ovo}">
					<h3>주문내역이 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<c:forEach var="order" items="${ovo}" varStatus="status">
							<div class="mypage_order">
								<div class="top">
								<p class="mypage_order_status" style="border-left: 1px solid blavk;">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${order.order_regdate}"/>&nbsp;&#9654;</p>
								</div>
								<div class="left">
									<p class="mypage_order_status">${order.order_request}</p>
										<p class="mypage_order_status"><fmt:formatDate pattern="yyyy-MM-dd" value="${order.order_regdate}"/>도착</p>
									<img alt="이미지" src="${pageContext.request.contextPath}/resources/image/hand1.jpeg">
									<div class="mypage_order_text">
										<p>주문 번호: ${order.order_idx}</p>
										<p>${order.product_name}</p>
										<p>${order.product_content}</p>
										<p>${order.product_content}</p>
										<p class="mypage_order_text_pay" style="font-size: 24px; margin-top: 20px;">
										<fmt:formatNumber value="${order.product_price}" pattern="#,###" /></p>
									</div>
								</div>
								<div class="right">
									<button class="mypage_order_btn1" onclick="delivery_go()">교환,
										반품 신청</button>
									<button class="mypage_order_btn1" onclick="delivery_go()">리뷰
										작성하기</button>
									<button class="mypage_order_btn1" onclick="delivery_go()">재구매</button>
								</div>
							</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

	<div class="mypage_order_footer" style="margin-top: 300px;">
		<%@include file="../main/footer.jsp"%>
	</div>
</body>
</html>