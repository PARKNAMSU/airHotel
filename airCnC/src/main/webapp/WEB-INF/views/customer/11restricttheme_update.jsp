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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/guestcheck.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	<script type="text/javascript" src="../js/hostregister.js"></script>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function restrictthemeSubmit() {
			if($("input:checkbox[name=house_theme_bbq_0or1]").is(":checked")){
				$("input:hidden[name=house_theme_bbq_0or1]").val("true")
			} else {
				$("input:hidden[name=house_theme_bbq_0or1]").val("false")
			}
			if($("input:checkbox[name=house_theme_pet_0or1]").is(":checked")){
				$("input:hidden[name=house_theme_pet_0or1]").val("true")
			} else {
				$("input:hidden[name=house_theme_pet_0or1]").val("false")
			}
			if($("input:checkbox[name=house_theme_party_0or1]").is(":checked")){
				$("input:hidden[name=house_theme_party_0or1]").val("true")
			} else {
				$("input:hidden[name=house_theme_party_0or1]").val("false")
			}
			if($("input:checkbox[name=house_theme_pool_0or1]").is(":checked")){
				$("input:hidden[name=house_theme_pool_0or1]").val("true")
			} else {
				$("input:hidden[name=house_theme_pool_0or1]").val("false")
			}
			if($("input:checkbox[name=house_theme_farm_0or1]").is(":checked")){
				$("input:hidden[name=house_theme_farm_0or1]").val("true")
			} else {
				$("input:hidden[name=house_theme_farm_0or1]").val("false")
			}
			if($("input:checkbox[name=house_condition_childok_0or1]").is(":checked")){
				$("input:hidden[name=house_condition_childok_0or1]").val("true")
			} else {
				$("input:hidden[name=house_condition_childok_0or1]").val("false")
			}
			if($("input:checkbox[name=house_condition_babyok_0or1]").is(":checked")){
				$("input:hidden[name=house_condition_babyok_0or1]").val("true")
			} else {
				$("input:hidden[name=house_condition_babyok_0or1]").val("false")
			}
			if($("input:checkbox[name=house_condition_smokeok_0or1]").is(":checked")){
				$("input:hidden[name=house_condition_smokeok_0or1]").val("true")
			} else {
				$("input:hidden[name=house_condition_smokeok_0or1]").val("false")
			}
			if($("input:checkbox[name=house_restrict_stairs_0or1]").is(":checked")){
				$("input:hidden[name=house_restrict_stairs_0or1]").val("true")
			} else {
				$("input:hidden[name=house_restrict_stairs_0or1]").val("false")
			}
			if($("input:checkbox[name=house_restrict_noise_0or1]").is(":checked")){
				$("input:hidden[name=house_restrict_noise_0or1]").val("true")
			} else {
				$("input:hidden[name=house_restrict_noise_0or1]").val("false")
			}
			if($("input:checkbox[name=house_restrict_pet_0or1]").is(":checked")){
				$("input:hidden[name=house_restrict_pet_0or1]").val("true")
			} else {
				$("input:hidden[name=house_restrict_pet_0or1]").val("false")
			}
			
			if($("input:checkbox[name=house_restrict_cantpark_0or1]").is(":checked")){
				$("input:hidden[name=house_restrict_cantpark_0or1]").val("true")
			} else {
				$("input:hidden[name=house_restrict_cantpark_0or1]").val("false")
			}
			if($("input:checkbox[name=house_restrict_commonspace_0or1]").is(":checked")){
				$("input:hidden[name=house_restrict_commonspace_0or1]").val("true")
			} else {
				$("input:hidden[name=house_restrict_commonspace_0or1]").val("false")
			}
			if($("input:checkbox[name=house_restrict_facility_0or1]").is(":checked")){
				$("input:hidden[name=house_restrict_facility_0or1]").val("true")
			} else {
				$("input:hidden[name=house_restrict_facility_0or1]").val("false")
			}
			if($("input:checkbox[name=house_restrict_cctv_0or1]").is(":checked")){
				$("input:hidden[name=house_restrict_cctv_0or1]").val("true")
			} else {
				$("input:hidden[name=house_restrict_cctv_0or1]").val("false")
			}
			if($("input:checkbox[name=house_restrict_weapon_0or1]").is(":checked")){
				$("input:hidden[name=house_restrict_weapon_0or1]").val("true")
			} else {
				$("input:hidden[name=house_restrict_weapon_0or1]").val("false")
			}
			if($("input:checkbox[name=house_restrict_beast_0or1]").is(":checked")){
				$("input:hidden[name=house_restrict_beast_0or1]").val("true")
			} else {
				$("input:hidden[name=house_restrict_beast_0or1]").val("false")
			}
			var f = document.restricttheme;
			f.submit();
		}
		
		function PrevSubmit() {
			var f = document.restricttheme;
			f.action = "<c:url value='/1newhouse.do' />";
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
    <c:url value="/11restricttheme.do" var="actionUrl" />
	<form action="/cnc/update_11restrictthemework.do" name="restricttheme" method="GET">
	<div class="container">
	<div class="form">
	<div class="check">
	<img src="${pageContext.request.contextPath}/resources/images/tripcheck.png" alt="javascript(0)" style="width: 500px;">
    	
    	<div class="check1"><h3 style="padding-top: 35px; font-size: 45px;">게스트가 지켜야 할 숙소 이용규칙을 정하세요.</h3></div>
        <h4 style="font-size: 25px;">게스트는 예약하기 전에 숙소의 테마를 선택할 수 있습니다.</h4><br>
        
        	<div class="guestcheckbox">
        		<div class="guideBox">
       			
        		<p>* 캠핑, 바베큐 등을 즐길 수 있음
        		<input type="hidden" name="house_theme_bbq_0or1" />
        		<input type="checkbox" class="textbtn" name="house_theme_bbq_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
        			<c:if test="${detail.house_theme_bbq ne 'false' }">checked</c:if>/>
	            </p><br>
	            <p>* 개인 반려동물 동행 출입이 가능
	            <input type="hidden" name="house_theme_pet_0or1" />
	            <input type="checkbox" class="textbtn" name="house_theme_pet_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
	            	<c:if test="${detail.house_theme_pet ne 'false' }">checked</c:if>/>
	            </p><br>
	            <p>* 수영장, 실내풀 등의 물놀이 가능
	            <input type="hidden" name="house_theme_party_0or1" />
	            <input type="checkbox" class="textbtn" name="house_theme_party_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
	            	<c:if test="${detail.house_theme_party ne 'false' }">checked</c:if>/>
	            </p><br>
	            <p>* 자연, 농장체험 가능
	            <input type="hidden" name="house_theme_pool_0or1" />
	            <input type="checkbox" class="textbtn" name="house_theme_pool_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
	            	<c:if test="${detail.house_theme_pool ne 'false' }">checked</c:if>/>
	            </p><br>
	            <p>* 실내 파티룸 장식, 이벤트 허용
	            <input type="hidden" name="house_theme_farm_0or1" />
	            <input type="checkbox" class="textbtn" name="house_theme_farm_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
	            	<c:if test="${detail.house_theme_farm ne 'false' }">checked</c:if>/>
	            
	            </p><br>
        		
        		
        		
        		<h4 style="font-size: 15px;">또한, 특이사항이 있을시 선택할 수 있습니다.</h4><br>
	            <p>* 어린이(2~12세) 숙박에 적합함
	            <input type="hidden" name="house_condition_childok_0or1" />
	            <input type="checkbox" class="textbtn" name="house_condition_childok_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
	            	<c:if test="${detail.house_condition_childok ne 'false' }">checked</c:if>/>
	            </p><br>
	            <p>* 유아(2세 미만) 숙박에 적합함
	            <input type="hidden" name="house_condition_babyok_0or1" />
	            <input type="checkbox" class="textbtn" name="house_condition_babyok_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
	            	<c:if test="${detail.house_condition_babyok ne 'false' }">checked</c:if>/>
	            </p><br>
	            <p>* 흡연 가능
	            <input type="hidden" name="house_condition_smokeok_0or1" />
	            <input type="checkbox" class="textbtn" name="house_condition_smokeok_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
	            	<c:if test="${detail.house_condition_smokeok ne 'false' }">checked</c:if>/>
	            </p><br>
				<br></br>
	            
	            

            	<h4 style="font-size: 25px;">게스트가 예약하기 전에 동의해야할 숙소 이용시 주의사항입니다.</h4><br>
            	<p>* 계단을 올라가야 함
            	<input type="hidden" name="house_restrict_stairs_0or1" />
            	<input type="checkbox" class="textbtn" name="house_restrict_stairs_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
            		<c:if test="${detail.house_restrict_stairs ne 'false' }">checked</c:if>/>
            	</p><br>
	            <p>* 소음이 발생할 수 있음
	            <input type="hidden" name="house_restrict_noise_0or1" />
	            <input type="checkbox" class="textbtn" name="house_restrict_noise_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
	            	<c:if test="${detail.house_restrict_noise ne 'false' }">checked</c:if>/>
	            </p><br>
	            <p>* 숙소에 반려동물 있음
	            <input type="hidden" name="house_restrict_pet_0or1" />
	            <input type="checkbox" class="textbtn" name="house_restrict_pet_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
	            	<c:if test="${detail.house_restrict_pet ne 'false' }">checked</c:if>/>
	            </p><br>
	            <p>* 건물 내 주차 불가
	            <input type="hidden" name="house_restrict_cantpark_0or1" />
	            <input type="checkbox" class="textbtn" name="house_restrict_cantpark_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
	            	<c:if test="${detail.house_restrict_cantpark ne 'false' }">checked</c:if>/>
	            </p><br>
	            <p>* 일부 공용 공간 있음
	            <input type="hidden" name="house_restrict_commonspace_0or1" />
	            <input type="checkbox" class="textbtn" name="house_restrict_commonspace_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
	           		<c:if test="${detail.house_restrict_commonspace ne 'false' }">checked</c:if>/>
	            </p><br>
	            <p>* 편의시설 제한
	            <input type="hidden" name="house_restrict_facility_0or1" />
	            <input type="checkbox" class="textbtn" name="house_restrict_facility_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
	            	<c:if test="${detail.house_restrict_facility ne 'false' }">checked</c:if>/>
	            </p><br>
	            <p>* 숙소에 감시 또는 녹화 장치 설치
	            <input type="hidden" name="house_restrict_cctv_0or1" />
	            <input type="checkbox" class="textbtn" name="house_restrict_cctv_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
	            	<c:if test="${detail.house_restrict_cctv ne 'false' }">checked</c:if>/>
	            </p><br>
	            <p>* 숙소에 무기 있음
	            <input type="hidden" name="house_restrict_weapon_0or1" />
	            <input type="checkbox" class="textbtn" name="house_restrict_weapon_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
	            	<c:if test="${detail.house_restrict_weapon ne 'false' }">checked</c:if>/>
	            </p><br>
	            <p>* 숙소에 위험한 동물 있음
	            <input type="hidden" name="house_restrict_beast_0or1" />
	            <input type="checkbox" class="textbtn" name="house_restrict_beast_0or1" value="" style="width: 15px; height: 15px; margin-left: 15px;"
	            	<c:if test="${detail.house_restrict_beast ne 'false' }">checked</c:if>/>
	            </p><br>
         
				</div>
			</div>
        
        
        
    	<div class="control" style="padding-bottom: 25px; padding-top: 25px;">
    		<a href="#" onclick="PrevSubmit();" style="float: left;"><button>< 뒤로가기</button></a>
			<a href="#" onclick="restrictthemeSubmit();" style="float: right;"><button>수정하기</button></a>
    	</div>



	</div>
 	</div>
	</div>
	</form>
    
    
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
</html>