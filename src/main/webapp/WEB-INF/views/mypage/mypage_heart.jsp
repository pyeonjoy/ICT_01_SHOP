<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심상품</title>
<link href="resources/css/mypage.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
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
	                alert("추가불가능~");
	               	 }
	            });
	        }
	        $(".product_list_cart_button").click(function() {
	        	 let product_idx = $(this).siblings(".product_idx").val();
	             let product_price = $(this).siblings(".product_price").val();
	            addToCart(product_idx,product_price);
	        });		
	        $('.mypage_heart_heart').click(function() {
	      		let heart_idx = $(this).data('heart-idx'); 
		       	let tag = this;
		        $.ajax({
		            url: "removeHeart.do",
		            type: "POST",
		            data: {heart_idx: heart_idx },
		            dataType: "text" ,
		            success: function(data) {
		           		alert('관심상품에서 해제되었습니다.'); 
		                $(tag).parent().parent().parent().remove();
		            },
		            error: function() {
		                alert('에러');
		            }
		        });
	    	});
		}); 
</script>
</head>
<body>
	<div class="mypage_heart_header">
		<%@include file="../main/header.jsp"%>
	</div>
	<div class="mypage_heart_aside_mypage">
		<%@include file="../main/aside_mypage.jsp"%>
	</div>
	<form action="post">
		<div class="mypage_heart_body mypage_wrapper_Atype">
				<div class="mypage_title"><h2>관심상품</h2>
					<div class="mypage_title_line"></div>
				</div>
				
			<div class="mypage_heart_wrap">
				<div class="mypage_heart_all">
					<c:choose>
						<c:when test="${empty vo_heart}">
							<h3 style="text-align: center;">관심상품이 없습니다.</h3>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${vo_heart}" varStatus="vs">

								<div class="mypage_heart_one">
									<div class="mypage_heart_box">
										<a href="product_detail.do?product_idx=${k.product_idx}">
										<img alt="resources/image/hand1.jpeg" src="resources/image/${k.product_img}"></a>
									</div>
									<div class="mypage_heart_bottom">
									<div class="mypage_heart_bottom_first">
										 <div class="mypage_heart_cart">
										<img src="${path}/resources/image/cart2.png" class="product_list_cart_button">
										<input type="hidden" class="product_idx" value="${k.product_idx}">
										<input type="hidden" class="product_price" value="${k.product_price}">
										</div>
										<div class="mypage_heart_heart" data-heart-idx="${k.heart_idx }">
											<img class="mypage_heart_img" src="resources/image/heart_02.png">
										</div>
											<a href="product_detail.do?product_idx=${k.product_idx}" style="font-weight: bold;">${k.product_name}</a>
										</div>
										<div class="mypage_heart_text">
											<p style="font-size: 12px; margin-top: 5px;">${k.product_detail}</p>
											<p><fmt:formatNumber value="${k.product_price}" pattern="#,###원"></fmt:formatNumber></p>
										</div>
									</div>
								</div>

							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</form>
	<div class="mypage_heart_footer">
		<%@include file="../main/footer.jsp"%>
	</div>
</body>
</html>