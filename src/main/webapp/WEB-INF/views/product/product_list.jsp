<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품페이지</title>
<style type="text/css">
.product_list_heart_button {
	float: right;
	width: 30px;
	margin-left: 3px;
	cursor: pointer;
}

.product_list_cart_button {
	border-radius: 100%;
	float: right;
	width: 30px;
	margin-left: 3px;
	cursor: pointer;
}

.product_list_wrapper {
	display: grid;
	width: 90%;
	margin: 100px auto 250px;
	grid-template-columns: repeat(4, 1fr);
	grid-template-areas: "product1 product2 product3 product4 product5
		product6 product7 product8";
	grid-gap: 10px;
}

.product_list_table {
	width: 400px;
}

.product_list_table th, .product_list_table tr, .product_list_table td {
	border-collapse: collapse;
	text-align: left;
	padding-bottom: 10px;
}

.product_list_main_image {
	width: 100%;
}

.product_list_product {
	margin: 0px 10px;
}

.product_list_sort select {
	border-style: none;
	float: right;
	position: relative;
	top: 150px;
	left: 320px;
}

#footer {
	position: static;
}
</style>
<script type="text/javascript">
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
                alert("추가불가능~");
               	 }
            });
        }
        $(".product_list_cart_button").click(function() {
        	 let product_idx = $(this).siblings(".product_idx").val();
             let product_price = $(this).siblings(".product_price").val();
            addToCart(product_idx,product_price);
        });
    });
</script>



</head>
<body>
	<%@include file="../main/header.jsp"%>
	<br>
	<div class="product_list_wrapper">
		<c:forEach items="${shop_list}" var="k">
			<div class="product_list_product">
				<a href="product_detail.do?product_idx=${k.product_idx}">
					<img src="resources/image/${k.product_img}" class="product_list_main_image"></a>
				<table class="product_list_table">
					<tbody>
						<tr>
							<th colspan="5">
							<a href="product_detail.do?product_idx=${k.product_idx}">${k.product_name}</a></th>
							<th><img src="${path}/resources/image/cart2.png" class="product_list_cart_button">
							<input type="hidden" class="product_idx" value="${k.product_idx}">
							<input type="hidden" class="product_price" value="${k.product_price}">
							<img src="${path}/resources/image/heart_01.png" class="product_list_heart_button" id="product_list_heart_button" onclick="addToHeart('${k.product_idx}')"></th>
						</tr>
						<tr>
							<td colspan="6">${k.product_detail}</td>
						</tr>
						<tr>
							<td colspan="6"><fmt:formatNumber value="${k.product_price}" pattern="#,###원"></fmt:formatNumber></td>
						</tr>
					</tbody>
				</table>
				<br> <br> <br>
			</div>
		</c:forEach>
	</div>

	<%@include file="../main/footer.jsp"%>
</body>
</html>