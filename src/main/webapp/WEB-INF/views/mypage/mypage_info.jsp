<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/button.css" rel="stylesheet" />
<style>
.mypage_info {
    width: 100%;
    margin: auto;
    text-align: center;
    margin-top: 50px; 
}

.mypage_info_table {
    width: 50%;
    border-collapse: separate;
    border-spacing: 0; 
    margin: auto;
}

.mypage_info_table th, .mypage_info_table td {
    padding: 10px;
    white-space: nowrap; 
    text-align: center; 
}

.mypage_info_table th:first-child, .mypage_info_table td:first-child {
    border-left: none;
}

.mypage_info_table th:last-child, .mypage_info_table td:last-child {
    border-right: none;
}

.info_input {
    width: calc(100% - 20px); 
    margin-right: 10px; 
    padding: 10px; 
    border: 2px solid #ccc; 
    border-radius: 5px;
    font-size: 16px;
    box-sizing: border-box; 
    text-align: center; 
    outline: none; 
}

.info_input:focus {
    border-color: #007bff; 
}

.email_wrapper, .address_wrapper {
    display: flex;
    align-items: center;
    justify-content: center;
}

.email_select, .address_button {
    margin-left: 5px; 
    font-size: 16px; 
}

.right_align {
    text-align: right !important;
}
</style>
</head>
<body>
    <div class="mypage_info_header">
        <%@include file="../main/header.jsp"%>
    </div>
    <div class="mypage_info_aside">
        <%@include file="../main/aside_mypage.jsp"%>
    </div>
    <div class="mypage_info">
        <h2 style="text-align: center;">회원 정보</h2>
        <div style="margin-bottom: 100px;"></div>
       
        <table class="mypage_info_table">
            <tr>
                <th class="right_align">아이디</th>
                <td><input class="info_input" type="text" name="id"></td>
            </tr>
            <tr>
                <th class="right_align">이름</th>
                <td><input class="info_input" type="text" name="name"></td>
            </tr>
            <tr>
                <th class="right_align">전화번호</th>
                <td><input class="info_input" type="text" name="phone"></td>
            </tr>
            <tr>
                <th class="right_align">전화번호 2</th>
                <td><input class="info_input" type="text" name="phone2"></td>
            </tr>
            <tr>
                <th class="right_align">이메일</th>
                <td>
                    <div class="email_wrapper">
                        <input class="info_input" type="text" name="email">
                        <select class="email_select">
                            <option value="">-선택-</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="hotmail.com">hotmail.com</option>
                            <option value="korea.com">korea.com</option>
                            <option value="nate.com">nate.com</option>
                            <option value="yahoo.com">yahoo.com</option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <th class="right_align">주소</th>
                <td>
                    <div class="address_wrapper">
                        <input class="info_input" type="text" name="address">
                        <button class="mypage_info_addr address_button">주소검색</button>
                    </div>
                </td>
            </tr>
            <tr>
                <th class="right_align"></th>
                <td><input class="info_input" type="text" name="additional_address"></td>
            </tr>
        </table>
    </div>
    <div class="mypage_info_footer">
        <%@include file="../main/footer.jsp"%>
    </div>
</body>
</html>
