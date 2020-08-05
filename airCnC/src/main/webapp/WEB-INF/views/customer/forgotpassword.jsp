<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<link rel="shortcut icon" type="image/x-icon"
	href="/Mainwork/img/favicon.png" />
<link rel="stylesheet" type="text/css"
	href="/Mainwork/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="/Mainwork/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="/Mainwork/css/style.css" />
<link rel="stylesheet" type="text/css" href="/Mainwork/css/menu.css" />
<link rel="stylesheet" type="text/css" href="/Mainwork/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/Mainwork/css/footer.css" />
<link rel="stylesheet" type="text/css"
	href="/Mainwork/html/index/pwfint.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet" />
<title>로그인</title>
</head>
<body>
	<!-- header-start -->
	<header class="menudiv1">
		<div class="menudiv2-1">
			<img alt="" src="/Mainwork/images/logo2.png" />
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1">
				<ul id="menuItems">
					<li class="item">호스트 등록</li>
					<li class="item">회원가입</li>
					<li class="item">로그인</li>
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
			<ul>
				<li>전송된 메일로 인증을 완료하면 임시 비밀번호가 발급됩니다.</li>
				<li>인증 메일은 발송 후 24시간 내에만 유효합니다.</li>
			</ul>
			<a href=""><button type="submit">비밀번호 재설정</button></a>
		</div>
	</form>
</body>
</html>