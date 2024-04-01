<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addr</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<link href="${path}/resources/css/mypage_addr.css" rel="stylesheet" />
<script type="text/javascript">
function addr_edit(f) {
	f.action ="mypage_addr_edit.do?idx=${user_idx}";
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
		</div>
		<div class="mypage_tilte_stroke"></div>
		
		
							<button class="mypage_addr_btn1" onclick="location.href='mypage_addr_add.do">배송지추가</button>
		<div class="mypage_addr_wrap">
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="4"><h3>원하는 정보가 존재하지 않습니다.</h3>
					</tr>
				</c:when>
				
				
				
				<c:otherwise>
						<c:forEach var="k" items="${list}">
					<c:if test="${k.user_idx == 1}">
					<div class="mypage_addr_inner"  style=" background-color: red;">
							<p>${k.addr_name}</p>
							<p>${k.addr_idx}
							<p>${k.addr_addr}</p>
							<button style="position: absolute;" class="mypage_addr_btn2" onclick="addr_edit(this.form)">수정</button>
					</div>
					</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>