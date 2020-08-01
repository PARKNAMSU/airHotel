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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/location.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function locationSubmit() {
			var f = document.llocation;
			f.submit();
		}
		
		
		function PrevSubmit() {
			var f = document.llocation;
			f.action = "<c:url value='/2housedetail.do' />";
			f.submit();
		}
		
		 //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	            }
	        }).open();
	    }
	</script>
</head>
<body>
 <!-- header-start -->
    <header class="menudiv1">
      <div class="menudiv2-1">
        <label for="menudiv2-1">위치</label>
        <img alt="" src="${pageContext.request.contextPath}/resources/images/logo2.png" />
      </div>
      <div class="menudiv2-2">
        <div class="menudiv3-1" id="div1">
          <img
            alt="http://www.naver.com"
            src="${pageContext.request.contextPath}/resources/images/menubar.png"
            id="menubar"
          />
        </div>
      </div>
    </header>
    <!-- header-end -->
    
    <c:url value="/4location.do" var="actionUrl" />
	<form:form id="4location" name="llocation" modelAttribute="house" method="GET" action="${actionUrl}">
		<div class="container" style="align-content: center;">
		<div class="form">
			<img src="${pageContext.request.contextPath}/resources/images/diretion.jpg">
			<div class="locationtitle" style="font-size: 25px; font-weight: bold;">숙소의 위치를 알려주세요</div>
			<div class="locationtitle1" style="font-size: 15px; font-weight: bold;">정확한 숙소 주소는 게스트가 예약을 완료한 후에만 공개됩니다.</div>
			<div class="locationtitle2" style="padding-top: 20px; padding-bottom: 20px;" >
				<label for="locationtitle3">지역</label>
				<form:select name="locationtitle4" path="house_location">
					<form:option value="0">지역선택</form:option>
					<form:option value="서울">서울</form:option>
					<form:option value="강원도">강원도</form:option>
					<form:option value="경기도">경기도</form:option>
					<form:option value="충청도">충청도</form:option>
					<form:option value="전라도">전라도</form:option>
					<form:option value="경상도">경상도</form:option>
					<form:option value="제주도">제주도</form:option>
				</form:select>
			</div>
			<div class="locationtitle5" style="padding-bottom: 20px;">
			    <label for="locationtitle5">우편번호</label>
			    <form:input type="text" id="sample4_postcode" placeholder="우편번호"  path="house_location_postnum" /><br></br>
       			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			</div>
			<div class="locationtitle6" style="padding-bottom: 20px;">
				<label for="locationtitle6">도로명주소</label>
				<form:input type="text" id="sample4_roadAddress" placeholder="도로명주소"  path="house_loaction_sido" /><br></br>
			</div>
			<div class="locationtitle7" style="padding-bottom: 20px;">
        		<label for="locationtitle7">상세주소</label>
			    <form:input type="text" placeholder="상세주소"  path="house_location_gugun" /><br></br>
        		<label for="locationtitle7" style="font-size: 10px">예)x층 y호</label>
        	</div>
			
			
        	
			<div class="locationbutton">
				<a href="#" onclick="PrevSubmit();">
				<button>뒤로가기</button></a>&nbsp;&nbsp;&nbsp;
				<a href="#" onclick="locationSubmit();">
				<button>다음</button></a>
			</div>
			
			<br></br><br></br><br></br>
		</div>
	</div>			
	</form:form>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
</html>