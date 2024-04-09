<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 내역</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<link href="${path}/resources/css/mypage_order.css" rel="stylesheet" />
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
					<h3>주문내역 없다</h3>
				</c:when>
				<c:otherwise>
					<c:forEach var="order" items="${ovo}" varStatus="vs">
						<div class="mypage_order">
							<!-- 블럭 시작 -->
							<div class="left">
								<img alt="resources/image/hand1.jpeg"
									src="resources/image/${order.product_img}" style="border-radius: 10%;">
							</div>
							<div class="right">
								<div class="mypage_order_text">
									    <p style="font-weight: bold; font-size:24px;">구매확정</p>
									
									<p>
										${order.order_date} 주문
									</p>
									<h3>${order.product_name}</h3>
									<p class="mypage_order_text_pay" style="font-size: 24px; font-weight: bold;">
										<fmt:formatNumber value="${order.product_price}"
											pattern="#,###" /> 원, ${order.order_count} 개
									</p>

								</div>
								<div>
									<button class="mypage_order_btn1" onclick="location.href='cart_list.do?order_idx=${order.order_idx}'">장바구니 담기</button>
								</div>
							</div>
						</div>
						<!-- 블럭 끝 -->
 					<script>mypage_order_status("${order.order_regdate}");</script> 

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