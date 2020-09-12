<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>이벤트 상세 페이지</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
	
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/menu.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/reset.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/footer.css">
	
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/SUHWAN.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/SUHWAN2.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	<style>
	.title {
		margin-bottom: 3em;
	}
	
	.title h2 {
		text-transform: lowercase;
		font-size: 2.8em;
	}
	
	.title .byline {
		font-size: 1.3em;
		color: #6F6F6F;
	}
	
	#featured {
		overflow: hidden;
		margin-bottom: 3em;
		padding-top: 5em;
		border-top: 1px solid rgba(0, 0, 0, 0.08);
	}
	</style>
	
	<script>
		
		function TakeSubmit() {
			var f = document.form1;
			f.action = '택현이 쿠폰 발급 액션';
			f.submit();
		}
		
		function ListSubmit() {
			var f = document.form1;
			f.action = '<c:url value="/selectEventList.do${paging.makeQueryPage(page) }" />';
			f.submit();
		}
			
		
		function ExampleSubmit() {
			var f = document.form1;
			f.action = "<c:url value='/delete.mdo${paging.makeQueryPage(detail.event_idx, page) }' />";
			f.submit();
		}
	</script>
</head>
<body>
	<header class="menudiv1" style="position : static">
	<div class="menudiv2-1" >
	<img alt="" src="${pageContext.request.contextPath}/resources/images/logo2.png">
	</div>
	<div class="menudiv2-2" style="overflow : hidden">
	<div class="menudiv3-1" id="div1">
		<ul id="menuItems">
			<li class="item">계정관리</li>
			<li class="item">통계</li>
			<li class="item">숙소관리</li>
			<li class="item">로그관리</li>
			<li class="item">로그인</li>
		</ul>
	</div>
	</div>
	</header>
	
	<!-- bradcam_area  -->
     <div class="bradcam_area bradcam_bg_5">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-center">
                        <h3>Event</h3>
                        <p>이벤트 상세</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->
    
    
    <div class="container">
	<!-- 좌측 목차 -->
    <nav role="navigation" style="float: left; width: 30%;" class="center_event">
	  <ul id="main-menu">
	    <li><a href="/cnc/selectBoardList.do">공지사항</a></li>
	    <li><a href="/cnc/selectEventList.do">이벤트</a></li>
	    <li><a href="/cnc/selectPolicyList.do">약관정책</a></li>
	    <li><a href="#">고객센터</a>
	      <ul id="sub-menu">
	        <li><a href="/cnc/goaddPersonalQue.do" aria-label="subemnu">1대1 문의</a></li>
	        <li><a href="/cnc/selectPersonalQueList.do" aria-label="subemnu">나의 질문</a></li>
	        <li><a href="/cnc/selectCommonQueList.do" aria-label="subemnu">자주묻는질문</a></li>
	      </ul>
	    </li>
	   </ul>
	 </nav>
	 
	 <!-- 우측 게시판 -->

	<div style="float: left; width: 60%; " id="featured">
	<div class="title">
					<h2>${detail.event_title }</h2>
					<hr>
					<span class="byline">※ 이벤트 기간 : ${detail.event_start } ~ ${detail.event_end }  </span><br><br>
				</div>
		<ul>
            <li>
                <form id="form1" name="form1" method="POST">
							<h4></h4>
							<img id=imageEventDetail src="${pageContext.request.contextPath}/resources/images/여기어때3.jpg">
          					
							<input type="hidden" name="idx" value="${detail.event_idx }">
          					<a href="#" onclick="ListSubmit();" id="listBtn" ><button>뒤로가기</button></a>
          					
                </form>
			</li>
		</ul>
	</div>
	</div>
	
	<div id="footer"></div>
     <footer class="first" id="bottom" >
		<div class="second">
			회사소개  | 이용약관 | 개인정보처리방침 |사업자 정보확인 | 여기어때 마케팅센터 | 액티비티 호스트센터 | HOTEL 여기어때 |콘텐츠산업진흥법에의한 표시<br>
			<br>
			고객행복센터 1670-6250 오전 9시 - 새벽 3시, 점심시간: 오후 12시 - 오후 1시<br><br>
			(주) 여기어때컴퍼니<br><br>
			주소 : 서울특별시 강남구 봉은사로 479, 479타워 11층<br>
			대표이사 : 박남수 | 사업자등록번호: 742-86-00224<br>
			통신판매번호 : 2017-서울강남-01779 | 관광사업자 등록번호: 제1026-24호<br>
			전화번호 : 1670-6250<br>
			전자우편주소 : skatn7979@gmail.com<br>
			Copyright GC COMPANY Corp. All rights reserved.<br>
			<hr id="bline">
			<img src="../images/face.png" id="blogo">
			<img src="../images/insta.png" id="blogo">
		</div>
	</footer>
	
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
</html>