<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" sizes="76x76" type="image/x-icon"
	href="https://a0.muscache.com/airbnb/static/logotype_favicon-21cc8e6c6a2cca43f061d2dcabdf6e58.ico">
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.png">
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/footer.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/hostregister.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/signup.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
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
			<div class="menudiv3-1" id="div1">
				<ul id="menuItems">	
					<li class="item">
							<p>
								<a href="/cnc/selectBoardList.do">공지사항</a>
							</p>
						</li>
						<li class="item"><a href="myHouse.do">호스트</a></li>
						<li class="item">
								<p><a href="/cnc/logout.do">로그아웃</a></p>
					</li>
				</ul>
			</div>
		</div>
	</header>
	</c:if>
	<form action="/cnc/registerCheck.do" method="post" id="regForm">
		<div class="loginform" style="text-align: center;">
			<div class="leftform">
				<h3 style="padding-top: 35px; font-size: 25px; font-weight: bold;">회원가입</h3>
				<br> <br>
				<div class="input_id">
					<span> <input class="bb6" type="text" name="customer_id"
						id="customerId" placeholder="&nbsp;&nbsp;아이디 입력" required>
					</span>
					<button type="button" class="idCheckBtn" id="idCheckBtn" value="N">중복확인</button>
				</div>
				<div class="input_password">
					<span> <input class="ipassword" type="password"
						id="customerPassword" name="customer_password"
						placeholder="&nbsp;&nbsp;비밀번호 설정" required>
					</span>
				</div>
				<div class="input_phone">
					<span><input class="itel" type="tel" id="customerPhone"
						placeholder="&nbsp;&nbsp;전화번호(예:010-0000-0000)"
						name="customer_phone" maxlength="13" required> </span>
				</div>
				<div class="input_name">
					<span> <input class="iname" type="text" name="customer_name"
						id="customerName" placeholder="&nbsp;&nbsp;이름(예:홍길동)" required>
					</span>
				</div>

				<div style="padding-top: 30px;">
					<div class="loginMove" style="text-align: center; color: black;">
						이미 에어비앤비 계정이 있나요? <a class="my__login__link"
							href="/cnc/loginView.do">로그인</a>
					</div>
				</div>
			</div>
			<div class="rightform">
				<h3 style="padding-top: 35px; font-size: 25px; font-weight: bold;">프로필
					사진 추가</h3>
				<br> <br>
				<h4>프로필 사진을 요청하는 호스트도 있지만, 이 경우에도 예약이 확정된 후에만 게스트의 사진을 볼수 있습니다.</h4>
				<div id="image_container" style="text-align: center;"></div>
				<br>
				<div class="filebox">
					<label for="image" style="font-size: 25px;">첨부할 사진을 선택하세요</label><input
						type="file" class="multi" id="image" accept="image/*"
						maxlength="2" onchange="setThumbnail(event);" name="customer_image" />
				</div>
				<div class="input_email">
					<span> <input class="iemail" type="email" id="customerEmail"
						name="customer_email" placeholder="&nbsp;&nbsp;이메일 주소" required>
					</span> <br>
					<button id="emailBtn"
						style="padding-top: 10px; font-size: 25px; font-weight: bold; width: 89%;">인증번호
						발송</button>
					<br> <span> <input class="iauth" type="text"
						id="customerKey" name="customer_key" placeholder="&nbsp;&nbsp;인증번호"
						required>
					</span> <br> <input id="emailAuthBtn" type="button"
						style="padding-top: 10px; font-size: 25px; font-weight: bold; width: 89%; color: white; display: inline-block; width: 89%; height: auto; background-color: #ff5a5f; border-radius: 5px; font-weight: 300; font-size: 30px; text-decoration: none; padding: 8px; border: none; margin-top: 18px; margin-bottom: 25px; text-align: center;"
						value="이메일 인증">
				</div>
				<br>
			</div>
		</div>
		<div class="register1">
			<button id="reg_submit">가입하기</button>
		</div>
	</form>
	<div style="margin-bottom: 5%"></div>
</body>
</html>
