<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="UTF-8">
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chargetext.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	<script type="text/javascript" src="../js/hostregister.js"></script>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function checkSubmit() {
			var f = document.chargetext;
			f.submit();
		}
		
		function PrevSubmit() {
			var f = document.chargetext;
			f.action = "<c:url value='/11restricttheme.do' />";
			f.submit();
		}
	
	</script>
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
    <div class="container" style="text-align: center;">
	<form action="/cnc/13chargetext.do" name="chargetext" accept-charset="utf-8" method="GET">
    
    
    
        <div class="chargetext" style="padding-top: 30px;">
            <label for="chargetext" style="font-size: 45px; font-weight: bold; color: black;">
                	회원님 거주 지역의 법규와 세금
            </label></br>
            <label for="chargetext" style="width: 50%; padding-top: 30px;">
            <hr>
	숙박 약관 제 1 조<br><br>
	1. 호텔의 숙박을 원하는 고객과의 체결하는 숙박계약 및 그것에 관련 하는 계약은 <br>
	본 약관에 정해진것으로 한하며 본 약관에 규정되어 있지 않은 사항에 대해서는 법령
	또는 관습에 의한것으로 합니다.<br><br>
	2. 호텔에서 특별계약을 받는 경우에, 관련 법규에 근거하며 계약을 체결한다. 이때,
	거래조건의 조항을 우선적으로 반영한다.<br><br>
	<hr>
	계약신청서 제 2 조<br><br>
	1. 본 호텔을 이용하기 위해서는 아래의 요구하는 이용자의 정보를 기록하여 신청해야
	한다.:<br>
(1) 숙박고객의 성함;<br>
(2) 숙박고객이 호텔에 도착할 예정날짜;<br>
(3) 숙박요금(제시된 기본요금 사항에 따른다;)<br>
(4) 그밖의 호텔이 적용한 특정사항.<br><br>
2. 숙박 고객의 요청에 따라 객실이용을 연장할 경우 (처음 작성한 날짜를 넘어서 묵을
경우) <br>그 요구를 받아들이는 호텔측에서는 사전의 신청서에 근거하여 새로운 계약을
하게 된다.<br><br>
<hr>
객실계약 체결과 그밖의 사항 . 제 3 조<br><br>
호텔이 위 조항들에 따라 정식으로 조건을 받아들이면 계약 체결을 승낙한다. <br>그러나
호텔의 규정요건에 맞지 않을 경우 호텔은 숙박을 거절 할수 있다.<br><br>
2.조항규정에 따라 계약이 체결되었을 경우 호텔에서 제시한 특정 기일까지(만일 3 일
동안 묵는다면, 3 일 초과 일까지) <br>고객은 예치금(선불금)을 지불한다.<br><br>
3. 예치금은 우선적으로 숙식요금비용에 쓰이며, 그 다음으로 제 6 조항및 제 18 조에
따라 위약금 배상금으로 쓰이며<br> 만일 잔액이 있는 경우 제 12 조항 요금을 참고하여
요금 결제시 환불 한다.<br><br>
4. 선택된 날짜에 예치금이 미납되었을 경우나, 호텔측에 사전에 어떠한 통보도 없이
늦춰진 경우에는<br> 예약이 무효화 된다.
(숙박요금을 손님에게 알린경우에 한함) <br><br>
<hr>
            </label>
        </div>
        
		<div class="control" style="padding-bottom: 25px; padding-top: 25px;">
			<a href="#" onclick="PrevSubmit();" style="float: left;"><button>< 뒤로가기</button></a>
			<a href="#" onclick="checkSubmit();" style="float: right;"><button>다음</button></a>
		</div>
	
    
	</form>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
</html>