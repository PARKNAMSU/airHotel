<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/myreservation.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myreservation.css?version=123">
<!-- Latest compiled JavaScript -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<head>
	<%@ include file="../html/menu.jsp" %>
	</head>
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
    <!-- slider_area_end -->
	<div style="clear:both;"></div>
	<%@include file="../html/sideMenu.jsp" %>

	<div class="maindiv" id="main">
		<h1 style="margin-bottom:5%;margin-left:25%;font-size:40px;color:red;"><a id="after" onclick="getRes()">예약 내역</a> | <a onclick="getResBefore()" id="before">이전 예약</a></h1>
		<div style="width:50px;height:50px;float:left;margin-top:9%;">
		<img alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/tri.png" class="tri" id="tri1">
		</div>
		<div class="subdiv" id="imgdiv1" onclick="">
			<div class="imgdiv" >
				<img alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/house1.png" id="img1" class="imgs">
			</div>
			<div class="textdiv" id="td1"></div>
		</div>
		<div class="subdiv" id="imgdiv2" onclick="">
			<div class="imgdiv" >
				<img alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/house1.png" id="img2" class="imgs">
			</div>
			<div class="textdiv" id="td2"></div>
		</div>
		<div class="subdiv" id="imgdiv3" onclick="">
			<div class="imgdiv" >
				<img alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/house1.png" id="img3" class="imgs">
			</div>
			<div class="textdiv" id="td3"></div>
		</div>
		<img alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/tri2.png" class="tri" style="margin-left: 2%;" id="tri2">
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
							$("#imgdiv"+i).attr("onclick","location.href='reservationHouse.do?house_seq="+getData[i-1].house_seq+"&reservation_seq="+getData[i-1].reservation_seq+"&accessType="+type+"'")
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
					$("#imgdiv"+b).attr("onclick","location.href='reservationHouse.do?house_seq="+getData[i].house_seq+"&reservation_seq="+getData[i].reservation_seq+"&accessType="+type+"'")
					//$("img"+b).attr("src","") 나중에 추가
					$("#td"+b).html('<p>'+getData[i].house_name+'</p>')
					console.log(i)
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
				$("#imgdiv"+i).attr("onclick","location.href='reservationHouse.do?house_seq="+getData[a].house_seq+"&reservation_seq="+getData[a].reservation_seq+"&accessType="+type+"'")
				//$("img"+b).attr("src","") 나중에 추가
				$("#td"+i).html('<p>'+getData[a].house_name+'</p>')
				a++;
			}
			if(area == 1){
				$("#tri1").css("display","none")
			}
		})
	})
	var getRes = function(){
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
							$("#imgdiv"+i).attr("onclick","location.href='reservationHouse.do?house_seq="+getData[i-1].house_seq+"&reservation_seq="+getData[i-1].reservation_seq+"&accessType="+type+"'")
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
		
		var getResBefore = function(){
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
								$("#imgdiv"+i).attr("onclick","location.href='reservationHouse.do?house_seq="+getData[i-1].house_seq+"&reservation_seq="+getData[i-1].reservation_seq+"&accessType="+type+"'")
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

</script>
</html>