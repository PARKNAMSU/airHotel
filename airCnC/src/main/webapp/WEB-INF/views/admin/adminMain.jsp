<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/adminlogin.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/adminLogin.js"></script>
<title>관리자 메인</title>
</head>
<body>
	<!-- header-start -->
	<header class="menudiv1" style="position: sticky;">
		<div class="menudiv2-1">
			<img alt="" src="${pageContext.request.contextPath}/resources/image/trip/logo2.png" />
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1">
				<ul id="menuItems">
					<li class="item">계정관리</li>
					<li class="item">통계</li>
					<li class="item">숙소관리</li>
					<li class="item">로그관리</li>
					<li class="item">
						<c:choose>
							<c:when test="${sessionScope.adminId == null}">
								<a href="${pageContext.request.contextPath}/admin/adminLoginView.mdo">로그인</a>
							</c:when>
							<c:otherwise>
								${sessionScope.adminId}관리자 로그인 중.
								<a href="${pageContext.request.contextPath}/admin/logout.mdo">로그아웃</a>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
			</div>
		</div>
	</header>
	<!-- header-end -->
	<h1>관리자 홈페이지</h1>
</body>
</html>