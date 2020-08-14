<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<title>메인 홈페이지</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon.png">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/menu.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/hostregister.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<!-- header-start -->
	<c:if test="${login_session eq null }">
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
								<a href="/cnc/registerView.do">회원가입</a>
							</p>
						</li>
						<li class="item">
							<p>
								<a href="/cnc/loginView.do">로그인</a>
							</p>
						</li>
						<li class="item">
							<p>
								<a href="/cnc/selectBoardList.do">공지사항</a>
							</p>
						</li>

				</ul>
			</div>
		</div>
	</header>
	</c:if>
	<c:if test="${login_session ne null }">
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
			<div style="width:50px;height:50px;margin-left:15px;margin-top:12px;border-radius: 30px 30px 30px 30px;float:left;background-color:white;overflow:hidden;" id="myinfo">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/my1.jpg" style="max-width:120%;max-height:120%;">
			</div>
		</div>
		<div id="mydiv" style="display:none;margin-left:86%;z-index:100;width:200px;background-color:#d2d2d2;font-size:20px;border-radius: 15px 15px 15px 15px;font-family: 'Jua', sans-serif;" >
					<ul>
						<li><br></li>
						<li style="margin-bottom:20px;"><a href="">내정보</a></li>
						<li style="margin-bottom:20px;"><a href="reservationPage.do">예약한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="myFavoriteHouse.do">저장한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="">쿠폰함</a></li>
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
	 <!-- slider_area_start -->
    <div class="mainview">
    <div class="content">
        <label1 for="content">Travelo</label1>
    </div>
    
    <div style="z-index:10;margin-left:85%;margin-top:5%;width:300px;height:300px;position:absolute;">
   		<p id="weathercity" style="font-size:50px;"></p><br><br>
   		<div style="width:50%;float:left;">
			<img src=""  id="weathericon" style="width:64px;height:64px;vertical-align:top;"><b id="templature" style="font-size:40px;"></b>
		</div>
		<div style="width:50%;float:left;font-size: 30px;">
			<b>습도: </b><b id="rainy"></b><br><br>
			<b>구름: </b><b id="cloud"></b><br><br>
			<b>풍속: </b><b id="wind"></b><br><br>
		</div>
	</div>

    <div class="searchOptions">
        <form action="searchIndex.do">
           <div class="srcachlocation" style="vertical-align: middle;">
               &nbsp;<label for="srcachlocation">지역 전체</label>
              <select id="select_type" name="location" style="border: none;">
                 <option id="first">지역 전체</option>
                 <option id="seo">서울</option>
                 <option id="gye">경기</option>
                 <option id="gw">강원</option>
                 <option id="cb">충북</option>
                 <option id="cn">충남</option>
                 <option id="gb">경북</option>
                 <option id="gn">경남</option>
                 <option id="jb">전북</option>
                 <option id="jn">전남</option>
              </select> 
              <select id="select_menu" name="detail" style="border: none;">
                 <option>지역 선택</option>
              </select> 
              <label class="searchConditions" style="padding-bottom: 15px;">체크인 
                  <input type="date" id="checkIn" name="checkIn" value="" min="" max=""  style="border: none; margin-bottom: 15px;"/>
                </label> 
                 <label class="searchConditions">체크아웃 
                     <input type="date"id="checkOut" name="checkOut" min="" max="" onclick="checkout()"  style="border: none;"/>
                </label> 
                <label class="searchConditions">최소 인원 <input type="number"
                 id="people" name="people" value="1" onclick="peopleCheck()"/>
                </label>
              <button class="btn12" type="submit" value="검색" style="border-radius: 32px;">검색</button>
           </div>
        </form>
    </div>
    <div class="img-cover"></div>
    </div>
	<!-- slider_area_end -->
	<div class="popular_destination_area"
		style="background-image: url(${pageContext.request.contextPath}/resources/images/main/blackback.jpg);">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="section_title text-center mb_70">
						<h3 style="color: white;">당신은 어디로 떠나고 싶나요?</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-1">
					<div class="single_trip">
						<div class="single_destination">
							<div class="thumb">
								<a href="getHouseList.do?location=서울"> <img
									src="${pageContext.request.contextPath}/resources/images/destination/seoul.jpg"
									alt="">
								</a>
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									서울 <a href="reservation_map.html">떠나자!</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-1">
					<div class="single_trip">
						<div class="single_destination">
							<div class="thumb">
								<a href="getHouseList.do?location=경기"> <img
									src="${pageContext.request.contextPath}/resources/images/destination/incheon.jpg"
									alt="">
								</a>
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									경기 <a href="reservation_map.html">떠나자!</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-1">
					<div class="single_trip">
						<div class="single_destination">
							<div class="thumb">
								<a href="getHouseList.do?location=강원"> <img
									src="${pageContext.request.contextPath}/resources/images/destination/gangrung.png"
									alt="">
								</a>
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									강원 <a href="reservation_map.html">떠나자!</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-1">
					<div class="single_trip">
						<div class="single_destination">
							<div class="thumb">
								<a href="getHouseList.do?location=충북"> <img
									src="${pageContext.request.contextPath}/resources/images/destination/jeacheon.jpg"
									alt="">
								</a>
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									충북 <a href="reservation_map.html">떠나자!</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-1">
					<div class="single_trip">
						<div class="single_destination">
							<div class="thumb">
								<a href="getHouseList.do?location=충남"> <img
									src="${pageContext.request.contextPath}/resources/images/destination/deajeun.png"
									alt="">
								</a>
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									충남 <a href="reservation_map.html">떠나자!</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-1">
					<div class="single_trip">
						<div class="single_destination">
							<div class="thumb">
								<a href="getHouseList.do?location=전북"> <img
									src="${pageContext.request.contextPath}/resources/images/destination/ulsan.jpg"
									alt="">
								</a>
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									전북 <a href="reservation_map.html">떠나자!</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-1">
					<div class="single_trip">
						<div class="single_destination">
							<div class="thumb">
								<a href="getHouseList.do?location=전남"> <img
									src="${pageContext.request.contextPath}/resources/images/destination/gwangju.jpg"
									alt="">
								</a>
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									전남 <a href="reservation_map.html">떠나자!</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-1">
					<div class="single_trip">
						<div class="single_destination">
							<div class="thumb">
								<a href="getHouseList.do?location=경북"> <img
									src="${pageContext.request.contextPath}/resources/images/destination/daegu.jpg"
									alt="">
								</a>
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									경북 <a href="reservation_map.html">떠나자!</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-1">
					<div class="single_trip">
						<div class="single_destination">
							<div class="thumb">
								<a href="getHouseList.do?location=경남"> <img
									src="${pageContext.request.contextPath}/resources/images/destination/busan.png"
									alt="">
								</a>
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									경남 <a href="reservation_map.html">떠나자!</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- popular_destination_area_start  -->
	<div class="popular_destination_area"
		style="background-image: url(${pageContext.request.contextPath}/resources/images/main/blackback.jpg);">
		<div class=" container">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="section_title text-center mb_70">
						<h3 style="color: white;">당신이 즐기고픈 테마는??</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-1" style="padding-bottom: 15px;">
					<div class="single_destination1"
						onclick="location.href='http://localhost:8090/cnc/themesearch.do?theme_type=house_condition_petok'">
						<div class="thumb">
							<img
								src="${pageContext.request.contextPath}/resources/images/dog.png"
								alt=""><i class="fas fa-dog"
								style="font-size: 60px; float: right;"></i>
						</div>
						<div class="content">
							<p class="d-flex align-items-center">
								반려견과 함께<a href="travel_destination.html">여행</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-1" style="padding-bottom: 15px;">
					<div class="single_destination1"
						onclick="location.href='http://localhost:8090/cnc/themesearch.do?theme_type=house_theme_bbq'">
						<div class="thumb">
							<img
								src="${pageContext.request.contextPath}/resources/images/bbq1.jpg"
								alt=""><i class="fas fa-drumstick-bite"
								style="font-size: 60px; float: right;"></i>
						</div>
						<div class="content">
							<p class="d-flex align-items-center">
								바비큐와 함께<a href="travel_destination.html">여행</a>
							</p>

						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-1" style="padding-bottom: 15px;">
					<div class="single_destination1"
						onclick="location.href='http://localhost:8090/cnc/themesearch.do?theme_type=house_theme_party'">
						<div class="thumb">
							<img
								src="${pageContext.request.contextPath}/resources/images/party1.jpg"
								alt=""><i class="fas fa-glass-cheers"
								style="font-size: 60px; float: right;"></i>
						</div>
						<div class="content">
							<p class="d-flex align-items-center">
								파티룸<a href="travel_destination.html">여행</a>
							</p>

						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-1">
					<div class="single_destination1"
						onclick="location.href='http://localhost:8090/cnc/themesearchhighscore.do'">
						<div class="thumb">
							<img
								src="${pageContext.request.contextPath}/resources/images/star.png"
								alt=""><i class="fas fa-medal"
								style="font-size: 60px; float: right;"></i>
						</div>
						<div class="content">
							<p class="d-flex align-items-center">
								평점이 높은<a href="travel_destination.html">여행</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-1">
					<div class="single_destination1" onclick="location.href='http://localhost:8090/cnc/themesearch.do?theme_type=house_theme_pool'">
						<div class="thumb">
							<img
								src="${pageContext.request.contextPath}/resources/images/familywater.jpg"
								alt=""><i class="fas fa-water"
								style="font-size: 60px; float: right;"></i>
						</div>
						<div class="content">
							<p class="d-flex align-items-center">
								가족 물놀이<a href="travel_destination.html">여행</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-1">
					<div class="single_destination1" onclick="location.href='http://localhost:8090/cnc/themesearch.do?theme_type=house_theme_farm'">
						<div class="thumb">
							<img
								src="${pageContext.request.contextPath}/resources/images/ground.jpg"
								alt=""><i class="fas fa-seedling"
								style="font-size: 60px; float: right;"></i>
						</div>
						<div class="content">
							<p class="d-flex align-items-center">
								가족 체험농장<a href="travel_destination.html">여행</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- popular_destination_area_end  -->
	<div class="popular_destination_area"
		style="background-image: url(${pageContext.request.contextPath}/resources/images/main/blackback.jpg); text-align: center;">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="section_title text-center mb_70">
						<h3 style="color: white;">지원 호스팅</h3>
					</div>
				</div>
			</div>
			<div class="row1">
				<div class="col-lg-4 col-md-1">
					<div class="save1" style="float: left; margin-left: 400px;">
						<div class="single_destination2">
							<div class="thumb" style="margin-top: 30px;">
								<img
									src="${pageContext.request.contextPath}/resources/images/good.jpg"
									alt=""><i class="fas fa-hand-holding-medical"
									style="font-size: 60px; float: right;"></i>
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									구호 인력 호스팅<a href="travel_destination.html">지원</a>
								</p>
							</div>
						</div>
						<div class="goodtext">
							<label class="goodtext" for="">코로나19와 맞서 싸우는 보건의료 인력, 긴급
								구호 요원, 응급 구조 요원 등 10만 명에게 임시 숙소를 제공하는 '구호 인력을 위한 숙소' 프로그램에 에어비앤비
								호스트 여러분의 참여를 부탁드립니다. 이는 감염 노출 위험이 있는 구호 인력에게 병원과 가까우면서도 가족과 떨어져
								안전하게 머물 수 있는 숙소를 제공하기 위한 것입니다. </label>
						</div>
					</div>
					<div class="save2" style="float: left;"
						style="float: left; margin-left: 350px;">
						<div class="single_destination2">
							<div class="thumb" style="margin-top: 30px;">
								<img
									src="${pageContext.request.contextPath}/resources/images/sad.PNG"
									alt=""><i class="fas fa-child"
									style="font-size: 60px; float: right;"></i>
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									아이를 위한 호스팅<a href="travel_destination.html">지원</a>
								</p>
							</div>
						</div>
						<div class="goodtext">
							<label class="goodtext" for="">현재 한국에는 전국적으로 200여개의
								‘고아원’이 존재한다. 현재 약 2만명의 ‘고아’가 존재하고 매년 4천명의 아동이 시설에 들어온다. 숫자 속에 숨은
								구체적인 사람을 봐야 한다. 삶의 안정도, 사람에 대한 신뢰도, 미래에 대한 꿈도 갖기 어려운 공간에서 다양한
								인권침해의 위험에 노출되어 있다. </label>
						</div>
					</div>
					<div class="save1" style="float: left; margin-left: 400px;">
						<div class="single_destination2">
							<div class="thumb" style="margin-top: 30px;">
								<img
									src="${pageContext.request.contextPath}/resources/images/oldsad.jpg"
									alt=""><i class="fas fa-blind"
									style="font-size: 60px; float: right;"></i>
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									노인를 위한 호스팅<a href="travel_destination.html">지원</a>
								</p>
							</div>
						</div>
						<div class="goodtext">
							<label class="goodtext" for="">노년층의 우울증과 자살을 막으려면 정부가
								주도하는 예방사업만으로는 한계가 있을 수밖에 없다. 결국 노인 자살률을 떨어뜨리려면 좀더 근본적으로는 이웃의 따뜻한
								관심과 배려가 필수라는 지적이다. </label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="first" id="bottom"
		style="background-image: url(${pageContext.request.contextPath}/resources/images/main/blackback.jpg);">
		<div class="second">
			회사소개 | 이용약관 | 개인정보처리방침 |사업자 정보확인 | 여기어때 마케팅센터 | 액티비티 호스트센터 | HOTEL
			여기어때 |콘텐츠산업진흥법에의한 표시<br> <br> 고객행복센터 1670-6250 오전 9시 - 새벽
			3시, 점심시간: 오후 12시 - 오후 1시<br> <br> (주) 여기어때컴퍼니<br> <br>
			주소 : 서울특별시 강남구 봉은사로 479, 479타워 11층<br> 대표이사 : 박남수 | 사업자등록번호:
			742-86-00224<br> 통신판매번호 : 2017-서울강남-01779 | 관광사업자 등록번호:
			제1026-24호<br> 전화번호 : 1670-6250<br> 전자우편주소 :
			skatn7979@gmail.com<br> Copyright GC COMPANY Corp. All rights
			reserved.<br>
			<hr id="bline">
			<img
				src="${pageContext.request.contextPath}/resources/images/face.png"
				id="blogo"> <img
				src="${pageContext.request.contextPath}/resources/images/insta.png"
				id="blogo">
		</div>
	</footer>
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("a[name='trigger']").toggle(function() {
				$(this).closest("tr").next().show();
			}, function() {
				$(this).closest("tr").next().hide();
			});
		});
	</script>
	<script>
		var slideIndex = 0;
		showSlides();
		function showSlides() {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > slides.length) {
				slideIndex = 1;
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
			setTimeout(showSlides, 2000); // Change image every 2 seconds
		}
	</script>
	
	<script type="text/javascript">
		var f_base =["지역 전체"]
		var f_seoul = [ "서울지역 선택", "강남구", "강서구", "노원구" ];
		var f_gyeonggi = [ "경기지역 선택", "성남시", "수원시", "광주시" ];
		var f_gangwon = [ "강원지역 선택", "강릉시", "속초시", "양양시" ];
		var f_cb = [ "충북지역 선택", "청주시", "충주시", "제천시" ];
		var f_cn = [ "충남지역 선택", "보령시", "공주시", "천안시" ];
		var f_gb = [ "경북지역 선택", "포항시", "안동시", "경주시" ];
		var f_gn = [ "경남지역 선택", "창원시", "통영시", "거제시" ];
		var f_jb = [ "전북지역 선택", "전주시", "익산시", "군산시" ];
		var f_jn = [ "전남지역 선택", "여수시", "순천시", "목포시" ];
		var foods = [ f_base, f_seoul, f_gyeonggi, f_gangwon, f_cb, f_cn, f_gb, f_gn, f_jb, f_jn ];

		function createTag(index) {
			var result = "";
			foods[index].forEach(function(item) {
				result += "<option>" + item + "</option>";
			});
			return result;
		}

		function chgOptions() {
			var selected_index = $("#select_type option").index(
					$("#select_type option:selected"));
			$("#select_menu").html(createTag(selected_index));
		}

		$("#select_type").on("change", function() {
			chgOptions();
		});
	</script>

	<script>
		window.onload = function () {
			let minlim = new Date().toISOString().substring(0, 10);
			document.getElementById('checkIn').value = minlim;
			document.getElementById('checkIn').min = minlim;
		};
	</script>
	
	<script>
		var peopleCheck = function() {
			let peo = document.getElementById("people");
			if(peo.value<1) {
				peo.value = 1;
				alert('최소인원은 1명 입니다.');
			}
			if(peo.value>10) {
				peo.value = 10;
				alert('너무 많은 인원입니다.');
			}
		}
	</script>
	
	<script>
		var checkout = function() {
			let maxLim = document.getElementById("checkIn");
			document.getElementById("checkOut").min = maxLim.value;
		}
	</script>
	
	<script>
		window.onload = function () {
			var loc = document.getElementById("first");
			loc.selected = true;
			chgOptions();
		}
	</script>
	<script type="text/javascript">
		var citys = ["Seoul","Busan","","Gwangju","Jeju",]
	
		window.onload = function(){
		     $.ajax({
		           type:"GET",
		           url: "http://api.openweathermap.org/data/2.5/weather?q=Jeju&appid=b7672f5a9052b4493d3d1a41da66f308",
		           dataType:"json",
		           async:"false",
		           success : function(data) {
		                console.log("현재온도 : "+ Math.round((data.main.temp- 273.15)) );
		                console.log("현재습도 : "+ data.main.humidity);
		                console.log("날씨 : "+ data.weather[0].main );
		                console.log("상세날씨설명 : "+ data.weather[0].description );
		                console.log("날씨 이미지 : "+ data.weather[0].icon );
		                console.log("바람   : "+ data.wind.speed );
		                console.log("나라   : "+ data.sys.country );
		                console.log("도시이름  : "+ data.name );
		                console.log("구름  : "+ (data.clouds.all) +"%" );
		                $("#weathercity").html(data.name)
		                $("#templature").html(Math.round((data.main.temp- 273.15))+"°C")
		                $("#weathericon").attr("src","http://openweathermap.org/img/w/"+data.weather[0].icon+".png")
		                $("#rainy").html(data.main.humidity+"%")
		                $("#cloud").html((data.clouds.all) +"%")
		                $("#wind").html(data.wind.speed+"m/s")
		           },
		           error : function(request, status, error) {
		        	   alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
		           }
		     });
			
		}
	</script>
</body>
</html>