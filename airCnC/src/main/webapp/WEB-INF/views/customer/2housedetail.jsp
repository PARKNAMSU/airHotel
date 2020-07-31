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
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	<script type="text/javascript">
	function newHouseSubmit() {
		var f = document.hostchoose;
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
    <c:url value="/2housedetail.do" var="actionUrl" />

	<form:form id="2housedetail" name="hostchoose" modelAttribute="house" method="GET" action="${actionUrl}">
		<div class="container">
			<img src="${pageContext.request.contextPath}/resources/images/badroom.jpg"style="align-content: center; padding-top: 30px;">
			<div class="title">숙소에 얼마나 많은 인원이 숙박 할수 있나요?</div>
			<div class="title1">모든 게스트가 편안하게 숙박할 수 있도록 침대가 충분히 구비되어 있는지 확인하세요.</div>
			<br class="guestcount">	
			<div class="form">
				<label for="guestcount">최대 숙박 인원</label>
				<button type="button" onclick="javascript:this.form.amount.value++;">+</button> 
        		<input type="text" name="amount" value="0" readonly="readonly" />      
        		<button type="button" onclick="javascript:this.form.amount.value--;">-</button>
				
				<div class="guestbad">
				<label for="guestbad">게스트가 사용할수 있는 침실은 몇 개 인가요?</label>
				<select name="guestbadcot">
		        	<option value="">침실선택</option>
		        	<option value="">2개</option>
		       		<option value="">4개</option>
		        	<option value="">6개</option>
		        	<option value="">8개</option>
		        	<option value="">10개</option>
		        	<option value="">12개</option>
        		</select>
        		</div>
			</div>
		</div>
	</form:form>

</body>
</html>