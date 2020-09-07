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
<title>호스트 신청</title>
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
	// 호스트 신청 버튼.
	$(document).on("click","#reg_submit",function() {
		var getData;
		var regExp = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; // email 유효성검사
		var hanChecked = /^[가-힝a-zA-Z]{2,15}$/; // 한글 유효성검사(2자리 이상 15자리 이하)
		var idChecked = /^[0-9a-zA-Z]{5,15}$/; // 아이디 유효성검사(5자리 이상 15자리 이하)
		var phoneChecked = /^\d{3}-\d{3,4}-\d{4}$/; // 전화번호 유효성 검사.

		if ($("#hostEmail").val()) {
			if (!regExp.test($("#hostEmail").val())) {
				alert("이메일 주소가 유효하지 않습니다");
				$("#hostEmail").focus();
				return false;
			}
		}
		if (!phoneChecked.test($("#hostPhone").val())) {
			alert("전화번호가 잘못 되었습니다.");
			$("#hostPhone").focus();
			return false;
		}
		if (!$("#hostId").val()) {
			alert("아이디를 입력 하세요.");
			$("#hostId").focus();
			return false;
		} else if (!idChecked.test($("#hostId").val())) {
			alert("아이디는 5자 ~ 15자리 사이로 만들어주세요.");
			$("#hostId").focus();
			return false;
		} else if (!$("#hostName").val()) {
			alert("이름을 입력 하세요.");
			$("#hostName").focus();
			return false;
		} else if (!hanChecked.test($("#hostName").val())) {
			alert("이름이 잘못 되었습니다.");
			$("#hostName").focus();
			return false;
		} else if (!$("#hostEmail").val()) {
			alert("이메일을 입력하세요.");
			$("#hostEmail").focus();
			return false;
		} else if (!$("#hostPassword").val()) {
			alert("비밀번호를 입력하세요.");
			$("#hostPassword").focus();
			return false;
		} else if(!document.regForm.host_account_name.value == "-은행을 선택하세요-" || document.regForm.host_account_name.value == ""){ 
			alert("은행을 선택하세요.");
			return false;
		} else if(!$("#hostAccount").val()){
			alert("계좌번호를 입력하세요.");
			$("#hostAccount").focus();
			return false;
		} else {
			getData = "complate";
			alert("호스트 신청이 완료되었습니다.");
		}
		if (getData == "complate") {
			document.getElementById("regForm").submit();
		}
	});
</script>
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
			<a href="/cnc/indexView.do"><img alt="" src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1">
				<ul id="menuItems">	
					<li class="item"><p><a href="/cnc/selectBoardList.do">공지사항</a></p></li>
					<li class="item"><a href="myHouse.do">호스트</a></li>
					<li class="item"><p><a href="/cnc/logout.do">로그아웃</a></p></li>
				</ul>
			</div>
		</div>
	</header>
	</c:if>
	<form action="/cnc/hostRegister.do" method="post" id="regForm" name="regForm" enctype="multipart/form-data">
		<div class="loginform" style="text-align: center;">
			<div class="leftform">
				<h2 style="padding-top: 30px; font-size: 40px; font-weight: bold;">호스트 신청</h2>
				<br><br>
				<h5 style="font-size: 25px; font-weight: bold;">아이디</h5>
				<div class="input_id">
					<span>
						<input class="bb6" type="text" id="hostId" name="host_id" value="${login_session}" readonly="readonly">
					</span>
				</div>
				<div style="padding-top: 5%;"></div>
				<div class="input_password">
				<h5 style="font-size: 25px; font-weight: bold;">비밀번호</h5>
					<span>
						<input class="ipassword" type="password"id="hostPassword" name="host_password" value="${customerPassword}" readonly="readonly">
					</span>
				</div>
				<div style="padding-top: 5%;"></div>
				<div class="input_phone">
				<h5 style="font-size: 25px; font-weight: bold;">연락처</h5>
					<span>
						<input class="itel" type="tel" id="hostPhone" name="host_phone" maxlength="13" value="${customerPhone}" readonly="readonly">
					</span>
				</div>
				<div style="padding-top: 5%;"></div>
				<div class="input_name">
				<h5 style="font-size: 25px; font-weight: bold;">이름</h5>
					<span>
						<input class="iname" type="text" id="hostName" name="host_name" value="${customerName}" readonly="readonly">
					</span>
				</div>
				<div style="padding-top: 5%;"></div>
				<div class="input_email">
				<h5 style="font-size: 25px; font-weight: bold;">이메일</h5>
					<span>
						<input class="iemail" type="email" id="hostEmail" name="host_email" value="${customerEmail}" readonly="readonly">
					</span>
					<br>
				</div>
			</div>
			<div class="rightform">
				<h3 style="padding-top: 35px; font-size: 25px; font-weight: bold;">프로필 사진 추가</h3>
				<br><br>
				<h4>프로필 사진을 요청하는 게스트도 있지만,기본적으로 호스트의 사진을 볼수 있습니다.</h4>
				<div style="padding-top: 5%;"></div>
				<div id="image_container" style="text-align: center;">
					<c:if test="${fdata.value.customer_image eq 'profile.png'}">
						<img width="200" height="250" id="img" name="host_image" src="${pageContext.request.contextPath}/resources/images/profile.png"/>
					</c:if>
					<c:if test="${fdata.value.customer_image ne 'profile.png'}">
						<img width="200" height="250" id="img" name="host_image" src="/cnc/display.do?name=${customerImage}"/>
					</c:if>
				</div>
				<br>	
				<div class="filebox">
					<label for="image" style="font-size: 25px;">첨부할 사진을 선택하세요</label>
					<input type="file" class="multi" id="image" name="host_photo" accept="image/*" max="1" onchange="readURL(this);"/>
				</div>
				<div class="input_account">
					<h3 style="padding-top: 35px; font-size: 25px; font-weight: bold;">계좌번호 등록</h3>
					<div style="padding-top: 5%;"></div>
					<span>
						<select name="host_account_name" class="hostAccountName" style="width:450px;height:45px;">
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
					<span><input class="iauth" type="text" id="hostAccount" name="host_account" placeholder="&nbsp;&nbsp;계좌번호 입력 ('-'제외)" maxlength="14"></span> 
				</div>
				<br>
			</div>
		</div>
		<div class="register1">
			<button id="reg_submit">호스트 신청하기</button>
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