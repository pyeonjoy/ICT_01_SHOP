<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Perfume</title>
<link href="resources/css/home.css" rel="stylesheet" />
<script type="text/javascript">
	// 쿠키 셋 
	function setCookie(name, value, exDay) {
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate() + exDay);
		document.cookie = name + "=" + escape(value) + ";expires="
				+ todayDate.toGMTString() + ";path=/";
	}

	// 쿠키 겟
	function getCookie(name) {
		var nameEQ = name + "=";
		var ca = document.cookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ')
				c = c.substring(1, c.length);
			if (c.indexOf(nameEQ) == 0)
				return c.substring(nameEQ.length, c.length);
		}
		return null;
	}

	// 팝업 닫기 
	function closePop(popId) {
		var cookiedata = document.cookie;
		if (document.getElementById('chkbox' + popId).checked) {
			setCookie("popup" + popId, "done", 1);
		}
		document.getElementById('layer_popup' + popId).style.display = "none";
	}

	// 페이지 로드 시 팝업 여부 체크
	document.addEventListener("DOMContentLoaded", function() {
		checkPopup();
	});
	function checkPopup() {
		for (var i = 1; i <= 5; i++) {
			if (getCookie("popup" + i) === "done") {
				document.getElementById('layer_popup' + i).style.display = "none";
			} else {
				document.getElementById('layer_popup' + i).style.display = "block";
			}
		}
	}
</script>
</head>
<body onload="checkPopup()">
	<!-- 페이지 로드 시 팝업 표시 여부 확인 -->
	<section id="section1">
		<%@include file="main/header.jsp"%>
	</section>
	<div id="video_area1">
		<video
			src="https://tamburins-resource.s3.ap-northeast-2.amazonaws.com/mainbanner/4047bc43-af66-4b6d-a004-ec47b3ee4746/Room_Main_Web(Final2).mp4"
			type="video/mp4" id="background_video" preload="auto"
			autoplay="autoplay" loop="loop" muted="muted" volume="0"></video>
	</div>

	<!-- 다중 팝업  -->

	<div id="layer_popup1" class="layer_popup"
		style="top: 50px; left: 50px;">
		<img src="resources/image/213e6fa73233c08f.jpg" alt="Popup Image"
			class="popup_image">
		<div id="check1">
			<input type="checkbox" id="chkbox1"> <label for="chkbox1">&nbsp;오늘
				하루동안 안 보기</label>
		</div>
		<div id="close1">
			<a href="javascript:closePop(1);">닫기</a>
		</div>
	</div>

	<div id="layer_popup2" class="layer_popup"
		style="top: 100px; left: 100px;">
		<img src="resources/image/213e6fa73233c08f.jpg" alt="Popup Image"
			class="popup_image">
		<div id="check2">
			<input type="checkbox" id="chkbox2"> <label for="chkbox2">&nbsp;오늘
				하루동안 안 보기</label>
		</div>
		<div id="close2">
			<a href="javascript:closePop(2);">닫기</a>
		</div>
	</div>

	<div id="layer_popup3" class="layer_popup"
		style="top: 150px; left: 150px;">
		<img src="resources/image/213e6fa73233c08f.jpg" alt="Popup Image"
			class="popup_image">
		<div id="check3">
			<input type="checkbox" id="chkbox3"> <label for="chkbox3">&nbsp;오늘
				하루동안 안 보기</label>
		</div>
		<div id="close3">
			<a href="javascript:closePop(3);">닫기</a>
		</div>
	</div>

	<div id="layer_popup4" class="layer_popup"
		style="top: 200px; left: 200px;">
		<img src="resources/image/213e6fa73233c08f.jpg" alt="Popup Image"
			class="popup_image">
		<div id="check4">
			<input type="checkbox" id="chkbox4"> <label for="chkbox4">&nbsp;오늘
				하루동안 안 보기</label>
		</div>
		<div id="close4">
			<a href="javascript:closePop(4);">닫기</a>
		</div>
	</div>

	<div id="layer_popup5" class="layer_popup"
		style="top: 250px; left: 250px;">
		<img src="resources/image/213e6fa73233c08f.jpg" alt="Popup Image"
			class="popup_image">
		<div id="check5">
			<input type="checkbox" id="chkbox5"> <label for="chkbox5">&nbsp;오늘
				하루동안 안 보기</label>
		</div>
		<div id="close5">
			<a href="javascript:closePop(5);">닫기</a>
		</div>
	</div>


	<div class="home_footer">
		<%@include file="main/footer.jsp"%>
	</div>
</body>
</html>
