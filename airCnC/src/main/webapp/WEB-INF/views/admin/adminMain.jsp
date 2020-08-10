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
	<c:if test="${admin_session eq null}">
		<script type="text/javascript">location.href="/admin/adminLoginView.mdo"</script>
	</c:if>
	<!-- header-start -->
	<header class="menudiv1" style="position: sticky;">
		<div class="menudiv2-1">
			<img alt="" src="${pageContext.request.contextPath}/resources/image/trip/logo2.png" />
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1">
				<ul id="menuItems">
					<c:catch>
						<c:choose>
							<c:when test="${admin_session eq null}">
								<script>history.go(-1);</script>
							</c:when>
							<c:otherwise>
								<li class="item" ><a href="http://localhost:8080/cnc/blamelist.mdo">신고관리</a></li>
								<li class="item"><a href="http://localhost:8080/cnc/salesChart.mdo">통계</a></li>
								<li class="item"><a href="http://localhost:8080/cnc/getRegisterWaitingList.mdo">호스트관리</a></li>
								<li class="item"><a href="http://localhost:8080/cnc/logPage.mdo">로그관리</a></li>
								<li class="item"><a href="http://localhost:8080/cnc/makeCupon.mdo">쿠폰관리</a></li>
								<li class="item"><a href="http://localhost:8080/cnc/goNoticeListAdmin.mdo">게시판관리</a></li>
								<li class="item"><a href="/cnc/logout.mdo">로그아웃</a></li>	
							</c:otherwise>
						</c:choose>
					</c:catch>
				</ul>
			</div>
		</div>
	</header>
	<!-- header-end -->
	<h1>관리자 홈페이지</h1>
</body>
</html>