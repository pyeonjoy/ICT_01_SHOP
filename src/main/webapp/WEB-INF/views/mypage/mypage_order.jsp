<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<link href="${path}/resources/css/mypage_order.css" rel="stylesheet" />
<script type="text/javascript">
	function delivery_go() {
		location.href = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=운송장번호들어갈곳 "

	}
	function reorder_go() {
		location.href = "order_pay.do?order_idx=${order_idx}?user_idx=${user_idx}"

	}
</script>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<%@include file="../main/aside_mypage.jsp"%>
	<div class="mypage_order_body">
		<div class="mypage_order_wrap">
			<h2 class="mypage_title">주문 내역</h2>
			<div class="login_changepwd_tilte"></div>

			<c:choose>
				<c:when test="${empty ovo}">
					<h3>주문내역 없다</h3>
				</c:when>
				<c:otherwise>
					<c:forEach var="order" items="${ovo}" varStatus="vs">
						<div class="mypage_order">
							<!-- 블럭 시작 -->
								<div class="left">
									<img alt="resources/image/hand1.jpeg"
										src="resources/image/hand1.jpeg">
								</div>
								<div class="right">
									<div class="mypage_order_text">
										<p class="mypage_order_status">${order.order_request}</p>
										<p>
											<fmt:formatDate pattern="yyyyMMdd"
												value="${order.order_regdate}" />
											${order.order_idx}
										</p>
										<h3>${order.product_name}</h3>
										<p>${order.product_content}</p>
										<p class="mypage_order_text_pay" style="font-size: 24px;">
											<fmt:formatNumber value="${order.product_price}"
												pattern="#,###" />
										</p>
										<p>
											<fmt:formatNumber value="${k.product_price}"
												pattern="#,##0.0" />
										</p>
									</div>
									<div>
							<form method="post">
										<input hidden name="order_idx" value="${order_idx }">
										<input hidden name="user_idx" value="${user_idx }">
										<button class="mypage_order_btn1" onclick="delivery_go()">배송조회</button>
										<button class="mypage_order_btn1" onclick="reorder_go(this.form)">재구매</button>
							</form>
									</div>
								</div>
						</div>
		<!-- 블럭 끝 -->


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