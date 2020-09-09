<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>	
<html>
<head>
	<meta charset="UTF-8">
	<title>집 목록</title>
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hostdetail1.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	
	<style>
	table {
	margin: auto;
	}
	table, th, td{
	border: 1px solid black;
	}
	td {
	height : 20px;
	width : 100px;
	padding: 20px;
	text-align: center;
	}
	
	</style>
</head>
<body>
<!-- header-start -->
    <header class="menudiv1">
      <div class="menudiv2-1">
        <label for="menudiv2-1"><a href="/cnc/myHouse.do">숙소 및 게스트</a></label>
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
    
<div class="container">
<h2>집 목록</h2>
	<table border="1">
		<tr>
			<th>집순번</th>
			<th>집이름</th>
			<th>숙소사진</th>
			<th>집가격</th>
			<th>집등록일</th>
		</tr>
		<hr>
			<c:choose>
			
				<c:when test="${!empty list}">
				
					<c:forEach items="${list }" var="list">
						<tr>
							<td>${list.house_seq }</td>
							<td>${list.house_name }</td>
							<td>
							<a href='<c:url value='/revisehouse/${list.house_seq}.do'/>'>
								<img alt="${list.house_photourl}" src="/upload_img/${list.house_photourl}" style="width:100px; height: 100px;" />
							</a>
							</td>
							<td>
								<fmt:formatNumber value="${list.house_price_default }"
								pattern="###,###,###" />
							</td>
							<td><fmt:formatDate value="${list.house_regdate }" pattern="yyyy-MM-dd"/></td>
						</tr>
						<input type="hidden" name="house_seq" value="${list.house_seq }">
						
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">등록된 글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
	</table>
    <input type="button" value="뒤로" class="submitbtn"  
     onclick="location.href='/cnc/hostregisterindex.do'"/>
     
</div>
</body>
</html>