<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<!-- 
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/adminlogin.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hostregister.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/adminLogin.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin_login.css"/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/javascript/processWithforceStop.js"></script>
<title>관리자 로그인</title>
<script type="text/javascript">
$(function(){
	$("#btnLogin").click(function(){
		var adminId = $('#adminId').val();
		var adminPw = $('#adminPassword').val();
		if ($("#adminId").val() == "") {
			alert("아이디를 입력 하세요.");
			$("#adminId").focus();
			return false;
		}else if ($("#adminPassword").val() == "") {
			alert("비밀번호를 입력 하세요.");
			$("#adminPassword").focus();
			return false;
		}else{
			document.getElementById("loginForm").submit();
		}
	})
})
</script>
</head>
<body>
<div class="container">
    <div class="card card-login mx-auto text-center bg-dark">
        <div class="card-header mx-auto bg-dark">
            <span> <img src="${pageContext.request.contextPath}/resources/images/airbnb.png" class="w-75" alt="Logo"> </span><br/>
            <span class="logo_title mt-5">관리자 로그인</span>
        </div>
        <div class="card-body">
            <form name="loginForm" action="adminLogin.mdo" method="post" id="loginForm"> 
                <div class="input-group form-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="text"name="admin_id" id="adminId" class="form-control" placeholder="관리자 아이디">
                </div>

                <div class="input-group form-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                    </div>
                    <input type="password" name="admin_password" id="adminPassword" class="form-control" placeholder="관리자 비밀번호">
                </div>

                <div class="form-group">
                    <input type="submit" id=btnLogin name="btn" value="로그인" class="btn btn-outline-danger float-right login_btn">
                </div>
                <c:if test="${msg == 'fail'}">
                	<script type="text/javascript">
                		alert('아이디 또는 비밀번호가 일치하지 않습니다.');
                	</script>
				</c:if>
            </form>
        </div>
    </div>
</div>
</body>
</html>