<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		${registerHouse.house_seq}<br>
		${registerHouse.house_name }<br>
		${registerHouse.house_price_default }<br>
		${registerHouse.house_location_fulladdress }<br>
	</div>
	<a href="registerHouse.mdo?house_seq=${registerHouse.house_seq}"><input type="button" value="등록" /></a>
	<a href="cancelRegister.mdo?house_seq=${registerHouse.house_seq}"><input type="button" value="취소" /></a>
	<br></br>
</body>
</html>