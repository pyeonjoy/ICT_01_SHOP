<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<style>
  .mypage_notice {
    width: 100%;
    margin: auto;
    text-align: center;
  }
  .mypage_notice_table {
    width: 50%; 
    border-collapse: separate;
    border-spacing: 0 4px; 
    margin: auto;
  }
  .mypage_notice_table th,
  .mypage_notice_table td {
    border-bottom: 1px solid #000; 
    padding: 10px;
  }
  .mypage_notice_table th:first-child,
  .mypage_notice_table td:first-child {
    border-left: none; 
  }
  .mypage_notice_table th:last-child,
  .mypage_notice_table td:last-child {
    border-right: none;
  }
  .search-container {
    margin-top: 100px; 
  }
  .table-search-gap {
    margin-bottom: 100px;
  }
</style>
</head>
<body>
    <%@include file="../main/header.jsp"%>
    <div class="mypage_notice_aside">
        <%@include file="../main/aside_mypage.jsp"%>
    </div>
    <div class="mypage_notice mypage_notice_flex">
        <div class="mypage_notice_flex">
            <h2 style="text-align: center;">공지사항</h2>
            <div class="table-search-gap"></div> 
            <table class="mypage_notice_table">
               <tr>
               <th>NO</th>
               <th>제목</th>
               <th>작성일</th>
               <th>작성자</th>
            </tr>
            <tr>
               <td>1</td>
               <td><a href="#" class="mypage_notice_title">공지사항 제목</a></td>
               <td>24.03.31</td>
               <td>관리자</td>
            </tr>
            <tr>
               <td>1</td>
               <td><a href="#" class="mypage_notice_title">공지사항 제목</a></td>
               <td>24.03.31</td>
               <td>관리자</td>
            </tr>
            <tr>
               <td>1</td>
               <td><a href="#" class="mypage_notice_title">공지사항 제목</a></td>
               <td>24.03.31</td>
               <td>관리자</td>
            </tr>
            <tr>
               <td>1</td>
               <td><a href="#" class="mypage_notice_title">공지사항 제목</a></td>
               <td>24.03.31</td>
               <td>관리자</td>
            </tr>
            <tr>
               <td>1</td>
               <td><a href="#" class="mypage_notice_title">공지사항 제목</a></td>
               <td>24.03.31</td>
               <td>관리자</td>
            </tr>
            <tr>
               <td>1</td>
               <td><a href="#" class="mypage_notice_title">공지사항 제목</a></td>
               <td>24.03.31</td>
               <td>관리자</td>
            </tr>
            <tr>
               <td>1</td>
               <td><a href="#" class="mypage_notice_title">공지사항 제목</a></td>
               <td>24.03.31</td>
               <td>관리자</td>
            </tr>
               
            </table>

            
            <div class="search-container">
                <div class="mypage_notice_flex">
                    <select>
                        <option>제목</option>
                        <option>내용</option>
                        <option>작성자</option>
                        <option>아이디</option>
                    </select>
                    <input type="text" name="search" placeholder="Search" class="mypage_notice_search">
                </div>
            </div>
        </div>
    </div>
    <%@include file="../main/footer.jsp"%>
</body>
</html>