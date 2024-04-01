<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>side</title>
<style type="text/css">
* {	margin: 0;
	padding: 0;
}

.mypage_menu_line{
background-color: black;
color: black;
width: 80px;
height: 5px;
font-size: 15px;
line-height: 35px;
margin: 12px 0px;
padding-left: 0px;

}

li {
	list-style: none
}

a {
	text-decoration: none;
	color: black;
}

a:visited {
	color: black;
}
a:hover {
	font-weight: bold;
}

.mypage_menu {
	position: absolute;
	margin: 70px 45px;
}

.mypage_menu_title {
	padding: 10px 0px;
}
.mypage_menu_list li{
	padding: 10px 0px;
}

@media screen and (max-width:900px) {
	.mypage_menu {
		display: none;
	}
}

</style>
</head>
<body>
	<div class="mypage_menu">
		<div class="mypage_menu_title">
			<b>마이페이지</b>
			<div class="mypage_menu_line"></div>
		</div>
		<div class="mypage_menu_list">
			<ul>
				<li><a href="mypage_info.do">회원정보</a></li>
				<li><a href="mypage_addr.do">배송지 관리</a></li>
				<li><a href="mypage_order.do?order_idx=2">주문내역</a></li>
				<li><a href="mypage_order_after.do?order_idx=2">결재내역</a></li>
				<li><a href="mypage_heart.do">관심상품</a></li>
				<li><a href="mypage_notice.do">공지사항</a></li>
				<li><a href="mypage_faq.do">자주 묻는 질문</a></li>
				<li><a href="mypage_qna.do">1:1 문의하기</a></li>
			</ul>
		</div>
	</div>
</body>
</html>
