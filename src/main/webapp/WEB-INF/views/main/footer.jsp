<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
.footer {
	position: absolute;
	top: 100vh;
	width: 100%;
	background-color: black;
	padding: 60px;
	color: white;
}

.item {
	display: inline-block;
}

.item:nth-of-type(1) {
	width: 40%;
}

.item:nth-of-type(2) {
	width: 40%;
}

.item:last-child {
	width: auto;
}

.footer_title {
	margin: 10px 0px;
}
.btn_gotop{
  position: fixed;
  right: 30px;
  bottom: 30px;
  display: inline-block;
  background-color: white;
  width: 70px;
  height: 70px;
  opacity: 1;
  transition: 0.7s ease;
  font-size: 17px;
  z-index: 5;
  border-radius: 100% ;
}

.btn_gotop img {
    width: 70px;
    height: 70px;
    object-fit: cover; 
    max-width: 100%;
  }
 
</style>
</head>
<body>
	<div id="footer" class="footer">
	<a href="#" class="btn_gotop"><img alt="people" src="resources/image/top.png" title="my"></a>
  <span class="glyphicon glyphicon-chevron-up">
  </span>
</a>
		<div class="item">
			<div class="footer_title">
				<b>Features</b>
			</div>
			<ul>
				<li>Cool stuff</li>
				<li>Random feature</li>
				<li>Team feature</li>
				<li>Stuff for developers</li>
				<li>Another one</li>
				<li>Last time</li>
				<li>Resources</li>
			</ul>
		</div>
		<div class="item">
			<div class="footer_title">
				<b>Features</b>
			</div>
			<ul>
				<li>Resource</li>
				<li>Resource name</li>
				<li>Another resource</li>
				<li>Final resource</li>
				<li>Team</li>
				<li>Locations</li>
				<li>Terms</li>
			</ul>
		</div>
		<div class="item" class="footer_title">
			<div class="footer_title">
				<b>Features</b>
			</div>
			<ul>
				<li>Resource</li>
				<li>Resource name</li>
				<li>Another resource</li>
				<li>Final resource</li>
				<li>Team</li>
				<li>Locations</li>
				<li>Terms</li>
			</ul>
		</div>
	</div>
</body>
</html>