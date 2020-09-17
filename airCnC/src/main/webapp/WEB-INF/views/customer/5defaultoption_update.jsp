<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>AirBnb</title>
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link rel="shortcut icon" type="image/x-icon"
		href="${pageContext.request.contextPath}/images/favicon.png">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/test.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/menu.css?version=123"><!--  -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/reset.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/footer.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/hostregister.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/index.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/effect.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
		rel="stylesheet">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" />
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN2.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" 
    />
    
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/comfortable.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	
	<script type="text/javascript">
		function defaultoptionSubmit() {
			if($("input:checkbox[name=house_defaultsetting_0or1]").is(":checked")){
				$("input:hidden[name=house_defaultsetting_0or1]").val("true")
			} else {
				$("input:hidden[name=house_defaultsetting_0or1]").val("false")
			}
			if($("input:checkbox[name=house_default_tv_0or1]").is(":checked")){
				$("input:hidden[name=house_default_tv_0or1]").val("true")
			} else {
				$("input:hidden[name=house_default_tv_0or1]").val("false")
			}
			if($("input:checkbox[name=house_default_wifi_0or1]").is(":checked")){
				$("input:hidden[name=house_default_wifi_0or1]").val("true")
			} else {
				$("input:hidden[name=house_default_wifi_0or1]").val("false")
			}
			if($("input:checkbox[name=house_default_heater_0or1]").is(":checked")){
				$("input:hidden[name=house_default_heater_0or1]").val("true")
			} else {
				$("input:hidden[name=house_default_heater_0or1]").val("false")
			}
			if($("input:checkbox[name=house_default_cooler_0or1]").is(":checked")){
				$("input:hidden[name=house_default_cooler_0or1]").val("true")
			} else {
				$("input:hidden[name=house_default_cooler_0or1]").val("false")
			}
			if($("input:checkbox[name=house_default_iron_0or1]").is(":checked")){
				$("input:hidden[name=house_default_iron_0or1]").val("true")
			} else {
				$("input:hidden[name=house_default_iron_0or1]").val("false")
			}
			if($("input:checkbox[name=house_default_fireditecter_0or1]").is(":checked")){
				$("input:hidden[name=house_default_fireditecter_0or1]").val("true")
			} else {
				$("input:hidden[name=house_default_fireditecter_0or1]").val("false")
			}
			if($("input:checkbox[name=house_default_coditecter_0or1]").is(":checked")){
				$("input:hidden[name=house_default_coditecter_0or1]").val("true")
			} else {
				$("input:hidden[name=house_default_coditecter_0or1]").val("false")
			}
			if($("input:checkbox[name=house_default_aidkit_0or1]").is(":checked")){
				$("input:hidden[name=house_default_aidkit_0or1]").val("true")
			} else {
				$("input:hidden[name=house_default_aidkit_0or1]").val("false")
			}
			if($("input:checkbox[name=house_default_firesofwa_0or1]").is(":checked")){
				$("input:hidden[name=house_default_firesofwa_0or1]").val("true")
			} else {
				$("input:hidden[name=house_default_firesofwa_0or1]").val("false")
			}
			if($("input:checkbox[name=house_default_bedrock_0or1]").is(":checked")){
				$("input:hidden[name=house_default_bedrock_0or1]").val("true")
			} else {
				$("input:hidden[name=house_default_bedrock_0or1]").val("false")
			}
				
			
			var f = document.checkbox1;
			f.submit();
		}
		
		
		function PrevSubmit() {
			var f = document.checkbox1;
			f.action = "<c:url value='/1newhouse.do' />";
			f.submit();
		}
	
	</script>
</head>
<body>
	
    <c:url value="/update_5defaultoptionwork.do" var="actionUrl" />
	<form action="/cnc/update_5defaultoptionwork.do" name="checkbox1" method="GET">	
    <div class="container">
      <img src="${pageContext.request.contextPath}/resources/images/facilities.jpg">
      <div class="form">
      
        <div class="check1" style="padding-bottom: 15px;">
        <h3 style="font-size: 50px; font-weight: bold;">어떤 편의 시설을 제공하나요?</h3>
       		<input type="hidden" id="cb1" name="house_defaultsetting_0or1" >
       		<input type="checkbox" id="cb1" name="house_defaultsetting_0or1" value="" 
       			<c:if test="${detail.house_defaultsetting ne 'false' }">checked</c:if>/>
	        <label for="checkbox1" style="font-size: 30px; font-weight: bold;">필수품목</label><br>
	        <label for="checkbox1">수건, 침대 시트, 비누, 화장지, 베개</label>
    	</div>
    	
	    <div class="check2" style="padding-bottom: 15px;">
	    	<input type="hidden" id="cb2" name="house_default_tv_0or1" >
	    	<input type="checkbox" id="cb2" name="house_default_tv_0or1" value="" 
	    		<c:if test="${detail.house_default_tv ne 'false' }">checked</c:if>/>
	        <label for="checkbox2" style="font-size: 30px; font-weight: bold;">TV</label><br>
	    </div>
	    
	    <div class="check3" style="padding-bottom: 15px;">
	    	<input type="hidden" id="cb3" name="house_default_wifi_0or1" >
	    	<input type="checkbox" id="cb3" name="house_default_wifi_0or1" value=""  
	    		<c:if test="${detail.house_default_wifi ne 'false' }">checked</c:if>/>
	        <label for="checkbox3" style="font-size: 30px; font-weight: bold;">무선인터넷</label><br>
	    </div>
	    
	    <div class="check4" style="padding-bottom: 15px;">
	    	<input type="hidden" id="cb4" name="house_default_heater_0or1" >
	        <input type="checkbox" id="cb4" name="house_default_heater_0or1" value=""  
	        	<c:if test="${detail.house_default_heater ne 'false' }">checked</c:if>/>
	        <label for="checkbox4" style="font-size: 30px; font-weight: bold;">난방</label><br>
	    </div>
	    
	    <div class="check5" style="padding-bottom: 15px;">
	    	<input type="hidden" id="cb5" name="house_default_cooler_0or1" >
	        <input type="checkbox" id="cb5" name="house_default_cooler_0or1" value=""  
	        	<c:if test="${detail.house_default_cooler ne 'false' }">checked</c:if>/>
	        <label for="checkbox5" style="font-size: 30px; font-weight: bold;">에어컨</label><br>
	    </div>
	    
	    <div class="check6" style="padding-bottom: 15px;">
	   		<input type="hidden" id="cb6" name="house_default_iron_0or1" >
	        <input type="checkbox" id="cb6" name="house_default_iron_0or1" value=""  
	        	<c:if test="${detail.house_default_iron ne 'false' }">checked</c:if>/>
	        <label for="checkbox6" style="font-size: 30px; font-weight: bold;">다리미</label><br>
	    </div>
	    
	    <div class="check7">
	      <h3 style="font-size: 50px; font-weight: bold; padding-bottom: 15px;">안전 시설</h3>
	      	<input type="hidden" id="cb7" name="house_default_fireditecter_0or1" >
	        <input type="checkbox" id="cb7" name="house_default_fireditecter_0or1" value=""  
	        	<c:if test="${detail.house_default_fireditecter ne 'false' }">checked</c:if>/>
	        <label for="checkbox7" style="font-size: 30px; font-weight: bold;">화재 감지기</label><br>
	        <label for="checkbox7">잘 작동하는 화재 감지기를 모든 방에 구비해 놓아야 하는지 현지 법규를 확인해보세요.</label>
	    </div>
	    
	    <div class="check8" style="padding-bottom: 15px;">
	    	<input type="hidden" id="cb8" name="house_default_coditecter_0or1" >
	        <input type="checkbox" id="cb8" name="house_default_coditecter_0or1" value=""  
	        	<c:if test="${detail.house_default_coditecter ne 'false' }">checked</c:if>/>
	        <label for="checkbox8" style="font-size: 30px; font-weight: bold;">일산화탄소 감지기</label><br>
	        <label for="checkbox8">일산화탄소 감지기 구비 요건에 대해 현지 법규를 확인해보세요. 지역에 따라, 정상적으로 작동하는 일산화탄소 감지기를 모든 방에 설치해야 할 수 있습니다.</label>
	    </div>
	    
	    <div class="check9" style="padding-bottom: 15px;">
	    	<input type="hidden" id="cb9" name="house_default_aidkit_0or1" >
	        <input type="checkbox" id="cb9" name="house_default_aidkit_0or1" value="" 
	        	<c:if test="${detail.house_default_aidkit ne 'false' }">checked</c:if>/>
	        <label for="checkbox9" style="font-size: 30px; font-weight: bold;">구급 상자</label><br>
	    </div>
	    
	    <div class="check10" style="padding-bottom: 15px;">
	    	<input type="hidden" id="cb10" name="house_default_firesofwa_0or1" >
	        <input type="checkbox" id="cb10" name="house_default_firesofwa_0or1" value=""  
	        	<c:if test="${detail.house_default_firesofwa ne 'false' }">checked</c:if>/>
	        <label for="checkbox10" style="font-size: 30px; font-weight: bold;">소화기</label><br>
	    </div>
	    
	    <div class="check11" style="padding-bottom: 15px;">
	    	<input type="hidden" id="cb11" name="house_default_bedrock_0or1" >
	        <input type="checkbox" id="cb11" name="house_default_bedrock_0or1" value=""  
	        	<c:if test="${detail.house_default_bedrock ne 'false' }">checked</c:if>/>
	        <label for="checkbox1" style="font-size: 30px; font-weight: bold;">침실문 잠금장치</label><br>
	        <label for="checkbox11">안전과 사생활 보호를 위해 방문을 잠글 수 있음</label>
	    </div>
	    
        <div class="locationbutton">
          <a href="#" onclick="PrevSubmit();" style="float: left;"><button>< 뒤로가기</button></a>
          <a href="#" onclick="defaultoptionSubmit();" style="float: right;"><button>수정하기</button></a>
        </div>
  
      </div>
    </div>
  
  </form>
    
    
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
</html>