<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집 상세보기</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>
				<img src="" width="300" height="300" >
			</td>
			<td>
				<table border="1" style="width:300px; height:300px;">
					<tr align="center">
						<td>집이름</td>
						<td>${detail.houseName }</td>
					</tr>
					<tr align="center">
						<td>집가격</td>
						<td>
							<fmt:formatNumber value="${detail.housePrice }"
							pattern="###,###,###" />
						</td>
					</tr>
					<tr align="center">
						<td>집소개</td>
						<td>${detail.houseDesc }</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>