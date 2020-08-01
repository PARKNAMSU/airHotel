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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hostdetail1.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bathcount.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	
	<script type="text/javascript">
		function bathcountSubmit() {
			var f = document.bathcount;
			f.submit();
		}
		
		
		function PrevSubmit() {
			var f = document.bathcount;
			f.action = "<c:url value='/1newhouse.do' />";
			f.submit();
		}

	</script>
</head>
<body>
	<!-- header-start -->
    <header class="menudiv1">
      <div class="menudiv2-1">
        <label for="menudiv2-1">숙소 및 게스트</label>
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
    
    <c:url value="/3bathcount.do" var="actionUrl" />
	<form:form id="3bathcount" name="bathcount" modelAttribute="house" method="GET" action="${actionUrl}">
    	<div class="container" style="align-content: center;">
        <div class="form">
        	<img src="${pageContext.request.contextPath}/resources/images/shawer.png" style="margin-bottom: 35px;" />
        <div class="bathtitle" style="font-size: 30px; font-weight: bold; padding-bottom: 15px;">
        	욕실 수</div>
        <div class="bathcounttitle" style="padding-bottom: 15px;">
        	 샤워실 또는 욕조가 없는 경우 0.5개로 간주합니다.</div>
        <div class="bathcount1" style="padding-bottom: 15px;">
            <label for="bathcount2">욕실</label>
            <button type="button" onclick="javascript:this.form.amount5.value++;">+</button>
            <form:input type="text" id="amount5" value="0" readonly="readonly" path="house_bathroom_amount" />
            <button type="button" onclick="javascript:this.form.amount5.value--;">-</button>
        </div>
        
        <div class="bathcount3" style="padding-bottom: 15px;">
            <label for="guestbad">게스트가 단독으로 사용하는 욕실인가요?</label><br /><br />
            <form:radiobutton id="radio1" path="house_bathroom_type" value="1" /><label> 예 </label><br /><br />
            <form:radiobutton id="radio2" path="house_bathroom_type" value="0" /><label> 아니오 </label>
        </div>
          
        <div class="bathcontrol" style="padding-bottom: 15px;">
        	<a href="#" onclick="PrevSubmit();" style="float : inherit;">
			<button>뒤로가기</button></a>&nbsp;&nbsp;&nbsp;
			<a href="#" onclick="bathcountSubmit();" style="float: inherit;">
			<button>다음</button></a>
        </div>
      </div>
    </div>
  </form:form>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
</html>