<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon.png">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/TEST.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/hostregister.css" />
<title>헤더</title>
</head>
<body>
	<div class="menudiv2-1">
		<a href=""><img alt="" src="${pageContext.request.contextPath}/resources/images/main/1123.png" /></a><br>
		<label for="" style="font-size: 20px;">Trip</label>
	</div>
	<div class="menudiv2-2">
		<div class="menudiv3-1" id="div1">
			<ul id="menuItems">
				<li class="item">
					<a href="#">호스트 </a>
				</li>
				<li class="item">
					<p><a href="/cnc/registerView.do">회원가입</a></p>
				</li>
				<li class="item">
					<p><a href="/cnc/loginView.do">로그인</a></p>
				</li>		
			</ul>
		</div>
		<div id="fade" class="black_overlay"></div>
	</div>
</body>
</html>