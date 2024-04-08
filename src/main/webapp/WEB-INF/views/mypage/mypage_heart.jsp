<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mypage_heart_cart img {
	width: 20px;
	height: 20px;
	object-fit: cover;
	max-width: 100%
}

.mypage_heart_cart {
	margin: -10px 0px 0px 10px;
	float: right;
}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<link href="${path}/resources/css/mypage_heart.css" rel="stylesheet" />
<script type="text/javascript">
	function product_detail_go(f) {
		location.href = "product_detail.do";
		f.submit();

	}
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$('.mypage_heart_cart').click(function() {
			alert('상품이 장바구니에 추가되었습니다.');
			const product_idx = "${product_idx}";
			location.href = "heart_cartlist_ok.do?product_idx=" + product_idx;
		});
/* 
		$('.mypage_heart_heart').click(function() {

			var currentSrc = $(this).attr('src');

			if (currentSrc === 'resources/image/heart_01.png') {
				$(this).attr('src', 'resources/image/heart_02.png');
			} else {
				$(this).attr('src', 'resources/image/heart_01.png');
				alert('관심상품에서 해제되었습니다.');
				
			}
		}); */
		
		$(function() {
			$('.mypage_heart_heart').click(function() {
		        let $heart = $(this);
		        /* let currentSrc = $heart.attr('src'); */
		        let $img = $heart.find('.mypage_heart_img');
    			let currentSrc = $img.attr('src');
		        let product_idx = $heart.data('product-idx');
		        let user_idx = $heart.data('user-idx');
		        let heart_idx = $heart.data('heart-idx');
		        
		        if (currentSrc === 'resources/image/heart_01.png') {
		            $img.attr('src', 'resources/image/heart_02.png');
		            addHeart(product_idx, user_idx, heart_idx);
		        } else {
		            $img.attr('src', 'resources/image/heart_01.png');
		            alert('관심상품에서 해제되었습니다.'); 
		            removeHeart(product_idx, user_idx, heart_idx);
		        }
		    });

		    function removeHeart(product_idx, user_idx, heart_idx) {
		        $.ajax({
		            url: "removeHeart.do",
		            type: "POST",
		            data: { product_idx: product_idx, user_idx: user_idx, heart_idx: heart_idx },
		            dataType: "text" ,
		            success: function(data) {
		                document.location.reload(true);
		            },
		            error: function() {
		                alert('에러');
		            }
		        });
		    }

		    function addHeart(product_idx, user_idx, heart_idx) {
		        $.ajax({
		            url: "addHeart.do",
		            type: "POST",
		            data: { product_idx: product_idx, user_idx: user_idx, heart_idx: heart_idx },
		            dataType: "text" ,
		            success: function(data) {
		                alert('추가성공');
		                document.location.reload(true);
		            },
		            error: function() {
		                alert('에러');
		            }
		        });
		    }

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
		<div class="mypage_heart_body">
			<div class="mypage_heart_wrap">
				<h2 style="text-align: center;">관심상품</h2>
				<div class="mypage_heart_tilte"></div>
				<div class="mypage_heart_all">

					<c:choose>
						<c:when test="${empty vo_heart}">
							<h3>관심상품 없다</h3>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${vo_heart}" varStatus="vs">

								<div class="mypage_heart_one">
									<div class="mypage_heart_box"
										onclick="product_detail_go(this.form)">
										<img alt="resources/image/hand1.jpeg"
											src="resources/image/hand1.jpeg"<%-- ${vo_heart.product_img} --%>>
									</div>
									<div class="mypage_heart_bottom">
										<div class="mypage_heart_cart">
											<img src="resources/image/cart2.png">
										</div>
										<div class="mypage_heart_heart" data-product-idx="${k.product_idx }" data-user-idx="${k.user_idx}" data-heart-idx="${k.heart_idx }">
											<img class="mypage_heart_img"
												src="resources/image/heart_02.png" >
										</div>
										<div class="mypage_heart_text"
											onclick="product_detail_go(this.form)">
											<p>${k.product_name}</p>
											<p>
												<small>${k.product_detail}</small>
											</p>
											<p>${k.product_price}</p>
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