<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
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
	
	
	// 디비가 지멋대로 바뀜,.. 같이 먹는듯?..
	function mypage_order_status(order_regdate) {
		
		const orderRegDate = new Date(order_regdate);
		 console.log(orderRegDate);
		 
	      const current_time = new Date();

	      
	   	  // 주문이 등록된 시간으로부터 24시간이 지났는지 확인
	      const tomorrow = new Date(orderRegDate.getTime() + 24 * 60 * 60 * 1000);
	   	  // 48시간
	      const tomorrow2 = new Date(orderRegDate.getTime() + 48 * 60 * 60 * 1000);
	      
	      const elements = document.querySelectorAll('.mypage_order_status');
	      elements.forEach(element => {

	          if (current_time > tomorrow2) {
	              element.innerHTML = "<p>배송완료</p>";
	          } else if (current_time > tomorrow) {
	              element.innerHTML = "<p>배송중</p>";
	          }
	      });
	      
/*	   	  switch (true) {
	            case current_time > tomorrow2 :
	                element.innerHTML = "<p>배송완료</p>";
	                break ;
	            case current_time > tomorrow:
	                element.innerHTML = "<p>배송중</p>";
	                break;
				
	        }
	   	  
	    });
*/	    	  
	     
	      }  
	      

</script>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<%@include file="../main/aside_mypage.jsp"%>
	<div class="mypage_order_body">
		<div class="mypage_order_wrap">
			<h2 class="mypage_title">주문 내역</h2>
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
									src="resources/image/hand1.jpeg">
							</div>
							<div class="right">
								<div class="mypage_order_text">
								<%-- 	<p class="mypage_order_status1" style="float:right;">${order.order_status}</p> --%>
									<p class="mypage_order_status" style="float:right;">상품준비중</p> 
									<p>
										<fmt:formatDate pattern="yyyyMMdd"
											value="${order.order_regdate}" />
										${order.order_idx}
									</p>
									<h3>${order.product_name}</h3>
									<p>${order.product_content}</p>
									<p class="mypage_order_text_pay" style="font-size: 24px;">
										<fmt:formatNumber value="${order.product_price}"
											pattern="#,###" />
									</p>

								</div>
								<div>
									<button class="mypage_order_btn1" onclick="delivery_go()">배송조회</button>
									<button class="mypage_order_btn1" onclick="reorder_go()">재구매</button>
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