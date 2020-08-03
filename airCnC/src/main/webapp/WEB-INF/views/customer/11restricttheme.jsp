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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/guestcheck.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	<script type="text/javascript" src="../js/hostregister.js"></script>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function restrictthemeSubmit() {
			var f = document.guestcheck;
			f.submit();
		}
		
		function PrevSubmit() {
			var f = document.guestcheck;
			f.action = "<c:url value='/9hosttitle.do' />";
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
	<form action="/hotel/11restricttheme.do" name="guestcheck" accept-charset="utf-8" method="GET">
	<div class="container">
	<div class="form">
	<div class="check">
	<img src="${pageContext.request.contextPath}/resources/images/tripcheck.png" alt="javascript(0)" style="width: 500px;">
    	
    	<div class="check1"><h3 style="padding-top: 35px; font-size: 45px;">게스트가 지켜야 할 숙소 이용규칙을 정하세요.</h3></div>
        <h4 style="font-size: 25px;">게스트는 예약하기 전에 숙소 이용규칙에 동의해야 합니다.</h4>
        <h4 style="font-size: 25px;">특이사항이 있을시 체크박스 클릭후 입력해주세요.</h4><br>
        
        	<div class="guestcheckbox">
        		<div class="guideBox">
        		
        		
        		
        		
	            <p>* 어린이(2~12세) 숙박에 적합함<input class="textbtn" type="checkbox" style="width: 15px; height: 15px; margin-left: 15px;"></input></p>
	            <div style="display:none">
	                <p style="font-size: 25px;">이유를 작성해 주세요</p>
	                <textarea name="#" id="" cols="30" rows="10" maxlength="150" placeholder="150자 이내"></textarea>
	            </div><br>
            
	            <p>* 유아(2세 미만) 숙박에 적합함<input class="textbtn" type="checkbox" style="width: 15px; height: 15px; margin-left: 15px;"></input></p>
	            <div style="display:none">
	                <p style="font-size: 25px;">이유를 작성해 주세요</p>
	                <textarea name="#" id="" cols="30" rows="10" maxlength="150" placeholder="150자 이내"></textarea>
	            </div><br>
	            
	            <p>* 반려동물 동반에 적합함<input class="textbtn" type="checkbox" style="width: 15px; height: 15px; margin-left: 15px;"></input></p>
	            <div style="display:none">
	                <p style="font-size: 25px;">이유를 작성해 주세요</p>
	                <textarea name="#" id="" cols="30" rows="10" maxlength="150" placeholder="150자 이내"></textarea>
	            </div><br>
	            
	            <p>* 흡연 가능<input class="textbtn" type="checkbox" style="width: 15px; height: 15px; margin-left: 15px;"></input></p>
	            <div style="display:none">
	                <p style="font-size: 25px;">이유를 작성해 주세요</p>
	                <textarea name="#" id="" cols="30" rows="10" maxlength="150" placeholder="150자 이내"></textarea>
	            </div><br>
				<p>* 행사나 파티 허용<input class="textbtn" type="checkbox" style="width: 15px; height: 15px; margin-left: 15px;"></input></p>
				<div style="display:none">
	                <p style="font-size: 25px;">이유를 작성해 주세요</p>
	                <textarea name="#" id="" cols="30" rows="10" maxlength="150" placeholder="150자 이내"></textarea>
	            </div><br></br>
	            
	            

            	<h4 style="font-size: 25px;">게스트는 예약하기 전에 숙소 이용규칙에 동의해야 합니다.</h4><br>
            	<p>* 계단을 올라가야 함<input class="textbtn" type="checkbox" style="width: 15px; height: 15px; margin-left: 15px;"></input></p>
	            <div style="display:none">
	                <p style="font-size: 25px;">이유를 작성해 주세요</p>
	                <textarea name="#" id="" cols="30" rows="10" maxlength="150" placeholder="150자 이내"></textarea>
	            </div><br>
	            
	            <p>* 소음이 발생할 수 있음<input class="textbtn" type="checkbox" style="width: 15px; height: 15px; margin-left: 15px;"></input></p>
	            <div style="display:none">
	                <p style="font-size: 25px;">이유를 작성해 주세요</p>
	                <textarea name="#" id="" cols="30" rows="10" maxlength="150" placeholder="150자 이내"></textarea>
	            </div><br>
	            
	            <p>* 숙소에 반려동물 있음<input class="textbtn" type="checkbox" style="width: 15px; height: 15px; margin-left: 15px;"></input></p>
	            <div style="display:none">
	                <p style="font-size: 25px;">이유를 작성해 주세요</p>
	                <textarea name="#" id="" cols="30" rows="10" maxlength="150" placeholder="150자 이내"></textarea>
	            </div><br>
	            
	            <p>* 건물 내 주차 불가<input class="textbtn" type="checkbox" style="width: 15px; height: 15px; margin-left: 15px;"></input></p>
	            <div style="display:none">
	                <p style="font-size: 25px;">이유를 작성해 주세요</p>
	                <textarea name="#" id="" cols="30" rows="10" maxlength="150" placeholder="150자 이내"></textarea>
	            </div><br>
	            
	            <p>* 일부 공용 공간 있음<input class="textbtn" type="checkbox" style="width: 15px; height: 15px; margin-left: 15px;"></input></p>
	            <div style="display:none">
	                <p style="font-size: 25px;">이유를 작성해 주세요</p>
	                <textarea name="#" id="" cols="30" rows="10" maxlength="150" placeholder="150자 이내"></textarea>
	            </div><br>
	            
	            <p>* 편의시설 제한<input class="textbtn" type="checkbox" style="width: 15px; height: 15px; margin-left: 15px;"></input></p>
	            <div style="display:none">
	                <p style="font-size: 25px;">이유를 작성해 주세요</p>
	                <textarea name="#" id="" cols="30" rows="10" maxlength="150" placeholder="150자 이내"></textarea>
	            </div><br>
	            
	            <p>* 숙소에 감시 또는 녹화 장치 설치<input class="textbtn" type="checkbox" style="width: 15px; height: 15px; margin-left: 15px;"></input></p>
	            <div style="display:none">
	                <p style="font-size: 25px;">이유를 작성해 주세요</p>
	                <textarea name="#" id="" cols="30" rows="10" maxlength="150" placeholder="150자 이내"></textarea>
	            </div><br>
	            
	            <p>* 숙소에 무기 있음<input class="textbtn" type="checkbox" style="width: 15px; height: 15px; margin-left: 15px;"></input></p>
	            <div style="display:none">
	                <p style="font-size: 25px;">이유를 작성해 주세요</p>
	                <textarea name="#" id="" cols="30" rows="10" maxlength="150" placeholder="150자 이내"></textarea>
	            </div><br>
	            
	            <p>* 숙소에 위험한 동물 있음<input class="textbtn" type="checkbox" style="width: 15px; height: 15px; margin-left: 15px;"></input></p>
	            <div style="display:none">
	                <p style="font-size: 25px;">이유를 작성해 주세요</p>
	                <textarea name="#" id="" cols="30" rows="10" maxlength="150" placeholder="150자 이내"></textarea>
	            </div><br>
         
         
         
				</div>
			</div>
        
        
        
    	<div class="control" style="padding-bottom: 25px; padding-top: 25px;">
    		<a href="#" onclick="PrevSubmit();" style="float: left;"><button>< 뒤로가기</button></a>
			<a href="#" onclick="restrictthemeSubmit();" style="float: right;"><button>다음</button></a>
    	</div>



	</div>
 	</div>
	</div>
	</form>
    
    
</body>
</html>