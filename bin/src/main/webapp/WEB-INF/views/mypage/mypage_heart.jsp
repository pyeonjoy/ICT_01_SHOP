<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<link href="${path}/resources/css/mypage_heart.css" rel="stylesheet"/>
<script type="text/javascript">
function product_detail_go(f){
	location.href ="product_detail.do" ;
	f.submit();
	
}
function cartlist_go(f) {
	alert("장바구니에 추가되었습니다.");
	f.submit() ;
}
function heart_go(f) {
	// 클릭했을 때 관심상품에서 삭제되어야함.
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
				<div class="mypage_heart_heart" onclick="cartlist_go(this.form)"><img src="resources/image/cart2.png"></div>
				<div class="mypage_heart_heart" onclick="heart_go(this.form)"><img src="resources/image/heart_02.png"></div>
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