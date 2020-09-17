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
    
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/comfortable.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	
	<script type="text/javascript">
		function guestcomfortableSubmit() {
			var f = document.checkbox2;
			f.submit();
		}
		
		
		function PrevSubmit() {
			var f = document.checkbox2;
			f.action = "<c:url value='/4location.do' />";
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
    
    <c:url value="/6guestcomfortable.do" var="actionUrl" />
	<form:form id="6guestcomfortable" name="checkbox2" modelAttribute="house" method="GET" action="${actionUrl}">
	
	
	<div class="container">
      <div class="form">
        <img src="${pageContext.request.contextPath}/resources/images/guestfacilities1.png" style="margin-top: 35px;">
        <div class="guestcomfor1" ><h3 style="font-size: 50px; font-weight: bold; padding-top: 35px;">게스트가 어떤 공간을 쓸수 있나요?</h3>
            <form:checkbox id="cb1" path="house_default_livingroom_type_0or1" value="true"/>
        	<label for="guestcomfor1"style="font-size: 30px; font-weight: bold;   padding-top: 15px;">단독 사용하는 거실</label>
    	</div>
    	
	    <div class="guestcomfor2">
	    	<form:checkbox id="cb2" path="house_default_kitchen_0or1" value="true"/>
	        <label for="guestcomfor2" style="font-size: 30px; font-weight: bold;   padding-top: 15px;">주방</label></br>
	    </div>
	    
	    <div class="guestcomfor3">
	        <form:checkbox id="cb3" path="house_default_laundry_washer_0or1" value="true"/>
	        <label for="guestcomfor3" style="font-size: 30px; font-weight: bold;   padding-top: 15px;">세탁공간-세탁기</label></br>
	    </div>
	    
	    <div class="guestcomfor4">
	        <form:checkbox id="cb4" path="house_default_laundry_dryer_0or1" value="true"/>
	        <label for="guestcomfor4" style="font-size: 30px; font-weight: bold;   padding-top: 15px;">세탁공간-건조기</label></br>
	    </div>
	    
	    <div class="guestcomfor5">
	        <form:checkbox id="cb5" path="house_default_parking_0or1" value="true"/>
	        <label for="guestcomfor5" style="font-size: 30px; font-weight: bold;   padding-top: 15px;">주차</label></br>
	    </div>
	    
	    <div class="guestcomfor6">
	        <form:checkbox id="cb6" path="house_default_gym_0or1" value="true" />
	        <label for="guestcomfor6" style="font-size: 30px; font-weight: bold;   padding-top: 15px;">헬스장</label></br>
	    </div>
	    
	    <div class="guestcomfor7">
	        <form:checkbox id="cb7" path="house_default_pool_0or1" value="true" />
	        <label for="guestcomfor7" style="font-size: 30px; font-weight: bold;   padding-top: 15px;">수영장</label></br>
	    </div>
	    
        <div class="locationbutton">
          <a href="#" onclick="PrevSubmit();" style="float: left;"><button>< 뒤로가기</button></a>
          <a href="#" onclick="defaultoptionSubmit();" style="float: right;"><button>다음</button></a>
        </div>
      </div>
    </div>
	
	
	</form:form>

</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
<script>
    function fnCalCount(type, ths) {
      var $input = $(ths).parents("td").find("input[name='pop_out']");
      var tCount = Number($input.val());
      var tEqCount = Number($(ths).parents("tr").find("td.bseq_ea").html());

      if (type == "p") {
        if (tCount < tEqCount) $input.val(Number(tCount) + 1);
      } else {
        if (tCount > 0) $input.val(Number(tCount) - 1);
      }
    }
</script>
</html>