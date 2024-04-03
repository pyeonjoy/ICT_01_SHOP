<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 확인</title>
<link rel="stylesheet" href="../css/button.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<style>

.mypage_pwdchk_wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin: 280px 300px;
}

.mypage_pwdchk_wrapper  input {
	border: 1px solid black;
	background-color: white;
	padding: 10px 30px;
	margin: 20px;
	font-weight: bold;
}
.mypage_pwdchk_aside{
	width: 350px;
	float: left;
	margin-top: 0;
	}
	
.mypage_pwdchk_icon {
    position: relative;
}
.mypage_pwdchk_icon i {
    position: absolute;
    top: 23%;
    right: 30px;
    color: black;
    cursor: pointer;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
    $('.mypage_pwdchk_chk i').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-eye-slash fa-lg")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-eye fa-lg")
            .prev('input').attr('type','password');
            
        }
    });
});
</script>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<div class="mypage_pwdchk_aside">
	<%@include file="../main/aside_mypage.jsp"%>
	</div>
	<div class="mypage_pwdchk_wrapper">
	<h2>비밀번호 확인</h2>
	<div class="mypage_pwdchk_chk">
    <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요">
    <span class="mypage_pwdchk_icon">
        <i class="fa fa-eye fa-lg"></i>
    </span>
	</div>
	<input type="submit" value="확인">
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>