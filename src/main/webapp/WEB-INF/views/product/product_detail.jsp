<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link rel="stylesheet" href="resources/css/button.css">
<style type="text/css">
.product_detail_wrap {
	margin: 0px auto;
	width: 1000px;
	line-height: 25px;
}

.product_detail_body {
	float: left;
	margin: 40px auto 70px;
	width: 100%;
}

.product_detail_top {
	text-align: center;
}

.product_detail_select_wrapper {
	position: relative;
	width: 370px;
	display: flex;
	margin: 40px 0px 20px 0px;
	gap: 10px;
	overflow: hidden;
}

.product_detail_select_one {
	flex: 1;
	width: 85px;
	white-space: nowrap;
}

.product_detail_select_img {
	height: 110px;
	background-color: gray;
	position: relative;
}

.product_detail_select_img img {
	position: absolute;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.product_detail_select_one p {
width: 85px;
	font-size: 11px;
	padding-top: 5px;
	overflow: hidden;
	text-overflow: ellipsis;
}

.product_detail_image {
	background-color: gray;
	width: 500px;
	height: 600px;
	float: left;
	position: relative;
}

.product_image {
	position: absolute;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.product_detail_heart {
	width: 50px;
	height: 50px;
	position: absolute;
	bottom: 10px;
	right: 10px;
}
.product_detail_select_bottom {
	position: absolute;
	display: inline-block;
}


.product_detail_text_right {
	width: 450px;
	height: 620px;
	padding: 60px 40px;
	float: right;
}

.product_detail_title {
	width: 200px;
	display: inline-block;
	float: left;
	margin: 0px;
	float: left;
}

.product_detail_price {
	margin: 0px;
	width: 100px;
	text-align: right;
	float: right;
}

.product_detail_subtitle {
	margin: 40px 0px 20px;
	font-size: 18px;
}

.product_detail_under_wrap1 {
	margin: 10px 0px 10px 0px;
	width: 200px;
	height: 30px;
	display: flex;
}

.product_detail_type {
	margin: 5px 5px;
}

.product_detail_btn1 {
	font-size: 10px;
	margin: 0px 5px;
	background-color: lightgray;
	border-radius: 20px;
	width: 50px;
	height: 25px;
	border: none;
}

.count_bnt {
	font-size: 20px;
}

.count_bnt input{
	width: 50px; 
	height: 30px;
	margin-bottom: 15px;
	text-align: center;
	font-size: 20px;
}

.buy_btn_wrap {
	display: flex;
	gap: 10px;
}

.buy_btn {
	font-size: 16px;
	text-align: center;
	width: 80px;
	height: 40px;
	margin: 0;
	flex: 1;
}

.buy_btn:nth-of-type(1) {
	margin-right: 10px;
}

.product_detail_text {
	font-size: 16px;
	
}

.product_detail_check_btn {
	display: none;
}

.product_detail_check_btn:checked ~ .product_detail_detail {
	display: block;
}

.product_detail_detail {
	display: none;
	padding: 6px;
	font-size: 15px;
	    line-height: 22px;
}

.product_detail_main {
	height: 430px;
}

.product_detail_description {
	display: block;
	width: 1000px;
	margin: 20px auto 90px;
}

#footer {
	position: static;
	margin-top: 30px;
	height: 268px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#cart_add").click(function() {
		let product_idx = $("#product_idx").val();
		let product_count = $("#product_count").val();
		if(product_count == "") {
			alert("수량을 입력해주세요");
			return;
		}
		$.ajax({
			url: "detail_cart_add.do",     
			method: "post",          
			dataType: "text",
			data: {product_idx:product_idx,product_count:product_count},
		    success: function (data) {
		    	alert("장바구니에 추가되었습니다.");
			},
			error:function(){
				alert("추가 실패");
			}
		});
	});
	
    $(".product_detail_heart").click(function() {
    	let product_idx = $("#product_idx").val();
    	let user_idx = $("#user_idx").val();
    	
        $.ajax({
            url: "addHeart.do",
            method: "post",
            dataType: "text",
            data: { user_idx: user_idx, product_idx: product_idx},
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
    });
});

	function order_chk(f) {
		f.action = "product_detail_pay.do";
		f.submit();
	}
</script>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<div class="product_detail_body">
		<div class="product_detail_wrap">
			<div class="product_detail_top">
				<hr>
				<p style="font-size: 16px; padding: 10px;">${pvo.product_category}</p>
				<h4 style="padding-bottom: 10px;">${pvo.product_name}</h4>
				<hr>
			</div>
			<form name="product_detail_form" id="product_detail_form" method="post">
				<div class="product_detail_image"><b>
					<img class="product_image" alt="상품이미지" src="resources/image/${pvo.product_img}"> 
					<img class="product_detail_heart" alt="찜" src="resources/image/heart_01.png">
				</div>
				<div class="product_detail_text_right">
					<div>
						<h4 class="product_detail_title">${pvo.product_name}</h4>
						<h4 class="product_detail_price">
							<fmt:formatNumber value="${pvo.product_price}" pattern="#,##0" />원
						</h4>
					</div>
					<div>
						<p class="product_detail_subtitle">${pvo.product_detail}</p>
						<p style="font-size: 14px;">${pvo.product_content}</p>
					</div>
					
					<c:choose>
						<c:when test="${pvo.product_idx >= 6 }">
							<c:set var="pbegin" value="${6}" />
							<c:set var="pend" value="${10}" />
						</c:when>
						<c:otherwise>
							<c:set var="pbegin" value="${pvo.product_idx}" />
							<c:set var="pend" value="${pvo.product_idx + 4}" />
						</c:otherwise>
					</c:choose>
							
					<div class="product_detail_select_bottom">
						<div class="product_detail_select_wrapper">
							<c:forEach items="${otherList}" var="k">
								<div class="product_detail_select_one">
									<div class="product_detail_select_img">
									<a href="product_detail.do?product_idx=${k.product_idx}">
										<img alt="상품이미지" src="resources/image/${k.product_img}">
									</a>
									</div>
									<p>${k.product_name}</p>
								</div>
							</c:forEach>
						</div>
	
						<div class="count_bnt">수량: 
							<input type="number" name="product_count" id="product_count" min="1" value="1">
						</div>
						<div class="buy_btn_wrap">
							<input type="hidden" id="product_idx" name="product_idx" value="${pvo.product_idx}"> 
							<input type="hidden" id="user_idx" name="user_idx" value="${user_idx}"> 
							<input class="buy_btn" id="cart_add" type="button" value="장바구니에 추가하기"> 
							<input class="buy_btn" id="pay" type="button" value="구매하기" onclick="order_chk(this.form)">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- div body 끝 -->
	<div class="product_detail_description">
		<div>
			<input class="product_detail_check_btn"
				id="product_detail_check_btn1" type="checkbox">
			<hr>
			<label for="product_detail_check_btn1">&#10148;제품 상세 정보</label>
			<h2 class="product_detail_detail">전성분</h2>
			<p class="product_detail_detail">변성알코올, 향료, 부틸렌글라이콜, 정제수, 리모넨,
				리날룰, 알파-아이소메틸아이오논, 헥실신남알, 쿠마린, 제라니올, 하이드록시시트로넬알, 시트랄</p>
			<br>
			<h2 class="product_detail_detail">사용방법</h2>
			<ul class="product_detail_detail">
				<li>향수를 원하는 만큼 분사하여 사용하세요.</li>
				<li>맥박이 뛰는 곳에도 가볍게 터치해주면 향을 더 고르게 느낄 수 있습니다.</li>
				<li>옷, 이불 등 섬유에 직접 뿌릴 경우 이염/오염에 주의해주세요.</li>
				<li>원료 특성상 내용물의 색상 편차가 있을 수 있고 미량의 침전물이 보일 수 있으나, 품질에는 이상이 없으니
					안심하고 사용해주세요.</li>
			</ul>
			<br>
			<h2 class="product_detail_detail">사용시 주의사항</h2>
			<ul class="product_detail_detail">
				<li>화장품 사용시 또는 사용 후 직사광선에 의하여 사용부위가 붉은 반점, 부어오름 또는 가려움증 등의 이상
					증상이나 부작용이 있는 경우에는 전문의 등과 상담할 것</li>
				<li>상처가 있는 부위 등에는 사용을 자제할 것</li>
				<li>불꽃을 향하여 사용하지 말 것</li>
				<li>어린이의 손이 닿지 않는 곳에 보관할 것</li>
				<li>직사광선을 피해서 보관할 것</li>
			</ul>
			<br>
			<h2 class="product_detail_detail">사용기한</h2>
			<p class="product_detail_detail">사용기한 36개월(상품 발송일 기준으로 사용기한이 12개월
				이상 남은 상품만을 판매합니다.)</p>
			<br>
			<h2 class="product_detail_detail">제조업자</h2>
			<p class="product_detail_detail">한국ICT(주)</p>
			<br>
		</div>
		<div>
			<input class="product_detail_check_btn"
				id="product_detail_check_btn2" type="checkbox">
			<hr>
			<label for="product_detail_check_btn2">&#10148; 배송 및 반품</label>
			<p class="product_detail_detail">배송비는 3,000원입니다</p>
			<p class="product_detail_detail">주문일로부터 1-2 영업일 이내 출고됩니다.</p>
			<p class="product_detail_detail">배송은 지역 택배사 사정에 따라 약간의 지연이 생길 수
				있습니다.</p>
			<p class="product_detail_detail">상품 혹은 증정품의 포장(랩핑)을 개봉 및 훼손한 경우
				반품이 불가합니다.</p>
			<p class="product_detail_detail">단순 변심 또는 주문 실수로 인한 교환이 불가합니다.
				신중한 구매 부탁드립니다.</p>
		</div>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>