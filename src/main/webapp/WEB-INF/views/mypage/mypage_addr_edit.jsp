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
	$("#addr_edit").click(function() {
		let name = $("#addr_name").val();
		let phone = $("#addr_phone").val();
		let addr = $("#addr_name").val();
		let phone_pattern = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})[0-9]{3,4}[0-9]{4}$/;
		
		
		if (name === "" || phone === "" || addr === "") {
			alert("입력칸을 모두 채워주세요.");
			return false;
		}
	      if (!phone_pattern.test(phone)) {
	            alert("올바른 전화번호 형식이 아닙니다.");
	            return false;
	    }
	});
	     addr_edit_ok(this.form);
});      
	function addr_edit_ok(f) {
		f.action = "mypage_addr_edit_ok.do";
		f.submit();
		alert("수정 되었습니다.");
	}
</script>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<%@include file="../main/aside_mypage.jsp"%>
	<div class="mypage_addr_add_wrap">
			<h2>주소록 수정</h2>
			<div class="mypage_addr_add_tilte"></div>
			<c:choose>
				<c:when test="${empty avo }">
					<h3>원하는 정보가 존재하지 않습니다.</h3>
				</c:when>
				
				<c:otherwise>
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
				                <input class="mypage_addr_add_info " type="text" placeholder="배송지 이름을 입력해주세요" id="addr_name" name="addr_name" value="${avo.addr_name}" autocomplete="off" />
				                <input class="mypage_addr_add_info" type="text" placeholder="연락처를 입력해주세요" id="addr_phone" name="addr_phone" value="${avo.addr_phone}" autocomplete="off"/>
				                <input class="mypage_addr_add_info" type="text" placeholder="주소를 입력해주세요" id="addr_addr" name="addr_addr" value="${avo.addr_addr}" autocomplete="off"/>
					                	<button class="mypage_addr_add_btn1" id="addr_edit">수정 완료</button>
					                    <button class="mypage_addr_add_btn1"onclick="history.go(-1)">취소</button>
					           </form>
					        </div>
						</div>
					</div>
			</c:otherwise>
		</c:choose>
		</div>
	<footer>
		<%@include file="../main/footer.jsp"%>
	</footer>

</body>
</html>