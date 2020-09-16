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
	<title>공지사항 페이지</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
    />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/resources/css/SUHWAN.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/resources/css/SUHWAN2.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
    />
	<style>
	#main-menu li:nth-child(1)>a {
		border-left: 1px solid #ee575d;
	}
	</style>
</head>
<body>
	<header class="logo" style="color: #ff5a5f;">
        <span
          ><i
            class="fas fa-images"
            style="font-size: 35px; padding-left: 20px; float: left;"
          ></i
        ></span>
        <label
          for=""
          style="font-size: 40px; color: #046b6b;"
          >공지사항(사용자)</label
        >
      </header>
    <div class="container1">
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
	        <li><a href="#" aria-label="subemnu">안내</a></li>
	      </ul>
	    </li>
	   </ul>
	 </nav>
	 
	 <!-- 우측 게시판 -->
	<div class="center_gonji">
	<table id="list" class="type10">
		<thead>
			<tr>
				<th>글번호</th>
				<th scope="cols">공지사항</th>
				<th scope="cols">등록날짜</th>
			</tr>
		</thead>
		
		<c:choose>
			<c:when test="${!empty boardList}">
				<c:forEach items="${boardList }" var="board">
					<tr>
						<td>${board.idx }</td>
						<td id="longtitle"><a href="#1" name="trigger" style="color: black;">${board.title }</a></td>
						<td><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
					</tr>
					<tr name="article" class="hide">
						<td class="even" colspan="3">${board.content }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<br>
	</div>
	 
		
		
		
	<div style=" float: left; width: 100%; " class="center_paging">
	<!-- Start Pagination -->
		<ul class="pagination" >
		    <c:if test="${paging.prev }">
		    <li>
		        <a href='<c:url value="/selectBoardList.do?page=${paging.startPage-1 }"/>'>이전</a>
		    </li>
		    </c:if>
		    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="pageNum">
		    <li>
		        <a href='<c:url value="/selectBoardList.do?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
		    </li>
		    </c:forEach>
		    <c:if test="${paging.next && paging.endPage >0 }">
		    <li>
		        <a href='<c:url value="/selectBoardList.do?page=${paging.endPage+1 }"/>'>다음</a>
		    </li>
		    </c:if>
		</ul>
	<!-- End Pagination -->
		<br></br>
		<br></br>
	</div>
		
	</div>

	<script type="text/javascript"
			src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$("a[name='trigger']").toggle(function() {
					$(this).closest("tr").next().show();
				}, function() {
					$(this).closest("tr").next().hide();
				});
			});
	</script> 
</body>
</html>