<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>회원가입</title>
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
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript">
function fn_idCheck() {
	if ($("#customerId").val() == "") {
		alert("아이디를 입력하세요.");
		$("#customerId").focus();
	}else{
		$.ajax({
			url:"idCheck.do",
			type:"post",
			dataType:"html",
			data:$("#regForm").serialize(),
			success:function(data){
				if (data == 1) {
					alert("이미 사용중인 아이디입니다.");
				}else if (data == 0) {
					$("#idCheckBtn").attr("value","Y");
					alert("사용 가능한 아이디입니다.");
				}
			}
		});	
	}
}
</script>
</head>
<body>
	<!-- header-start -->
	<header class="menudiv1">
		<div class="menudiv2-1">
			<a href="/cnc/indexView.do"><img alt=""
				src="${pageContext.request.contextPath}/resources/images/main/1123.png" /></a>
			<label for="" style="font-size: 20px; background-color: white;">Trip</label>
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
	<form action="/cnc/registerCheck.do" method="post" id="regForm">
		<div class="loginform" style="text-align: center;">
			<div class="leftform">
				<h3 style="padding-top: 35px; font-size: 25px; font-weight: bold;">회원가입</h3>
				<br>
				<br>
				<div class="input_id">
					<span> <input class="bb6" type="text" name="customerId"
						id="customerId" placeholder="&nbsp;&nbsp;아이디 입력" required>
					</span>
					<button type="button" class="idCheckBtn" id="idCheckBtn" onclick="fn_idCheck();" value="N">중복확인</button>
				</div>
				<div class="input_password">
					<span> <input class="ipassword" type="password"
						name="customerPassword" placeholder="&nbsp;&nbsp;비밀번호 설정" required>
					</span>
				</div>
				<div class="input_email">
					<span> <input class="iemail" type="email"
						name="customerEmail" placeholder="&nbsp;&nbsp;이메일 주소" required>
					</span>
				</div>
				<div class="input_name">
					<span> <input class="iname" type="text" name="customerName"
						placeholder="&nbsp;&nbsp;이름(예:홍길동)" required>
					</span>
				</div>

				<div style="padding-top: 30px;">
					<div class="loginMove" style="text-align: center">
						이미 에어비앤비 계정이 있나요? <a class="my__login__link" href="/cnc/loginView.do">로그인</a>
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
						maxlength="2" onchange="setThumbnail(event);" name="customerImage" />
				</div>
				<div class="input_phone">
						<span>
						<input class="itel" type="text" placeholder="&nbsp;&nbsp;-없이 번호만 입력해주세요"
						name="customerPhone" maxlength="11"
						style="width: 250px; text-align: left;" required>
						</span>
						<br>
					<button type="button" class=""
						style="padding-top: 10px; font-size: 25px; font-weight: bold; width: 250px;">전화번호
						인증하기</button>
				</div>
				<br>
			</div>
		</div>
		<div class="register1">
			<button id="reg_submit" name="reg_submit" type="submit">가입하기</button>
		</div>
	</form>
	<div style="margin-bottom: 5%"></div>
</body>
</html>