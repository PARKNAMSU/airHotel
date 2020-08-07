<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> 
<style type="text/css">
	body{
		background:white;
	}
	.stars{
		margin-left:50px;
		margin-top:50px;
	}
	#clickbtn{
		margin-left:460px;
		width: 100px;
		height: 60px;
	}
</style>
<meta charset="UTF-8">
<script type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body style="font-family: 'Jua', sans-serif;">
	<br><br><br>
	<h1 style="text-align:center;color:red;">별점 선택</h1>
	<div></div>
	<div class="stars">
	<img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/nostar.png" id="star1">
	<img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/nostar.png" id="star2">
	<img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/nostar.png" id="star3">
	<img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/nostar.png" id="star4">
	<img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/nostar.png" id="star5">
	</div><br><br>
	<form>
		<input type="hidden" value="0" id="comments_rate">
		<input type="hidden" id="commant">
	</form>
	<button id="clickbtn" onclick="closeWindow()"  class="btn btn-outline-danger" >선택</button>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/jquery-3.5.1.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/reservationhouse.js?version=123" ></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#star1").on("click",function(){
			$("#star1").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/star.png"})
			$("#star2").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/nostar.png"})
			$("#star3").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/nostar.png"})
			$("#star4").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/nostar.png"})
			$("#star5").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/nostar.png"})
			$("#comments_rate").attr({"value":"1"})
		})
		$("#star2").on("click",function(){
			$("#star1").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/star.png"})
			$("#star2").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/star.png"})
			$("#star3").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/nostar.png"})
			$("#star4").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/nostar.png"})
			$("#star5").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/nostar.png"})
			$("#comments_rate").attr({"value":"2"})
		})
		$("#star3").on("click",function(){
			$("#star1").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/star.png"})
			$("#star2").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/star.png"})
			$("#star3").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/star.png"})
			$("#star4").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/nostar.png"})
			$("#star5").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/nostar.png"})
			$("#comments_rate").attr({"value":"3"})
		})
		$("#star4").on("click",function(){
			$("#star1").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/star.png"})
			$("#star2").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/star.png"})
			$("#star3").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/star.png"})
			$("#star4").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/star.png"})
			$("#star5").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/nostar.png"})
			$("#comments_rate").attr({"value":"4"})
		})
		$("#star5").on("click",function(){
			$("#star1").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/star.png"})
			$("#star2").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/star.png"})
			$("#star3").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/star.png"})
			$("#star4").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/star.png"})
			$("#star5").attr({"src":"${pageContext.request.contextPath}/resources/images/reservationhouse/star.png"})
			$("#comments_rate").attr({"value":"5"})
		})
	})
</script>
</html>