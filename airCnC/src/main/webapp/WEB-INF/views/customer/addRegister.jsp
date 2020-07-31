<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>회원가입-프로필 등록</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon.png">
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
	href="${pageContext.request.contextPath}/resources/css/addregister.css">
<script type="text/javascript" src="../js/hostregister.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
</head>
<body>
	<!-- header-start -->
	<header class="menudiv1">
		<div class="menudiv2-1">
			<img alt=""
				src="${pageContext.request.contextPath}/resources/images/logo2.png" />
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1">
				<ul id="menuItems">
					<li class="item">호스트</li>
					<li class="item">회원가입</li>
					<li class="item" id="contents">로그인</li>
				</ul>
			</div>
		</div>
	</header>
	<!-- header-end -->

	<div class="container">
		<form action="registerCheck.do" method="post">
			<div class="addregister">
				<h3 style="padding-top: 35px; font-size: 25px; font-weight: bold;">프로필
					사진 추가</h3>
				<br>
				<h4>프로필 사진을 요청하는 호스트도 있지만, 이 경우에도 예약이 확정된 후에만 게스트의 사진을 볼수 있습니다.</h4>
				<div id="image_container" style="text-align: center;"></div>
				<div class="filebox">
					<label for="image">첨부할 사진을 선택하세요</label> <input type="file"
						class="multi" name="customerImage" id="image" accept="image/*"
						maxlength="2" onchange="setThumbnail(event);" />
				</div>

				<div class="addphone">
					<h3 style="padding-top: 35px; font-size: 25px; font-weight: bold;">전화번호
						인증하기</h3>
					<br> <label for="">010</label> - <input type="tel"
						placeholder="번호를 입력하세요" maxlength="8" name="customerPhone"
						pattern="[0-9]{4}[0-9]{4}"> <label for=""
						style="font-size: 20px;">인증하기</label>
				</div>
				<br><input class="registerSuccess" type="submit" value="가입  완료" style="font-size: 30px;" />
			</div>
		</form>
	</div>

</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<script>
    function setThumbnail(event) {
      var reader = new FileReader();
      reader.onload = function (event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        document.querySelector("div#image_container").appendChild(img);
      };
      reader.readAsDataURL(event.target.files[0]);
    }
  </script>
</html>
