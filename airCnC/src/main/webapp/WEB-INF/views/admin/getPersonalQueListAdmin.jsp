<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>1대1문의-관리자 페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN.css">
	<link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/admin/admin_singo_complete.css">
	<script src="${pageContext.request.contextPath}/resources/javascript/processWithforceStop.js"></script>
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"/>
    </head>
	<style>
	
		
	#main-menu li:nth-child(4)>a {
		border-left: 1px solid #ee575d;
	}
	.menu a {
        cursor: pointer;
    }

    .menu .hide {
        display: none;
    }

	 </style>

<body>
	<!-- header-start -->
<header style="color: #ff5a5f;">
    <div class="headermenu">
        <span><i class="fas fa-user-slash" style="font-size: 35px; float: left;"></i></span>
        <label for="" style="font-size: 40px; background-color: black; color: #ff5a5f;">자기관리로 바꿈</label>
        <ul>
            <li class="menu" style="list-style: none;">
                <label for="" style="font-size: 40px;">메뉴</label>
                <ul class="hide" style="list-style: none; padding-top: 25px; float: initial; padding-right: 20px;">
                    <li class="item">
                        <a href="http://localhost:8080/cnc/blamelist.mdo">신고관리</a>
                    </li>
                    <li class="item">
                        <a href="http://localhost:8080/cnc/salesChart.mdo">통계</a>
                    </li>
                    <li class="item">
                        <a href="http://localhost:8080/cnc/getRegisterWaitingList.mdo">호스트관리</a>
                    </li>
                    <li class="item">
                        <a href="http://localhost:8080/cnc/logPage.mdo">로그관리</a>
                    </li>
                    <li class="item">
                        <a href="http://localhost:8080/cnc/makeCuponView.mdo">쿠폰관리</a>
                    </li>
                    <li class="item">
                        <a href="http://localhost:8080/cnc/goNoticeListAdmin.mdo">게시판관리</a>
                    </li>
                    <li class="item">
                        <a href="/cnc/logout.mdo" style="color: white;">로그아웃</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</header>
<!-- header-end -->
    
    
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
	        <li><a href="/cnc/goCommonQueListAdmin.mdo" aria-label="subemnu">자주묻는질문 관리</a></li>
	      </ul>
	    </li>
	   </ul>
	 </nav>
	<div id="featured">
			<div class="title">
				<h2>1대1문의 관리</h2>
				<hr>
				<span class="byline">전체 1대1문의를 관리합니다.</span><br><br>
				<button id="gonjibtn" type="button" onclick="">
				질문의 제목을 눌러주세요</button>
			</div>
			
		<ul class="style1">
		<c:choose>
			<c:when test="${!empty personalqList}">
				<c:forEach items="${personalqList }" var="personalq">
				
						<li class="first">
							<p class="date"><fmt:formatDate value="${personalq.personalq_regdate }" pattern="yyyy-MM-dd"/></p>
							<h3>글번호 : ${personalq.personalq_idx }번 / 분류 : ${personalq.personalq_type }</h3>
							<p><a href='<c:url value='/detailPersonalQue/${personalq.personalq_idx }.mdo
							${paging.makeQueryPage(personalq.personalq_idx, paging.cri.page) }'/>' style="color: black;">${personalq.personalq_title }</a></p>
						</li>         

				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</ul>
			
		</div>



	<div style="float: left; width: 30%; " class="center_paging">
	<!-- Start Pagination -->
		<ul class="pagination">
		    <c:if test="${paging.prev }">
		    <li>
		        <a href='<c:url value="/goPersonalQueListAdmin.mdo${paging.makeQueryPage(paging.startPage-1) }"/>'>이전</a>
		    </li>
		    </c:if>
		    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="pageNum">
		    <li>
		        <a href='<c:url value="/goPersonalQueListAdmin.mdo${paging.makeQueryPage(pageNum) }"/>'><i class="fa">${pageNum }</i></a>
		    </li>
		    </c:forEach>
		    <c:if test="${paging.next && paging.endPage >0 }">
		    <li>
		        <a href='<c:url value="/goPersonalQueListAdmin.mdo${paging.makeQueryPage(paging.endPage+1) }"/>'>다음</a>
		    </li>
		    </c:if>
		</ul>
	<!-- End Pagination -->
		<br></br>
		<br></br>
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
<script>
    function numberCounter(target_frame, target_number) {
        this.count = 0;
        this.diff = 0;
        this.target_count = parseInt(target_number);
        this.target_frame = document.getElementById(target_frame);
        this.timer = null;
        this.counter();
    }

    numberCounter.prototype.counter = function () {
        var self = this;
        this.diff = this.target_count - this.count;

        if (this.diff > 0) {
            self.count += Math.ceil(this.diff / 5);
        }

        this.target_frame.innerHTML = this.count
            .toString()
            .replace(/\B(?=(\d{3})+(?!\d))/g, ",");

        if (this.count < this.target_count) {
            this.timer = setTimeout(function () {
                self.counter();
            }, 20);
        } else {
            clearTimeout(this.timer);
        }
    };

    new numberCounter("counter1", ${blameCount[0]+blameCount[1]});
    new numberCounter("counter2", ${blameCount[0]});
    new numberCounter("counter3", ${blameCount[1]});
    </script>

    <script>
    jQuery(document).ready(function () {
        jQuery(".menu>label").click(function () {
            var submenu = jQuery(this).next("ul");
            if (submenu.is(":visible")) {
                submenu.slideUp();
            } else {
                submenu.slideDown();
            }
        });
    });
</script>
</html>