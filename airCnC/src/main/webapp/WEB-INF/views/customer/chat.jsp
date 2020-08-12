<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sideMenu.css?version=123">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/menu.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chat.css?version=123">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<style type="text/css">
body {
  font-family: "Jua", sans-serif;
}
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> 
<title>Insert title here</title>
</head>
<body>
	<c:if test="${login_session == null }">
		<script type="text/javascript">location.href ='loginView.do'</script>
	</c:if>
	<header class="menudiv1">
		<div class="menudiv2-1">
			<a href="/cnc/indexView.do"><img alt=""
				src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1">
				<ul id="menuItems">	
						<li class="item">
							<p>
								<a href="/cnc/selectBoardList.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >공지사항</a>
							</p>
						</li>
						<li class="item"><p><a href="myHouse.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >호스트</a></p></li>
						<li class="item">
								<p><a href="/cnc/logout.do" style="color:white;font-family: 'Jua', sans-serif;font-size:20px;" >로그아웃</a></p>
						</li>
				</ul>
			</div>
		</div>
	</header>

	 <!-- slider_area_start -->
    <div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider  d-flex align-items-center slider_bg_2">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3>Chatting</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>

    </div>
    <!-- slider_area_end -->
	<div style="clear:both;"></div>
	
	<div id="sidediv">
		<ul id="sidemenu">
			<li class="menu"><span id="topmenu" style="font-family: 'Jua', sans-serif;">내정보 관리</span></li>
			<li class="menu"><a href="reservationPage.do" style="font-family: 'Jua', sans-serif;" >예약내역</a></li>
			<li class="menu"><a href="myFavoriteHouse.do" style="font-family: 'Jua', sans-serif;">저장한 숙소</a></li>
			<li class="menu"><a href="" style="font-family: 'Jua', sans-serif;">내 쿠폰함</a></li>
			<li class="menu"><a href="chat.do" style="font-family: 'Jua', sans-serif;">메세지</a></li>		
			<li class="menu"><a href="#" style="font-family: 'Jua', sans-serif;">회원탈퇴</a></li>
		</ul>
	</div>
	
	<div class="headdiv">
		<h1 style="font-size:40px;margin-left:3%;font-family: 'Jua', sans-serif;">나의 채팅</h1>
	</div>
	<div class="chatdiv">
		<div id="chatbox">
			<div id="chatelement" onclick="openChat('message.do?message_to_id=admin')" >
				<div  id="imgdiv" >
					<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/human.png" style="width:64px;height:64px;"><!-- db에서 받아온 이미지 -->
				</div>
				<div id="namediv" >
					<p style="font-family: 'Jua', sans-serif;">admin</p><!-- db에서 받아온 이름 -->
					<br>
					<p style="color:gray;font-family: 'Jua', sans-serif;"></p><!-- db에서 받아온 최신 메세지 날짜 -->
				</div>
				<div id="textdiv">
					<p style="font-family: 'Jua', sans-serif;">관리자 알람 확인</p><!-- db에서받아온 최신 메세지 -->
				</div>
			</div>
			<hr>
			<c:forEach items="${messageList }" var="list">
			<div id="chatelement" onclick="openChat('message.do?message_to_id=${list.message_to_id}')">
				<div  id="imgdiv" >
					<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/human.png" style="width:64px;height:64px;"><!-- db에서 받아온 이미지 -->
				</div>
				<div id="namediv">
					<p style="font-family: 'Jua', sans-serif;">${list.message_to_name}</p><!-- db에서 받아온 이름 -->
					<br>
					<p style="color:gray;font-family: 'Jua', sans-serif;">${list.message_regdate}</p><!-- db에서 받아온 최신 메세지 날짜 -->
				</div>
				<div id="textdiv">
					<p style="font-family: 'Jua', sans-serif;">상대방과 대화하기</p><!-- db에서받아온 최신 메세지 -->
				</div>
			</div>
			<hr>
			</c:forEach>
		</div>
	</div>
<div style="clear:both;"></div>

<footer>
<%@include file="../html/footer.jsp" %>
</footer>
<script type="text/javascript">
	function openChat(url){
		var openWin = window.open(url,"rankpopup","width=750, height=900, resizable = no, scrollbars = no");
	}
</script>
</body>
</html>