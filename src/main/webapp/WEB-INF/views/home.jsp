<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Perfume</title>
<link href="resources/css/home.css" rel="stylesheet" />
</head>
<section id="section1">
	<%@include file="main/header.jsp"%>
</section>
<div id="video_area1">
	<video
		src="https://tamburins-resource.s3.ap-northeast-2.amazonaws.com/mainbanner/4047bc43-af66-4b6d-a004-ec47b3ee4746/Room_Main_Web(Final2).mp4"
		type="video/mp4" id="background_video" preload="auto"
		autoplay="autoplay" loop="loop" muted="muted" volume="0"></video>
</div>

<div class="home_footer">
	<%@include file="main/footer.jsp"%>
</div>
</body>
</html>