<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>Travelo</title>
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png" />
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css" />
	
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hostdetail1.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	
	<script type="text/javascript">
		function houseDetailSubmit() {
			var f = document.hostchoose1;
			if(f.house_maxperson.value == 0) {
				alert("최대숙박인원은 최소 1명 이상입니다.");
				return;
			}
			if(f.house_bedroom_amount.value == 0) {
				alert("침실선택을 해주세요.");
				return;
			}
			f.submit();
		}
		
		
		function PrevSubmit() {
			var f = document.hostchoose1;
			f.action = "<c:url value='/hostregisterindex.do' />";
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
					<c:choose>
						<c:when test="${my_image eq 'profile.png'}">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/profile.png" style="max-width:120%;max-height:120%;">
						</c:when>
						<c:otherwise>
							<img alt="" src="/cnc/display.do?name=${my_image}" style="max-width:120%;max-height:120%;">
						</c:otherwise>
					</c:choose>
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

    <c:url value="/2housedetail.do" var="actionUrl" />
    <div class="container">
	<form:form id="2housedetail" name="hostchoose1" modelAttribute="house" method="GET" action="${actionUrl}">
		
			<img src="${pageContext.request.contextPath}/resources/images/badroom.jpg"style="align-content: center; padding-top: 30px;">
			<div class="title" style="color: black;">숙소에 얼마나 많은 인원이 숙박 할수 있나요?</div>
			<div class="title1" style="color: black;">모든 게스트가 편안하게 숙박할 수 있도록 침대가 충분히 구비되어 있는지 확인하세요.</div>
			<br class="guestcount">	
			<div class="form">
				<label for="guestcount">최대 숙박 인원</label>
				<c:set var="maxperson" value="${house_maxperson}" />
				<button type="button" onclick="javascript:this.form.amount.value++;">+</button> 
        		<form:input type="text" id="amount" value="${maxperson }" readonly="readonly" path="house_maxperson" />
        		<button type="button" onclick="javascript:this.form.amount.value--;">-</button>
				
				<div class="guestbad">
				<label for="guestbad">게스트가 사용할수 있는 침실은 몇 개 인가요?</label>
				<form:select name="guestbadcot" path="house_bedroom_amount">
					<form:option value="0">침실선택</form:option>
					<form:option value="2">2개</form:option>
					<form:option value="4">4개</form:option>
					<form:option value="6">6개</form:option>
					<form:option value="6">8개</form:option>
					<form:option value="10">10개</form:option>
					<form:option value="12">12개</form:option>
				</form:select>
        		</div>
        		
        		<div class="guestbadcount">
			        <div class="guestbadcount1">
			        <label for="guestbadcount2">침대</label>  
			        <c:set var="bed_amount" value="${house_bed_amount}" />      
			        <button type="button" onclick="javascript:this.form.amount1.value++;">+</button>   
			        <form:input type="text" id="amount1" value="${bed_amount }" readonly="readonly" path="house_bed_amount" />    
			        <button type="button" onclick="javascript:this.form.amount1.value--;">-</button>
			        </div>
			    </div>
			    
			    <div class="bad">
			    	<div class="title2" style="margin-bottom: 5px;">침대유형</div><br>
			    	<label for="bad" style="margin-bottom: 15px;">각 침실에 놓인 침대 유형을 명시하면 숙소에 침대가 어떻게 구비되어  있는지 게스트가 잘 파악할 수 있습니다.</label>
			    	<div class="badcount">
			    		<div class="bad1">
			    			<label for="guestcount">싱글</label>
			    			<c:set var="bed_type_single" value="${house_bed_type_single}" />   
					        <button type="button" onclick="javascript:this.form.amount2.value++;">+</button>  
					        <form:input type="text" id="amount2" value="${bed_type_single }" readonly="readonly" path="house_bed_type_single" />
					        <button type="button" onclick="javascript:this.form.amount2.value--;">-</button>
			    		</div><br>
			    		<div class="bad2">
			    			<label for="guestcount">더블</label>
			    			<c:set var="bed_type_double" value="${house_bed_type_double}" />
					        <button type="button" onclick="javascript:this.form.amount3.value++;">+</button>  
					        <form:input type="text" id="amount3" value="${bed_type_double }" readonly="readonly" path="house_bed_type_double" />  
					        <button type="button" onclick="javascript:this.form.amount3.value--;">-</button>
			    		</div><br>
			    		<div class="bad3">
			    			<label for="guestcount">퀸</label>
			    			<c:set var="bed_type_queen" value="${house_bed_type_queen}" />
					        <button type="button" onclick="javascript:this.form.amount4.value++;">+</button>  
					        <form:input type="text" id="amount4" value="${bed_type_queen }" readonly="readonly" path="house_bed_type_queen" />    
					        <button type="button" onclick="javascript:this.form.amount4.value--;">-</button>
			    		</div>
			    	</div>
			    </div>
			    
			</div>
			    
			    
	</form:form>
				<div class="control">
				    <div class="control2">
				    <a href="#" onclick="PrevSubmit();" style="float : left;">
				    <button>뒤로가기</button></a>
				    <a href="#" onclick="houseDetailSubmit();" style="float: right;">
				    <button>다음</button></a>
				    <br></br><br></br>
			    </div>
					<div class="bor1" style="height: 30px;"></div>
				
				</div>
	</div>

</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
</html>