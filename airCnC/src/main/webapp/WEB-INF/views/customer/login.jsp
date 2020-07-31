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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<title>로그인</title>
<script type="text/javascript">
$('#loginBtn').click(function() {
	var id = $('#customerId').val();
	var pw = $('#customerPassword').val();
	var remember_id = $('#remember_ud').is(':checked');
		$.ajax({
		type : 'post',
		url : 'loginCheck.do',
		data : {
			customerId : id,
			customerPassword : pw,
			rememberCustomerId : remember_id
			},
			success : function(data) {
				if (data == 0) { // 로그인 실패시.
					console.log(data);
					alert('로그인 정보를 정확히 입력해주세요.');
				} else if (data == -2) { // 인증하지 않았다면?
					console.log(data);
					alert('이메일 인증을 해주셔야 합니다!');						
				} else if (data == -3) { // 아이디가 사용중이라면?
					console.log(data);
					location.href = 'loginSuccess.do?customerId=' + id + '&customerPassword=' + pw + '&rememberCustomerId=' + remember_id;						
				} else { //로그인 성공시.
					console.log(data);
					location.href = 'indexView.do';
				}
			}
		});
	});
</script>
</head>
<body>
	<!-- Cookie가 비어있지 않을 때 checked 속성을 줌 -->
	<c:if test="${not empty cookie.customer_check}">
		<c:set value="checked" var="checked" />
	</c:if>
	<!-- header-start -->
	<header class="menudiv1">
		<div class="menudiv2-1">
			<a href="/cnc/indexView.do"><img alt=""
				src="${pageContext.request.contextPath}/resources/images/main/1123.png" /></a><br>
			<label for="" style="font-size: 20px;">Trip</label>
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1">
				<ul id="menuItems">
					<li class="item"><a href="#">호스트 </a></li>
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
				</ul>
			</div>
			<div id="fade" class="black_overlay"></div>
		</div>
	</header>
	<!-- header-end -->
	<form action="" accept-charset="utf-8" name="login1" method="POST">
		<div class="container">
			<img
				src="${pageContext.request.contextPath}/resources/images/guestperson1.png">
			<div id="light1" class="white_content" style="text-align: center;">
				<div class="allScreen" id="my__all__login">
					<div class="my__login" style="display: inline-block;">
						<div class="a">
							<div class="login">
								<div>
									<a class="bb1" style="font-size: 30px;"><span>네이버
											계정으로 로그인</span> </a>
								</div>
								<div>
									<a class="bb2" style="font-size: 30px;"> <span>카카오
											계정으로 로그인</span>
									</a>
								</div>
								<div class="a3">
									<input class="bb6" type="email" id="customerId" value="${cookie.customer_check.value}" 
									name="customerId" placeholder="&nbsp;&nbsp;아이디" required>
								</div>
								<div class="a3">
									<input class="bb6" type="password" id="customerPassword"
										name="customerPassword" placeholder="&nbsp;&nbsp;비밀번호"
										required>
								</div>
								<div class="idsave" style="padding-top: 25px; font-size: 25px;">
									<input type="checkbox"id="remember_id" name="remember_customerId" ${checked}><label for="idsave">아이디저장</label>
								</div>

								<div class="a5">
									<a class="bb9" style="font-size: 15px;"
										href="#">비밀번호가 생각나지 않으세요?</a>
								</div>
								<div>
									<input id="loginBtn" class="a6" type="button" value="로그인" />
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