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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/check.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	<script type="text/javascript" src="../js/hostregister.js"></script>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function checkSubmit() {
			var f = document.check;
			f.submit();
		}
		
		function PrevSubmit() {
			var f = document.check;
			f.action = "<c:url value='/10charge.do' />";
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
	<form action="/hotel/12guestcheck1.do" name="check" accept-charset="utf-8" method="GET">
	<div class="container">
	<div class="check">
	
	<img src="${pageContext.request.contextPath}/resources/images/tripcheck.png" alt="javascript(0)" style="width: 500px;">
		<div class="check1"><h3 style="padding-top: 35px; font-size: 45px;">에어비앤비의 게스트 필수 요건을 검토합니다.</h3></div>
		<h4 style="font-size: 25px;">모든 게스트는 예약하기 전에 에어비앤비의 필수조건을 충족해야 합니다.</h4>
		<h4 style="font-size: 20px;">모든 에어비앤비 게스트는 예약 전에 다음 정보를 제공해야 합니다.</h4></br>
		<img src="${pageContext.request.contextPath}/resources/images/redcheck.png" style="width: 15px; height: 15px;">&nbsp;<label for="#">이메일 주소</label></br>
		<img src="${pageContext.request.contextPath}/resources/images/redcheck.png" style="width: 15px; height: 15px;">&nbsp;<label for="#">전화번호 인증</label></br>
		<img src="${pageContext.request.contextPath}/resources/images/redcheck.png" style="width: 15px; height: 15px;">&nbsp;<label for="#">결제 정보</label></br></br></br>
		
		<div class="check2">
			<h4 style="font-size: 20px;">게스트는 예약 전에 다음을 이행해야 합니다.</h4>
			<img src="${pageContext.request.contextPath}/resources/images/redcheck.png" style="width: 15px; height: 15px;">&nbsp;<label for="#">숙소 이용규칙에 동의합니다.</label></br>
			<img src="${pageContext.request.contextPath}/resources/images/redcheck.png" style="width: 15px; height: 15px;">&nbsp;<label for="#">호스트에게 메시지를 보내 여행에 관해 알리기</label></br>
			<img src="${pageContext.request.contextPath}/resources/images/redcheck.png" style="width: 15px; height: 15px;">&nbsp;<label for="#">숙박 인원이 몇 명인지 알리기</label></br>
			<img src="${pageContext.request.contextPath}/resources/images/redcheck.png" style="width: 15px; height: 15px;">&nbsp;<label for="#">게스트가 2일 이내에 도착할 예정이라면 체크인 시간을 확정하세요.</label></br></br></br>
		</div>
              
		<div class="check3">
 			<h4 style="font-size: 20px;">필수조건 추가하기</h4>
			<input type="checkbox">&nbsp;<label for="">에어비앤비에 정부에서 발행한 신분증을 제출해야 합니다.</label></br></br>
			<input type="checkbox">&nbsp;<label for="">다른 호스트에게 추천을 받고 부정적인 후기가 없어야 합니다.</label></br>
			<h4 style="font-size: 15px;">게스트는 예약 전에 다음을 이행해야 합니다.</h4>
		</div>
              
              
    	<div class="control" style="padding-bottom: 25px; padding-top: 25px;">
    		<a href="#" onclick="PrevSubmit();" style="float: left;"><button>< 뒤로가기</button></a>
			<a href="#" onclick="checkSubmit();" style="float: right;"><button>다음</button></a>
		</div>
		
	</div>
    </div>
	</form>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
<script>
	function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
</html>