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
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>공지사항-관리자 페이지</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN.css" />
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin_log.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hostregister.css" />
	<!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
	
	<script type="text/javascript">
      $(function () {
        $(".logbars").click(function () {
          $("#menuItems").fadeToggle("slow");
        });
      });
    </script>
    
	<style>
	#main-menu li:nth-child(1)>a {
		border-left: 1px solid #ee575d;
	}
	
	</style>
</head>
<body>
     <header class="logo" style="position: sticky;">
     <label for="" class="loglabel">공지사항(관리자)</label>
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
	<div id="featured">
			<div class="title">
				<h2 style="color: black;">공지사항 관리</h2>
				<hr>
				<span class="byline">전체 공지사항을 관리합니다.</span><br><br>
				<button id="gonjibtn" type="button" onclick="location.href='/cnc/goaddNotice.mdo' ">
				새 공지 등록</button>
			</div>
			
		<ul class="style1">
		<c:choose>
			<c:when test="${!empty boardList}">
				<c:forEach items="${boardList }" var="board">
				
						<li class="first">
							<p class="date"><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></p>
							<h3>글번호 : ${board.idx }번</h3>
							<p><a href='<c:url value='/detail/${board.idx }.mdo${paging.makeQueryPage(board.idx, paging.cri.page) }'/>'>${board.title }</a></p>
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
		        <a href='<c:url value="/goNoticeListAdmin.mdo${paging.makeQueryPage(paging.startPage-1) }"/>'>이전</a>
		    </li>
		    </c:if>
		    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="pageNum">
		    <li>
		        <a href='<c:url value="/goNoticeListAdmin.mdo${paging.makeQueryPage(pageNum) }"/>'><i class="fa">${pageNum }</i></a>
		    </li>
		    </c:forEach>
		    <c:if test="${paging.next && paging.endPage >0 }">
		    <li>
		        <a href='<c:url value="/goNoticeListAdmin.mdo${paging.makeQueryPage(paging.endPage+1) }"/>'>다음</a>
		    </li>
		    </c:if>
		</ul>
	<!-- End Pagination -->
		<br></br>
		<br></br>
	</div>
	
	</div>

</body>
</html>