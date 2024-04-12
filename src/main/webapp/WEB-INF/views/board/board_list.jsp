<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE HTML>
<html>
<head>
<meta charset=UTF-8>
<title>게시판</title>
<link href="resources/css/board.css" rel="stylesheet" />
<script type="text/javascript">
	function board_write() {
		location.href = "board_write.do";
	}
</script>
</head>
<body>
<%@include file="../main/header.jsp"%>
	<%@include file="../main/aside_mypage.jsp"%>
	<div id="bbs" align="center" class="bbs_list">
		<div class="mypage_title">
			<h2>1:1 문의게시판</h2>
			<div class="mypage_title_line"></div>
		</div>
		<table summary="게시판 목록">
			<thead>
				<tr class="title">
					<th class="no">번호</th>
					<th class="subject">제목</th>
					<th class="writer">글쓴이</th>
					<th class="reg">날짜</th>
					<th class="hit">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty board_list }">
						<tr><td colspan="5" rowspan="3"><h3>게시물이 존재하지 않습니다.</h3></td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${board_list}" varStatus="vs">
							<tr>
							    <td>${paging.totalRecord - ((paging.nowPage-1)*paging.numPerPage + vs.index )}</td>
							    <td style="text-align: left;">
								    <c:forEach begin="1" end="${k.step}">&nbsp;[Re]</c:forEach>
								    <c:choose>
								    	<c:when test="${k.active == 1 }">
								    		<span style="color:lightgray">삭제된 게시물입니다</span>
								    	</c:when>
								    	<c:otherwise>
								    		<a href="board_detail.do?bo_idx=${k.bo_idx}&cPage=${paging.nowPage}">${k.title }</a></td>
								    	</c:otherwise>
								    </c:choose>
							    <td>${k.writer }</td>
							    <td>${k.regdate.substring(0,10)}</td>
							    <td>${k.hit }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<ol class="paging">
							<!-- 이전 버튼 -->
							<c:choose>
								<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
									<li class="disable">이전</li>
								</c:when>
								<c:otherwise>
									<li><a href="board_list.do?cPage=${paging.beginBlock - paging.pagePerBlock }">이전으로</a></li>
								</c:otherwise>
							</c:choose>
							<!-- 페이지번호들 -->
							<c:forEach begin="${paging.beginBlock }" end="${paging.endBlock }" step="1" var="k">
								<c:choose>
									<c:when test="${k == paging.nowPage }">
										<li class="now">${k}</li>
									</c:when>
									<c:otherwise>
										<li><a href="board_list.do?cPage=${k}">${k }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- 이후 버튼 -->
								<c:choose>
								<c:when test="${paging.endBlock >= paging.totalPage }">
									<li class="disable">다음</li>
								</c:when>
								<c:otherwise>
									<li><a href="board_list.do?cPage=${paging.beginBlock + paging.pagePerBlock }">다음으로</a></li>
								</c:otherwise>
							</c:choose>
						</ol>	
					</td>
					<td>
						<input type="button" value="글쓰기" onclick="board_write()">
					</td>
				</tr>
			</tfoot>	
		</table>
	</div>
		<footer>
		<%@include file="../main/footer.jsp"%>
	</footer>
</body>
</html>
