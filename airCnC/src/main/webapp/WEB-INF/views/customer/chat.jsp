<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chat.css?version=123">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> 
<title>Insert title here</title>
</head>
<body>
<header>
<%@include file="../html/menu.jsp" %>
</header>

<div style="clear:both;"></div>
<%@include file="../html/sideMenu.jsp" %>
	
	<div class="headdiv">
		<h1 style="font-size:40px;margin-left:3%;">나의 채팅</h1>
	</div>
	<div class="chatdiv">
		<div id="chatbox">
			<div id="chatelement" onclick="openChat('message.do?message_to_id=admin')">
				<div  id="imgdiv" >
					<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/human.png" style="width:64px;height:64px;"><!-- db에서 받아온 이미지 -->
				</div>
				<div id="namediv">
					<p>admin</p><!-- db에서 받아온 이름 -->
					<br>
					<p style="color:gray;"></p><!-- db에서 받아온 최신 메세지 날짜 -->
				</div>
				<div id="textdiv">
					<p>관리자 알람 확인</p><!-- db에서받아온 최신 메세지 -->
				</div>
			</div>
			<hr>
			<c:forEach items="${messageList }" var="list">
			<div id="chatelement" onclick="openChat('message.do?message_to_id=${list.message_to_id}')">
				<div  id="imgdiv" >
					<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/human.png" style="width:64px;height:64px;"><!-- db에서 받아온 이미지 -->
				</div>
				<div id="namediv">
					<p>${list.message_to_name}</p><!-- db에서 받아온 이름 -->
					<br>
					<p style="color:gray;">${list.message_regdate}</p><!-- db에서 받아온 최신 메세지 날짜 -->
				</div>
				<div id="textdiv">
					<p>안녕하세요 예약감사합니다</p><!-- db에서받아온 최신 메세지 -->
				</div>
			</div>
			<hr>
			</c:forEach>
			<div id="chatelement">
			
			</div>
			<div id="chatelement">
			
			</div>
			<div id="chatelement">
			
			</div>
		</div>
	</div>
<div style="clear:both;"></div>

<footer>
<%@include file="../html/footer.jsp" %>
</footer>
<script type="text/javascript">
	function openChat(url){
		var openWin = window.open(url,"rankpopup","width=750, height=900, resizable = no, scrollbars = no");
	}
</script>
</body>
</html>