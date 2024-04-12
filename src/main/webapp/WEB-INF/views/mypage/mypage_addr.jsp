<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 목록</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/mypage_addr.css" rel="stylesheet" />
<link href="resources/css/mypage.css" rel="stylesheet" />
<script type="text/javascript">
	function addr_addr_ok(f) {
		f.action = "addr_checked2.do";
		alert("기본배송지로 설정되었습니다.");
		f.submit();
	}
</script>
</head>
<body>
	<div class="mypage_addr_header">
		<%@include file="../main/header.jsp"%>
	</div>
	<div class="aside">
		<%@include file="../main/aside_mypage.jsp"%>
	</div>
	<div class="mypage_addr_body margin-top_20">
			<div class="mypage_title"><h2>배송지 목록</h2>
				<div class="mypage_title_line"></div>
			</div>
			
		<div class=mypage_box>
			<div class="mypage_addr_wrap">
				<button class="addr_add_btn" onclick="location.href='mypage_addr_add.do'">배송지추가</button>
				
				<c:choose>
					<c:when test="${empty list }">
						<h3>원하는 정보가 존재하지 않습니다.</h3>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${list}">
							<form method="post" action="mypage_delete.do">
								<div class="mypage_addr_inner">
									<div class="mypage_addr_inner_in">
										<p>${k.addr_name}</p>
										<p>${k.addr_phone}</p>
										<p>${k.addr_addr}</p>
										<input type="hidden" name="addr_idx" value="${k.addr_idx}">
										<input type="hidden" name="addr_phone" value="${k.addr_phone}">
										<input type="hidden" name="addr_name" value="${k.addr_name}">
										<input type="hidden" name="addr_addr" value="${k.addr_addr}">
									</div>
									<div class="mypage_addr_inner_in ">
										<button class="addr_box_btn" onclick="addr_addr_ok(this.form)">기본 설정</button>
										<input class="addr_box_btn" type="button" value="수정"  onclick="location.href='mypage_addr_edit.do?addr_idx=${k.addr_idx}'" />
										<button class="addr_box_btn" type="submit">삭제</button>
									</div>
								</div>
							</form>
							<hr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>