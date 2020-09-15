<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<!-- 
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
	href="${pageContext.request.contextPath}/resources/css/pwfint.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/SUHWAN.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/hostregister.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet" />
-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/SUHWAN.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/hostregister.css" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" />
<title>임시 비밀번호 발송</title>
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
<style type="text/css">
.form-gap {
    padding-top: 70px;
}
</style>
</head>
<body>
	<!-- header-start -->
	<c:if test="${login_session eq null }">
		<header class="logo">
			<span> <a href="/cnc/indexView.do"> <i
					class="fas fa-registered"
					style="font-size: 35px; padding-left: 20px; float: left; color: #ff5a5f;"></i>
			</a>
			</span> <label for="fas fa-question" style="font-size: 40px;">임시
				비밀번호 발송 </label>
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
	<!-- header-end -->
	<div class="form-gap"></div>
	<div class="container">
		<div class="row" style="margin-right: 45%;">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default" style="width: 700px;">
					<div class="panel-body">
						<div class="text-center">
							<h3>
								<i class="fa fa-lock fa-4x"></i>
							</h3>
							<h2 class="text-center">비밀번호를 잊으셨나요?</h2>
							<p>계정으로 사용하는 이메일 주소를 입력하시면, 임시 비밀번호를 전송해 드립니다.</p>
							<div class="panel-body">
								<form id="sendEmail" action="/cnc/sendPassword.do" class="form"
									method="post">
									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope color-blue"></i></span> <input
												id="customerEmail" name="customer_email"
												placeholder="이메일 주소" class="form-control" type="email">
										</div>
									</div>
									<div class="form-group">
										<input id="sendPasswordBtn" name="recover-submit"
											class="btn btn-lg btn-primary btn-block" value="임시 비밀번호 발송"
											type="submit">
									</div>
									<div id="message">
										<c:if test="${sendMessage eq 'success'}">
											<p style="color: blue; font-size: 25px;">
												임시 비밀번호를 발송해드렸습니다.<br>로그인하여 비밀번호를 변경해주세요.
											</p>
										</c:if>
										<c:if test="${sendMessage eq 'fail'}">
											<p style="color: red; font-size: 25px;">회원가입 되어 있지 않은
												이메일입니다.</p>
										</c:if>
										<c:if test="${sendMessage eq 'error'}">
											<p style="color: red; font-size: 25px;">임시 비밀번호 발송 오류</p>
										</c:if>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>