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
			<li class="menu"><span id="topmenu"
				style="font-family: 'Jua', sans-serif;"><a href="mypage.do">내정보 관리</a></span>
			</li>
			<li class="menu"><a href="passwordChangeView.do"
				style="font-family: 'Jua', sans-serif;">비밀번호 변경</a></li>
			<li class="menu"><a href="reservationPage.do"
				style="font-family: 'Jua', sans-serif;">예약내역</a></li>
			<li class="menu"><a href="myFavoriteHouse.do"
				style="font-family: 'Jua', sans-serif;">저장한 숙소</a></li>
			<li class="menu"><a href="chat.do"
				style="font-family: 'Jua', sans-serif;">메세지</a></li>
			<li class="menu"><a href="customerWithdrawalView.do"
				style="font-family: 'Jua', sans-serif;">회원탈퇴</a></li>
			<li class="menu"><a href="getCuponList.do"
				style="font-family: 'Jua', sans-serif;">쿠폰함</a></li>
		</ul>
	</div>
</body>
</html>