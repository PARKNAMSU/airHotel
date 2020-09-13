<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>자주묻는질문 등록 페이지</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
	
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/style.css"/>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/menu.css"/>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/reset.css"/>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/SUHWAN.css"/>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/SUHWAN2.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hostregister.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin_log.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script type="text/javascript">
      $(function () {
        $(".logbars").click(function () {
          $("#menuItems").fadeToggle("slow");
        });
      });
    </script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/resources/javascript/processWithforceStop.js"></script>
	<style>
	#main-menu li:nth-child(4)>a {
		border-left: 1px solid #ee575d;
	}
	
	input[type=radio]{
	  width: 0;
	  height: 0;
	  position: absolute;
	  left: -9999px;
	}
	input[type=radio] + label{
	  margin: 0;
	  padding: .75em 1.5em;
	  box-sizing: border-box;
	  position: relative;
	  display: inline-block;
	  border: solid 1px #DDD;
	  background-color: #FFF;
	  line-height: 140%;
	  text-align: center;
	  box-shadow: 0 0 0 rgba(255, 255, 255, 0);
	  transition: border-color .15s ease-out,  color .25s ease-out,  background-color .15s ease-out, box-shadow .15s ease-out;
	  cursor: pointer;
	}
	input[type=radio]:checked + label{
	  background-color: #4B9DEA;
	  color: #FFF;
	  box-shadow: 0 0 10px rgba(102, 179, 251, 0.5);
	  border-color: #4B9DEA;
	  z-index: 1;
	}
	</style>
</head>
<body>
<header class="logo" style="position: sticky;">
     <label for="" class="loglabel">자주묻는질문 등록(관리자)</label>
      <span>
        <a href="/cnc/indexView.do">
          <i
            class="fas fa-question"
            style="font-size: 35px; float: left; color: #ff5a5f;"
          ></i>
        </a>
      </span>
      
      <div class="menudiv3-1" id="div1">
        <ul id="menuItems">
          <c:catch>
            <c:choose>
              <c:when test="${admin_session eq null}">
                <script>
                  history.go(-1);
                </script>
              </c:when>
              <c:otherwise>
                <li class="item1">
                  <a href="http://localhost:8080/cnc/blamelist.mdo">신고관리</a>
                </li>
                <li class="item1">
                  <a href="http://localhost:8080/cnc/salesChart.mdo">통계</a>
                </li>
                <li class="item1">
                  <a href="http://localhost:8080/cnc/getRegisterWaitingList.mdo">호스트관리</a>
                </li>
                <li class="item1">
                  <a href="http://localhost:8080/cnc/logPage.mdo">로그관리</a>
                </li>
                <li class="item1">
                  <a href="http://localhost:8080/cnc/makeCupon.mdo">쿠폰관리</a>
                </li>
                <li class="item1">
                  <a href="http://localhost:8080/cnc/goNoticeListAdmin.mdo" >게시판관리</a>
                </li>
                <li class="item1">
                  <a href="/cnc/logout.mdo">로그아웃</a>
                </li>
              </c:otherwise>
            </c:choose>
          </c:catch>
        </ul>
        <a class="logbars" href="#">메뉴<i class="fas fa-bars"></i></a>
      </div>
    </header>
    <!--/ bradcam_area  -->

	<div class="container">
	<!-- 좌측 목차 -->
    <nav role="navigation" style="float: left; width: 30%; margin-top: 20%;" class="center_event">
	  <ul id="main-menu">
	    <li><a href="/cnc/goNoticeListAdmin.mdo">공지사항 관리</a></li>
	    <li><a href="/cnc/goEventListAdmin.mdo">이벤트 관리</a></li>
	    <li><a href="/cnc/goPolicyListAdmin.mdo">약관정책 관리</a></li>
	    <li><a href="/cnc/goPersonalQueListAdmin.mdo">고객센터</a>
	      <ul id="sub-menu">
	        <li><a href="/cnc/goPersonalQueListAdmin.mdo" aria-label="subemnu">1대1 문의 관리</a></li>
	        <li><a href="/cnc/goCommonQueListAdmin.mdo" aria-label="subemnu">자주묻는질문 관리</a></li>
	      </ul>
	    </li>
	   </ul>
	 </nav>


	<!-- 우측 게시판 -->

	<div style="float: left; width: 60%; " id="featured">
	<div class="title">
					<h2 style="color: black;">자주묻는질문 관리</h2>
					<hr>
					<span class="byline">자주묻는질문을 등록합니다.</span><br><br>
				</div>
		<ul>
            <li>
                <form  action="/cnc/addCommonQueList.mdo" method="POST" >
                
                <label>질문의 유형을 선택해주세요.</label><br /><br />
                
                	<input type="radio" id="option1" name="commonq_type" value="예약결제" checked="checked">
					<label for="option1">예약결제</label>
					<input type="radio" id="option2" name="commonq_type" value="예약취소">
					<label for="option2">예약취소</label>
					<input type="radio" id="option3" name="commonq_type" value="이용문의">
					<label for="option3">이용문의</label>
					<input type="radio" id="option4" name="commonq_type" value="회원정보">
					<label for="option4">회원정보</label>
					<input type="radio" id="option5" name="commonq_type" value="기타문의">
					<label for="option5">기타문의</label>
					
					<br></br>

                   			<input name="commonq_title" class="" type="text" value="새로운 질문의 제목을 입력하세요."
          					onfocus="if(this.value == '새로운 질문의 제목을 입력하세요.') { this.value = ''; }"
          					onblur="if(this.value == '') { this.value = '새로운 질문의 제목을 입력하세요.'; }" />
          					<textarea name="commonq_content" cols="" rows=""
          					onfocus="if(this.value == '새로운 질문의 내용을 입력하세요.') { this.value = ''; }"
          					onblur="if(this.value == '') { this.value = '새로운 질문의 내용을 입력하세요.'; }">새로운 질문의 내용을 입력하세요.</textarea>

          					<input type="submit" value="등록" class="submitbtn" />
          					<input type="button" value="취소" class="submitbtn"  
          					onclick="location.href='/cnc/goCommonQueListAdmin.mdo'"/>
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