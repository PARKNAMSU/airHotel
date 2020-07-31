<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지1</title>
<script type="text/javascript">
function HouseSubmit() {
	var f = document.write1Form;
	if(f.houseId.value == "") {
		alert("집번호 입력해주세요.");
		return;
	}
	if(f.houseName.value == "") {
		alert("집이름 입력해주세요.");
		return;
	}
	f.submit();
}
</script>
</head>
<body>
	<h2>상품 등록1</h2>
	<c:url value="/write1.do" var="actionUrl" />
	<form:form id="write1Form" name="write1Form" modelAttribute="house" method="POST" action="${actionUrl}">
		<table border="1">
			<tr>
				<th><label for="houseId">집번호</label></th>
				<td><form:input path="houseId" /></td>
				<th><label for="houseName">집이름</label></th>
				<td><form:input path="houseName" /></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="다음페이지로 - input-submit 형식"> 
				<input type="button" value="목록" 
				onclick="location.href='/hotel/list.do';"></td>
			</tr>
		</table>
	</form:form>
	<div>
	    [<a href="<c:url value='/list.do' />">목록</a>]
	    [<a href="#" onclick="HouseSubmit();">다음 - a-javascript-submit 형식</a>]
    </div>
</body>
</html>