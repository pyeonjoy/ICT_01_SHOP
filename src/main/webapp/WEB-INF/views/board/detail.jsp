<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="resources/css/board.css" rel="stylesheet" >
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
<div id="bbs" align="center" class="bbs_detail bbs_write">
	<div>
		<form method="post" >
			<table>
			<tbody>
				<tr>
					<th>제목</th>
					<td>${bovo.title} </td>
				</tr>
				
				<tr class="board_detail_content">
					<th>내용</th>
					<td style=""><pre>${bovo.content}</pre></td>
				</tr>
				
				<tr>
					<th>첨부파일</th>
					<td>
					<c:choose>
						<c:when test="${empty bovo.f_name }">
							<b>첨부파일없음</b>
						</c:when>
						<c:otherwise>
							<a href="board_down.do?f_name=${bovo.f_name}"><img src="resources/upload/${bovo.f_name}" style="width: 80px"> </a>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td> ${bovo.writer}</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>${bovo.regdate.substring(0,10)} </td>
				</tr>
			</tbody>
			</table>
			 <div class="board_write_button">
		     	<input type="hidden" value="${bovo.bo_idx}" name="bo_idx">
		     	<input type="hidden" value="${cPage}" name="cPage">
		        <input type="button" value="목록" onclick="board_list(this.form)" />
		        <input type="button" value="답글" onclick="ans_write(this.form)" />
		        <input type="button" value="수정" onclick="board_update(this.form)" />
		        <input type="button" value="삭제" onclick="board_delete(this.form)" />
			</div>
		</form>
	</div>
</div>
	<footer>
		<%@include file="../main/footer.jsp"%>
	</footer>
</body>
</html>