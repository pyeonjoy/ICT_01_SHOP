<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mypage_heart_cart img{
	width: 20px;
	height: 20px;
    object-fit: cover; 
    max-width: 100%
	}
.mypage_heart_cart{
	margin: -10px 0px 0px 10px;
	float: right;}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<link href="${path}/resources/css/mypage_heart.css" rel="stylesheet"/>
<script type="text/javascript">
function product_detail_go(f){
	location.href ="product_detail.do" ;
	f.submit();
	
}

</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	// prodcut_idx 넘겨보기..
    $(document).ready(function() {
        $('.mypage_heart_cart').click(function() {
        	alert('상품이 장바구니에 추가되었습니다.');
        	const product_idx = "${product_idx}";
    		location.href="heart_cartlist_ok.do?product_idx="+product_idx ;
        });

        $('.mypage_heart_img').click(function() {
            var currentSrc = $(this).attr('src');
            
            if (currentSrc === 'resources/image/heart_01.png') {
                $(this).attr('src', 'resources/image/heart_02.png');
            } else {
                $(this).attr('src', 'resources/image/heart_01.png');
                alert('관심상품에서 해제되었습니다.') ;
                UpdateHeartStatus(this);
            }
        });
    });
    function UpdateHeartStatus(element) {
    	location.href="update_heart_status.do"
    }
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
	<div class="mypage_heart_tilte" ></div>
	<div class="mypage_heart_all">

 	<c:choose>
		<c:when test="${empty vo_heart}">
			<h3>관심상품 없다</h3>
		</c:when>
		<c:otherwise>
			<c:forEach var="k" items="${vo_heart}" varStatus="vs">

	<div class="mypage_heart_one" >
		<div class="mypage_heart_box" onclick="product_detail_go(this.form)">
		<img alt="resources/image/hand1.jpeg" src="resources/image/hand1.jpeg" <%-- ${vo_heart.product_img} --%>>
		</div>
		<div class="mypage_heart_bottom">
				<div class="mypage_heart_cart" ><img src="resources/image/cart2.png"></div>
				<div class="mypage_heart_heart"><img class="mypage_heart_img"src="resources/image/heart_02.png"></div>
			<div class="mypage_heart_text" onclick="product_detail_go(this.form)">
				<p>${k.product_name}</p>
				<p><small>${k.product_detail}</small></p>
				<p>${k.product_price}</p>
			</div> 
		</div>
	</div>

			</c:forEach>
		</c:otherwise>
	</c:choose> 




</div>
</div></div>
</form>
<div class="mypage_heart_footer">
		<%@include file="../main/footer.jsp"%>
	</div>
</body>
</html>