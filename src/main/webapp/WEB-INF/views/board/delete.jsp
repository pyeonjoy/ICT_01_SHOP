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
	width:500px;
	margin:0 auto;
	margin-top:20px;
/* 	border: 1px solid black;
	border-collapse: collapse; */
	font-size: 14px;
}
tr {
	    text-align:center;
	    padding:4px 10px;
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
		f.action ="board_list.do"
		f.submit();
	}
	function board_delete_ok(f) {
		f.action ="board_delete_ok.do"
		f.submit();
	}
</script>
</head>
<body>
<%@include file="../main/header.jsp"%>
	<%@include file="../main/aside_mypage.jsp"%>
		<div id="bbs" align="center">
	<form method="post" >
		<table width="500">
		<tbody>
			<tr>
				<th>비밀번호</th>
				<td align="left"><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="hidden" name="bo_idx" value="${bo_idx}">
				<input type="hidden" name="cPage" value="${cPage}">
				<input type="button" value="목록" onclick="board_list(this.form)" /> 
				<input type="button" value="삭제" onclick="board_delete_ok(this.form)" /> 
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