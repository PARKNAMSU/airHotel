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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN2.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" 
    />
    
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/guesttextarea.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	<script type="text/javascript" src="../js/hostregister.js"></script>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function guesttextareaSubmit() {
			var f = document.guesttext;
			if(f.house_desc1.value == "") {
				alert("'게스트에게 설명'을 입력해주세요.");
				return;
			}
			if(f.house_desc2.value == "") {
				alert("'숙소'를 입력해주세요.");
				return;
			}
			if(f.house_desc3.value == "") {
				alert("'게스트와의 교류'를 입력해주세요.");
				return;
			}
			if(f.house_desc4.value == "") {
				alert("'숙소가 위치한 지역'을 입력해주세요.");
				return;
			}
			if(f.house_desc5.value == "") {
				alert("'교통편'를 입력해주세요.");
				return;
			}
			f.submit();
		}
		
		
		function PrevSubmit() {
			var f = document.guesttext;
			f.action = "<c:url value='/5defaultoption.do' />";
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
    
    <div class="container">
    <div class="form">
    <c:url value="/7guesttextarea.do" var="actionUrl" />
	<form:form id="7guesttextarea" name="guesttext" modelAttribute="house" method="GET" action="${actionUrl}">
	
    	
    	<div class="guesttextarea">
        <img src="${pageContext.request.contextPath}/resources/images/welcome.png" alt="">
        <div class="guesttextarea"><h3 style="padding-top: 35px; font-size: 45px;">게스트에게 설명</h3></div></br>
        	<h4 style="font-size: 25px;">게스트에게 숙소에 대해 설명해주세요.</h4></br>
        	<h4>숙소의 장점, 특별한 편의시설(예: 빠른 와이파이 또는 주차 시설)과 주변 지역의 매력을 소개해주세요.</h4>
            <form:textarea name="guest" path="house_desc1" rows="10" cols="75" placeholder="500자 이내로 작성하세요." maxlength="500"/>
        
        <div class="guesttextarea"><h3 style="padding-top: 35px; font-size: 45px;">숙소</h3></div></br>
            <h4 style="font-size: 25px;">게스트에게 숙소에 대해 설명해주세요.</h4></br>
            <h4>숙소의 모습과 느낌을 설명해주세요. 독서를 즐길 수 있는 아늑한 모퉁이나 야외 좌석 등 특별한 디자인 요소나 공간이 있다면, 이에 대해 알려주세요.</h4>
            <form:textarea name="guest1" path="house_desc2" rows="10" cols="75" placeholder="500자 이내로 작성하세요." maxlength="500"/>   
                
        <div class="guesttextarea"><h3 style="padding-top: 35px; font-size: 45px;">게스트와의 교류</h3></div></br>
            <h4 style="font-size: 25px;">게스트에게 숙소에 대해 설명해주세요.</h4></br>
            <h4>게스트가 숙박하는 동안 얼마나 많은 교류를 할 수 있는지 알려주세요. 신변 안전을 위해 예약이 확정될 때까지 전화번호나 이메일을 알려주지 마세요.</h4>
            <form:textarea name="guest2" path="house_desc3" rows="10" cols="75" placeholder="500자 이내로 작성하세요." maxlength="500"/>
                    
        <div class="guesttextarea"><h3 style="padding-top: 35px; font-size: 45px;">숙소가 위치한 지역</h3></div></br>
            <h4 style="font-size: 25px;">게스트에게 숙소에 대해 설명해주세요.</h4></br>
            <h4>숙소가 위치한 지역에 대해 알려주세요. 분위기, 주변의 카페, 독특한 명소와 도보 거리에 있는 생활편의시설 등 동네를 특별하게 만드는 장소를 소개해주세요.</h4>
            <form:textarea name="guest3" path="house_desc4" rows="10" cols="75" placeholder="500자 이내로 작성하세요." maxlength="500"/>
                        
        <div class="guesttextarea"><h3 style="padding-top: 35px; font-size: 45px;">교통편</h3></div></br>
            <h4 style="font-size: 25px;">게스트에게 숙소에 대해 설명해주세요.</h4></br>
            <h4>근처의 대중교통 수단, 운전 정보, 편리한 도보 경로 등 도시와 동네를 돌아다니는 방법을 알려주세요.</h4>
            <form:textarea name="guesttextarea" path="house_desc5" rows="10" cols="75" placeholder="500자 이내로 작성하세요." maxlength="500"/>
		</div>
              
      	
      	</form:form>	
      	
      	<div class="control" style="padding-bottom: 25px; padding-top: 25px;">
        	<a href="#" onclick="PrevSubmit();" style="float: left;"><button>< 뒤로가기</button></a>
          	<a href="#" onclick="guesttextareaSubmit();" style="float: right;"><button>다음</button></a>
      	</div>
    	</div>
    </div>
	
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
</html>