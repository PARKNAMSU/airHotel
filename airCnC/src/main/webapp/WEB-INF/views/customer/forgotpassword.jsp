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
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>로그인</title>
<script type="text/javascript">
//회원가입 버튼.
$(document).on("click","#sendEmailBtn",function() {
	var regExp = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; // email 유효성검사.
	if ($("#customerEmail").val()) {
		if (!regExp.test($("#customerEmail").val())) {
			alert("이메일 주소가 유효하지 않습니다");
			$("#customerEmail").focus();
			return false;
		}
	}
	if (!$("#customerEmail").val()) {
		alert("이메일을 입력하세요.");
		$("#customerEmail").focus();
		return false;
	}
	$.ajax({
		type : "post",
		url : "findPassword.do",
		data : {
			"customerEmail" : $("#customerEmail").val()
		},
		success : function(data) {
			if (data == 0) {
				alert("가입되어 있지 않은 이메일 계정입니다.");
			}else if(data == 1){
				alert("새 비밀번호 발송에 성공하였습니다.")
			}else{
				alert("새 비밀번호 발송에 실패하였습니다.")
			}
		},
		error : function(data) {
			alert("에러");
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
				src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1">
				<ul id="menuItems">
					<c:if test="${login_session eq null && sessionScope.token eq null}">
						<li class="item"><a href="/Mainwork/html/hostresgister.html">호스트</a></li>
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
					</c:if>
					<c:if test="${login_session ne null && sessionScope.token ne null}">
						<li class="item"><a href="/Mainwork/html/hostresgister.html">호스트</a></li>
						<li class="item">
							<p>
								<a href="/cnc/selectBoardList.do">공지사항</a>
							</p>
						</li>
						<c:choose>
							<c:when test="${login_session ne null}">
								<li class="item">
									<p><a href="/cnc/logout.do">로그아웃</a></p>
								</li>
							</c:when>
							<c:when test="${sessionScope.token ne null}">
								<li class="item">
									<p><a href="/cnc/kakaologout.do">로그아웃</a></p>
								</li>
							</c:when>
							<c:when test="${sessionScope ne null}">
								<li class="item">
									<p><a href="/cnc/kakaologout.do">로그아웃</a></p>
								</li>
							</c:when>
						</c:choose>
					</c:if>
				</ul>
			</div>
		</div>
	</header>
	<!-- header-end -->
	<form action="/cnc/findPassword.do" accept-charset="utf-8" id="passwordForm" method="POST">
		<div class="container" style="padding-top: 12.5%;">
			<div class="pwtitle">
				<label for="" style="font-size: 38px;">비밀번호를 잊으셨나요?</label><br/> 
				<label for="">계정으로 사용하는 이메일 주소를 입력하시면, 비밀번호 재설정 링크를 전송해 드립니다.</label>
			</div>
			<div class="emailbox">
				<input id="customerEmail" name="customer_email" type="text" placeholder="이메일" />
			</div>
			<button id="sendEmailBtn">비밀번호 재설정</button>
		</div>
	</form>
</body>
</html>