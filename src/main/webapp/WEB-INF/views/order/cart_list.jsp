<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>장바구니</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<link href="${path}/resources/css/cart_list.css" rel="stylesheet"/>

<script type="text/javascript">
    function all_check() {
        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
        const isChecked = checkboxes[0].checked; 
        checkboxes.forEach((checkbox)=>{
            checkbox.checked = !isChecked;
        });
    }
    function sum(){
		let total = 0;
		//아 이거 하기실ㄷㅎ다핳
		
    }
    
</script>
</head>
<body>
	<form>
		<%@include file="../main/header.jsp"%>
		<div class="cart_list_wrapper">
			<div class="mypage_tilte">
				<h2>장바구니</h2>
				<div class="cart_list_line"></div>				
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
					<tr>
						<td><input type="checkbox" name="checkbox" /></td>
						<td class="img_show"><a href="#">
						<img src="resources/image/pro01.png"alt="향수1" /></a></td>
						<td colspan="3">더 엘레강스 프리미엄 로얄 샬룻트 퍼퓸</td>
						<td><select name="count">
								<option value="1">1개</option>
								<option value="2">2개</option>
								<option value="3">3개</option>
								<option value="4">4개</option>
								<option value="5">5개</option>
								<option value="6">6개</option>
								<option value="7">7개</option>
								<option value="8">8개</option>
								<option value="9">9개</option>
						</select></td>
						<td>55,000원</td>
						<td>55,000원</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="checkbox" /></td>
						<td class="img_show"><a href="#"><img src="resources/image/pro01.png" alt="향수2"/></a></td>
						<td colspan="3">더 프리미엄 골든 더 빠르 펄</td>
						<td><select name="count">
								<option value="1">1개</option>
								<option value="2">2개</option>
								<option value="3">3개</option>
								<option value="4">4개</option>
								<option value="5">5개</option>
								<option value="6">6개</option>
								<option value="7">7개</option>
								<option value="8">8개</option>
								<option value="9">9개</option>
						</select></td>
						<td>55,000원</td>
						<td>55,000원</td>
					</tr>
				</table>
					<hr>
				<table class="cart_list_button">
					<tr>
						<th><input type="button" value="전체선택/해제" onclick="all_check(this.form)" />
						<input type="button" value="선택삭제" /></th>
						<th><b>선택상품금액 : 110,000원&nbsp;&nbsp;&nbsp;</b>
						<input type="button" value="선택구매" /></th>
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
			</div>
		</div>
		<%@include file="../main/footer.jsp"%>
	</form>
</body>
</html>