<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>이벤트 등록 페이지</title>
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
	<link rel="stylesheet" 
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">

	 <style>
		#main-menu li:nth-child(2)>a {
		border-left: 1px solid #ee575d;
		}
	 </style>
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
	
	<div class="bradcam_area bradcam_bg_5">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-center">
                        <h3>contact</h3>
                        <p>관리자-이벤트등록 화면이에요</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<div class="container">
	<!-- 좌측 목차 -->
    <nav role="navigation" style="float: left; width: 30%;" class="center_event">
	  <ul id="main-menu">
	    <li><a href="/cnc/goNoticeListAdmin.mdo">공지사항 관리</a></li>
	    <li><a href="/cnc/goEventListAdmin.mdo">이벤트 관리</a></li>
	    <li><a href="/cnc/goPolicyListAdmin.mdo">약관정책 관리</a></li>
	    <li><a href="#">고객센터</a>
	      <ul id="sub-menu">
	        <li><a href="/cnc/goPersonalQueListAdmin.mdo" aria-label="subemnu">1대1 문의 관리</a></li>
	        <li><a href="안내.html" aria-label="subemnu">안내 관리</a></li>
	      </ul>
	    </li>
	   </ul>
	 </nav>


	<!-- 우측 게시판 -->

	<div style="float: left; width: 60%; " id="featured">
	<div class="title">
	<h2>이벤트 관리</h2>
	<hr>
	<span class="byline">행사를 등록합니다.</span><br><br>
	</div>
		<ul>
		<li>
		<form action="/cnc/addEventList.mdo" method="POST" enctype="multipart/form-data">

		<input name="event_title" class="" type="text" value="새로운 행사의 제목을 입력하세요."
		onfocus="if(this.value == '새로운 행사의 제목을 입력하세요.') { this.value = ''; }"
		onblur="if(this.value == '') { this.value = '새로운 행사의 제목을 입력하세요.'; }" />
		
		<textarea name="event_content" cols="" rows=""
		onfocus="if(this.value == '새로운 행사의 내용을 입력하세요.') { this.value = ''; }"
		onblur="if(this.value == '') { this.value = '새로운 행사의 내용을 입력하세요.'; }">새로운 행사의 내용을 입력하세요.</textarea>
 		
 		<p>
		<input type="date" id="trip-start" name="event_start"
 		value="" min="2020-01-01" max="2020-12-31">
 		 ~
		<input type="date" id="trip-end" name="event_end"
		value="" min="2020-01-01" max="2020-12-31">
       	</p>
       	
   
       	<p>(전체 이벤트 리스트에 표시될 이미지 파일을 선택해주세요.)</p><br>
		<input multiple="multiple" type="file" name="event_img" id="event_img" />
		<p>(이벤트 상세보기에 표시될 이미지 파일을 선택해주세요.)</p><br>
		<input multiple="multiple" type="file" name="event_img" id="event_img" />
		
		<input type="submit" value="등록" name="subscribe" class="submitbtn" />
		<input type="button" value="취소" class="submitbtn"  
		onclick="location.href='/cnc/goEventListAdmin.mdo'"/>

		</form>
		</li>
		</ul>
	</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
</html>