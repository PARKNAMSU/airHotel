<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지2</title>
<script type="text/javascript">
function HouseSubmit() {
	var f = document.write2Form;
	if(f.housePrice.value == "") {
		alert("집가격 입력해주세요.");
		return;
	}
	if(f.houseDesc.value == "") {
		alert("집설명 입력해주세요.");
		return;
	}
	f.action = "<c:url value='/write2.do' />";
	f.submit();
}
function PrevSubmit() {
	var f = document.write2Form;
	f.action = "<c:url value='/topage.do' />";
	f.submit();
}

</script>
</head>
<body>
	<h2>상품 등록2</h2>
	<c:url value="/write2.do" var="actionUrl" />
	<form:form id="write2Form" name="write2Form" modelAttribute="house" method="POST" action="${actionUrl}">
	
		<table border="1">
			<tr>
				<th><label for="housePrice">가격</label></th>
				<td><form:input path="housePrice" /></td>
				<th><label for="houseDesc">상품설명</label></th>
				<td><form:input path="houseDesc" /></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="등록 - input-submit 형식"> 
				<input type="button" value="목록" 
				onclick="location.href='/hotel/list.do';"></td>
			</tr>
		</table>
	</form:form>
	<div>
	    [<a href="<c:url value='/list.do' />">목록</a>]
	    [<a href="#" onclick="PrevSubmit();">이전</a>]
	    [<a href="#" onclick="HouseSubmit();">등록 - a-javascript-submit 형식</a>]
    </div>
</body>
</html>