<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sideMenu.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chat.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hostregister.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hostdetail1.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(e){
		$('#passwordChangeBtn').click(function(){	
			// 비밀번호 입력 확인.
			if($('#customerPassword').val() == ''){
				alert("비밀번호를 입력해 주세요.");
				$('#customerPassword').focus();
				return false;
			}else if($('#newPassword').val() == ''){
				alert("변경할 비밀번호를 입력해 주세요.")
				$('#newPassword').focus();
				return false;
			}else if($('#newPasswordCheck').val() == ''){
				alert("비밀번호 확인은 필수 사항입니다.");
				$('#newPasswordCheck').focus();
				return false;
			}else if ($("#newPassword").val().length > 16 || $("#newPassword").val().length < 8) {
				alert("비밀번호는 8 ~ 16 자리로 입력해주세요.");
				return false;
			}
			
			// 입력한 패스워드가 같은지 확인.
			if($('#newPassword').val() != $('#newPasswordCheck').val()){
				alert("비밀번호가 일치하지 않습니다.");
				$('#newPasswordCheck').focus();
				return false;
			}
			
			// 비밀번호 확인 후 변경.
			$.ajax({
				url: "checkPassword.do",
				type: "POST",
				async : false,
				data: {"customer_password":$("#customerPassword").val()},
				success: function(data){
					if(data == 0){
						alert("현재 비밀번호가 일치하지 않습니다.");
						$('#customerPassword').focus();
						return;
					}else{
						var result = confirm('정말 변경하시겠습니까?');
						if(result){
							alert("비밀번호가 정상적으로 변경되었습니다.\n변경된 비밀번호로 로그인 해주세요.");
							$('#uptFrm').submit();
						}
					}
				},
				error: function(){
					alert("서버 에러.");
				}
			});
		});
	});
</script>
</head>
<body>
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
			<div class="menudiv3-1" id="div1" style="float:left;">
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
			<div style="width:50px;height:50px;margin-left:1px;margin-top:10px;border-radius: 30px 30px 30px 30px;float:left;background-color:white;overflow:hidden;" id="myinfo">
				<c:choose>
					<c:when test="${my_image eq 'profile.png'}">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/profile.png" style="max-width:120%;max-height:120%;">
					</c:when>
					<c:otherwise>
						<img alt="" src="/cnc/display.do?name=${my_image}" style="max-width:120%;max-height:120%;">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div id="mydiv" style="display:none;margin-left:85%;z-index:100;width:200px;background-color:#d2d2d2;font-size:20px;border-radius: 15px 15px 15px 15px;font-family: 'Jua', sans-serif;" >
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
	<form id="uptFrm" action="/cnc/modifyPassword.do" method="post">
		<div class="container" style="padding-top: 10%;">
			<div class="pwtitle">
				<label for="" style="font-size: 38px;">비밀번호 변경</label><br/> 
				<label for="">암호는 8~20자여야 하며 공백을 포함해서는 안 됩니다.</label>
			</div>
			<div style="padding-top: 5%;"></div>
			<label for="pwd">현재 비밀번호</label>
			<div class="passwordBox">
				<input id="customerPassword" type="password" style="font-size: 25px;"/>
			</div>
			<div id="pwMsg">
				<p style="color: red; font-size: 25px;"></p>
			</div>
			<div style="padding-top: 3%;"></div>
			<label for="newPwd">새 비밀번호</label>
			<div class="passwordBox">
				<input id="newPassword" type="password" style="font-size: 25px;"/>
			</div>
			<div id="newPwMsg">
				<p style="color: red; font-size: 25px;"></p>
			</div>
			<div style="padding-bottom: 3%;"></div>
			<label for="confirmPwd">새 비밀번호 확인</label>
			<div class="passwordBox">
				<input id="newPasswordCheck" name="customer_password" type="password" style="font-size: 25px;"/>
			</div>
			<div id="newPwChkMsg">
				<p style="color: red; font-size: 25px;"></p>
			</div>
			<div style="padding-top: 3%;"></div>
			<button id="passwordChangeBtn">비밀번호 변경</button>
			<div style="padding-top: 3%;"></div>
			<div class="moveLoginForm">
				<a href="/cnc/forgotPasswordView.do" style="color: black; font-size: 35px">비밀번호를 잊으셨나요?</a>
			</div>
		</div>
	</form>
</body>
</html>