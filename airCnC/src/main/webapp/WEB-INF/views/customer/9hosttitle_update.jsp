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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hosttitle.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	<script type="text/javascript" src="../js/hostregister.js"></script>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function hosttitleSubmit() {
			var f = document.hosttitle;
			if(f.house_name.value == "") {
				alert("숙소의 제목을 입력해주세요.");
				return;
			}
			f.submit();
		}
		
		function PrevSubmit() {
			var f = document.hosttitle;
			f.action = "<c:url value='/1newhouse.do' />";
			f.submit();
		}
	
	</script>
</head>
<body>
	<!-- header-start -->
    <header class="menudiv1">
      <div class="menudiv2-1">
        <label for="menudiv2-1">편의시설</label>
        <img alt="" src="${pageContext.request.contextPath}/resources/images/logo2.png" />
      </div>
      <div class="menudiv2-2">
        <div class="menudiv3-1" id="div1">
          <img alt="http://www.naver.com"
            src="${pageContext.request.contextPath}/resources/images/menubar.png"
            id="menubar"/>
        </div>
      </div>
    </header>
    <!-- header-end -->
    
    <div class="container" style="align-content: center;">
    <c:url value="/9hosttitle.do" var="actionUrl" />
   	<form action="/cnc/update_9hosttitlework.do" name="hosttitle" method="GET">	
   
   
    	<div class="hosttitle" style="padding-top: 35px;">
        <img src="${pageContext.request.contextPath}/resources/images/housecheck.jpg" alt="">
        	<div class="addhosttitle"><h3 style="padding-top: 35px; font-size: 45px;">숙소의 제목을 만들어 주세요</h3></div><br>
        	<h4>숙소의 특징과 장점을 강조하는 제목으로 게스트의 관심을 끌어보세요.</h4>
        	<textarea id="guest" name="house_name" rows="2" cols="60" placeholder="50자 이내로 작성하세요." maxlength="50">
        		${detail.house_name }</textarea>      
        </div>
              
     </form>         
    	<div class="control" style="padding-bottom: 25px; padding-top: 25px;">
     		<a href="#" onclick="PrevSubmit();" style="padding-right: 26.5%;"><button>< 뒤로가기</button></a>
			<a href="#" onclick="hosttitleSubmit();" style="float: right;"><button>수정하기</button></a>
    	</div>
      
      
   
  	
  	
  	
  	
  	</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
</html>