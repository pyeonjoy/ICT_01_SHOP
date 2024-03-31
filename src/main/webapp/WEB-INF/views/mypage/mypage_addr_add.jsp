<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<link href="${path}/resources/css/mypage_addr_add.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>주소록 추가</title>
<script type="text/javascript">
	function save_go(f) {
		f.action = "mypage_addr_add_ok.do";
		f.submit();
	}
	
	function back_go(f) {
		f.action = "mypage_addr.do";
		f.submit();
	}
</script>
</head>
<body>
	<%@include file="../main/header.jsp"%>

	<div class="mypage_addr_add_wrap">
		<h2>주소록 추가</h2>
		<div class="mypage_addr_add_tilte"></div>
		<div class="mypage_addr_add_inner">
			<form method="post">
				<table>
					<tr align="center">
						<td class="mypage_addr_add_label">이름</td>
						<td><input class="mypage_addr_add_info " type="text"
							name="addr_name" placeholder="배송지 이름을 입력해주세요" /></td>
					</tr>	
					<tr align="center">
						<td class="mypage_addr_add_label">연락처</td>
						<td><input class="mypage_addr_add_info" type="text" name="addr_phone" placeholder="연락처를 입력해주세요" /></td>
					</tr>
					<tr align="center">
						<td class="mypage_addr_add_label">주소</td>
						<td><input class="mypage_addr_add_info" type="text"	placeholder="주소를 입력해주세요" name="addr_addr" /> </td>
					</tr>
							<td>
							<input class="mypage_addr_add_btn1" type="button" value="추가완료" onclick="save_go(this.form)" />
								</td>
								<td> 
								<input	class="mypage_addr_add_btn1" type="button" value="취소" onclick="back_go(this.form)" />
								</td>
				</table>
			</form>
		</div>
	</div>
	<footer>
		<%@include file="../main/footer.jsp"%>
	</footer>

</body>
</html>