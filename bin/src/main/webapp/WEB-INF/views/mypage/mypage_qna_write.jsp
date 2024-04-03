<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<link href="${path}/resources/css/mypage_qna_write.css" rel="stylesheet"/>

</head>
<body>
<%@include file="../main/header.jsp"%>
    <%@include file="../main/aside_mypage.jsp" %>
    <div>
		<div class="mypage_title"><h2>게시물 작성</h2></div>
		<div class="mypage_tilte_tilte" ></div>
		<div class="mypage_qna_write_wrapper">
		<form action="" method="post" class="mypage_qna_write_item">
		<div class="mypage_qna_write_header">
		<p class="mypage_qna_write_header_p">제목: </p>
		<p><input type="text" name="name" size="83" placeholder="제목을 입력하세요." class="mypage_qna_write_title">
		</p>
		</div>
			<textarea rows="25" cols="93" name="content" class="mypage_qna_write_textarea" value="내용을 입력하세"></textarea>
		<div class="mypage_qna_write_container">
		<table>
			<tbody>
				<tr><td colspan="3">비밀번호<input type="password" name="password" class="mypage_qna_write_password"></td></tr>
				<tr><td colspan="3">파일1 <input type="file" name="file"></td></tr>
				<tr><td>파일2 <input type="file" name="file"></td>
					<td></td>
					<td class="mypage_qna_write_submit"><input type="submit" value="작성"> <input type="reset"value="취소"></td>
				</tr>
			</tbody>
		</table>
		</div>	
		</form>
	</div>
	</div>
<%@include file="../main/footer.jsp"%>
</body>
</html>