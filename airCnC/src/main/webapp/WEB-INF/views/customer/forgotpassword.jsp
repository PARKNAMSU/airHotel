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
<title>로그인</title>
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
					<c:catch>
						<c:choose>
							<c:when test="${login_session eq null}">
								<li class="item"><a
									href="/Mainwork/html/hostresgister.html">호스트 </a></li>
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
										<a href="javascript:void(0)"
											onclick="document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">공지사항</a>
									</p>
								</li>
							</c:when>
							<c:otherwise>
								<script>location.href = "/cnc/indexView.do";</script>
							</c:otherwise>
						</c:choose>
					</c:catch>
				</ul>
			</div>
		</div>
	</header>
	<!-- header-end -->
	<form action="" accept-charset="utf-8" name="" method="POST">
		<div class="container" style="padding-top: 12.5%;">
			<div class="pwtitle">
				<label for="" style="font-size: 45px;">비밀번호 재설정</label><br /> <label
					for="">가입되어 있는 이메일 주소를 입력해주세요.</label>
			</div>
			<div class="emailbox">
				<input type="text" placeholder="이메일" />
			</div>
			<ul style="color: black;">
				<li>전송된 메일로 인증을 완료하면 임시 비밀번호가 발급됩니다.</li>
				<li>인증 메일은 발송 후 24시간 내에만 유효합니다.</li>
			</ul>
			<a href=""><button type="submit">비밀번호 재설정</button></a>
		</div>
	</form>
</body>
</html>