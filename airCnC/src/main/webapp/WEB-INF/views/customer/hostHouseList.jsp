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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myreservation.css?version=124">
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
			<div class="menudiv3-1" id="div1" >
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
	<div style="clear:both;"></div>
	 <!-- slider_area_start -->
    <div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider  d-flex align-items-center slider_bg_2">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3>My House</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>

    </div>
    <!-- slider_area_end -->
	<div style="clear:both;"></div>
	
	<div class="maindiv" id="main" style="margin-left:20%;margin-top:2%;font-family: 'Jua', sans-serif;">
		<div >
			<button class="btn btn-outline-danger" style="font-size:20px;margin-left:60%;" onclick="hostSales()">매출 통계보기</button>&nbsp;&nbsp;
			<button class="btn btn-outline-danger" style="font-size:20px;" onclick="hostSales()">숙소 등록하기</button>
		</div>
		<h1 style="margin-top:5%;margin-bottom:5%;margin-left:35%;font-size:40px;color:red;">내 숙소 목록</h1>
		<div style="width:50px;height:50px;float:left;margin-top:9%;">
		<img alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/tri.png" class="tri" id="tri1">
		</div>
		<div class="subdiv" id="imgdiv1" onclick="" >
			<div class="imgdiv" >
				<img alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/house1.png" id="img1" class="imgs">
			</div>
			<div class="textdiv" id="td1"></div>
		</div>
		<div class="subdiv" id="imgdiv2" onclick="" >
			<div class="imgdiv" >
				<img  alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/house1.png" id="img2" class="imgs">
			</div>
			<div class="textdiv" id="td2" ></div>
		</div>
		<div class="subdiv" id="imgdiv3" onclick="">
			<div class="imgdiv" >
				<img " alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/house1.png" id="img3" class="imgs">
			</div>
			<div class="textdiv" id="td3" ></div>
		</div>
		<img alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/tri2.png" class="tri" style="margin-left: 2%;" id="tri2">
	</div>
	<div style="display:none;font-family: 'Jua', sans-serif;border:solid;" id="noneDiv" >
		<div style="width:50%;font-size:50px;margin-top:10%;margin-bottom:10%;margin-left:42%;" >			
			<h1 style="font-family:'Jua', sans-serif;">숙소를 등록해주세요</h1><br><br>
			<button class="btn btn-outline-danger" style="font-size:20px;font-family:'Jua', sans-serif;" onclick="hostSales()">숙소 등록하러 가기</button>
		</div>
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
	var type = "host";
	window.onload = function(){	
	     $.ajax({
	           type:"GET",
	           url:"myHouseList.do",
	           dataType:"json",	   
	           success : function(data) {
					getData = data;
					if(getData.length >0){
						for(var i=1;i<=instanceNum;i++){
							if(getData[i-1] != null){
								$("#imgdiv"+i).attr("onclick","goToResHouse("+(getData[i-1].house_seq)+","+(getData[i-1].house_status)+",'"+type+"')")
								//$("img"+i).attr("src","") 나중에 추가
								$("#td"+i).html('<p style="font-size:30px;color:black;">'+getData[i-1].house_name+'</p><br><hr><p>숙소상태: '+getData[i-1].house_status_text+'</p>')
							}else{
								$("#imgdiv"+i).css("display","none")
							}
						}
						if(getData.length <= instanceNum){
							$("#tri2").css('display','none');
						}
					}else{
						$("#main").css('display','none');
						$("#noneDiv").css('display','initial');
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
					$("#imgdiv"+b).attr("onclick","goToResHouse("+getData[i].house_seq+","+getData[i].house_status+",'"+type+"')")
					//$("img"+b).attr("src","") 나중에 추가
					$("#td"+b).html('<p>'+getData[i].house_name+'</p><br><hr><p>숙소상태: '+getData[i].house_status_text+'</p>')
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
				$("#imgdiv"+i).attr("onclick","goToResHouse("+getData[a].house_seq+","+getData[a].house_status+",'"+type+"')")
				//$("img"+b).attr("src","") 나중에 추가
				$("#td"+i).html('<p>'+getData[a].house_name+'</p><br><hr><p>숙소상태: '+getData[a].house_status_text+'</p>')
				a++;
			}
			if(area == 1){
				$("#tri1").css("display","none")
			}
		})
	})
		
		function goToResHouse(house_seq,house_status,accessType){
			var form = document.createElement("form");
			var input = new Array()
			var names = ["house_seq","accessType"]
			var values = [house_seq,accessType]
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
	        if(house_status == 0){
	        	form.action = "reservationHouse.do";
	        	form.submit();
	        }else if(house_status == 2){
	        	var result = confirm("삭제를 취소하시겠습니까?")
	        	if(result){
	        		form.action = "rollbackDelete.do";
	        		form.submit();
	        	}
	        }else{
	        	alert("현재 접근할 수 없는 상태입니다")
	        }
		}
	
var hostSales = function(){
	location.href="hostSales.do";
}

</script>
</html>