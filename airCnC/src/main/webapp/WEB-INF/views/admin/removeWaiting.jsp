<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		${removeHouse.house_seq}<br>
		${removeHouse.house_name }<br>
		${removeHouse.house_price_default }<br>
		${removeHouse.house_location_fulladdress }<br>
	</div>
	<a href="updateDate.mdo?house_seq=${removeHouse.house_seq}"><input type="button" value="삭제 허가" /></a>
	<a href="cancelRemove.mdo?house_seq=${removeHouse.house_seq}"><input type="button" value="취소" /></a>
</body>
</html>