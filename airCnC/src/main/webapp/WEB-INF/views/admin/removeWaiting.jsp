<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${removeHouse == null }">
		<script type="text/javascript">
			alert("잘못 접근된 경로입니다.")
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${session == 'null' }">
		<script type="text/javascript">
			alert("잘못 접근된 경로입니다.")
			history.go(-1);
		</script>
	</c:if>
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