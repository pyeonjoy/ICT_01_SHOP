<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<link href="${path}/resources/css/mypage_addr_add.css" rel="stylesheet" />
<style type="text/css">
#bbs table {
	width:800px;
	margin:0 auto;
	margin-top:20px;
/* 	border: 1px solid black;
	border-collapse: collapse; */
	font-size: 14px;
}
tr {
	    text-align:center;
	    padding:4px 10px;
margin: 10px;
	}
	input{
margin: 10px;
}
	input[type="button"]{
line-height: 20px;
text-align: center;
width: 100px;
padding: 5px;
}
	input[type="reset"]{
padding: 5px;
line-height: 20px;
text-align: center;
width: 100px;
}
input {
  font-size: 15px;
  color: #222222;
  width: 300px;
  border: none;
  border-bottom: solid #aaaaaa 1px;
  padding-bottom: 10px;
  padding-left: 10px;
  position: relative;
  background: none;
  z-index: 5;
}

input::placeholder { color: #aaaaaa; }

th {
margin: 10px;
		width:120px;
	    text-align:center;
	    padding:4px 10px;
	}
</style>
<script type="text/javascript">
	function board_ans_write_ok(f) {
		for (var i = 0; i < f.elements.length; i++) {
			if (f.elements[i].value == "") {
				if (i == 3) continue;
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
		<div id="bbs" align="center">
	<form action="board_ans_write_ok.do" method="post" enctype="multipart/form-data">
		<table width="700">
		<tbody>
			<tr>
				<th>작성자</th>
				<td align="left"><input type="text" name="writer"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td align="left"> <input type="text" name="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td align="left"><textarea rows="10" cols="60" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td align="left"><input type="file" name="file"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td align="left"><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="hidden" name="cPage" value="${cPage }">
				<input type="hidden" name="bo_idx" value="${bo_idx }">
				<input type="hidden" name="user_idx" value="${uvo.user_idx }">
				<input type="button" value="답글입력" onclick="board_ans_write_ok(this.form)" /> 
				<input type="button" value="목록" onclick="board_list(this.form)" /> 
				<input type="reset" value="취소" />
				</td>
			</tr>
            </tbody>
		</table>
	</form>
	</div>
			<footer>
		<%@include file="../main/footer.jsp"%>
	</footer>
</body>
</html>