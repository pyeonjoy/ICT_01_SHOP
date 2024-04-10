<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<link href="${path}/resources/css/mypage_addr.css" rel="stylesheet" />
<script type="text/javascript">
function addr_addr_ok(f) {
	f.action = "addr_checked2.do";
	alert("추가 되었습니다.");
	f.submit();
}
</script>
</head>
<body>
	<div class="mypage_addr_header">
		<%@include file="../main/header.jsp"%>
	</div>
	<div class="mypage_addr_aside_mypage">
		<%@include file="../main/aside_mypage.jsp"%>
	</div>
	<div class="mypage_addr_body">
		<div class="mypage_tilte">
			<h2>배송지 목록</h2>
		<div class="mypage_tilte_stroke"></div>
		</div>
		
		
		<div class="mypage_addr_wrap">
			<c:choose>
				<c:when test="${empty list }">
					<button class="mypage_addr_btn1" onclick="location.href='mypage_addr_add.do'">배송지추가</button>
					<h3>원하는 정보가 존재하지 않습니다.</h3>
				</c:when>
				<c:otherwise>
					<br>
					<button class="mypage_addr_btn1" onclick="location.href='mypage_addr_add.do'">배송지추가</button>
					<c:forEach var="k" items="${list}">
						<div class="mypage_addr_inner">
							<form method="post" action="mypage_delete.do">
							    <div class="mypage_addr_inner_1">
							    <p>${k.addr_name}</p>
							    <p>${k.addr_phone}</p>
							    <p>${k.addr_addr}</p>
							    <input type="hidden" name="addr_idx" value="${k.addr_idx}">
							    <input type="hidden" name="addr_phone" value="${k.addr_phone}">
							    <input type="hidden" name="addr_name" value="${k.addr_name}">
							    <input type="hidden" name="addr_addr" value="${k.addr_addr}">
							    </div>
							   <div class="mypage_addr_inner_in2">
							    <p>
							    <button style="margin-left: 10px;" class="mypage_addr_btn2" type="submit">삭제</button>
							    </p>
							    <p>
							    <button class="mypage_addr_btn2"  value="배송지 선택하기"  onclick="addr_addr_ok(this.form)">배송지 선택하기</button>
							    </p>
							    <p>
							    <input type="button" value="수정" class="mypage_addr_btn2" onclick="location.href='mypage_addr_edit.do?addr_idx=${k.addr_idx}'"/>
							    </p>
							   </div>
							</form>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>