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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chargetext.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	<script type="text/javascript" src="../js/hostregister.js"></script>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function checkSubmit() {
			var f = document.chargetext;
			f.submit();
		}
		
		function PrevSubmit() {
			var f = document.chargetext;
			f.action = "<c:url value='/11restricttheme.do' />";
			f.submit();
		}
	
	</script>
</head>
<body>
	<!-- header-start -->
    <header class="menudiv1">
      <div class="menudiv2-1">
        <img alt="" src="${pageContext.request.contextPath}/resources/images/logo2.png" />
        <label for="menudiv2-1">요금관련 설명</label>
      </div>
    </header>
    <!-- header-end -->
    
	<form action="/hotel/13chargetext.do" name="chargetext" accept-charset="utf-8" method="GET">
    
    <div class="container" style="text-align: center;">
    
        <div class="chargetext" style="padding-top: 30px;">
            <label for="chargetext" style="font-size: 45px; font-weight: bold; color: black;">
                	회원님 거주 지역의 법규와 세금
            </label></br>
            <label for="chargetext" style="width: 50%; padding-top: 30px;">
                	이곳에 약관중 호스트 등록에 관한페이지 또는 설명(text)가 오면 된다.
            </label>
        </div>
        
		<div class="control" style="padding-bottom: 25px; padding-top: 25px;">
			<a href="#" onclick="PrevSubmit();" style="float: left;"><button>< 뒤로가기</button></a>
			<a href="#" onclick="checkSubmit();" style="float: right;"><button>다음</button></a>
		</div>
	</div>
    
	</form>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
</html>