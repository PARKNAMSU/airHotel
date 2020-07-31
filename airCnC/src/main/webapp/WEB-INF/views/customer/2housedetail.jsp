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
        		
        		<div class="guestbadcount">
			        <div class="guestbadcount1">
			          <label for="guestbadcount2">침대</label>        
			        <button type="button" onclick="javascript:this.form.amount1.value++;">+</button>  
			        <input type="text" name="amount1" value="0" readonly="readonly" />     
			        <button type="button" onclick="javascript:this.form.amount1.value--;">-</button>
			        </div>
			    </div>
			    
			    <div class="bad">
			    	<div class="title2" style="margin-bottom: 5px;">침대유형</div><br>
			    	<label for="bad" style="margin-bottom: 15px;">각 침실에 놓인 침대 유형을 명시하면 숙소에 침대가 어떻게 구비되어  있는지 게스트가 잘 파악할 수 있습니다.</label>
			    	<div class="badcount">
			    		<div class="bad1">
			    			<label for="guestcount">싱글</label>
					        <button type="button" onclick="javascript:this.form.amount2.value++;">+</button>  
					        <input type="text" name="amount2" value="0" readonly="readonly" />     
					        <button type="button" onclick="javascript:this.form.amount2.value--;">-</button>
			    		</div><br>
			    		<div class="bad2">
			    			<label for="guestcount">더블</label>
					        <button type="button" onclick="javascript:this.form.amount3.value++;">+</button>  
					        <input type="text" name="amount3" value="0" readonly="readonly" />     
					        <button type="button" onclick="javascript:this.form.amount3.value--;">-</button>
			    		</div><br>
			    		<div class="bad3">
			    			<label for="guestcount">퀸</label>
					        <button type="button" onclick="javascript:this.form.amount4.value++;">+</button>  
					        <input type="text" name="amount4" value="0" readonly="readonly" />     
					        <button type="button" onclick="javascript:this.form.amount4.value--;">-</button>
					        <div class="badfix"><br>
					          <a href="#"><button>침대 수정하기</button></a>
					        </div>
			    		</div>
			    	</div>
			    </div>
			    </div>
			    <div class="control">
				    <div class="control2">
				    <a href="" style="float : left;"><button>뒤로가기</button></a>
				    <a href="" style="float: right;"><button>다음</button></a>
			    </div>
			    <div class="bor1" style="height: 3px;"></div>
			</div>
		</div>
	</form:form>

</body>
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
</html>