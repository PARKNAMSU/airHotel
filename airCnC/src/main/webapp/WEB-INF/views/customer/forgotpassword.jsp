<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pwfint.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
    />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>로그인</title>
<script type="text/javascript">
$(document).on("click","#sendPasswordBtn",function() {
	var regExp = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; // email 유효성검사.
	if ($("#customerEmail").val() == "" || $("#customerEmail").val() == null) {
		alert("이메일을 입력하세요.");
		$("#customerEmail").focus();
		return false;
	}
	if (!regExp.test($("#customerEmail").val())) {
		alert("이메일 주소가 유효하지 않습니다");
		$("#customerEmail").focus();
		return false;
	}
	$.ajax({
		type : "post",
		url : "sendPassword.do",
		data : $("#sendEmail").serialize(),
		success : function(data) {
			console.log(data);
		},
		error : function(data) {
			alert("인증번호 발송에 실패하였습니다.");
		}
	});
});
</script>
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
        <label for="fas fa-question" style="font-size: 40px;"
          >회원가입
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
						<p><a href="/cnc/logout.do">로그아웃</a></p>
					</li>
				</ul>
			</div>
		</div>
	</header>
	</c:if>
	<!-- header-end -->
	<form action="/cnc/sendPassword.do" accept-charset="utf-8" id="sendEmail" method="POST">
		<div class="container1" style="padding-top: 5%;">
			<div class="pwtitle">
				<label for="" style="font-size: 38px;">비밀번호를 잊으셨나요?</label><br>
				<div style="padding-top: 1%;"></div> 
				<label for="">계정으로 사용하는 이메일 주소를 입력하시면, 임시 비밀번호를 전송해 드립니다.</label>
			</div>
			<div style="padding-top: 5%;"></div>
			<div class="emailbox">
				<input id="customerEmail" name="customer_email" type="text" placeholder="이메일" />
			</div>
			<div style="padding-top: 1%;"></div>
			<div id="message">
				<c:if test="${sendMessage eq 'success'}">
					<p style="color: blue; font-size: 25px;">임시 비밀번호를 발송해드렸습니다.<br>로그인하여 비밀번호를 변경해주세요.</p>
				</c:if>
				<c:if test="${sendMessage eq 'fail'}">
					<p style="color: red; font-size: 25px;">회원가입 되어 있지 않은 비밀번호입니다.</p>
				</c:if>
				<c:if test="${sendMessage eq 'error'}">
					<p style="color: red; font-size: 25px;">임시 비밀번호 발송 오류.</p>
				</c:if>
			</div>
			<div style="padding-top: 1%;"></div>
			<button id="sendPasswordBtn" style="width: 34%;">비밀번호 재설정</button>
			<div class="moveLoginForm">
				<a href="/cnc/loginView.do" style="color: black; font-size: 35px">로그인하러 가기</a>
			</div>
		</div>
	</form>
</body>
</html>