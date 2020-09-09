<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>Travelo</title>
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png" />
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hostregister.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hostdetail.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	
	<link rel="stylesheet" type="text/javascript" href="${pageContext.request.contextPath}/resources/js/hostdetail.js" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/hostdetail.js"></script>
	<script type="text/javascript">
	function newHouseSubmit() {
		var f = document.hostchoose;
		f.submit();
	}
	</script>
	<style>
	span {
	color : black;
	}
	</style>
</head>
<body>
	<!--resiterform-->
	<c:url value="/1newhouse.do" var="actionUrl" />
	
	<form:form id="1newhouse" name="hostchoose" modelAttribute="house" method="GET" action="${actionUrl}">
		<div class="container">
			<div class="form">
				<div class="title">어떻게 시작하고 싶으세요?</div>
				<div class="host">
					<div class="newhost">
						<form:radiobutton path="newhouse" value="new1" />
						<span class="up">새로운 숙소</span> 
						<img src="${pageContext.request.contextPath}/resources/images/host/house1.png" />
					</div>
					<div class="hosting">
						<form:radiobutton path="newhouse" value="new2" />
						<span class="up">등록한 숙소</span> 
						<img src="${pageContext.request.contextPath}/resources/images/host/house1.png" />
					</div>
					
				</div>
				<div class="button" style="float: right;">
				 	<a href="#" onclick="newHouseSubmit();">next</a>
				</div>
			</div>
		</div>
	</form:form>	
	<!--registerform end-->

</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
</html>