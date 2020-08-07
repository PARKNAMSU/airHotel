<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="font-family: 'Jua', sans-serif;">
	<c:if test="${blameVO.blame_target_member_id eq null || blameVO.blame_target_member_id eq '' }">
	<script type="text/javascript">
		self.close();
	</script>
	</c:if>
	<div style="text-align: center;width:650px;margin-top:5%;margin-left:5%;">
		<h1 style="font-size:40px;">호스트 신고 (${blameVO.blame_target_member_id}) </h1><br>
		<p style="font-size:30px;">해당 호스트가 마음에 들지 않으셨나요?</p>
		<p style="font-size:30px;">신고하실 내용을 입력해 주세요</p>
		<form action="insertBlameHost.do" method="post" id="blameForm">
			<textarea rows="" cols="" class="form-control" name="blame_content"></textarea><br>
			<input type="hidden" name="blame_member_id" value="${blameVO.blame_member_id }">
			<input type="hidden" name="blame_target_member_id" value="${blameVO.blame_target_member_id}">
			<input type="button" onclick="formSubmit()" value="제출" class="btn btn-outline-danger" style="font-size:30px;margin-left:70%;" onclick="">&nbsp;&nbsp;<button style="font-size:30px;" class="btn btn-outline-danger" onclick="window.close()">취소</button>
		</form>
	</div>
</body>
<script type="text/javascript">
	function formSubmit(){
		var result = confirm("신고하시겠습니까?")
		if(result){
			document.getElementById("blameForm").submit()
		}else{
			self.close()
		}
	}
</script>
</html>