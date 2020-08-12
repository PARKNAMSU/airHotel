<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>약관정책 등록 페이지</title>
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
	
	<style>
	#main-menu li:nth-child(3)>a {
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
                        <p>관리자-약관정책등록 화면이에요</p>
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
					<h2>약관정책 관리</h2>
					<hr>
					<span class="byline">약관정책을 등록합니다.</span><br><br>
				</div>
		<ul>
            <li>
                <form  action="/cnc/addPolicyList.mdo" method="POST" >

                   			<input name="policy_title" class="" type="text" value="새로운 정책의 제목을 입력하세요."
          					onfocus="if(this.value == '새로운 정책의 제목을 입력하세요.') { this.value = ''; }"
          					onblur="if(this.value == '') { this.value = '새로운 정책의 제목을 입력하세요.'; }" />
          					<textarea name="policy_content" cols="" rows=""
          					onfocus="if(this.value == '새로운 정책의 내용을 입력하세요.') { this.value = ''; }"
          					onblur="if(this.value == '') { this.value = '새로운 정책의 내용을 입력하세요.'; }">새로운 정책의 내용을 입력하세요.</textarea>

          					<input type="submit" value="등록" class="submitbtn" />
          					<input type="button" value="취소" class="submitbtn"  
          					onclick="location.href='/cnc/goPolicyListAdmin.mdo'"/>
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
</html>