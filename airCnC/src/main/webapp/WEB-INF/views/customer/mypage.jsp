<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sideMenu.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chat.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hostregister.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hostdetail1.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" />
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>내 정보 관리</title>
</head>
<body>
	<!--  
	<header style="color: #ff5a5f;">
		<span><i class="fas fa-images" style="font-size: 35px; padding-left: 20px; float: left;"></i></span>
		<label for="" style="font-size: 40px; background-color: black; color: #ff5a5f;">내 정보 페이지</label>
	</header>
	-->
	<!-- header-start -->
<c:if test="${login_session eq null}">
	<header class="menudiv1">
		<div class="menudiv2-1">
			<a href="/cnc/indexView.do"><img alt="" src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
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
<c:if test="${login_session ne null}">
	<header class="menudiv1">
		<div class="menudiv2-1">
			<a href="/cnc/indexView.do"><img alt="" src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1" style="float:left;width:70%;">
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
			<div style="width:50px;height:50px;margin-left:5%;margin-top:12px;border-radius: 30px 30px 30px 30px;float:left;background-color:white;overflow:hidden;" id="myinfo">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/my1.jpg" style="max-width:120%;max-height:120%;">
			</div>
		</div>
		<div id="mydiv" style="display:none;margin-left:90%;z-index:100;width:200px;background-color:#d2d2d2;font-size:20px;border-radius: 15px 15px 15px 15px;font-family: 'Jua', sans-serif;" >
					<ul>
						<li><br></li>
						<li style="margin-bottom:20px;"><a href="mypage.do">내정보</a></li>
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
	<div style="clear: both;"></div>
	<div id="sidediv">
		<ul id="sidemenu">
			<li class="menu"><span id="topmenu"
				style="font-family: 'Jua', sans-serif;"><a href="mypage.do">내정보 관리</a></span>
			</li>
			<li class="menu"><a href="reservationPage.do"
				style="font-family: 'Jua', sans-serif;">예약내역</a></li>
			<li class="menu"><a href="myFavoriteHouse.do"
				style="font-family: 'Jua', sans-serif;">저장한 숙소</a></li>
			<li class="menu"><a href="chat.do"
				style="font-family: 'Jua', sans-serif;">메세지</a></li>
			<li class="menu"><a href="#"
				style="font-family: 'Jua', sans-serif;">회원탈퇴</a></li>
			<li class="menu"><a href="#"
				style="font-family: 'Jua', sans-serif;">쿠폰함</a></li>
		</ul>
	</div>
	<div class="loginform" style="text-align: center;">
		<div class="leftform">
			<h3 style="padding-top: 35px; font-size: 25px; font-weight: bold;">내 정보 수정</h3>
			<br>
			<br>
			<div class="input_id">
				<span> <input class="iid" type="text" name="customer_id"
					placeholder="${login_session}" required readonly="readonly">
				</span><br>
			</div>
			<div class="input_password" style="margin-bottom: auto;">
				<span> <input class="iid" type="password" name="customer_password"
					placeholder="&nbsp;&nbsp;비밀번호 수정" required>
				</span>
			</div>
			<div class="input_password" style="margin-bottom: auto;">
				<span> <input class="iid" type="password" name="customer_password"
					placeholder="&nbsp;&nbsp;비밀번호 확인" required>
				</span>
			</div>
			<div class="input_name">
				<span> <input class="iid" type="text" name="customer_name"
					placeholder="&nbsp;&nbsp;이름(예:홍길동)" required>
				</span>
			</div>
			<div class="addphone">
				<span> <input class="iid" type="tel" name="customer_phone"
					placeholder="&nbsp;&nbsp;연락처 수정" required>
				</span>
			</div>
			<div class="input_email" style="margin-bottom: auto;">
				<span> <input class="iid" type="text" name="customer_email"
					placeholder="&nbsp;&nbsp;이메일 주소 변경" required>
				</span>
				<button type="button" class="emailSendBtn">인증번호 발송</button>
			</div>
			<div class="input_email" style="margin-bottom: auto;">
				<span> <input class="iid" type="text" name="customer_key"
					placeholder="&nbsp;&nbsp;인증번호 입력" required>
				</span>
				<button type="button" class="emailAuthBtn">이메일 인증</button>
			</div>
			<br>
		</div>
		<div class="rightform">
			<h3 style="padding-top: 35px; font-size: 25px; font-weight: bold;">프로필 사진 확인 및 수정</h3>
			<br>
			<br>
			<h4>등록했던 프로필 사진을 확인 또는 수정할수 있습니다.</h4>
			<div id="image_container" style="text-align: center;"></div>
			<br>
			<div class="filebox" style="padding-top: 250px;">
				<label for="image" style="font-size: 25px;">수정할 사진을 선택하세요</label><input
					type="file" class="multi" id="image" name="customer_image" accept="image/*" maxlength="2"
					onchange="setThumbnail(event);" />
			</div>
		</div>
	</div>
	<button class="mypagebtn" style="margin-top: 5%;">수정완료</button>
</body>
</html>