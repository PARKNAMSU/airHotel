<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sideMenu.css?version=123">
<title>Insert title here</title>
</head>
<body>
	<div id="sidediv">
		<ul id="sidemenu">
			<li class="menu"><span id="topmenu" style="font-family: 'Jua', sans-serif;">내정보 관리</span></li>
			<li class="menu"><a href="${pageContext.request.contextPath}/resources/project/myreservation.jsp" style="font-family: 'Jua', sans-serif;">예약내역</a></li>
			<li class="menu"><a href="${pageContext.request.contextPath}/resources/project/chat.jsp" style="font-family: 'Jua', sans-serif;">메세지</a></li>
			<li class="menu" style="font-family: 'Jua', sans-serif;">회원탈퇴</li>
		</ul>
	</div>
</body>
</html>