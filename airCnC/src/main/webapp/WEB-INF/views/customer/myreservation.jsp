<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/myreservation.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/menu.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myreservation.css?version=126">
<!-- Latest compiled JavaScript -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="font-family: 'Jua', sans-serif;">
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
		<div id="mydiv" style="display:none;margin-left:84%;z-index:100;width:200px;background-color:#d2d2d2;font-size:20px;border-radius: 15px 15px 15px 15px;font-family: 'Jua', sans-serif;" >
					<ul>
						<li><br></li>
						<li style="margin-bottom:20px;"><a href="mypage.do">내정보</a></li>
						<li style="margin-bottom:20px;"><a href="passwordChangeView.do">비밀번호 변경</a></li>
						<li style="margin-bottom:20px;"><a href="reservationPage.do">예약한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="myFavoriteHouse.do">저장한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="getCuponList.do">쿠폰함</a></li>
						<li style="margin-bottom:20px;"><a href="chat.do">메세지</a></li>
					<c:choose>
						<c:when test="${social_type ne null}">
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
	<div style="clear:both;"></div>

    <!-- slider_area_end -->
	<div style="clear:both;"></div>
	<%@include file="../html/sideMenu.jsp" %>
	<div class="maindiv" id="main" style="width:70%;">
		<div style="margin-bottom:5%;margin-left:55%;">
			<span style="font-size:30px;color:black;">예약하신 숙소가 없으십니까?</span><br><br><button class="btn btn-outline-danger" style="font-size:30px;" onclick="location.href='http://localhost:8080/cnc/themesearchhighscore.do'">숙소 예약하러 가기</button>
		</div>
		<h1 style="margin-bottom:5%;margin-left:25%;font-size:40px;color:red;"><a id="after" onclick="getRes()" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">예약 내역</a> | <a onclick="getResBefore()" id="before" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">이전 예약</a></h1>
		<div style="width:50px;height:50px;float:left;margin-top:9%;">
		<img alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/tri.png" class="tri" id="tri1" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">
		</div>
		<div class="subdiv" id="imgdiv1" onclick="" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">
			<div class="imgdiv" >
				<img alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/house1.png" id="img1" class="imgs">
			</div>
			<div class="textdiv" id="td1"></div>
		</div>
		<div class="subdiv" id="imgdiv2" onclick="" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">
			<div class="imgdiv" >
				<img alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/house1.png" id="img2" class="imgs">
			</div>
			<div class="textdiv" id="td2"></div>
		</div>
		<div class="subdiv" id="imgdiv3" onclick="" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">
			<div class="imgdiv" >
				<img alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/house1.png" id="img3" class="imgs">
			</div>
			<div class="textdiv" id="td3"></div>
		</div>
		<img onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)" alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/tri2.png" class="tri" style="margin-left: 2%;" id="tri2">
	</div>
	
	<div style="clear:both;"></div>
	<footer>
		<%@ include file="../html/footer.jsp" %>
	</footer>
</body>

<script type="text/javascript">
	var getData = [];
	var area = 1;
	var instanceNum = 3;
	var type = "nowres";
	window.onload = function(){	
	     $.ajax({
	           type:"GET",
	           url:"myReservation.mdo",
	           dataType:"json",	   
	           success : function(data) {
					getData = data;
					for(var i=1;i<=instanceNum;i++){
						if(getData[i-1] != null){
							$("#imgdiv"+i).attr("onclick","goToResHouseNow("+(getData[i-1].house_seq)+","+(getData[i-1].reservation_seq)+",'"+type+"',"+getData[i-1].reservation_status+")")
							//$("img"+i).attr("src","") 나중에 추가
							$("#td"+i).html('<p>'+getData[i-1].house_name+'</p><br><hr><p>'+getData[i-1].reservation_status_text+'</p>')
						}else{
							$("#imgdiv"+i).css("display","none")
						}
					}
					if(getData.length <= instanceNum){
						$("#tri2").css('display','none');
					}
	           },
	           error : function(request, status, error) {
	        	   alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
	           }
	     });
	}
	if(area == 1){
		$("#tri1").css('display','none');
	}

	$(function(){
		$("#tri2").click(function(){
			area +=1;
			if(area > 1 ){
				$("#tri1").css('display','initial');
			}
			var a = (area-1)*instanceNum;
			var b = 1;
			for(var i=a;i<a+instanceNum;i++){
				if(getData[i] != null){
					
					//$("img"+b).attr("src","") 나중에 추가
					if(type = "nowres"){
						$("#imgdiv"+i).attr("onclick","goToResHouseNow("+(getData[i].house_seq)+","+(getData[i].reservation_seq)+",'"+type+"',"+getData[i].reservation_status+")")
						$("#td"+i).html('<p>'+getData[i].house_name+'</p><br><hr><p>'+getData[i].reservation_status_text+'</p>')
					}else{
						$("#imgdiv"+b).attr("onclick","goToResHouse("+getData[i].house_seq+","+getData[i].reservation_seq+",'"+type+"')")
						$("#td"+i).html('<p>'+getData[i].house_name+'</p>')
					}
				}else{
					$("#imgdiv"+b).css("display","none");
				}
				b++;
			}
			if(a+instanceNum >= getData.length){
				$("#tri2").css("display","none")
			}
			
		}),
		$("#tri1").click(function(){
			area -= 1;
			$("#tri2").css("display","initial");
			var a = (area-1)*instanceNum;
			var b = 1;
			for(var i=1; i<=3;i++){
				$("#imgdiv"+i).css("display","initial");
				
				//$("img"+b).attr("src","") 나중에 추가
				if(type == "nowres"){
					$("#imgdiv"+i).attr("onclick","goToResHouseNow("+(getData[a].house_seq)+","+(getData[a].reservation_seq)+",'"+type+"',"+getData[a].reservation_status+")")
					$("#td"+i).html('<p>'+getData[a].house_name+'</p><br><hr><p>'+getData[a].reservation_status_text+'</p>')
				}else{
					$("#imgdiv"+i).attr("onclick","goToResHouse("+getData[a].house_seq+","+getData[a].reservation_seq+",'"+type+"')")
					$("#td"+i).html('<p>'+getData[a].house_name+'</p>')
				}
				a++;
			}
			if(area == 1){
				$("#tri1").css("display","none")
			}
		})
	})
	var getRes = function(){
		$("#tri1").css('display','none');
		area = 1;
		type = "nowres";
		for(var i=1; i<=3;i++){
			$("#imgdiv"+i).css("display","initial");
		}
	     $.ajax({
	           type:"GET",
	           url:"myReservation.mdo",
	           dataType:"json",	   
	           success : function(data) {
	        	  
					getData = data;
					if(getData.length > instanceNum){
						$("#tri2").css('display','initial');
					}
					for(var i=1;i<=instanceNum;i++){
						if(getData[i-1] != null){
							$("#imgdiv"+i).attr("onclick","goToResHouseNow("+(getData[i-1].house_seq)+","+(getData[i-1].reservation_seq)+",'"+type+"',"+getData[i-1].reservation_status+")")
									//$("img"+i).attr("src","") 나중에 추가
							$("#td"+i).html('<p>'+getData[i-1].house_name+'</p><br><hr><p>'+getData[i-1].reservation_status_text+'</p>')
							
						}else{
							$("#imgdiv"+i).css("display","none")
						}
					}
					if(getData.length <= instanceNum){
						$("#tri2").css('display','none');
					}
	           },
	           error : function(request, status, error) {
	        	   alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
	           }
	     });
	}
		
		var getResBefore = function(){
			$("#tri1").css('display','none');
			area = 1;
			type = "beforeres";
			for(var i=1; i<= 3;i++){
				$("#imgdiv"+i).css("display","initial");
			}
		     $.ajax({
		           type:"GET",
		           url:"myReservationBefore.mdo",
		           dataType:"json",	   
		           success : function(data) {
						getData = data;
						if(getData.length > instanceNum){
							$("#tri2").css('display','initial');
						}
						for(var i=1;i<=instanceNum;i++){
							if(getData[i-1] != null){
								$("#imgdiv"+i).attr("onclick","goToResHouse("+getData[i-1].house_seq+","+getData[i-1].reservation_seq+",'"+type+"')")
								//$("img"+i).attr("src","") 나중에 추가
								$("#td"+i).html('<p>'+getData[i-1].house_name+'</p>')
							}else{
								$("#imgdiv"+i).css("display","none")
							}
							
						}
						if(getData.length <= instanceNum){
							$("#tri2").css('display','none');
						}
		           },
		           error : function(request, status, error) {
		        	   alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
		           }
		     });
		}
		function goToResHouse(house_seq,reservation_seq,accessType){
			var form = document.createElement("form");
			var input = new Array()
			var names = ["house_seq","reservation_seq","accessType"]
			var values = [house_seq,reservation_seq,accessType]
	        form.action = "reservationHouse.do";
	        form.method = "post";
	        
	        for (var i = 0; i < 3; i++) {
	        	            
	        	input[i] = document.createElement("input");
	            input[i].setAttribute("type", "hidden");
	            input[i].setAttribute('name', names[i]);
	            input[i].setAttribute("value", values[i]);
	            form.appendChild(input[i]);
	        }
	        document.body.appendChild(form);
	        form.submit();
		}
		function goToResHouseNow(house_seq,reservation_seq,accessType,reservation_status){
			var form = document.createElement("form");
			var input = new Array()
			var names = ["house_seq","reservation_seq","accessType"]
			var values = [house_seq,reservation_seq,accessType]
	        form.action = "reservationHouse.do";
	        form.method = "post";   
	        for (var i = 0; i < 3; i++) {
	        	            
	        	input[i] = document.createElement("input");
	            input[i].setAttribute("type", "hidden");
	            input[i].setAttribute('name', names[i]);
	            input[i].setAttribute("value", values[i]);
	            form.appendChild(input[i]);
	        }
	        document.body.appendChild(form);
			if(reservation_status == 1){
				var result = confirm("현재 예약취소 대기중인 숙소입니다.\n예약취소를 취하하시겠습니까?")
				if(result){
					form.action = "rollbackReservationCancel.do"
					form.submit();
				}
			}
			if(reservation_status ==0){
				form.action = "reservationHouse.do";
		        form.submit();
			}
		}

</script>
</html>