<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Perfume</title>
<style type="text/css">
#video_area1 {
  padding: 0;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
float: left;
}
/* #video_area2 {
float: left;
  padding: 0;
  width: 50vw;
  height: 100vh;
  overflow: hidden;
}
#video_area3 {
float: left;
  padding: 0;
  width: 50vw;
  height: 100vh;
  overflow: hidden;
} */
#background_video {
    z-index: -1;
  height: 100vh;
    width: auto;
    position: absolute;
}
.header_space{
display: none;
}
/* .home_footer{
width:100%;
position: absolute;
bottom: 0;
} */
</style>
</head>
<section id="section1"><!-- 영상 위에 올라올것들 -->
	<%@include file="main/header.jsp"%>
</section>
<div id="video_area1">
<video src="https://tamburins-resource.s3.ap-northeast-2.amazonaws.com/mainbanner/4047bc43-af66-4b6d-a004-ec47b3ee4746/Room_Main_Web(Final2).mp4" type="video/mp4" id="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="0"></video>
</div>
<!-- <div id="video_area2">
    <video src="https://tamburins-dev-resource.s3.ap-northeast-2.amazonaws.com/mainbanner/1966d633-1974-44d6-a6da-9af2d62ce01e/pc_main_banner_2.mp4" type="video/mp4" id="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="0"></video>
</div>
<div id="video_area3">
    <video src="https://tamburins-resource.s3.ap-northeast-2.amazonaws.com/mainbanner/d5fc14f8-164e-4cd2-b5de-bd44ccefe526/lip_balm_1280_1193.mp4" type="video/mp4" id="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="0"></video>
</div> -->

<div class="home_footer">
	<%@include file="main/footer.jsp"%>
</div>
</body>
</html>