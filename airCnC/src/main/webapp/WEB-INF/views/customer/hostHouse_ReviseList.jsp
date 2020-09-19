<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>AirBnb</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="shortcut icon" type="image/x-icon"
		href="${pageContext.request.contextPath}/images/favicon.png">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/test.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/menu.css?version=123"><!--  -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/reset.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/footer.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/hostregister.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/index.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/effect.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
		rel="stylesheet">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" />
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" 
    />
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/hostdetail1.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
		rel="stylesheet" />
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" />

<style>
h2 {
	font-size: 50px;
	color: black;
}

h4 {
	width: 500px;
	border-bottom: 3px solid black;
}

li {
	margin-top: 40px;
	color: black;
	list-style: none;
	font-size: 25px;
}

li:hover {
	color: #ff5a5f;
}

input[type="submit"] {
	color: white;
	display: inline-block;
	width: auto;
	height: auto;
	background-color: #ff5a5f;
	border-radius: 5px;
	font-size: 30px;
	text-decoration: none;
	padding: 3px;
	border: none;
}
</style>

</head>

<body>
	<!-- header-start -->
	<c:if test="${login_session eq null }">
		<header style="padding: 20px; background: rgb(025, 025, 025);">
	    <a href="/cnc/indexView.do"><img alt="" src="${pageContext.request.contextPath}/resources/images/main/logo111.png"/></a>
	    <div class="menudiv3-1" id="div1" style="padding-top: 13px;">
	        <ul id="menuItems">
	        <li class="item"> 
	            <a
	            href="/cnc/registerView.do"
	            onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"
	            ><li class="item">회원가입</li></a>
	            <a
	            href="/cnc/loginView.do"
	            onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"
	            ><li class="item">로그인</li></a>
	            <a
	            href=""
	            onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"
	            ><li class="item">공지사항</li></a>
	        </li>
	        </ul>
	    </div>
	</header>
	</c:if>
	<c:if test="${login_session ne null }">
		<header class="menudiv1">
			<div class="menudiv2-1" style="margin:0 0 10px;">
				<a href="/cnc/indexView.do"><img alt="" src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
			</div>
			<div class="menudiv2-2" style="padding:0 0 4px;">
				<div class="menudiv3-1" id="div1" style="float:left;width:70%;">
					<ul id="menuItems" style="padding:12px;">	
							<li class="item"><p><a href="/cnc/indexView.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;">메인페이지</a></p></li>
							<li class="item">
								<p>
									<a href="/cnc/selectBoardList.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >공지사항</a>
								</p>
							</li>
							<li class="item"><p><a href="myHouse.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >호스트</a></p></li>
					</ul>
				</div>
				<div style="width:50px;height:50px;margin-left:5%;margin-top:10px;border-radius: 30px 30px 30px 30px;float:left;background-color:white;overflow:hidden;" id="myinfo">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/my1.jpg" style="max-width:120%;max-height:120%;">
				</div>
			</div>
			<div id="mydiv" style="display:none;margin-left:90%;z-index:100;width:200px;background-color:#d2d2d2;font-size:20px;border-radius: 15px 15px 15px 15px;font-family: 'Jua', sans-serif;" >
						<ul>
							<li><br></li>
							<li style="margin-bottom:20px;"><a href="mypage.do">내 정보</a></li>
							<li style="margin-bottom:20px;"><a href="hostRegisterView.do">호스트 신청</a></li>
							<li style="margin-bottom:20px;"><a href="reservationPage.do">예약한 숙소</a></li>
							<li style="margin-bottom:20px;"><a href="myFavoriteHouse.do">저장한 숙소</a></li>
							<li style="margin-bottom:20px;"><a href="getCuponList.do">쿠폰함</a></li>
							<li style="margin-bottom:20px;"><a href="chat.do">메세지</a></li>
						<c:choose>
							<c:when test="${social_type ne null }">
							<li style="margin-bottom:20px;"><a href="kakaologout.do">로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li style="margin-bottom:20px;"><a href="logout.do">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					<li ><br></li>
				</ul>
			</div>
		</header>
		
		<script type="text/javascript">
			$(function(){
				$("#myinfo").click(function(){
					$("#mydiv").fadeToggle("slow");
				})
			})
		</script>
	</c:if>
    <!-- header-end -->
	<div class="container" style="align-content: center;">
		<img src="${pageContext.request.contextPath}/resources/images/step.png" alt="" style="float: right;" />
		<br><br><br>	
		<h2>숙소 수정이 가능합니다.</h2>
		<h4>수정을 원하는 항목을 선택 후 숙소를 수정할 수 있습니다.</h4>
		<div class="hoststep">
			<ul>
				<a href="/cnc/update_2housedetailopen.do"><li>인원 및 침실</li></a>
				<a href="/cnc/update_3bathcountopen.do"><li>욕실 및 공용여부</li></a>
				<a href="/cnc/update_4locationopen.do"><li>숙소 위치</li></a>
				<a href="/cnc/update_5defaultoptionopen.do"><li>숙소옵션 및 안전시설</li></a>
				<a href="/cnc/update_6guestcomfortableopen.do"><li>숙소내 편의시설</li></a>
				<a href="/cnc/update_7guesttextareaopen.do"><li>숙소 설명</li></a>
				<a href="/cnc/update_8hosthouseimgopen.do"><li>숙소 사진</li></a>
				<a href="/cnc/update_9hosttitleopen.do"><li>숙소 제목</li></a>
				<a href="/cnc/update_10chargeopen.do"><li>사용요금 및 시간</li></a>
				<a href="/cnc/update_11restrictthemeopen.do"><li>테마 및 주의사항</li></a>
			</ul>
		</div>
		<a href="#" onclick="location.href='/cnc/1newhouse.do'" style="float: right;"><button>< 뒤로가기</button></a>
	</div>

</body>
</html>