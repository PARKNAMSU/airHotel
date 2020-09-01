<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sideMenu.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chat.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hostregister.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hostdetail1.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
// 회원정보 수정 버튼.
$(document).on("click","#customerInfoUpdateBtn",function() {
	var blacklistEmailCheck = true;
	var regExp = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; // email 유효성검사
	var hanChecked = /^[가-힝a-zA-Z]{2,15}$/; // 한글 유효성검사(2자리 이상 15자리 이하)
	var phoneChecked = /^\d{3}-\d{3,4}-\d{4}$/; // 전화번호 유효성 검사.

	if ($("#customerName").val() == "") {
		alert("이름을 입력 하세요.");
		$("#customerName").focus();
		return false;
	} else if($("#customerPhone").val() == ""){
		alert("전화번호를 입력하세요.");
		$("#customerPhone").focus();
		return false;
	} else if (!hanChecked.test($("#customerName").val())) {
		alert("이름이 잘못 되었습니다.");
		$("#customerName").focus();
		return false;
	} else if ($("#customerEmail").val() == "") {
		alert("이메일을 입력하세요.");
		$("#customerEmail").focus();
		return false;
	} else if (blacklistEmailCheck == false) {
		alert("정보 수정이 불가한 이메일 계정입니다.");
		$("#customerEmail").focus();
		return false;
	} else if (!regExp.test($("#customerEmail").val())) {
		alert("이메일 주소가 유효하지 않습니다");
		$("#customerEmail").focus();
		return false;
	} else if (!phoneChecked.test($("#customerPhone").val())) {
		alert("전화번호가 잘못 되었습니다.");
		$("#customerPhone").focus();
		return false;
	}
});
</script>
<script>
	var responseMessage = "<c:out value="${resultMessage}"/>";
	if(responseMessage != ""){
	    alert(responseMessage);
	}
</script>
<title>내 정보 관리</title>
</head>
<body>
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
<div id="saveOK" class="alert alert-warning hidden" role="alert"></div>
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
						<li style="margin-bottom:20px;"><a href="passwordChangeView.do">비밀번호 변경</a></li>
						<li style="margin-bottom:20px;"><a href="reservationPage.do">예약한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="myFavoriteHouse.do">저장한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="getCuponList.do">쿠폰함</a></li>
						<li style="margin-bottom:20px;"><a href="chat.do">메세지</a></li>
					<c:choose>
						<c:when test="${social_type ne null}">
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
			<li class="menu"><a href="passwordChangeView.do"
				style="font-family: 'Jua', sans-serif;">비밀번호 변경</a></li>
			<li class="menu"><a href="reservationPage.do"
				style="font-family: 'Jua', sans-serif;">예약내역</a></li>
			<li class="menu"><a href="myFavoriteHouse.do"
				style="font-family: 'Jua', sans-serif;">저장한 숙소</a></li>
			<li class="menu"><a href="chat.do"
				style="font-family: 'Jua', sans-serif;">메세지</a></li>
			<li class="menu"><a href="customerWithdrawalView.do"
				style="font-family: 'Jua', sans-serif;">회원탈퇴</a></li>
			<li class="menu"><a href="#"
				style="font-family: 'Jua', sans-serif;">쿠폰함</a></li>
		</ul>
	</div>
	<form action="/cnc/customerInfoUpdate.do" method="post" id="regForm" enctype="multipart/form-data">
		<div class="loginform" style="text-align: center;">
			<div class="leftform">
				<h3 style="padding-top: 35px; font-size: 25px; font-weight: bold;">내 정보 수정</h3>
				<br>
				<br>
				<div class="inputId">
					<span> <input class="iid" type="text" name="customer_id"
						value="${login_session}" readonly="readonly">
					</span><br>
				</div>
				<div class="inputName">
					<span> <input class="iid" type="text" id="customerName" name="customer_name"
						value="${customerName}">
					</span>
				</div>
				<div class="inputPhone">
					<span> <input class="iid" type="tel" id="customerPhone" name="customer_phone"
						value="${customerPhone}" maxlength="13">
					</span>
				</div>
				<div class="inputEmail" style="margin-bottom: auto;">
					<span> <input class="iid" type="text" id="customerEmail" name="customer_email"
						value="${customerEmail}">
					</span>
				</div>
				<br>
			</div>
			<div class="rightform">
				<h3 style="padding-top: 35px; font-size: 25px; font-weight: bold;">프로필 사진 확인 및 수정</h3>
				<br>
				<br>
				<h4>등록했던 프로필 사진을 확인 또는 수정할수 있습니다.</h4>
				<div id="image_container" style="text-align: center;">
					<c:if test="${fdata.value.customer_image eq 'profile.png'}">
						<img width="200" height="250" id="img" name="customer_image" src="${pageContext.request.contextPath}/resources/images/profile.png"/>
					</c:if>
					<c:if test="${fdata.value.customer_image ne 'profile.png'}">
						<img width="200" height="250" id="img" name="customer_image" src="/cnc/display.do?name=${customerImage}"/>
					</c:if>
				</div>
				<br>	
				<div class="filebox">
					<label for="image" style="font-size: 25px;">첨부할 사진을 선택하세요</label>
					<input type="file" class="multi" id="image" name="customer_photo" accept="image/*" max="1" onchange="readURL(this);"/>
				</div>
			</div>
		</div>
		<button class="mypagebtn" id="customerInfoUpdateBtn" style="margin-top: 5%;">개인정보 수정</button>
	</form>
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