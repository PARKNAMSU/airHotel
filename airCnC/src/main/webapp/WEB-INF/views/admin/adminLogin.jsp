<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/adminlogin.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
<title>관리자 로그인</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/adminLogin.js"></script>
</head>
<body>
	<!-- header-start -->
	<header class="menudiv1" style="position: sticky;">
		<div class="menudiv2-1">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/logo2.png" />
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1">
				<ul id="menuItems">
					<li class="item">계정관리</li>
					<li class="item">통계</li>
					<li class="item">숙소관리</li>
					<li class="item">로그관리</li>
					<li class="item">로그인</li>
				</ul>
			</div>
		</div>
	</header>
	<!-- header-end -->
	<form name="loginForm" action="adminLogin.mdo" method="post">
	<div class="container" style="text-align: center;">
		<img src="${pageContext.request.contextPath}/resources/images/admin/adminregister.jpg" alt="" />
		<div class="adminm">
			<div class="admin1" style="padding-bottom: 30px;">
				<label for="admin">관리자 로그인</label>
			</div>
			<div class="adminid" style="padding-bottom: 30px;">
				<input type="text" name="adminId" id="adminId" placeholder="관리자 계정"/>
			</div>
			<div class="adminpw">
				<input type="password" name="adminPassword" id="adminPassword" placeholder="비밀번호"/>
			</div>
		</div>
		<div class="btnadmin">
			<button type="submit" class="button" name="submit">로그인</button>
			<c:if test="${message == 'fail'}">
				<div style="color: red">
					<script>alert('아이디 또는 비밀번호가 잘못되었습니다.'); history.go(-1);</script>
				</div>
			</c:if>
			<c:if test="${message == 'logout'}">
				<div style="color: red">
					<script>alert('로그아웃되었습니다..'); history.go(-1);</script>
				</div>
			</c:if>
		</div>
	</div>
	</form>
</body>
</html>