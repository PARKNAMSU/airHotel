<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chatpopup.css">
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
<body style="font-family: 'Jua', sans-serif;">
	<div id="headdiv">
		<h1>${toId}</h1>
	</div>
	<div id="chatdiv" style="font-family: 'Jua', sans-serif;">


		<c:forEach begin="0" end="${messageList.size() -1}" step="1" var="i">
			<c:if test="${i == 0}">
			<div id="dateline">
				<b style="color:gray;">${messageList.get(i).message_date}</b>
			</div>
			</c:if>
			
			<c:if test="${i > 0 }">
				<c:if test="${messageList.get(i).message_date != messageList.get(i-1).message_date}">
					<div id="dateline">
						<b style="color:gray;">${messageList.get(i).message_date}</b>
					</div>
				</c:if>
			</c:if>
			
			<c:if test="${messageList.get(i).message_type eq 'info' }">
				<div id="infoline">
					<b >${messageList.get(i).message_content}</b>
				</div>
			</c:if>
			<c:if test="${messageList.get(i).message_type eq 'nomal' }">
			<c:choose>
				<c:when test="${i == messageList.size() -1}">
					<div class="chatline" id="firstChat">
						<div  id="imgdiv" onclick="">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/human.png" style="width:64px;height:64px;"><!-- db에서 받아온 이미지 -->
							</div>
						<div id="namediv">
						
							<c:if test="${toId eq 'admin'}"><p>admin</p></c:if>
							<p>${messageList.get(i).message_from_name}</p><!-- db에서 받아온 이름 -->
							<p style="color:gray;">${messageList.get(i).message_time}</p><!-- db에서 받아온 최신 메세지 날짜 -->
						</div>
						<div id="textdiv">
							<p>${messageList.get(i).message_content}</p><!-- db에서받아온 최신 메세지 -->
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="chatline">
						<div  id="imgdiv" onclick="">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/human.png" style="width:64px;height:64px;"><!-- db에서 받아온 이미지 -->
							</div>
						<div id="namediv">
							<p>${messageList.get(i).message_from_name}</p><!-- db에서 받아온 이름 -->
							<p style="color:gray;">${messageList.get(i).message_time}</p><!-- db에서 받아온 최신 메세지 날짜 -->
						</div>
						<div id="textdiv">
							<p>${messageList.get(i).message_content}</p><!-- db에서받아온 최신 메세지 -->
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			</c:if>
		</c:forEach>
	</div>
	<div style="clear:both;"></div>
	<div id="submitdiv">
		<form action="insertMessage.do" method="post" class="form-inline">
			<input type="text" name="message_content" style="width:570px;height:50px;"class="form-control" id="message_content">
			<input type="hidden" name="message_type" value="nomal">
			<input type="hidden" name="message_from_id" value="${login_session}">
			<input type="hidden" name="message_to_id" value="${toId}">
			<c:if test="${toId eq 'admin'}"><input type="submit" value="전송" class="btn btn-danger" style="font-size:30px;" disabled="disabled"></c:if>
			<c:if test="${toId != 'admin'}"><input type="submit" value="전송" class="btn btn-danger" style="font-size:30px;"></c:if>
		</form>
	</div>
	<div style="margin-left:15%;margin-top:5%;">
	<button class="btn btn-danger" style="font-size:30px;" onclick="window.close()">닫기</button>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#chatdiv").animate({scrollTop:$("#firstChat").offset().top,duration:400});
	})
</script>
</html>