<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="/resources/css/mypage.css" rel="stylesheet" />
<script type="text/javascript">
	function delivery_go() {
		location.href = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=운송장번호들어갈곳 "
	}
</script>
<script>
	$(document).ready(function(){
        function addToCart(product_idx,product_price) {
            $.ajax({
                url: "product_list_add_cart.do",
                method: "post",
                data: { product_idx: product_idx, product_price: product_price},
                dataType: "text",
                success: function(data) {
                alert("장바구니에 정상적으로 추가되었습니다.");
                },
                error: function() {
                alert("장바구니 추가에 실패하셨습니다.");
               	 }
            });
        }
        $(".mypage_order_cartlist_go").click(function() {
        	 let product_idx = $(this).siblings(".product_idx").val();
             let product_price = $(this).siblings(".product_price").val();
            addToCart(product_idx,product_price);
        });
    });
	</script>	
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<%@include file="../main/aside_mypage.jsp"%>

	<div class="mypage_order_body">
		<div class="mypage_title">
			<h2>주문 내역</h2>
			<div class="mypage_title_line"></div>
		</div>
		
		<div class="mypage_order_wrap">
			<c:choose>
				<c:when test="${empty ovo}">
					<h3>주문 내역이 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<c:forEach var="order" items="${ovo}" varStatus="vs">
						<div class="mypage_order">
							<!-- 블럭 시작 -->
							<div class="left" style="float: left;">
								<img alt="resources/image/hand1.jpeg"
									src="resources/image/${order.product_img }" style="border-radius: 10%;">
							</div>
							<div class="right" style="float: left;">
								<div class="mypage_order_text">
									<p class="mypage_order_status">
												<c:if test="${order.order_status eq '1'}">
												    <p  style="font-weight: bold; font-size:24px;">배송준비중</p>
												</c:if>
												<c:if test="${order.order_status eq '2'}">
												    <p style="font-weight: bold; font-size:24px;">배송중</p>
												</c:if>
											 	<c:if test="${order.order_status eq '3'}">
												    <p style="font-weight: bold; font-size:24px;">배송완료</p>
												</c:if> 
									</p> 
									<p>${order.order_date}</p>
									<p>${order.product_name} </p>
									<p class="mypage_order_text_pay" style="font-size: 24px; font-weight: bold;">
										<fmt:formatNumber value="${order.product_price}" pattern="#,###" /> 원, ${order.order_count} 개
									</p>
								</div>
								
								<div>
									<button class="mypage_order_btn1" onclick="location.href='confirm.do?order_idx=${order.order_idx}'">구매확정</button>
									<button class="mypage_order_btn1" onclick="delivery_go()">배송조회</button>
									<button class="mypage_order_cartlist_go" >장바구니 담기</button>
									<input type="hidden" class="product_idx" value="${order.product_idx}">
									<input type="hidden" class="product_price" value="${order.product_price}">
								</div>
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