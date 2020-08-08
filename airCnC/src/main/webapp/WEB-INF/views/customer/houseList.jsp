<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>	
<html>
<head>
<meta charset="UTF-8">
<title>집 목록</title>
</head>
<body>
<h2>집 목록</h2>
<input type="button" value="상품등록" 
				onclick="location.href='/hotel/topage.do';">
<table border="1">
	<tr>
		<th>집 번호</th>
		<th>집 이미지</th>
		<th>집 이름</th>
		<th>집 가격</th>
	</tr>
	<c:forEach var="row" items="${list }">
	<tr>
		<td>${row.houseId }</td>
		<td>
			<a href="/hotel/detail/${row.houseId }.do">
			</a>
		</td>
		<td>
			<a href="/hotel/detail/${row.houseId}.do">
			${row.houseName }</a>
		</td>
		<td>
			<fmt:formatNumber value="${row.housePrice }"
			pattern="###,###,###" />
		</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>