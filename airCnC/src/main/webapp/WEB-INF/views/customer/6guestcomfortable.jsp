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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/comfortable.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	
	<script type="text/javascript">
		function guestcomfortableSubmit() {
			var f = document.checkbox2;
			f.submit();
		}
		
		
		function PrevSubmit() {
			var f = document.checkbox2;
			f.action = "<c:url value='/4location.do' />";
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
    
    <c:url value="/6guestcomfortable.do" var="actionUrl" />
	<form:form id="6guestcomfortable" name="checkbox2" modelAttribute="house" method="GET" action="${actionUrl}">
	
	
	<div class="container">
      <div class="form">
        <img src="${pageContext.request.contextPath}/resources/images/guestfacilities1.png" style="margin-top: 35px;">
        <div class="guestcomfor1" ><h3 style="font-size: 50px; font-weight: bold; padding-top: 35px;">게스트가 어떤 공간을 쓸수 있나요?</h3>
            <form:checkbox id="cb1" path="house_default_livingroom_type_0or1" value="true"/>
        	<label for="guestcomfor1"style="font-size: 30px; font-weight: bold;   padding-top: 15px;">단독 사용하는 거실</label>
    	</div>
    	
	    <div class="guestcomfor2">
	    	<form:checkbox id="cb2" path="house_default_kitchen_0or1" value="true"/>
	        <label for="guestcomfor2" style="font-size: 30px; font-weight: bold;   padding-top: 15px;">주방</label></br>
	    </div>
	    
	    <div class="guestcomfor3">
	        <form:checkbox id="cb3" path="house_default_laundry_washer_0or1" value="true"/>
	        <label for="guestcomfor3" style="font-size: 30px; font-weight: bold;   padding-top: 15px;">세탁공간-세탁기</label></br>
	    </div>
	    
	    <div class="guestcomfor4">
	        <form:checkbox id="cb4" path="house_default_laundry_dryer_0or1" value="true"/>
	        <label for="guestcomfor4" style="font-size: 30px; font-weight: bold;   padding-top: 15px;">세탁공간-건조기</label></br>
	    </div>
	    
	    <div class="guestcomfor5">
	        <form:checkbox id="cb5" path="house_default_parking_0or1" value="true"/>
	        <label for="guestcomfor5" style="font-size: 30px; font-weight: bold;   padding-top: 15px;">주차</label></br>
	    </div>
	    
	    <div class="guestcomfor6">
	        <form:checkbox id="cb6" path="house_default_gym_0or1" value="true" />
	        <label for="guestcomfor6" style="font-size: 30px; font-weight: bold;   padding-top: 15px;">헬스장</label></br>
	    </div>
	    
	    <div class="guestcomfor7">
	        <form:checkbox id="cb7" path="house_default_pool_0or1" value="true" />
	        <label for="guestcomfor7" style="font-size: 30px; font-weight: bold;   padding-top: 15px;">수영장</label></br>
	    </div>
	    
        <div class="locationbutton">
          <a href="#" onclick="PrevSubmit();" style="float: left;"><button>< 뒤로가기</button></a>
          <a href="#" onclick="defaultoptionSubmit();" style="float: right;"><button>다음</button></a>
        </div>
      </div>
    </div>
	
	
	</form:form>

</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
<script>
    function fnCalCount(type, ths) {
      var $input = $(ths).parents("td").find("input[name='pop_out']");
      var tCount = Number($input.val());
      var tEqCount = Number($(ths).parents("tr").find("td.bseq_ea").html());

      if (type == "p") {
        if (tCount < tEqCount) $input.val(Number(tCount) + 1);
      } else {
        if (tCount > 0) $input.val(Number(tCount) - 1);
      }
    }
</script>
</html>