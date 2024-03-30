<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<link href="${path}/resources/css/mypage_addr_add.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>주소록 수정</title>
<!--경로지정 안함 수정해야함 또르그르르륽   -->
</head>
<body>
    <%@include file="../main/header.jsp"%>

        <div class="mypage_addr_add_wrap">
            <h2>주소록 수정</h2>
            <div class="mypage_addr_add_tilte"></div>
				<div class="mypage_addr_add_inner">
					<div class="mypage_addr_add_left">
						<div class ="mypage_addr_add_label">
						배송지
						</div>               
	
						<div class="mypage_addr_add_label">
	                    연락처
						</div>               
					
						<div class ="mypage_addr_add_label">
	                    주소
						</div>
					</div>  
					<div class="mypage_addr_add_right">             
                    <input class="mypage_addr_add_info "  type="text" placeholder="배송지 이름을 입력해주세요" />
                    <input class="mypage_addr_add_info" type="text" placeholder="연락처를 입력해주세요" />
                    <input class="mypage_addr_add_info"    type="text" placeholder="주소를 입력해주세요" />
					</div>
                <input class="mypage_addr_add_info2"   type="text"  placeholder="상세주소를 입력해주세요" />

        </div>
        	<div class="mypage_addr_add_bottom">
            <button class="mypage_addr_add_btn1">수정 완료</button>
            <button class="mypage_addr_add_btn1">취소</button>
        	</div>
				</div>
    <footer>
        <%@include file="../main/footer.jsp"%>
    </footer>

</body>
</html>