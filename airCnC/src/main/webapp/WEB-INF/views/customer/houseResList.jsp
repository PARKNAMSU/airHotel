<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/menu.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<meta charset="UTF-8">
<style type="text/css">
	div{
		
	}
</style>
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
                                <h3>Reservation</h3><br>
                                <h3>Member List</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>

    </div>
	<div style="clear: both;"></div>
	<div style="width:80%;margin-left:10%;font-family: 'Jua', sans-serif;color:black;">
		<div style="margin-left:30%;font-size:40px;margin-top:10%;"><h1>예약자 리스트(이름 클릭시 해당유저와 대화)</h1></div>
		<div style="margin-top: 10%;margin-left:0%;">
			<c:forEach items="${resList }" var="item">
			<div style="margin-bottom:5%;float:left;font-size:20px;margin-left:5%;">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/human.png" style="width:64px;height:64px;"> <a onclick="openChat('${item.reservation_customer_id}')">${item.customer_name }(${item.reservation_customer_id})</a><br><br>
				<b>전화번호: ${item.customer_phone }</b>&nbsp;&nbsp;<b>이메일: </b><a href="mailto:${item.customer_email}" style="display:initial;">${item.customer_email }</a><br><br>
				<b>예약날짜: ${item.reservation_regdate }</b><br><br>
				<b>체크인 시간:${item.reservation_check_in }</b>&nbsp;&nbsp;<b>체크아웃 시간:${item.reservation_check_out }</b>
				<hr>		
			</div>
			</c:forEach>
		</div>
		<div style="clear: both;"></div>
	</div>
	<div style="width:80%;margin-left:13.4%;font-family: 'Jua', sans-serif;margin-top:5%;margin-bottom:10%;">
		<button onclick="reservationDetail(${house_seq})" class="btn btn-outline-danger" style="font-size:30px;">뒤로가기</button>&nbsp;&nbsp;
		<button class="btn btn-outline-danger" style="font-size:30px;" onclick="myHouseList()">숙소리스트</button>&nbsp;&nbsp;
		<button class="btn btn-outline-danger" style="font-size:30px;" onclick="ResListBefore(${house_seq})">이전 예약명단</button>
	</div>
	<footer>
		<%@include file="../html/footer.jsp" %>
	</footer>
</body>
<script type="text/javascript">
var openChat = function(id){
	url = 'message.do?message_to_id='+id;
	var openWin = window.open(url,"rankpopup","width=750, height=900, resizable = no, scrollbars = no");
}
var reservationDetail = function(house_seq){
	var form = document.createElement("form");
	var input = new Array()
	var names = ["house_seq","accessType"]
	var values = [house_seq,"host"]
    form.action = "reservationHouse.do";
    form.method = "post";
    
    for (var i = 0; i < 2; i++) {
    	input[i] = document.createElement("input");
        input[i].setAttribute("type", "hidden");
        input[i].setAttribute('name', names[i]);
        input[i].setAttribute("value", values[i]);
        form.appendChild(input[i]);
    }
    document.body.appendChild(form);
    form.submit();
}
var myHouseList = function(){
	location.href = "myHouse.do";
}
var ResListBefore = function(house_seq){
	var form = document.createElement("form");
	var input = new Array()
	var names = ["house_seq"]
	var values = [house_seq]
	 window.open("" ,"beforeForm",
     "toolbar=no, width=540, height=800, directories=no, status=no,scrollorbars=no, resizable=no");
    form.action = "myHouseBeforeResList.do";
    form.method = "post";
    form.target = "beforeForm"
    
    for (var i = 0; i < 2; i++) {
    	input[i] = document.createElement("input");
        input[i].setAttribute("type", "hidden");
        input[i].setAttribute('name', names[i]);
        input[i].setAttribute("value", values[i]);
        form.appendChild(input[i]);
    }
    document.body.appendChild(form);
    form.submit();
}
</script>
</html>