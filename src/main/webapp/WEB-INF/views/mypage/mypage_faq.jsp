<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<style type="text/css">
	.mypage_faq_check_btn{
	display: none;
	}
	.mypage_faq_check_btn:checked ~ .mypage_faq_detail{
	display: block;
	font-weight: bold;
	
	}
	.mypage_faq_detail{
	display: none;
	padding: 6px;
	font-size: 15px;
	}
	.mypage_faq_delivery{
		display: block;
		width: 600px;
		margin: 20px auto;
	}
	.mypage_faq_order_pay{
		display: none;
		width: 600px;
		margin: 20px auto;
	}
	.mypage_faq_cancel_change{
		display: none;
		width: 600px;
		margin: 20px auto;
	}
	.mypage_faq_info_benefit{
		display: none;
		width: 600px;
		margin: 20px auto;
	}

.mypage_faq_all{
	display: flex;
	justify-content:center;
	text-align: center;
	height: 90vh;
	padding: 100px;
	}
.mypage_faq_all h2{
	text-align: center;
	margin-bottom: 50px;
}
.mypage_faq_all label{
	line-height: 50px;
}

.mypage_faq_delivery p{
	font-weight: bold;
	line-height: 20px;
		
}

.mypage_faq_title {
    background-color: black;
    color: black;
    width: 149px;
    height: 5px;
    font-size: 15px;
    line-height: 35px;
    margin: -47px auto 60px;
}

input[type="button"] {
    background-color: white; 
    border: 1px solid black; 
    padding: 7px 20px;
    font-size: 20px; 
    cursor: pointer; 
   }
   
 
</style>
<script type="text/javascript">
function showDelivery() {
	document.querySelector('.mypage_faq_delivery').style.display = 'block';
	document.querySelector('.mypage_faq_order_pay').style.display = 'none';
	document.querySelector('.mypage_faq_cancel_change').style.display= 'none';
	document.querySelector('.mypage_faq_info_benefit').style.display= 'none';	
}

function showOrderPay() {
	document.querySelector('.mypage_faq_delivery').style.display = 'none';
	document.querySelector('.mypage_faq_order_pay').style.display = 'block';
	document.querySelector('.mypage_faq_cancel_change').style.display= 'none';
	document.querySelector('.mypage_faq_info_benefit').style.display= 'none';	
}
function showCancelChange(){
	document.querySelector('.mypage_faq_delivery').style.display = 'none';
	document.querySelector('.mypage_faq_order_pay').style.display = 'none';
	document.querySelector('.mypage_faq_cancel_change').style.display= 'block';
	document.querySelector('.mypage_faq_info_benefit').style.display= 'none';	
}
function showInfoBenefit(){
	document.querySelector('.mypage_faq_delivery').style.display = 'none';
	document.querySelector('.mypage_faq_order_pay').style.display = 'none';
	document.querySelector('.mypage_faq_cancel_change').style.display= 'none';	
	document.querySelector('.mypage_faq_info_benefit').style.display= 'block';	 
}
</script>
</head>
<body>
<%@include file="../main/header.jsp"%>
	<%@include file="../main/aside_mypage.jsp" %>
	<form action="" method="post" class="mypage_faq_all">
		<div class="mypage_faq_div">
		<h2>자주 묻는 질문</h2>
		<div class="mypage_faq_title"></div>
		<input type="button" value="배송" onclick="showDelivery()">
		<input type="button" value="주문/결제" onclick="showOrderPay()">
		<input type="button" value="취소/반품/교환" onclick="showCancelChange()">
		<input type="button" value="회원정보/혜택" onclick="showInfoBenefit()">
		<br>
		<div class="mypage_faq_delivery">
			<div>
				<input class="mypage_faq_check_btn" id="mypage_faq_check_btn1" type="checkbox">
				<hr>
				<label for="mypage_faq_check_btn1">제주 및 도서 산간 배송 시 추가 비용이 있나요?</label>
				<p class="mypage_faq_detail">추가 비용이 발생하지 않습니다.</p>
			</div>
			<div>
				<input class="mypage_faq_check_btn" id="mypage_faq_check_btn2" type="checkbox">
				<hr>
				<label for="mypage_faq_check_btn2">한 번에 결제하여, 여러 사람에게 분할 배송할 수 있나요?</label>
				<p class="mypage_faq_detail">주문 1건은 오직 한 주소지로 배송할 수 있습니다.
				<br>분할 배송을 원하실 경우, 개별 주문건을 생성(결제)해주셔야 합니다.</p>
			</div>
			<div>
				<input class="mypage_faq_check_btn" id="mypage_faq_check_btn3" type="checkbox">
				<hr>
				<label for="mypage_faq_check_btn3">배송지를 변경할 수 있나요?</label>
				<p class="mypage_faq_detail">[마이페이지>1:1 문의하기]로 문의 주시면 배송지 수정이 가능합니다.
				<br>단, '준비' 단계 이후부터는 송장 발부 및 패킹시작된 이후인지라 수정이 불가합니다. </p>
			</div>
			<div>
				<input class="mypage_faq_check_btn" id="mypage_faq_check_btn4" type="checkbox">
				<hr>
				<label for="mypage_faq_check_btn4">주문한 상품은 언제 수령할 수 있나요?</label>
				<p class="mypage_faq_detail">주문일(입금확인일)로부터 영업일 기준 1~3일 내 출고됩니다.
				 택배사 지역 상황 또는 주문량에 따라 달라질 수 있습니다.</p>
			</div>
			<div>
				<input class="mypage_faq_check_btn" id="mypage_faq_check_btn5" type="checkbox">
				<hr>
				<label for="mypage_faq_check_btn5">송장 조회 시, 아무런 내역도 확인되지 않아요.</label>
				<p class="mypage_faq_detail">배송 시작 메세지는 송장을 등록한 기준으로 발송되는 것이므로, 
				해당 메세지를 수신하시더라도 실 택배사 인계 또는 집하가 진행중 일 수 있어, 현황조치가 어려울 수 있습니다.</p>
			</div>
		</div>

		
		<div class="mypage_faq_order_pay">
			<div>
				<input class="mypage_faq_check_btn" id="mypage_faq_check_btn6" type="checkbox">
				<hr>
				<label for="mypage_faq_check_btn6">사용 가능한 결제 수단에는 무엇이 있나요?</label>
				<ul class="mypage_faq_detail">
					<li>신용카드(국내)</li>
					<li>무통장 입금(가상계좌)</li>
					<li>간편결제(네이버페이, 카카오페이)</li>
					<li>보유 적립금</li>
				</ul>
			</div>
			<div>
				<input class="mypage_faq_check_btn" id="mypage_faq_check_btn7" type="checkbox">
				<hr>
				<label for="mypage_faq_check_btn7">주문 이후, 결제 수단을 변경할 수 있나요?</label>
				<p class="mypage_faq_detail"> '입금' 상태 이후 결제 수단 변경 불가합니다. 
				결제 취소 후, 원하시는 결제 수단으로 재 주문 해주시기 바랍니다.</p>
			</div>
			<div>
				<input class="mypage_faq_check_btn" id="mypage_faq_check_btn8" type="checkbox">
				<hr>
				<label for="mypage_faq_check_btn8">주문 이후, 상품 옵션 변경/상품 추가 하고 싶어요.</label>
				<p class="mypage_faq_detail">주문한 상품 옵션을 변경할 수 없습니다.
				 상품 및 수량변경을 원하신다면 주문취소 후 다시 주문해 주시기 바랍니다.</p>
			</div>
		</div>
		<div class="mypage_faq_cancel_change">
			<div>
				<input class="mypage_faq_check_btn" id="mypage_faq_check_btn9" type="checkbox">
				<hr>
				<label for="mypage_faq_check_btn9">제품 하자로 인한 교환은 어떻게 진행되나요?</label>
				<p class="mypage_faq_detail"> [마이페이지>1:1 문의하기]에서 문의글 작성해주시면, 
				주문번호와 구매 시 기재하신 연락처 확인 후 교환 접수가 진행됩니다.<br>
				 접수 이후, 기존 수령하신 상품에 대한 회수가 진행되며 
				 하자 제품 증상 및 제품 회수 확인 후, 새 상품으로 교환 진행됩니다.</p>
			</div>
			<div>
				<input class="mypage_faq_check_btn" id="mypage_faq_check_btn10" type="checkbox">
				<hr>
				<label for="mypage_faq_check_btn10">다른 상품/향으로 교환하고 싶어요.</label>
				<p class="mypage_faq_detail">단순 변심 또는 주문 실수로 인한 교환이 불가합니다.
				 반품 후, 원하시는 상품으로 재 구매를 요청드립니다.</p>
			</div>
			<div>
				<input class="mypage_faq_check_btn" id="mypage_faq_check_btn11" type="checkbox">
				<hr>
				<label for="mypage_faq_check_btn11">반품 및 교환 규정을 알려주세요.</label>
				<ul class="mypage_faq_detail">
					<li>주문 시, 제품을 수령하신 날로부터
					 7일 이내 교환 또는 환불 의사를 말씀해 주셔야 합니다.</li>
					<li>교환 및 반품하려는 모든 제품은 개봉되지 않은 상태를 유지해야 하며,
					 개봉, 파손 또는 오염된 경우 반품이 거부될 수 있습니다.</li>
					<li>퍼퓸 제품은 포장(래핑)을 개봉 및 훼손되었을 경우,
					 교환 및 반품이 불가하며 기존 수령지로 자동 반송됩니다.</li>
				</ul>
			</div>
			<div>
				<input class="mypage_faq_check_btn" id="mypage_faq_check_btn12" type="checkbox">
				<hr>
				<label for="mypage_faq_check_btn12">주문한 상품 중, 일부 상품만 취소/수량을 변경할 수 있나요?</label>
				<p class="mypage_faq_detail">일부 상품 또는 수량을 취소할 수 없습니다.
				 '주문' 또는 '입금' 단계에서, 전체 주문 취소하신 후,
				  원하시는 상품/수량 설정하여 재 주문(결제) 해주세요.</p>
			</div>
		</div>
		<div class="mypage_faq_info_benefit">
			<div>
				<input class="mypage_faq_check_btn" id="mypage_faq_check_btn13" type="checkbox">
				<hr>
				<label for="mypage_faq_check_btn13">생일 축하 적림금은 어떻게 받을 수 있나요?</label>
				<ul class="mypage_faq_detail">
					<li>회원 가입 후, 만 1년 이내 구매이력이 있는 고객님에 한해 지급됩니다.
					<br>로그인한 계정으로 생일 당일 오전 발급됩니다.</li>
					<li>생일 당일 가입 또는 최근 1년간 온라인 구매 이력이 
					없을 경우 지급이 불가합니다.</li>
				</ul>
			</div>
			<div>
				<input class="mypage_faq_check_btn" id="mypage_faq_check_btn14" type="checkbox">
				<hr>
				<label for="mypage_faq_check_btn14">회원 탈퇴 후 재가입을 할 수 있나요?</label>
				<p class="mypage_faq_detail">일반 회원가입은 탈퇴 후 동일한 메일 계정으로 재가입이 불가합니다.</p>
			</div>
			<div>
				<input class="mypage_faq_check_btn" id="mypage_faq_check_btn15" type="checkbox">
				<hr>
				<label for="mypage_faq_check_btn15">회원가입 축하 적립금이 발금되지 않았어요.</label>
				<p class="mypage_faq_detail">[마이페이지>1:1 문의하기]에서 문의글 작성 해주시면,
				 확인 및 발급 처리 도와드리겠습니다.</p>
			</div>
		</div>	
		</div>	
	</form>
<%@include file="../main/footer.jsp"%>
</body>
</html>