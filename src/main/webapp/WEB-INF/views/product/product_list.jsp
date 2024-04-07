<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
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
	// 찜하기 버튼 클릭 시
	function addToHeart(productIdx) {
		$.ajax({
			type : "POST",
			url : "add_to_heart_ajax",
			data : {
				user_idx : "${sessionScope.userVO.user_idx}",
				product_idx : productIdx
			},
			success : function(response) {
				if (response === "success") {
					alert("찜");
					changeHeartButtonImage(productIdx);
				} else if (response === "fail") {
					alert("이미 찜한 상품입니다.");
				} else {
					alert("오류");
				}
			},
			error : function(error) {
				console.log(error);
			}
		});
	}

	function addToCart(productId) {
		alert('상품이 장바구니에 추가되었습니다.');
	}

	function changeHeartButtonImage(productIdx) {
		let image = document.getElementById('product_list_heart_button'
				+ productIdx);
		if (image.src.match('heart_01')) {
			image.src = '${path}/resources/image/heart_02.png';
		} else {
			image.src = '${path}/resources/image/heart_01.png';
		}
	}
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
							<th><img src="${path}/resources/image/cart2.png" class="product_list_cart_button" onclick="addToCart('${k.product_idx}')"> <img
								src="${path}/resources/image/heart_01.png"
								class="product_list_heart_button"
								id="product_list_heart_button"
								onclick="addToHeart('${k.product_idx}')"></th>
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