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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
    />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript">
	let idCheck = false;
	let emailSendCheck = false;
	let emailAuthCheck = false;
	let blacklistEmailCheck = false;

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
					} else if (data == 0) {
						$("#idCheckBtn").attr("value", "Y");
						idCheck = true;
						alert("사용 가능한 아이디입니다.");
					}
				}
			});
		}
	});

	// 이메일 유효성 검사 조건문. 이메일 발송 버튼 클릭 이벤트.
	$(document).on("click", "#emailBtn", function() {
		if ($("#customerEmail").val() == "") {
			alert("이메일을 입력하세요.");
			$("#customerEmail").focus();
		}else{
			$.ajax({
				type : "post",
				url : "createEmailCheck.do",
				async: false,
				data : $("#regForm").serialize(),
				success : function(data) {
					if (data == "blacklist") {
						alert("회원가입할 수 없는 이메일 계정입니다.");
					} else if(data == "complate") {
						alert("인증번호 발송 성공")
						emailSendCheck = true;
						blacklistEmailCheck = true;
					} else if (data == "fail") {
						alert("인증번호 발송 실패");
					}
				},
				error : function(data) {
					alert("인증번호 발송에 실패하였습니다.");
				}
			});
		}
	});

	/* 이메일 인증번호 입력 후 인증 버튼 클릭 이벤트. */
	$(document).on("click", "#emailAuthBtn", function() {
		if ($("#customerKey").val() == "") {
			alert("인증번호를 입력하세요.");
			$("#customerKey").focus();
		}else{
			$.ajax({
				type : "post",
				url : "emailAuth.do",
				async: false,
				data : {
					"customer_key" : $("#customerKey").val()
				},
				success : function(data) {
					if (data == "complate") {
						alert("인증이 완료되었습니다.")
						emailAuthCheck = true;
					} else if (data == "false") {
						alert("인증번호를 잘못 입력하셨습니다.")
					}
				}
			});	
		}
	});

	// 회원가입 버튼.
	$(document).on("click","#reg_submit",function() {
		var getData;
		var regExp = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; // email 유효성검사
		var hanChecked = /^[가-힝a-zA-Z]{2,15}$/; // 한글 유효성검사(2자리 이상 15자리 이하)
		var idChecked = /^[0-9a-zA-Z]{5,15}$/; // 아이디 유효성검사(5자리 이상 15자리 이하)
		var phoneChecked = /^\d{3}-\d{3,4}-\d{4}$/; // 전화번호 유효성 검사.

		if (!$("#customerId").val()) {
			alert("아이디를 입력 하세요.");
			$("#customerId").focus();
			return false;
		} else if (idCheck == false) {
			alert("아이디 중복체크를 해주세요.");
			$('#idCheckBtn').focus();
			return false;
		} else if (!idChecked.test($("#customerId").val())) {
			alert("아이디는 5자 ~ 15자리 사이로 만들어주세요.");
			return false;
		} else if (!$("#customerPassword").val()) {
			alert("비밀번호를 입력하세요.");
			$("#customerPassword").focus();
			return false;
		} else if ($("#customerPassword").val().length > 16 || $("#customerPassword").val().length < 8) {
			alert("비밀번호는 8 ~ 16 자리로 입력해주세요.");
			return false;
		} else if (!$("#customerPhone").val()) {
			alert("전화번호를 입력하세요.");
			$("#customerPhone").focus();
			return false;
		} else if (!phoneChecked.test($("#customerPhone").val())) {
			alert("전화번호가 잘못 되었습니다.");
			$("#customerPhone").focus();
			return false;
		} else if (!$("#customerName").val()) {
			alert("이름을 입력 하세요.");
			$("#customerName").focus();
			return false;
		} else if (!hanChecked.test($("#customerName").val())) {
			alert("이름이 잘못 되었습니다.");
			$("#customerName").focus();
			return false;
		} else if(!document.regForm.customer_refund_bank.value == "-은행을 선택하세요-" || document.regForm.customer_refund_bank.value == ""){ 
			alert("은행을 선택하세요.");
			return false;
		} else if(!$("#customerRefundAccount").val()){
			alert("계좌번호를 입력하세요.");
			$("#customerRefundAccount").focus();
			return false;
		} else if (!$("#customerEmail").val()) {
			alert("이메일을 입력하세요.");
			$("#customerEmail").focus();
			return false;
		} else if (!regExp.test($("#customerEmail").val())) {
			alert("이메일 주소가 유효하지 않습니다");
			$("#customerEmail").focus();
			return false;
		} else if (emailSendCheck == false) {
			alert("인증코드 발송을 완료해주세요.");
			$("#customerEmail").focus();
			return false;
		} else if (emailAuthCheck == false) {
			alert("이메일 인증을 완료해주세요.");
			$("#customerKey").focus();
			return false;
		} else if (blacklistEmailCheck == false) {
			alert("회원가입 불가한 이메일 계정입니다.");
			$("#customerEmail").focus();
			return false;
		} else {
			getData = "complate";
			alert("회원가입이 완료되었습니다.");
		}
		if (getData == "complate") {
			document.getElementById("regForm").submit();
		}
	});
</script>
</head>
<body>
	<!-- header-start -->
	<c:if test="${login_session eq null}">
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
	<c:if test="${login_session ne null}">
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
	<form action="/cnc/registerCheck.do" method="post" id="regForm" name="regForm" enctype="multipart/form-data">
		<div class="loginform" style="text-align: center; padding-bottom: 50px">
			<div class="leftform">
				<h3 style="padding-top: 35px; font-size: 25px; font-weight: bold;">회원가입</h3>
				<br> <br>
				<div class="input_id">
					<span> <input class="bb6" type="text" name="customer_id"
						id="customerId" placeholder="&nbsp;&nbsp;아이디 입력">
					</span>
					<button type="button" class="idCheckBtn" id="idCheckBtn" value="N">중복확인</button>
				</div>
				<div class="input_password">
					<span> <input class="ipassword" type="password"
						id="customerPassword" name="customer_password"
						placeholder="&nbsp;&nbsp;비밀번호 설정">
					</span>
				</div>
				<div class="input_phone">
					<span><input class="itel" type="tel" id="customerPhone"
						placeholder="&nbsp;&nbsp;전화번호(예:010-0000-0000)"
						name="customer_phone" maxlength="13"></span>
				</div>
				<div class="input_name">
					<span> <input class="iname" type="text" name="customer_name"
						id="customerName" placeholder="&nbsp;&nbsp;이름(예:홍길동)">
					</span>
				</div>
				<div class="input_account">
					<h3 style="padding-top: 35px; font-size: 25px; font-weight: bold;">환불 계좌번호 등록</h3>
					<div style="padding-top: 5%;"></div>
					<span>
						<select name="customer_refund_bank" class="customerRefundBank" style="width:89%; height:45px;">
					       <option value=''>-은행을 선택하세요-</option>
					       <option value="카카오뱅크">카카오뱅크</option>
					       <option value="케이뱅크">케이뱅크</option>
					       <option value='기업은행'>기업은행</option>
					       <option value="KDB산업은행">KDB산업은행</option>
					       <option value='국민은행'>국민은행</option>
					       <option value='우리은행'>우리은행</option>
					       <option value='SC제일은행'>SC제일은행</option>
					       <option value='한국시티은행'>한국시티은행</option>
					       <option value='하나은행'>하나은행</option>
					       <option value='신한은행'>신한은행</option>
					       <option value='NH농협은행'>NH농협은행</option>
					       <option value='SH수협은행'>SH수협은행</option>					       
					       <option value='대구은행'>대구은행</option>
					       <option value='부산은행'>부산은행</option>
					       <option value='광주은행'>광주은행</option>
					       <option value='제주은행'>제주은행</option>
					       <option value='전북은행'>전북은행</option>
					       <option value='경남은행'>경남은행</option>			       
					       <option value='새마을금고'>새마을금고</option>
					    </select>
					</span>
					<br>
					<span><input class="iauth" type="text" id="customerRefundAccount" name="customer_refund_account" placeholder="&nbsp;&nbsp;계좌번호 입력 ('-'제외)" maxlength="14"></span> 
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
				<div style="padding-top: 5%;"></div>
				<div id="image_container" style="text-align: center;">
					<img width="200" height="250" id="img" name="customer_image" src="${pageContext.request.contextPath}/resources/images/profile.png">
				</div>
				<br>
				<div class="filebox">
					<label for="image" style="font-size: 25px;">첨부할 사진을 선택하세요</label>
					<input type="file" class="multi" id="image" name="customer_photo" accept="image/*" max="1" onchange="readURL(this);"/>
				</div>
			
				<div class="input_email">
					<span> <input class="iemail" type="email" id="customerEmail"
						name="customer_email" placeholder="&nbsp;&nbsp;이메일 주소">
					</span> <br>
					<input type="button" id="emailBtn" value="인증번호 발송" style="padding-top: 10px; font-size: 25px; font-weight: bold; width: 89%; color: white; display: inline-block; width: 89%; height: auto; background-color: #ff5a5f; border-radius: 5px; font-weight: 300; font-size: 30px; text-decoration: none; padding: 8px; border: none; margin-top: 18px; margin-bottom: 25px; text-align: center;"/>
					<br> <span> <input class="iauth" type="text"
						id="customerKey" name="customer_key" placeholder="&nbsp;&nbsp;인증번호">
					</span> <br> 
					<input id="emailAuthBtn" type="button" style="padding-top: 10px; font-size: 25px; font-weight: bold; width: 89%; color: white; display: inline-block; width: 89%; height: auto; background-color: #ff5a5f; border-radius: 5px; font-weight: 300; font-size: 30px; text-decoration: none; padding: 8px; border: none; margin-top: 18px; margin-bottom: 25px; text-align: center;" value="이메일 인증">
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
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#img').attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</html>