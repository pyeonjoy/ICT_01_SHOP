<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<div class="bbs_delete_wraps">
<div id="bbs" align="center" class="bbs_delete_pwd">
	<form method="post"  class="bbs_delete_pwd_wrap">
		<table>
		<tbody>
			<tr>
				<td>비밀번호</td>
				<td align="left"><input type="password" name="pwd"></td>
			</tr>
            </tbody>
		</table>
		<div colspan="2"  class="board_write_button bbs_delete_btn" >
			<input type="hidden" name="bo_idx" value="${bo_idx}">
			<input type="hidden" name="user_idx" value="${uvo.user_idx }">
			<input type="hidden" name="cPage" value="${cPage}">
			<input type="button" value="삭제" onclick="board_delete_ok(this.form)" /> 
			<input type="reset" value="취소" onclick="history.go(-1)"/>
		</div>
	</form>
</div>
</div>
	<footer>
		<%@include file="../main/footer.jsp"%>
	</footer>
</body>
</html>