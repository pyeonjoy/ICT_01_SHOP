<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="resources/css/board.css" rel="stylesheet" />
<script type="text/javascript">
	function board_ans_write_ok(f) {
		for (var i = 0; i < f.elements.length; i++) {
			if (f.elements[i].value == "") {
				if (i == 2) continue;
				alert(f.elements[i].name + "를 입력하세요");
				f.elements[i].focus();
				return;//수행 중단
			}
		}
		f.submit();
	}
	function board_list(f) {
		f.action="board_list.do";
		f.submit();
	}
</script>
</head>
<body>
<%@include file="../main/header.jsp"%>
	<%@include file="../main/aside_mypage.jsp"%>
		<div id="bbs" align="center" class="bbs_write">
		<div>
			<form action=board_ans_write_ok.do method="post" enctype="multipart/form-data">
				<table>
				<tbody>
					<tr>
						<th>제목</th>
						<td> <input type="text" name="title" style="font-size: 20px;" placeholder="제목"></td>
					</tr>
					<tr class="board_write_content">
						<th>내용</th>
						<td><textarea rows="16" cols="70" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td align="left"><input type="file" name="file"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td align="left"><input type="text" name="writer"  placeholder="작성자"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td align="left"><input type="password" name="pwd" placeholder="비밀번호"></td>
					</tr>
            </tbody>
		</table>
			 <div class="board_write_button">
				<input type="hidden" name="cPage" value="${cPage }">
				<input type="hidden" name="bo_idx" value="${bo_idx }">
				<input type="hidden" name="user_idx" value="${uvo.user_idx }">
				<input type="button" value="목록" onclick="board_list(this.form)" /> 
				<input type="button" value="답글" onclick="board_ans_write_ok(this.form)" /> 
				<input type="reset" value="취소" />
			</div>
	</form>
	</div>
	</div>
			<footer>
		<%@include file="../main/footer.jsp"%>
	</footer>
</body>
</html>