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
    
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	<script type="text/javascript" src="../js/hostregister.js"></script>
	<script type="text/javascript">
		function hosthouseimgSubmit() {
			var f = document.hostpic;
			
			
			if(!f.house_photo.value){
				alert('메인 사진은 반드시 선택하셔야합니다.');
				return;
			}
			f.submit();
			
		}
		
		
		function PrevSubmit() {
			var f = document.hostpic;
			f.action = "<c:url value='/6guestcomfortable.do' />";
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
    
    
   
    <form action="/cnc/8hosthouseimg.do" name="hostpic" method="POST" enctype="multipart/form-data">
	<div class="container">
	
    <div class="hostpic1">
    	<img src="${pageContext.request.contextPath}/resources/images/sleep1.jpg" alt="">
        <div class="addregister"><h3 style="padding-top: 35px; font-size: 45px; font-weight: bold;">숙소 사진</h3></div><br>
        
        <h4 style="font-size: 25px; font-weight: bold;">멋진 사진으로 숙소가 돋보이게 해주세요.</h4><br>
        <h4>휴대전화나 카메라를 사용하여 사진을 찍으세요. 숙소를 등록하려면 1장 이상의 사진이 필요합니다. 나중에 언제든 사진을 추가하거나 수정하실 수 있습니다.</h4>
        
        <div id="image_container" style="text-align: center;"></div>
        <div class="filebox">
        	<hr>
			<p>이전 선택한 파일 : ${house.house_photourl }</p>
			<img alt="이전에 선택한 파일이 없습니다." src="display.do?name=${house.house_photourl}" style="color : black; width:200px; height: 200px;" />
			
			<hr>
			<input type="file" name="house_photo" id="house_photo" style="width:180px; height:50px; color:black;" />
        </div>
    </div>
    
	<div class="control" style="padding-bottom: 25px; padding-top: 25px;">
		<a href="#" onclick="PrevSubmit();" style="float: left;"><button>뒤로가기</button></a>
		<a href="#" onclick="hosthouseimgSubmit();" style="float: right;"><button>다음</button></a>
    </div>
    </div>	
	</form>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
</html>