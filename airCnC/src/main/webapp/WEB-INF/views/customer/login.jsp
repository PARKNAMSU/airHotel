<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<link rel="shortcut icon" sizes="76x76" type="image/x-icon"
	href="https://a0.muscache.com/airbnb/static/logotype_favicon-21cc8e6c6a2cca43f061d2dcabdf6e58.ico">
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<title>로그인</title>
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
							<p>
								<a href="/cnc/logout.do">로그아웃</a>
							</p>
						</li>
					</ul>
				</div>
			</div>
		</header>
	</c:if>
	<form action="/cnc/loginProcess.do" method="post">
		<div class="container">
			<img
				src="${pageContext.request.contextPath}/resources/images/guestperson1.png">
			<div id="light1" class="white_content" style="text-align: center;">
				<div class="allScreen" id="my__all__login">
					<div class="my__login" style="display: inline-block;">
						<div class="a">
							<div class="login">
								<script type="text/javascript"
									src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
									charset="utf-8"></script>
								<div id="naver_id_login" style="text-align: center;">
									<a href="${naverUrl}"> <img width="500px"
										src="${pageContext.request.contextPath}/resources/images/naver_login.png" />
									</a>
								</div>
								<div id="kakao_id_login" style="text-align: center">
									<a href="${kakaoUrl}" id="kakao-login-btn"> <img
										width="500px"
										src="${pageContext.request.contextPath}/resources/images/kakao_login.png" />
									</a>
								</div>
								<div style="margin-top: 5px;">
						            <div class="my__join__line1">또는</div>
						        </div>
								<div class="a3">
									<input class="bb6" type="text" id="customerId"
										name="customer_id" placeholder="&nbsp;&nbsp;아이디" required />
								</div>
								<div class="a3">
									<input class="bb6" type="password" id="customerPassword"
										name="customer_password" placeholder="&nbsp;&nbsp;비밀번호"
										required />
								</div>
								<div id="message">
									<c:if test="${sendMessage eq 'idFail'}">
										<p style="color: red; font-size: 25px;">아이디가 존재하지 않습니다.</p>
									</c:if>
									<c:if test="${sendMessage eq 'pwFail'}">
										<p style="color: red; font-size: 25px;">비밀번호가 일치하지 않습니다.</p>
									</c:if>
								</div>
								<div class="idsave" style="padding-top: 25px; font-size: 25px;">
									<input type="checkbox" id="remember_id"
										name="remember_customerId" /><label for="idsave">아이디
										저장</label>
								</div>

								<div class="a5">
									<a class="bb9" style="font-size: 15px;"
										href="/cnc/forgotPasswordView.do">비밀번호가 생각나지 않으세요?</a>
								</div>
								<div>
									<button id="loginBtn" name="loginBtn">로그인</button>
								</div>
							</div>
						</div>
						<br>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>