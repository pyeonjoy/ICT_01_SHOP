<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/button.css" rel="stylesheet"/>
<link href="${path}/resources/css/signup.css" rel="stylesheet"/>
<script type="text/javascript">
$(document).ready(function() {
    $("#user_id").keyup(function() {
        $.ajax({
            url: "Signup_idchk.do",
            data: "user_id=" + $("#user_id").val(),
            method: "post",
            dataType: "text",
            success: function(data) {
                if (data == '1') {
                    $("#sign_btn1").removeAttr("disabled");
                    $(".signup_idchk").text("사용가능").css("color","green");
                } else if (data == '0') {
                    $("#sign_btn1").attr("disabled", "disabled");
                    $(".signup_idchk").text("사용불가").css("color","red");
                }
            }
        });
    });

    $("#sign_btn1").click(function() {
        
    	let pwd1 = $("#pwd1").val();
        let pwd2 = $("#pwd2").val();
        let id = $("#user_id").val();
        let name = $("#user_name").val();
        let phone = $("#user_phone").val();
        let birth = $("#user_birth").val();
        let email = $("#user_email").val();
        let addr = $("#user_addr").val();
        
        if (pwd1 === "" || pwd2 === "" || id === "" || name === "" || phone === "" || birth === "" || email === "" || addr === "") {
            alert("입력칸을 모두 채워주세요.");
            return false;
        }
        
        if (pwd1 !== pwd2) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }
        if (!$("input[type='checkbox']").is(":checked")) {
            alert("개인정보 약관에 동의해야 합니다.");
            return false;
        }
        SignUp_go(this.form);
    });
});
    function SignUp_go(f) {
    	f.action="congratulation.do";
    	f.submit();
	}
</script>
</head>
<body>
<form method="post">
	<div class="sign_header">
		<%@include file="../main/header.jsp"%>
	</div>
	<div class="sign_body">
		<div class="sign_wrap">
		<h2 style="margin-bottom: 30px;">회원 가입</h2>
		<div class="sign_stroke" ></div>
			<div class="sign_left">
				<p>아이디</p>
				<p>비밀번호</p>	
				<p>비밀번호 확인</p>
				<p>이름</p>
				<p>전화번호</p>
				<p>생년월일</p>
				<p>이메일</p>
				<p>주소</p>
			</div>
			<div class="sign_right">
				<!-- 파일 변경으로 인해 수정해야할 부분 -->
				<input class="sign_info_input" type="text" id="user_id" name="user_id" placeholder="아이디를 입력해주세요." >
				<span class="signup_idchk" style="font-size: 8px;"></span>
				<input class="sign_info_input" type="password" id="pwd1" name="user_pwd" placeholder="비밀번호를 입력해주세요." >
				<input class="sign_info_input" type="password" id="pwd2" placeholder="다시한번 입력해주세요." required> 
				<input class="sign_info_input" type="text" id="user_name" name="user_name" placeholder="이름을 입력해주세요."> 
				<input class="sign_info_input" type="text" id="user_phone"name="user_phone" placeholder="전화번호를 입력해주세요."  maxlength="11">
				<input class="sign_info_input" type="text" id="user_birth"name="user_birth" placeholder="생년월일 ex)980331"  maxlength="6">
				<input class="sign_info_input" type="text" id="user_email"name="user_email" placeholder="이메일을 입력해주세요." >
				<input class="sign_info_input" type="text" id="user_addr" name="user_addr" placeholder="주소를 입력해주세요." >
			</div>
			<div class="sign_bottom">
				<input type="checkbox">
				<p style="display: inline-block;">개인정보 약관에 동의하시겠습니까?</p>
				<button class="sign_btn1" type="button" id ="sign_btn1">회원가입</button>
			</div>
		</div>
	</div>
	<div class="sign_footer">
		<%@include file="../main/footer.jsp"%>
	</div>
		</form>
</body>
</html>