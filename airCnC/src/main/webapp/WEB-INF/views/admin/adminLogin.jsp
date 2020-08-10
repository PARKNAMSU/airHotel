<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/adminlogin.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
<title>관리자 로그인</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/adminLogin.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnLogin").click(function(){
		var adminId = $('#adminId').val();
		var adminPw = $('#adminPassword').val();
		if ($("#adminId").val() == "") {
			alert("아이디를 입력 하세요.");
			$("#adminId").focus();
		}else if ($("#adminPassword").val() == "") {
			alert("비밀번호를 입력 하세요.");
			$("#adminPassword").focus();
		}else{
			document.getElementById("loginForm").submit();
		}
	})
})
</script>
</head>
<body>
	<!-- header-start -->
	<header class="menudiv1" style="position: sticky;">
		<div class="menudiv2-1">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/logo2.png" />
		</div>
	</header>
	<!-- header-end -->
	<form name="loginForm" action="adminLogin.mdo" method="post" id="loginForm"> 
	<div class="container" style="text-align: center;">
		<img src="${pageContext.request.contextPath}/resources/images/admin/adminregister.jpg" alt="" />
		<div class="adminm">
			<div class="admin1" style="padding-bottom: 30px;">
				<label for="admin">관리자 로그인</label>
			</div>
			<div class="adminid" style="padding-bottom: 30px;">
				<input type="text" name="admin_id" id="adminId" placeholder="관리자 계정"/>
			</div>
			<div class="adminpw">
				<input type="password" name="admin_password" id="adminPassword" placeholder="비밀번호"/>
			</div>
		</div>
		<div class="btnadmin">
			<c:if test="${msg == 'fail'}">
				<div style="color: red">
					아이디 또는 비밀번호가 일치하지 않습니다.
				</div>
			</c:if>
			<button type="button" class="button" id="btnLogin" name="btnLogin">로그인</button>
		</div>
	</div>
	</form>
</body>
</html>