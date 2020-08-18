<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/menu.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="font-family: 'Jua',sans-serif;" >
	<c:if test="${login_session == null }">
		<script type="text/javascript">location.href ='loginView.do'</script>
	</c:if>
	<header class="menudiv1">
		<div class="menudiv2-1">
			<a href="/cnc/indexView.do"><img alt=""
				src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1" style="float:left;">
				<ul id="menuItems">	
						<li class="item"><p><a href="/cnc/indexView.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;">메인페이지</a></p></li>
						<li class="item">
							<p>
								<a href="/cnc/selectBoardList.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >공지사항</a>
							</p>
						</li>
						<li class="item"><p><a href="myHouse.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >호스트</a></p></li>
				</ul>
			</div>
			<div style="width:50px;height:50px;margin-left:35px;margin-top:12px;border-radius: 30px 30px 30px 30px;float:left;background-color:white;overflow:hidden;" id="myinfo">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/my1.jpg" style="max-width:120%;max-height:120%;">
			</div>
		</div>
		<div id="mydiv" style="display:none;margin-left:88%;z-index:100;width:200px;background-color:#d2d2d2;font-size:20px;border-radius: 15px 15px 15px 15px;font-family: 'Jua', sans-serif;" >
					<ul>
						<li><br></li>
						<li style="margin-bottom:20px;"><a href="">내정보</a></li>
						<li style="margin-bottom:20px;"><a href="reservationPage.do">예약한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="myFavoriteHouse.do">저장한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="">쿠폰함</a></li>
						<li style="margin-bottom:20px;"><a href="chat.do">메세지</a></li>
						<li style="margin-bottom:20px;"><a href="logout.do">로그아웃</a></li>
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
	<div style="clear:both;"></div>
	 <!-- slider_area_start -->
    <div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider  d-flex align-items-center slider_bg_2">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3>My Reservation</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="clear:both;"></div>
    <div style="width:60%;margin-left:20%;margin-top:10%;margin-bottom:10%;">
    	<p>메세지 > 후기/추천 보기</p>
    	<h1>후기/추천 보기</h1><br><br>
    	<div style="font-size:20px;">
    		<b id="forme" onclick="getCommentsForMe()">나에 대한 후기</b>&nbsp;&nbsp;&nbsp;&nbsp;<b id="my" onclick="getMyComments()">내가 작성한 후기</b>
    	</div>
    	<hr><br>
    	<div id="commentsMain">
    		<div id="commentsHead" style="font-size:30px;border:1px solid; background-color:gray;padding:2%;">
    			<b>지난후기</b>
    		</div>
    		<div id="commentsBody" style="border:1px solid;"></div>
    	</div><br>
    	<button onclick="location.href='chat.do'" class="btn btn-outline-danger" style="font-size:40px;">메세지</button>
    </div>
</body>
<script type="text/javascript">
	var getData;
	$(function(){
		$.ajax({
			type:"POST",
			url:"getCommentsForMe.do",
			dataType:"json",
			success:function(data){
				alert(data);
				getData = data;
				for(var i=0;i<getData.length;i++){
					var html = "<div style='width:20%;float:left;padding:5%;'><b style='font-size:30px;'>"+getData[i].comments_id+"</b><br><br><b style='font-size:15px;'>"+getData[i].comments_regdate+"</b></div>";
					html += "<div style='width:69%;float:left;padding:5%;'><b style='font-size:30px;'>"+getData[i].comments_content+"</b></div><div style='clear: both;'></div><br><hr>";
					$("#commentsBody").append(html);
				}
			}
		})
	})
	
	var getMyComments = function(){
		$.ajax({
			type:"POST",
			url:"getMyComments.do",
			dataType:"json",
			success:function(data){
				$("#commentsBody").empty();
				getData = data;
				for(var i=0;i<getData.length;i++){
					var html = "<div style='width:20%;float:left;padding:5%;'><b style='font-size:30px;'>"+getData[i].comments_id+"</b><br><br><b style='font-size:15px;'>"+getData[i].comments_regdate+"</b></div>";
					html += "<div style='width:69%;float:left;padding:5%;'><b style='font-size:30px;'>"+getData[i].house_name+"에 대한 후기</b><br><br><br><b style='font-size:30px;color:gray;'>"+getData[i].comments_content+"</b></div><div style='clear: both;'></div><br><hr>";
					$("#commentsBody").append(html);
				}
			}
		})
	}
	var getCommentsForMe = function(){
		$.ajax({
			type:"POST",
			url:"getCommentsForMe.do",
			dataType:"json",
			success:function(data){
				$("#commentsBody").empty();
				getData = data;
				for(var i=0;i<getData.length;i++){
					var html = "<div style='width:20%;float:left;padding:5%;'><b style='font-size:30px;'>"+getData[i].comments_id+"</b><br><br><b style='font-size:15px;'>"+getData[i].comments_regdate+"</b></div>";
					html += "<div style='width:69%;float:left;padding:5%;'><b style='font-size:30px;'>"+getData[i].comments_content+"</b></div><div style='clear: both;'></div><br><hr>";
					$("#commentsBody").append(html);
				}
			}
		})
	}
</script>
</html>