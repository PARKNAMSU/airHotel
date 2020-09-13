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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
    />
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript">
$(document).on("click","#loginBtn",function() {
	if (!$("#customerId").val()) {
		alert("아이디를 입력하세요.");
		$("#customerId").focus();
		return false;
	}else if (!$("#customerPassword").val()) {
		alert("비밀번호를 입력하세요.");
		$("#customerPassword").focus();
		return false;
	}
});
</script>
<script type="text/javascript">
$(document).ready(function() {
	var customerInputId = getCookie("customerInputId"); // 저장된 쿠키값 가져오기.
	$("input[name='customer_id']").val(customerInputId);
	if($("input[name='customer_id']").val != "") { 
		$("#idSaveCheck").attr("checked", true);
	}
	
	$("#idSaveCheck").change(function() {
		if($("#idSaveCheck").is(":checked")) {
			var customerInputId = $("input[name='customer_id']").val();
			setCookie("customerInputId", customerInputId, 7);
		}else {
			deleteCookie("customerInputId");
		}
	});
	
	// 아이디 저장하기를 체크한 상태에서 아이디를 입력하는 경우, 이럴 때도 쿠키를 저장.
	$("input[name='customer_id']").keyup(function() {
		if($("idSaveCheck").is(":checked")){
			var customerInputId = $("input[name='customer_id']").val();
			setCookie("customerInputId", customerInputId, 7);
		}
	});
});

function setCookie(cookieName, value, exdays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName) {
	var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if (start != -1) {
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if (end == -1) {
			end = cookieData.length;
		}
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}
</script>
<title>로그인</title>
</head>
<body>
	<!-- header-start -->
	<c:if test="${login_session eq null }">
		<header class="logo">
        <span>
          <a href="/cnc/indexView.do">
            <i
              class="fas fa-registered"
              style="
                font-size: 35px;
                padding-left: 20px;
                float: left;
                color: #ff5a5f;
              "
            ></i>
          </a>
        </span>
        <label for="fas fa-question" style="font-size: 40px;">로그인
        </label>
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
		<div class="container1" style="text-align: center; margin-top: 20px;">
			<img src="${pageContext.request.contextPath}/resources/images/guestperson1.png">
			<div id="light1" class="white_content" style="text-align: center;">
				<div class="allScreen" id="my__all__login">
					<div class="my__login" style="display: inline-block;">
						<div class="a">
							<div class="login">
								<script type="text/javascript"
									src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
									charset="utf-8"></script>
								<div id="naver_id_login" style="text-align: center;">
									<a href="${naverUrl}"> <img width="500"
										src="${pageContext.request.contextPath}/resources/images/naver_login.png" />
									</a>
								</div>
								<div id="kakao_id_login" style="text-align: center">
									<a href="${kakaoUrl}" id="kakao-login-btn"> <img
										width="500"
										src="${pageContext.request.contextPath}/resources/images/kakao_login.png" />
									</a>
								</div>
								<div style="margin-top: 5px;">
						            <div class="my__join__line1">또는</div>
						        </div>
								<div class="a3">
									<input class="bb6" type="text" id="customerId"
										name="customer_id" placeholder="&nbsp;&nbsp;아이디"/>
								</div>
								<div class="a3">
									<input class="bb6" type="password" id="customerPassword"
										name="customer_password" placeholder="&nbsp;&nbsp;비밀번호"/>
								</div>
								<div id="message">
									<c:if test="${sendMessage eq 'idFail'}">
										<p style="color: red; font-size: 25px;">아이디가 존재하지 않습니다.</p>
									</c:if>
									<c:if test="${sendMessage eq 'pwFail'}">
										<p style="color: red; font-size: 25px;">비밀번호가 일치하지 않습니다.</p>
									</c:if>
								</div>
								<div class="checkbox-container" style="font-size: 25px;">
									<input type="checkbox" id="idSaveCheck">
									<label for="idSaveCheck">아이디 저장하기</label>
								</div>

								<div class="a5">
									<a class="bb9" style="font-size: 15px;"
										href="/cnc/forgotPasswordView.do">비밀번호가 생각나지 않으세요?</a>
								</div>
								<div>
									<button id="loginBtn">로그인</button>
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