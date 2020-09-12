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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/charge.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	<script type="text/javascript" src="../js/hostregister.js"></script>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function chargeSubmit() {
			var f = document.charge;
			if(f.house_price_default_parInt.value < 10000) {
				alert("숙소의 가격은 최소 10,000원 이상입니다.");
				return;
			}
			f.submit();
		}
		
		function PrevSubmit() {
			var f = document.charge;
			f.action = "<c:url value='/1newhouse.do' />";
			f.submit();
		}
	
	</script>
</head>
<body>
	<!-- header-start -->
    <header class="menudiv1">
      <div class="menudiv2-1">
        <img alt="" src="${pageContext.request.contextPath}/resources/images/logo2.png" />
        <label for="menudiv2-1">요금설정</label>
      </div>
    </header>
    <!-- header-end -->
    <div class="container" style="text-align: center;">
	<form action="/cnc/update_10chargework.do" name="charge" accept-charset="utf-8" method="GET">
   
    
    
	<div class="form">
    	<div class="hostpic1">
        <img src="${pageContext.request.contextPath}/resources/images/welcome.png">
        <div class="charge1">
        <h3 style="padding-top: 35px; font-size: 45px;">숙소요금 설정하기</h3></div><br>
        <h4 style="font-size: 25px;">예약을 받을 가능성을 높이세요</h4><br>
        <h4>스마트 요금을 설정하면 숙소가 위치한 지역에 대한 수요에 따라 1박 요금이 자동으로 조정되어 경쟁력을 유지할 수 있습니다.</h4><br>
        
        <h4 style="font-size: 25px;">기본 요금</h4>
        <h4>스마트 요금 기능을 사용하지 않을 때 적용되는 기본 요금입니다.</h4>
        <input type="image" src="${pageContext.request.contextPath}/resources/images/won.png" style="width: 35px; height: 20px;">
        <input type="text" name="house_price_default_parInt" numberonly placeholder="숫자만 입력해 주세요" maxlength="30"style="width: 150px;"
        	value="${detail.house_price_default}"><br></br>
        	
        <h4 style="font-size: 25px;">최저 요금</h4>
        <h4>수요가 낮아지면 요금을 1박당 최저 얼마까지 인하하시겠어요?</h4>
        <input type="image" src="${pageContext.request.contextPath}/resources/images/won.png" style="width: 35px; height: 20px;">
        <input type="text" name="house_price_max_parInt" numberonly placeholder="숫자만 입력해 주세요" maxlength="30" style="width: 150px;"
        	value="${detail.house_price_max }"><br></br>

		<h3 style="padding-top: 35px; font-size: 45px;">체크인-아웃시간 설정하기</h3></div><br>
        <h4>체크인 시간과 체크아웃 시간을 설정하세요.</h4><br></br>
		<p>CHECK-IN 시간 : <input type="time" name="house_checkin_time" min="00:00" max="24:00"maxlength="30" style="width: 100px;"
			value="${detail.house_checkin_time }"></p><br></br>
		<p>CHECK-OUT 시간 : <input type="time" name="house_checkout_time" min="00:00" max="24:00"maxlength="30" style="width: 100px;"
			value="${detail.house_checkout_time }"></p><br></br>
        
    </div>
	
    </form>
        
            
    	<div class="control" style="padding-bottom: 25px; padding-top: 25px;">
    		<a href="#" onclick="PrevSubmit();" style="float: left;"><button>< 뒤로가기</button></a>
			<a href="#" onclick="chargeSubmit();" style="float: right;"><button>수정하기</button></a>
    	</div>
        
	</div>
	
    
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
	$("input:text[numberOnly]").on("keyup", function() {
		$(this).val(addCommas($(this).val().replace(/[^0-9]/g, "")));
	});

	//3자리 단위마다 콤마 생성
	function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
</html>