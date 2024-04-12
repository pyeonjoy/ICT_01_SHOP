<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="resources/css/board.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		let pwdchk = "${pwdchk}";
		if(pwdchk == 'fail'){
			alert("비밀번호틀림");
			return;
		}
	});
</script>
<script type="text/javascript">
	function board_list(f) {
		f.action="board_list.do";
		f.submit();
	}

	function board_update_ok(f) {
		for (var i = 0; i < f.elements.length; i++) {
			if (f.elements[i].value == "") {
				if (i == 2 || i ==3) continue;
				alert(f.elements[i].name + "를 입력하세요");
				f.elements[i].focus();
				return;//수행 중단
			}
		}
		f.action="board_update_ok.do";
		f.submit();
	}
</script>
</head>
<body>
<%@include file="../main/header.jsp"%>
	<%@include file="../main/aside_mypage.jsp"%>
	<div id="bbs" align="center" class="bbs_write">
		<div>
			<form method="post" enctype="multipart/form-data">
				<table>
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" value="${bovo.title }" style="font-size: 20px;" placeholder="제목"></td>
					</tr>
					<tr class="board_write_content">
						<th>내용</th>
						<td><textarea rows="16" cols="70" name="content">${bovo.content}</textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td class="file_space_td">
							<c:choose>
								<c:when test="${empty bovo.f_name}">
									<input class="file_space" type="file" name="file">
									<span class="file_space"><b>이전파일없음</b></span>
									<input type="hidden" name="old_f_name" value="">	
								</c:when>
								<c:otherwise>
									<input class="file_space" type="file" name="file">
									<span class="file_space"><b>${bovo.f_name}</b></span>
									<input type="hidden" name="old_f_name" value="${bovo.f_name}">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="writer" value="${bovo.writer }" placeholder="작성자"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pwd" placeholder="비밀번호"></td>
					</tr>
					
						
		        </tbody>
				</table>
				<div class="board_write_button">
					<input type="hidden" name="bo_idx" value="${bovo.bo_idx }">
					<input type="hidden" name="cPage" value="${cPage }">
					<input type="button" value="목록" onclick="board_list(this.form)" /> 
					<input type="button" value="수정" onclick="board_update_ok(this.form)" /> 
					<input type="reset" value="취소" onclick="history.go(-1)" />
				</div>
			</form>
		</div>
	</div>
	<footer>
		<%@include file="../main/footer.jsp"%>
	</footer>
</body>
</html>