<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon.png">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/TEST.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/hostregister.css"/>
<title>메인 홈페이지</title>
</head>
<body>
	<header class="menudiv1">
	<div class="menudiv2-1">
		<a href="/cnc/indexView.do"><img alt="" src="${pageContext.request.contextPath}/resources/images/main/1123.png" /></a><br>
		<label for="" style="font-size: 20px;">Trip</label>
	</div>
	<div class="menudiv2-2">
		<div class="menudiv3-1" id="div1">
			<ul id="menuItems">
				<li class="item">
					<a href="#">호스트 </a>
				</li>
				<li class="item">
					<p><a href="/cnc/registerView.do">회원가입</a></p>
				</li>
				<li class="item">
					<p><a href="/cnc/loginView.do">로그인</a></p>
				</li>		
			</ul>
		</div>
		<div id="fade" class="black_overlay"></div>
	</div>
	</header>
	<!-- slider_area_start -->
	<div class="mainview">
      <div class="content">
          <label for="content">Travelo</label>
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
								<a href="#"> <img
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
								<a href="#"> <img
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
								<a href="#"> <img
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
								<a href="#"> <img
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
								<a href="#"> <img
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
								<a href="#"> <img
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
								<a href="#"> <img
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
								<a href="#"> <img
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
								<a href="#"> <img
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
			<div style="margin-left: 15%">
				<div class="row">
					<div class="col-lg-5 col-md-6">
						<div class="single_destination">
							<div class="thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/dogevent.jpg"
									alt="">
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									반려견과 함께<a href="travel_destination.html">여행</a>
								</p>

							</div>
						</div>
					</div>
					<div class="col-lg-5 col-md-6">
						<div class="single_destination">
							<div class="thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/bbqevent.jpg"
									alt="">
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									바비큐와 함께<a href="travel_destination.html">여행</a>
								</p>

							</div>
						</div>
					</div>
					<div class="col-lg-5 col-md-6">
						<div class="single_destination">
							<div class="thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/partyroom.jpg"
									alt="">
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									파티룸<a href="travel_destination.html">여행</a>
								</p>

							</div>
						</div>
					</div>
					<div class="col-lg-5 col-md-6">
						<div class="single_destination">
							<div class="thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/star.png"
									alt="">
							</div>
							<div class="content">
								<p class="d-flex align-items-center">
									평점이 높은<a href="travel_destination.html">여행</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- popular_destination_area_end  -->


	<div class="travel_variation_area"
		style="background-image: url(${pageContext.request.contextPath}/resources/images/main/blackback.jpg);">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="section_title text-center mb_70">
						<h3 style="color: white;">곤란한 일이 생겼나요?</h3>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single_travel text-center">
						<div class="icon">
							<img src="img/svg_icon/1.svg" alt="">
						</div>
						<h3>공지사항</h3>
						<button type="button" onclick="location.href='공지사항.html'">더보기</button>
						<table id="list" class="main">
							<thead>
								<tr>
									<th>글번호</th>
									<th scope="cols">공지제목</th>
									<th scope="cols">등록날짜</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td id="longtitle"><a href="#1" name="trigger">공지1번!</a></td>
									<td>2020-06-28</td>
								</tr>
								<tr name="article" class="hide">
									<td class="even" colspan="3"><a name="1" id="first"></a>야!!!!
										읽어라 !!!!</td>
								</tr>
								<tr>
									<td>2</td>
									<td id="longtitle"><a href="#2" name="trigger">공지2번!</a></span></td>
									<td>2020-07-15</td>
								</tr>
								<tr name="article" class="hide">
									<td class="even" colspan="3"><a name="2" id="second"></a>2차에서
										수정 사항이 있어요! 당첨자 3명!!</td>
								</tr>
								<tr>
									<td>3</td>
									<td id="longtitle"><a href="#3" name="trigger">공지3번!</a></span></td>
									<td>2020-07-15</td>
								</tr>
								<tr name="article" class="hide">
									<td class="even" colspan="3"><a name="3" id="second"></a>1차에서
										수정 사항이 있어요! 당첨자 5명!!</td>
								</tr>
								<tr>
									<td>4</td>
									<td id="longtitle"><a href="#4" name="trigger">공지4번!</a></td>
									<td>2020-07-14</td>
								</tr>
								<tr name="article" class="hide">
									<td class="even" colspan="3"><a name="4" id="third">첫
											이벤트를 공지합니다. 당첨자 10명!</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single_travel text-center">
						<div class="icon">
							<img src="img/svg_icon/2.svg" alt="">
						</div>
						<h3>이벤트</h3>
						<button type="button" onclick="location.href='이벤트.html'">더보기</button>
						<br>
						<section class="slider_section">
							<span class="prev_btn">이전 버튼</span><span class="next_btn">다음
								버튼</span>
						</section>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single_travel text-center">
						<div class="icon">
							<img src="img/svg_icon/3.svg" alt="">
						</div>
						<h3>자주묻는 질문</h3>
						<button type="button" onclick="location.href='자주질문.html'">더보기</button>
						<table id="list" class="main">
							<thead>
								<tr>
									<th>글번호</th>
									<th scope="cols">질문제목</th>
									<th scope="cols">등록날짜</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td id="longtitle"><a href="#1" name="trigger">질문1번!</a></td>
									<td>2020-06-28</td>
								</tr>
								<tr name="article" class="hide">
									<td class="even" colspan="3"><a name="1" id="first"></a>야!!!!
										읽어라 !!!!</td>
								</tr>
								<tr>
									<td>2</td>
									<td id="longtitle"><a href="#2" name="trigger">질문2번!</a></td>
									<td>2020-07-15</td>
								</tr>
								<tr name="article" class="hide">
									<td class="even" colspan="3"><a name="2" id="second"></a>2차에서
										수정 사항이 있어요! 당첨자 3명!!</td>
								</tr>
								<tr>
									<td>3</td>
									<td id="longtitle"><a href="#3" name="trigger">질문3번!</a></td>
									<td>2020-07-15</td>
								</tr>
								<tr name="article" class="hide">
									<td class="even" colspan="3"><a name="3" id="second"></a>1차에서
										수정 사항이 있어요! 당첨자 5명!!</td>
								</tr>
								<tr>
									<td>4</td>
									<td id="longtitle"><a href="#4" name="trigger">질문4번!</a></td>
									<td>2020-07-14</td>
								</tr>
								<tr name="article" class="hide">
									<td class="even" colspan="3"><a name="4" id="third">첫
											이벤트를 공지합니다. 당첨자 10명!</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/customer/footer.jsp"%>
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
</body>
</html>