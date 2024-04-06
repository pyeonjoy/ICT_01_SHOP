<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>장바구니</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<link href="${path}/resources/css/cart_list.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
    function all_check() {
        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
        const isChecked = checkboxes[0].checked; 
        checkboxes.forEach((checkbox)=>{
            checkbox.checked = !isChecked;
        });
    }
    
    $(document).ready(function() {
    	const urlParams = new URLSearchParams(window.location.search);
    	let cartlist_status = urlParams.get('cartlist_status');
			
		switch (cartlist_status) {
		case 'check_none': alert("선택한 상품이 없습니다."); return;
		case 'error': alert("에러 발생 다시 시도해주세요."); return;
		}
		
	});
    
    function select_delete(f) {
		f.action = "cartlist_delete.do";
		f.submit();
	}
    function select_pay(f) {
		f.action = "select_pay.do";
		f.submit();
	}
    function cartlist_edit(f, idx) {
    	f.action = "cartlist_edit.do";
		f.submit();
	}
    
    function select_pay(f, idx) {
    	if (document.getElementsByName("cart_check_idx").length === 0) {
    		alert("선택한 상품이 없습니다."); return;
    	} 
    	f.action = "cartlist_select_pay.do";
		f.submit();
	}
    
    $(document).ready(function() {
        $("input[name='cart_check_idx'], input[name='cart_checkbox_all']").click(function() {
            let totalsel = 0;
            let checkboxes = document.getElementsByName("cart_check_idx");
            let check_number = document.getElementsByName("check_number");
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    totalsel += parseInt(check_number[i].value);
                    
                }
            }
            
            $("#cart_selTotal").text(totalsel.toLocaleString());
        });
    });    
</script>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<div class="cart_list_wrapper">
		<div class="mypage_tilte"><h2>장바구니</h2>
			<div class="cart_list_line"></div></div>
		
			<table class="cart_list_table">
				<tr class="cart_list_head">
					<th></th>
					<th></th>
					<th></th>
					<th>상품명</th>
					<th></th>
					<th>수량</th>
					<th>개당가격</th>
					<th>금액</th>
				</tr>
				<c:choose>
					<c:when test="${empty cartlist}">
						<tr><td colspan="8">&nbsp</td>
						<tr><td colspan="8"><h3>장바구니가 비었습니다</h3></td></tr>
						<tr><td colspan="8">&nbsp</td>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${cartlist}" varStatus="vs">
							<tr>
								<input type="hidden" name="check_number" value="${k.cartlist_number * k.cartlist_count}" form="cartlist_selchk">
								<td><input type="checkbox" name="cart_check_idx" value="${k.cartlist_idx}" form="cartlist_selchk" onclick="checkbox_on()"/></td>
								<td class="img_show"><a href="#"><img src="resources/image/${k.product_img}" alt="향수" /></a></td>
									
								<td colspan="3">${k.product_name}</td>	
								<td>
									<form method="post">
										<input type="hidden" name="cartlist_idx" value="${k.cartlist_idx}"/>
										<input type="number" name="cartlist_count" min="1" value="${k.cartlist_count}" style="width: 50px" onchange="cartlist_edit(this.form)">
									</form>
								</td>
								<td><fmt:formatNumber value="${k.cartlist_number}" pattern="#,##0" />원</td>
								<td><fmt:formatNumber value="${k.cartlist_number * k.cartlist_count}" pattern="#,##0" />원</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			<hr>
			<form id="cartlist_selchk" method="post">
			<table class="cart_list_button">
				<tr>
					<th><input type="button" value="전체선택/해제" name="cart_checkbox_all" onclick="all_check(this.form)" />
					<input type="button" value="선택삭제" onclick="select_delete(this.form)"></th>
					<th><b>선택상품금액 : <span id="cart_selTotal">0</span> 원&nbsp;&nbsp;&nbsp;</b>
					<input type="button" value="선택구매" onclick="select_pay(this.form)"></th>
				</tr>
				<tbody>
					<tr class="cart_list_notice">
						<td>
							<p class="cart_list_notice_p">
								배송비용은 2,500원 이며,3만원 이상 구매하실 경우 배송 비용은 무료입니다.
							</p>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>