<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.footer {
	position: absolute;
	top: 100vh;
	width: 100%;
	background-color: black;
	padding: 60px;
	color: white;
}

.item {
	display: inline-block;
}

.item:nth-of-type(1) {
	width: 40%;
}

.item:nth-of-type(2) {
	width: 40%;
}

.item:last-child {
	width: auto;
}

.footer_title {
	margin: 10px 0px;
}
.footer li{
	padding: 5px;
}
</style>
</head>
<body>
	<div id="footer" class="footer">
		<div class="item">
			<div class="footer_title">
				<b>회사정보</b>
			</div>
			<ul>
				<li>상호 : 한국ICT기술협회</li>
				<li>대표 : 편조이</li>
				<li>주소 : 서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)</li>
				<li>개인정보관리 책임자 : 노준형</li>
				<li>사업자 등록번호 :000-00-00000</li>
				<li>통신판매업 신고 : 제 0000-서울-0000호</li>
			</ul>
		</div>
		<div class="item">
			<div class="footer_title">
				<b>고객센터 C/S Center</b>
			</div>
			<ul>
				<li>전화 : 02.739.7235</li>
				<li>팩스 : 02-733-3460</li>
				<li>elseks123@gmail.com</li>
				<li>상담시간 : 9:00am ~ 6:00pm(월~금)</li>
				
			</ul>
		</div>
		<div class="item" class="footer_title">
			<div class="footer_title">
				<!-- <b></b> -->
			</div>
			<ul>
				<li>회사소개</li>
				<li>쇼핑가이드</li>
				<li>개인정보보호정책</li>
				<li>이용약관</li>
				<li>인재채용</li>
			</ul>
		</div>
	</div>
</body>
</html>