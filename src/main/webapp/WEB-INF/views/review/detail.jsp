<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판</title>
<link href="resources/css/board.css" rel="stylesheet">
<style>
    textarea {
        width: 100%; /* Makes the textarea wider */
        height: 200px; /* Increases the height */
        border: none; /* Removes border */
        resize: none;
    }
</style>
<script type="text/javascript">
	function review_list(f) {
		f.action = "review_list.do";
		f.submit()
	}
	function review_ans_write(f) {
		f.action = "review_ans_write.do";
		f.submit()
	}
	function review_update(f) {
		f.action = "review_update.do";
		f.submit()
	}
	function review_delete(f) {
		f.action = "review_delete.do";
		f.submit()
	}
</script>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<%@include file="../main/aside_mypage.jsp"%>
	<div id="bbs" align="center" class="bbs_detail bbs_write">
		<div>
			<form action="ans_write.do" method="POST">
				<table>
					<tbody>
						<tr>
							<th>제목</th>
							  <td><span>${rvo.title}</span></td>
						</tr>

						<tr>
							<th>내용</th>
							<td><textarea name="content" rows="5" cols="50" readonly>${rvo.content}</textarea></td>
                        </tr>

						<tr>
							<th>첨부파일</th>
							<c:choose>
								<c:when test="${empty rvo.f_name }">
									<td><b>첨부파일없음</b></td>
								</c:when>
								<c:otherwise>
									<td><a href="review_down.do?f_name=${rvo.f_name}"><img
											src="resources/upload/${rvo.f_name}" style="width: 80px">
									</a></td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<th>작성자</th>
							 <td><span>${rvo.writer}</span></td>
						</tr>
						<tr>
							<th>날짜</th>
							<td>${rvo.regdate.substring(0,10)}</td>
						</tr>
					</tbody>
				</table>
				<div class="board_write_button">
					<input type="hidden" value="${rvo.re_idx}" name="re_idx"> <input
						type="hidden" value="${cPage}" name="cPage"> <input
						type="hidden" name="user_idx" value="${uvo.user_idx}"> <input
						type="button" value="목록" onclick="review_list(this.form)" /> <input
						type="button" value="답글" onclick="review_ans_write(this.form)" />
					<input type="button" value="삭제" onclick="review_delete(this.form)" />
				</div>
			</form>
		</div>
	</div>
	<footer>
		<%@include file="../main/footer.jsp"%>
	</footer>
</body>
</html>