<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<link href="${path}/resources/css/mypage_addr_add.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>주소록 수정</title>
<script type="text/javascript">
$(document).ready(function() {
	$("#mypage_addr_go").click(function() {
		let name = $("#addr_name").val();
		let phone = $("#addr_phone").val();
		let addr = $("#addr_name").val();
		let phone_pattern = /^\d{3}-\d{3,4}-\d{4}$/;
		
		
		if (name === "" || phone === "" || addr === "") {
			alert("입력칸을 모두 채워주세요.");
			return false;
		}
	      if (!phone_pattern.test(phone)) {
	            alert("올바른 전화번호 형식이 아닙니다.");
	            return false;
	    }
	});
	addr_addr_ok(this.form);
});     
	function addr_addr_ok(f) {
		f.action = "mypage_addr_add_ok.do";
		f.submit();
		alert("추가 되었습니다.");
	}
</script>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<%@include file="../main/aside_mypage.jsp"%>
	<div class="mypage_addr_add_wrap">
			<h2>주소록 추가</h2>
			<div class="mypage_addr_add_tilte"></div>
					<div class="mypage_addr_add_inner">
						<div class="mypage_addr_add_left">
							<div class="mypage_addr_add_label">배송지</div>
	
							<div class="mypage_addr_add_label">연락처</div>
	
							<div class="mypage_addr_add_label">주소</div>
						</div>
						<div class="mypage_addr_add_right">
							<div class="mypage_addr_inner">
				            <form method="post">
				                  <input type="hidden" name="user_idx" value="${uvo.user_idx}" />
				                  <input type="hidden" name="addr_idx" value="${avo.addr_idx}" />
				                <input class="mypage_addr_add_info " type="text" placeholder="배송지 이름을 입력해주세요" id="addr_name"name="addr_name" autocomplete="off"/>
				                <input class="mypage_addr_add_info" type="text" placeholder="연락처를 입력해주세요" id="addr_phone"name="addr_phone" autocomplete="off"/>
				                <input class="mypage_addr_add_info" type="text" placeholder="주소를 입력해주세요" id="addr_addr"name="addr_addr" autocomplete="off"/>
					                	<button class="mypage_addr_add_btn1" id="mypage_addr_go">추가 완료</button>
					                    <button class="mypage_addr_add_btn1"onclick="history.go(-1)">취소</button>
					            </form>
					        </div>
						</div>
					</div>
		</div>
	<footer>
		<%@include file="../main/footer.jsp"%>
	</footer>

</body>
</html>