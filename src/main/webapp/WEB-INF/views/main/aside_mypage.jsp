<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>side</title>
<link href="resources/css/mypage.css" rel="stylesheet" />
</head>
<body>
	<div class="mypage_menu">
		<div class="mypage_menu_title">
			<a href="mypage_stack.do"><b>마이페이지</b></a>
			<div class="mypage_title_line"></div>
		</div>
		<div class="mypage_menu_list">
			<ul>
				<li><a href="mypage_info.do">나의 정보</a></li>
				<li><a href="mypage_addr.do?user_idx=${uvo.user_idx }">배송지 목록</a></li>
				<li><a href="mypage_order.do?user_idx=${uvo.user_idx }">주문 내역</a></li>

				<li><a href="mypage_order_after.do?user_idx=${uvo.user_idx }">구매 확정</a></li>
				<li><a href="mypage_heart.do?user_idx=${uvo.user_idx}">관심 상품</a></li>

				<li><a href="mypage_faq.do">자주 묻는 질문</a></li>
				<li><a href="board_list.do?user_idx=${uvo.user_idx }">1:1 문의게시판</a></li>
			</ul>
		</div>
	</div>
</body>
</html>
