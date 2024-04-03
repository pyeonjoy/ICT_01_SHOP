<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</style>
</head>
<body>
	<div id="footer" class="footer">
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