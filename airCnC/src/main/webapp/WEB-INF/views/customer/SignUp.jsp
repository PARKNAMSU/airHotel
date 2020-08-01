<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript">
	var idCheck = false;
	var emailSendCheck = false;
	var emailAuthCheck = false;
	
	// 아이디 중복 체크.
	$(document).on("click", "#idCheckBtn", function() {
		if ($("#customerId").val() == "") {
			alert("아이디를 입력하세요.");
			$("#customerId").focus();
		} else {
			$.ajax({
				url : "idCheck.do",
				type : "post",
				dataType : "html",
				data : $("#regForm").serialize(),
				success : function(data) {
					if (data == 1) {
						alert("사용중인 아이디입니다.");
						idCheck = true;
					} else if (data == 0) {
						$("#idCheckBtn").attr("value", "Y");
						alert("사용 가능한 아이디입니다.");
					}
				}
			});
		}
	});
	
	// 이메일 유효성 검사 조건문.
	$(document).on("click", "#emailBtn", function(){
		if(!$.trim($("#customerId").val())){
			alert("아이디를 먼저 입력해 주세요.");
			return false;
		}
		if(!$.trim($("#customerEmail").val())){
			alert("이메일을 입력하세요.");
			return false;
		}
		
		if ($("#customerEmail").val() != "") {
			var emailChecked = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; // 이메일 유효성검사
			if (!emailChecked.test($("#customerEmail").val())) {
				alert("잘못된 이메일 주소입니다.");
				return false;
			}
		}
		$.ajax({
			type:"post",
			url:"createEmailCheck.do",
			data : {"customerEmail" : $("#customerEmail").val()},
			success:function(data){
				if(data == true){
					alert("인증번호 발송 완료");
					emailSendCheck = true;
				}else if(data == false){
					alert("인증번호 발송 실패")
				}
			},
			error:function(data){
				alert("인증번호 발송에 실패하였습니다.");
			}
		});
	});	

	/* 이메일 인증번호 입력 후 인증 버튼 클릭 이벤트. */
	$(document).on("click", "#emailAuthBtn", function(){
		$.ajax({
			type:"post",
			url:"emailAuth.do",
			data:{"customerKey" : $("#customerKey").val()},
			success:function(data){
				if(data == "complete"){
					alert("인증이 완료되었습니다.");
					emailAuthCheck = true;
				}else if(data == "false"){
					alert("인증번호를 잘못 입력하셨습니다.")
				}
			},
			error:function(data){
				alert("에러가 발생했습니다.");
			}
		});
	});
	
	// 회원가입 버튼
	$(document).on("click", "#reg_submit", function() {
		var validate = true;
		var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; // email 유효성검사
		var hanChecked = /^[가-힝a-zA-Z]{2,15}$/; // 한글 유효성검사(2자리 이상 15자리 이하)
		var idChecked = /^[0-9a-zA-Z]{5,15}$/; // 아이디 유효성검사(5자리 이상 15자리 이하)
		//var phoneChecked = /^[0-9-]{1,16}$/;
		var phoneChecked = /^\d{3}-\d{3,4}-\d{4}$/;
		
		if ($("#customerEmail").val()) {
			if (!regExp.test($("#customerEmail").val())) {
				alert("이메일 주소가 유효하지 않습니다");
				$("#customerEmail").focus();
				return false;
			}
		}
		if ($("#customerPhone").val()) {
			if (!phoneChecked.test($("#customerPhone").val())) {
				alert("전화번호가 잘못 되었습니다.");
				$("#customerPhone").focus();
				return false;
			}
		}
		if (!$("#customerId").val()) {
			alert("아이디를 입력 하세요.");
			$("#customerId").focus();
			validate = false;
			return false;
		} else if (idCheck == false) {
			alert("아이디 중복체크를 해주세요.");
			$('#idCheckBtn').focus();
			return false;
		} else if (!idChecked.test($("#customerId").val())) {
			alert("아이디는 5자 ~ 15자리 사이로 만들어주세요.");
			return false;
		} else if (!$("#customerName").val()) {
			alert("이름을 입력 하세요.");
			$("#customerName").focus();
			return false;
		} else if (!hanChecked.test($("#customerName").val())) {
			alert("이름이 잘못 되었습니다.");
			$("#customerName").focus();
			return false;
		} else if (!$("#customerEmail").val()) {
			alert("이메일을 입력하세요.");
			$("#customerEmail").focus();
			return false;
		} else if (emailSendCheck == false) {
			alert("인증코드 발송을 완료해주세요.");
			$("#emailBtn").focus();
			return false;
		} else if (emailAuthCheck == false) {
			alert("이메일 인증을 완료해주세요.");
			$("#emailAuthBtn").focus();
			return false;
		} else if (!$("#customerPassword").val()) {
			alert("비밀번호를 입력하세요.");
			$("#customerPassword").focus();
			return false;
		} else if ($("#customerPassword").val().length > 16 || $("#customerPassword").val().length < 8) {
			alert("비밀번호는 8 ~ 16 자리로 입력해주세요.");
			return false;
		} else {
			return true;
		}
		
		$.ajax({
			type:"post",
			url:"registerCheck.do",
			data:$("#regForm").serialize(),
			success:function(data){
				if(data=="complate"){
					alert("회원가입이 완료되었습니다.");
				}else if(data == "false"){
					alert("회원가입이 실패하였습니다.")
				}
			},
			error:function(data){
				alert("에러가 발생했습니다.");
			}
		});
	});
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
				<br> <br>
				<div class="input_id">
					<span> <input class="bb6" type="text" name="customerId"
						id="customerId" placeholder="&nbsp;&nbsp;아이디 입력" required>
					</span>
					<button type="button" class="idCheckBtn" id="idCheckBtn" value="N">중복확인</button>
				</div>
				<div class="input_password">
					<span> <input class="ipassword" type="password" id="customerPassword"
						name="customerPassword" placeholder="&nbsp;&nbsp;비밀번호 설정" required>
					</span>
				</div>
				<div class="input_phone">
					<span><input class="itel" type="tel" id="customerPhone"
						placeholder="&nbsp;&nbsp;전화번호(예:010-0000-0000)" name="customerPhone"
						maxlength="13" required> </span>
				</div>
				<div class="input_name">
					<span> <input class="iname" type="text" name="customerName" id="customerName"
						placeholder="&nbsp;&nbsp;이름(예:홍길동)" required>
					</span>
				</div>

				<div style="padding-top: 30px;">
					<div class="loginMove" style="text-align: center">
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
						maxlength="2" onchange="setThumbnail(event);" name="customerImage" />
				</div>
				<div class="input_email">
					<span> <input class="iemail" type="email" id="customerEmail"
						name="customerEmail" placeholder="&nbsp;&nbsp;이메일 주소" required>
					</span> <br>
					<button id="emailBtn"
						style="padding-top: 10px; font-size: 25px; font-weight: bold; width: 89%;">인증번호
						발송</button>
					<br> <span> <input class="iauth" type="text"
						id="customerKey" name="customerKey" placeholder="&nbsp;&nbsp;인증번호"
						required>
					</span> <br>
					<button id="emailAuthBtn"
						style="padding-top: 10px; font-size: 25px; font-weight: bold; width: 89%;">이메일
						인증</button>
					<!-- <input type="hidden" path="random" id="random" value="${random}" /> -->
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