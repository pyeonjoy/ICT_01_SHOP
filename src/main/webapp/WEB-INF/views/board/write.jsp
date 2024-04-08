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

tr {
	    text-align:center;
	    padding:4px 10px;
	    margin: 10px;
	}
	
th {
		width:120px;
	    text-align:center;
	    padding:4px 10px;
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
</style>
<script type="text/javascript">
	function board_write_ok(f) {
		for (var i = 0; i < f.elements.length; i++) {
			if (f.elements[i].value == "") {
				if (i == 3) continue;
				alert("이름을 입력하세요");
				f.elements[i].focus();
				return;//수행 중단
			}
		}
		f.submit();
	}
</script>
</head>
<body>
<%@include file="../main/header.jsp"%>
	<%@include file="../main/aside_mypage.jsp"%>
	<div id="bbs" align="center">
	<form action="board_write_ok.do" method="post" enctype="multipart/form-data" align="center">
		<table>
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
				<input type="button" value="입력" onclick="board_write_ok(this.form)" /> 
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