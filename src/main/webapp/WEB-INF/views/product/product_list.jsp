<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/css/order_product.css" rel="stylesheet" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품페이지</title>
<script type="text/javascript">
//장바구니 추가 ajax
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
        $(".product_list_cart_button").click(function() {
        	 let product_idx = $(this).siblings(".product_idx").val();
             let product_price = $(this).siblings(".product_price").val();
            addToCart(product_idx,product_price);
        });
    });
</script>
<script>
// 찜추가
$(document).ready(function() {
    function addToHeart(user_idx, product_idx) {
        $.ajax({
            url: "addHeart.do",
            method: "post",
            data: { user_idx: user_idx, product_idx: product_idx },
            dataType: "text",
            success: function(data) {
                if(data != "error") {
                    alert("찜 등록");
                } else {
                    alert("이미 찜한 상품입니다.");
                }
            },
            error: function(error) {
                alert("서버오류");
            }
        });
    }
    $(".product_list_heart_button").click(function() {
        let user_idx = $(this).siblings(".user_idx").val();
        let product_idx = $(this).siblings(".product_idx").val();
        addToHeart(user_idx, product_idx);
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
							<a href="product_detail.do?product_idx=${k.product_idx}"><h3>${k.product_name}</h3></a></th>
							<th><img src="${path}/resources/image/cart2.png" class="product_list_cart_button">
							<input type="hidden" class="user_idx" value="${user_idx}">
							<input type="hidden" class="product_idx" value="${k.product_idx}">
							<input type="hidden" class="product_price" value="${k.product_price}">
							<img src="${path}/resources/image/heart_01.png" class="product_list_heart_button" id="product_list_heart_button"></th>
						</tr>
						<tr>
							<td colspan="6" style="font-size: 14px;">${k.product_detail}</td>
						</tr>
						<tr>
							<td colspan="6" style="padding-top: 10px"><fmt:formatNumber value="${k.product_price}" pattern="#,###원"></fmt:formatNumber></td>
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