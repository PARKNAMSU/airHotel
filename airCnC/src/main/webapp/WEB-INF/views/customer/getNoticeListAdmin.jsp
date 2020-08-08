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
	
	<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
		href="../css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN.css">
	
	<style>
		.title
		{
			margin-bottom: 3em;
		}

		.title h2
		{
			text-transform: lowercase;
			font-size: 2.8em;
		}

		.title .byline
		{
			font-size: 1.3em;
			color: #6F6F6F;
		}
		ul.style1
		{
			margin: 0 auto;
			padding: 0;
			width: 80%;
			overflow: hidden;
			list-style: none;
			text-align: left;
			color: #6c6c6c
		}

		ul.style1 li
		{
			padding: 1.6em 0em 0em 0em;
			margin: 0 0 2.5em 0;
			border-top: 1px solid rgba(0,0,0,.1);
		}

		ul.style1 li:first-child
		{
			border-top: none;
		}

		ul.style1 p
		{
			padding: 10px 0em 10px 0em;
			margin: 0;
		}

		ul.style1 a
		{
			display: block;
			text-decoration: none;
			color: #2D2D2D;
		}

		ul.style1 a:hover
		{
			text-decoration: underline;
		}

		ul.style1 h3
		{
			padding: 1em 0em 20px 0em;
			text-transform: uppercase;
			font-size: 1em;
			font-weight: 400;
		}

		ul.style1 .first
		{
			padding-top: 0;
			background: none;
		}

		ul.style1 .date
		{
			float: left;
			position: relative;
			width: 80px;
			height: 70px;
			margin: 0.5em 1.5em 0em 0.5em;
			padding: 1.5em 0em 1.5em 0em;
			box-shadow: 0px 0px 0px 5px rgba(255,255,255,0.1);
			line-height: normal;
			text-align: center;
			text-transform: uppercase;
			text-shadow: 0px 1px 0px rgba(0,0,0,.2);
			font-size: 1em;
			font-weight: 400;
			border-right: 1px solid rgba(0,0,0,.1);
		}

		ul.style1 .date:after
		{
			content: '';
			display: block;
			position: absolute;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			border-radius: 6px;
		}

		ul.style1 .date b
		{
			margin: 0;
			padding: 0;
			display: block;
			margin-top: -5px;
			font-size: 1.8em;
			font-weight: 700;
		}

		ul.style1 .date a
		{
		}

		ul.style1 .date a:hover
		{
			text-decoration: none;
		}


		#featured
		{
			overflow: hidden;
			margin-bottom: 3em;
			padding-top: 5em;
			border-top: 1px solid rgba(0,0,0,0.08);
		}


		.pagination {
		  position: absolute;
		  left: 50%;
		  -webkit-transform: translate(-50%, -50%);
				  transform: translate(-50%, -50%);
		  margin: 0;
		  padding: 10px;
		  background-color: #fff;
		  border-radius: 40px;
		  box-shadow: 0 5px 25px 0 rgba(0, 0, 0, 0.1);
		}
		.pagination li {
		  display: inline-block;
		  list-style: none;
		}
		.pagination li a {
		  display: block;
		  width: 40px;
		  height: 40px;
		  line-height: 40px;
		  background-color: #fff;
		  text-align: center;
		  text-decoration: none;
		  color: #252525;
		  border-radius: 4px;
		  margin: 5px;
		  box-shadow: inset 0 5px 10px rgba(0, 0, 0, 0.1), 0 2px 5px rgba(0, 0, 0, 0.1);
		  -webkit-transition: all 0.3s ease;
		  transition: all 0.3s ease;
		}
		.pagination li a:hover, .pagination li a.active {
		  color: #fff;
		  background-color: #ff4242;
		}
		.pagination li:first-child a {
		  border-radius: 40px 0 0 40px;
		}
		.pagination li:last-child a {
		  border-radius: 0 40px 40px 0;
		}


		#gonjibtn {
		float:right;
			width:100px;
			background-color: #f8585b;
			border-radius:10px 0 10px 0;
			border: none;
			color:#fff;
			padding: 15px 0;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 15px;
			margin: 4px;
			cursor: pointer;
		}




	 </style>
</head>
<body>
	<header class="menudiv1">
        <div class="menudiv2-1">
            <img alt="" src="../images/logo2.png">
        </div>
        <div class="menudiv2-2">
            <div class="menudiv3-1" id="div1">
                <ul id="menuItems">
                    <li class="item">호스트</li>
                    <!-- 히든으로 리스트 -->
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
                        <h3>notice</h3>
                        <p>관리자-공지사항은 여기에요</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->
    
    <div class="container">
	<div id="featured">
			<div class="title">
				<h2>공지사항 관리</h2>
				<hr>
				<span class="byline">전체 공지사항을 관리합니다.</span><br><br>
				<button id="gonjibtn" type="button" onclick="location.href='/cnc/goaddNotice.do' ">
				새 공지 등록</button>
			</div>
			
		<ul class="style1">
		<c:choose>
			<c:when test="${!empty boardList}">
				<c:forEach items="${boardList }" var="board">
				
						<li class="first">
							<p class="date"><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></p>
							<h3>글번호 : ${board.idx }번</h3>
							<p><a href="/cnc/detail/${board.idx }.do">${board.title }</a></p>
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
		        <a href='<c:url value="/goNoticeListAdmin.do?page=${paging.startPage-1 }"/>'>이전</a>
		    </li>
		    </c:if>
		    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="pageNum">
		    <li>
		        <a href='<c:url value="/goNoticeListAdmin.do?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
		    </li>
		    </c:forEach>
		    <c:if test="${paging.next && paging.endPage >0 }">
		    <li>
		        <a href='<c:url value="/goNoticeListAdmin.do?page=${paging.endPage+1 }"/>'>다음</a>
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
</html>