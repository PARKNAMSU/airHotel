<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%
	//테스트용 값
	List<Integer> list = new ArrayList<Integer>();
	for(int i=1;i<=53;i++){
		list.add(i);
	}
	session.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin_log.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admincss/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admincss/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admincss/style.css">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<header>
		<%@ include file="../html/menu.jsp" %>
	</header>
	<div style="clear:both;"></div>
    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider  d-flex align-items-center slider_bg_2">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3>Log Check</h3>
                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>

    </div>
    <!-- slider_area_end -->
	<div class="container-xl"> 
		<div class="all">
			<div class="headdiv">
				<form action="getLog.do" class="form-inline" id="logForm">
					<select name="log_type" class="form-control form-control-lg" style="margin-right:30px;margin-left:0%;">
						<option value="login">로그인</option>
						<option value="logout">로그아웃</option>
						<option value="logout">회원가입</option>
						<option value="logout">회원탈퇴</option>
						<option value="reservation">예약</option>
						<option value="sendMessage">메세지전송</option>
					</select>
					<input type="date" class="form-control form-control-lg" id="startDate" name="startDate" style="margin-right:30px">~<b style="margin-right:30px;"></b>
					<input type="date" class="form-control form-control-lg" id="endDate" name="endDate" style="margin-right: 30px;">
					<input type="text" name="id" class="form-control form-control-lg" placeholder="아이디" style="margin-right:30px" >
					<input type="button" value="검색" class="btn btn-outline-danger" id="formBtn" style="font-size:20px">
				</form>
			</div>
			
			<input type="hidden" value="" id="allElement">
			<div class="maindiv">
				<table class="table table-striped" id="logtable">
					<tr class="table-danger">
						<th>아이디</th>
						<th>내용</th>
						<th>타입</th>
						<th>날짜</th>
					</tr>
					<c:forEach begin="1" end="10" var="i">
					<tr>
						<td id="name${i}"></td>
						<td id="state${i}"></td>
						<td id="type${i}"></td>
						<td id="date${i}"></td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div style="margin-bottom: 10%;width:500px;margin-left: 40%;margin-top: 5%;">
			<a onclick="clickPrev()" id="prev" class="page" style="font-size:20px;">prev</a>
				<c:forEach begin="1" end="5" var="i">
					<a class="page" id="page${i}" onclick="loadLog(${i})" style="font-size:20px;">${i}</a>
				</c:forEach>		
			<a onclick="clickNext()" id="next" class="page" style="font-size:20px;">next</a>
			</div>
		</div>
	</div>

	<footer>
		<%@include file="../html/footer.jsp" %>
	</footer>
</body>

<script type="text/javascript">
$(document).ready(function() {
	$("#startDate").change(function() {
		$("#endDate").attr("min", $("#startDate").val())
	}), 
	$("#endDate").change(function() {
		$("#startDate").attr("max", $("#endDate").val())
	})
})
var getData;
var page = 1;
var area = 1;
var allElement = Number(document.getElementById("allElement").value)
var allPage = 0;
var instanceNum = 10;//한페이지당 인스턴스 수
var areaToPageNum = 5;//한에어리어의 페이지 수
		$(function(){
			$("#formBtn").click(function(){
			     $.ajax({

			           type:"GET",
			           url:"getLog.mdo",
			           dataType:"json",
			           data:$("#logForm").serialize(), // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			   
			           success : function(data) {
							getData = data;
							alert(getData.length)
							$("allElement").val(getData.length)
							allElement = Number($("allElement").val(getData.length))
							for(var i=0;i<instanceNum;i++){
								if(getData[i] != null){
									$("#name"+(i+1)).html(getData[i].log_id)
									$("#state"+(i+1)).html(getData[i].log_content)
									$("#type"+(i+1)).html(getData[i].log_type)
									$("#date"+(i+1)).html(getData[i].log_regdate)
								}else{
									$("#name"+(i+1)).html("")
									$("#state"+(i+1)).html("")
									$("#type"+(i+1)).html("")
									$("#date"+(i+1)).html("")
								}
							}
			           },
			           error : function() {
			                 alert("에러발생");
			           }
			     });	
			})
		})
	
//페이징 처리

if(allElement%10 == 0){
	allPage = Math.floor(allElement/(instanceNum*areaToPageNum));//5는 나중에 사용자 설정으로 변경(한페이에서의 row 수,한 에어리어의 페이지 수)
}else{
	allPage = Math.floor(allElement/(instanceNum*areaToPageNum)) +1;
}
if(allPage <= 1){
	$("#next").css('display','none');
}
var clickNext = function(){
	area += 1;
	if(area > 1){
		$("#prev").css('display','initial')
	}
	if(area == allPage){
		$("#next").css('display','none');
		if(area !=Math.floor(allElement/(instanceNum*areaToPageNum))){

			var page = allElement - (instanceNum*areaToPageNum*Math.floor(allElement/(instanceNum*areaToPageNum)))
			var pageDiv = page/5
			if(pageDiv !== parseInt(pageDiv, 10)){
				pageDiv = Math.floor(pageDiv)+1;
			}
			var a= 0;
			for(var i=area;i<area+pageDiv;i++){
				a = a+1
				$("#page"+a).html(a+(5*(area-1)));
				
			}
			for(var i =6-a;i>a;i--){
				$("#page"+i).html("");
			}
		}else{
			var a = 1
			for(var i=area ;i<area+5;i++){
				$("#page"+a).html(a+(5*(area-1)));
				a = a+1
			}	
		}
	}else{
		var a = 1
		for(var i=area ;i<area+5;i++){
			$("#page"+a).html(a+(5*(area-1)));
			a = a+1
		}	
	}
}
var clickPrev = function(){
	area -= 1;
	if(area == 1){
		$("#prev").css('display','none');
	}
	if(area < allPage){
		$("#next").css('display','initial');
	}
	var a= 1
	for(var i=area ;i<area+5;i++){
		$("#page"+a).html(a+(5*(area-1)));
		a = a+1
	}		
} 

var loadLog = function(pageNum){
	var num = ((area-1)*areaToPageNum + pageNum) * instanceNum - (instanceNum-1)
	a = 1;
	for(var i = num ; i<num+instanceNum;i++){
		if(getData[i-1] != null){
			$("#name"+(a)).html(getData[i-1].log_id)
			$("#state"+(a)).html(getData[i-1].log_content)
			$("#type"+(a)).html(getData[i-1].log_type)
			$("#date"+(a)).html(getData[i-1].log_regdate)
		}else{
			$("#name"+(a)).html("")
			$("#state"+(a)).html("")
			$("#type"+(a)).html("")
			$("#date"+(a)).html("")
		}
		a = a+1;
	}
}

</script>
</html>