<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
input{
margin: 10px;
}
tr {
		
	    text-align:center;
	}
	
th {margin: 10px;
	    border-bottom: 1px solid black;
		width:120px;
	    text-align:center;
	    padding:14px 20px;
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
	function board_list(f) {
		f.action="board_list.do";
		f.submit()
	}	
	function ans_write(f) {
		f.action="ans_write.do";
		f.submit()
	}	
	function board_update(f) {
		f.action="board_update.do";
		f.submit()
	}	
	function board_delete(f) {
		f.action="board_delete.do";
		f.submit()
	}	
</script>
</head>
<body>
<%@include file="../main/header.jsp"%>
	<%@include file="../main/aside_mypage.jsp"%>
		<div id="bbs" align="center">
	<form method="post">
	<table width="700">
	<tbody>
	<tr>
		<th>제목</th>
		<td>${bovo.title} </td>
	</tr>
	<tr>
		<th>작성자</th>
		<td> ${bovo.writer}</td>
	</tr>
	<tr>
		<th>날짜</th>
		<td>${bovo.regdate.substring(0,10)} </td>
	</tr>
	<tr>
		<th>내용</th>
		<td><pre>${bovo.content }</pre></td>
	</tr>
	
	<tr>
		<th>첨부파일</th>
		<c:choose>
			<c:when test="${empty bovo.f_name }">
				<td><b>첨부파일없음</b></td>
			</c:when>
			<c:otherwise>
				<td>
					<a href="board_down.do?f_name=${bovo.f_name}"><img src="resources/upload/${bovo.f_name}" style="width: 80px"> </a>
				</td>
			</c:otherwise>
		</c:choose>
	</tr>
	</tbody>
	<tfoot>
	<tr>
     <td colspan="2">
     	<input type="hidden" value="${bovo.bo_idx}" name="bo_idx">
     	<input type="hidden" value="${cPage}" name="cPage">
        <input type="button" value="목록" onclick="board_list(this.form)" />
        <input type="button" value="답글" onclick="ans_write(this.form)" />
        <input type="button" value="수정" onclick="board_update(this.form)" />
        <input type="button" value="삭제" onclick="board_delete(this.form)" />
     </td>
	</tr>
	</tfoot>
	</table>
	</form>
</div>
		<footer>
		<%@include file="../main/footer.jsp"%>
	</footer>
</body>
</html>