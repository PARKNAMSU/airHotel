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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin_log.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

<!-- pdf,excel -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/javascript/jquery.table2excel.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.2/jspdf.plugin.autotable.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/javascript/html2canvas.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/javascript/bluebird.min.js"></script>
	
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<header class="menudiv1" style="position: sticky;">
		<div class="menudiv2-1">
			<img alt="" src="${pageContext.request.contextPath}/resources/image/trip/logo2.png" />
		</div>
		<div class="menudiv2-2" style="margin-left:56%">
			<div class="menudiv3-1" id="div1" >
				<ul id="menuItems" >
					<c:catch>
						<c:choose>
							<c:when test="${admin_session eq null}">
								<script>history.go(-1);</script>
							</c:when>
							<c:otherwise>
								<li class="item" ><a href="http://localhost:8080/cnc/blamelist.mdo" style="color:white;">신고관리</a></li>
								<li class="item"><a href="http://localhost:8080/cnc/salesChart.mdo" style="color:white;">통계</a></li>
								<li class="item"><a href="http://localhost:8080/cnc/getRegisterWaitingList.mdo" style="color:white;">호스트관리</a></li>
								<li class="item"><a href="http://localhost:8080/cnc/logPage.mdo" style="color:white;">로그관리</a></li>
								<li class="item"><a href="http://localhost:8080/cnc/makeCupon.mdo" style="color:white;">쿠폰관리</a></li>
								<li class="item"><a href="http://localhost:8080/cnc/goNoticeListAdmin.mdo" style="color:white;">게시판관리</a></li>
								<li class="item"><a href="/cnc/logout.mdo" style="color:white;">로그아웃</a></li>	
							</c:otherwise>
						</c:choose>
					</c:catch>
				</ul>
			</div>
		</div>
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
    <div style="clear:both;"></div>
    <!-- slider_area_end -->
		<div class="all" style="width:60%;border: solid;margin-left:20%;margin-bottom:10%;overflow:scroll;">
			<div class="headdiv" style="border: solid;">
				<form action="getLog.mdo" class="form-inline" id="logForm">
					<select name="log_type" class="form-control form-control-lg" style="margin-right:30px;margin-left:0%;">
						<option value="login">로그인</option>
						<option value="logout">로그아웃</option>
						<option value="createAccount">회원가입</option>
						<option value="reservation">예약</option>
						<option value="sendMessage">메세지전송</option>
						<option value="insertCommnets">후기등록</option>
						<option value="updateComments">후기수정</option>
						<option value="insertBlame">유저신고</option>
					</select>
					<input type="date" class="form-control form-control-lg" id="startDate" name="startDate" style="margin-right:30px">~<b style="margin-right:30px;"></b>
					<input type="date" class="form-control form-control-lg" id="endDate" name="endDate" style="margin-right: 30px;">
					<input type="text" name="log_id" id="log_id" class="form-control form-control-lg" placeholder="아이디" style="margin-right:30px" >
					<input type="button" value="검색" class="btn btn-outline-danger" id="formBtn" style="font-size:20px">
				</form>
			</div>
			
			<input type="hidden" value="" id="allElement">
			<div class="maindiv">
				<table class="table table-striped" id="logtable">
					<tr class="table-danger" id="tr0">
						<th>번호</th>
						<th>아이디</th>
						<th>내용</th>
						<th>타입</th>
						<th>날짜</th>
					</tr>
					<c:forEach begin="1" end="5" var="i">
					<tr id="tr${i}">
						<td id="seq${i}"></td>
						<td id="name${i}"></td>
						<td id="state${i}"></td>
						<td id="type${i}"></td>
						<td id="date${i}"></td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div style="margin-bottom: 10%;width:500px;margin-left: 40%;margin-top: 5%;">
			<div style="float:left;box-shadow: 2px 2px 2px 2px gray;border-radius: 15px 15px 15px 15px;padding:10px;">
				<a onclick="clickPrev()" id="prev" class="page" style="font-size:20px;color:black;">prev</a>
					<c:forEach begin="1" end="5" var="i">
						<a class="page" id="page${i}" onclick="loadLog(${i})" style="font-size:20px;color:black;margin-left:10px">${i}</a>
					</c:forEach>		
				<a onclick="clickNext()" id="next" class="page" style="font-size:20px;color:black;">next</a>
			</div>
			<select id="instanceNum" style="width:200px;margin-left:90%;"onchange="" class="form-control form-control-lg">
				<option value="5">5</option>
				<option value="10">10</option>
				<option value="15">15</option>
				<option value="20">20</option>
			</select>
			</div>
			<div>
				<button class="btn btn-outline-danger" onclick="ReportToExcel()">로그 문서화(Excel)</button>&nbsp;&nbsp;
				<button class="btn btn-outline-danger" onclick="ReportToPDF()">로그 문서화(PDF)</button>&nbsp;&nbsp;
				<button class="btn btn-outline-danger" onclick="deleteLog()">로그 기록 삭제</button>
			</div >
		</div>
</body>
<script type="text/javascript">
var getData;
var page = 1;
var area = 1;
var allElement = Number(document.getElementById("allElement").value)
var allArea = 0;
var allPage = 0;
var instanceNum = 5;//한페이지당 인스턴스 수
var areaToPageNum = 5;//한에어리어의 페이지 수
$(document).ready(function() {
	$("#startDate").change(function() {
		$("#endDate").attr("min", $("#startDate").val())
	}), 
	$("#endDate").change(function() {
		$("#startDate").attr("max", $("#endDate").val())
	}),
	$("#instanceNum").change(function(){
		for(var i=1; i<=instanceNum; i++){
			$("#tr"+i).remove()
		}
		instanceNum = this.value
		
		for(var i=1;i<=instanceNum; i++){
			var innerHtml = "";
			innerHtml += '<tr id="tr'+i+'"><td id="seq'+i+'"></td><td id="name'+i+'"></td><td id="state'+i+'"></td><td id="type'+i+'"></td><td id="date'+i+'"></td></tr>'
			$("#logtable > tbody:last").append(innerHtml);
		}
		loadLog(page);
		alert(instanceNum)
	})
})


		$(function(){
			$("#formBtn").click(function(){
			     $.ajax({

			           type:"GET",
			           url:"getLog.mdo",
			           dataType:"json",
			           data:$("#logForm").serialize(), // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			   
			           success : function(data) {
							getData = data;
							$("#allElement").val(getData.length)
							allElement = Number($("#allElement").val())
							if(allElement%10 == 0){
								allArea = Math.floor(allElement/(instanceNum*areaToPageNum));//5는 나중에 사용자 설정으로 변경(한페이에서의 row 수,한 에어리어의 페이지 수)
							}else{
								allArea = Math.floor(allElement/(instanceNum*areaToPageNum)) +1;
								alert(allArea);
							}
							if(allArea <= 1){
								$("#next").css('display','none');
							}else{
								$("#next").css('display','initial');
							}
							for(var i=0;i<instanceNum;i++){
								if(getData[i] != null){
									$("#seq"+(i+1)).html(getData[i].log_seq)
									$("#name"+(i+1)).html(getData[i].log_id)
									$("#state"+(i+1)).html(getData[i].log_content)
									$("#type"+(i+1)).html(getData[i].log_type)
									$("#date"+(i+1)).html(getData[i].log_regdate)
								}else{
									$("#seq"+(i+1)).html("")
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
	allArea = Math.floor(allElement/(instanceNum*areaToPageNum));//5는 나중에 사용자 설정으로 변경(한페이에서의 row 수,한 에어리어의 페이지 수)
}else{
	allArea = Math.floor(allElement/(instanceNum*areaToPageNum)) +1;
	alert(allArea);
}
if(allArea <= 1){
	$("#next").css('display','none');
}
var clickNext = function(){
	area += 1;
	if(area > 1){
		$("#prev").css('display','initial')
	}
	if(area == allArea){
		$("#next").css('display','none');
		if(allElement % instanceNum*areaToPageNum != 0){
			
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
			for(var i =a+1;i<6;i++){
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
	$("#next").css('display','initial');
	if(area == 1){
		$("#prev").css('display','none');
	}
	var a= 1
	for(var i=area ;i<area+5;i++){
		$("#page"+a).html(a+(5*(area-1)));
		a = a+1
	}		
} 

var loadLog = function(pageNum){
	page = pageNum;
	var num = ((area-1)*areaToPageNum + pageNum) * instanceNum - (instanceNum-1)
	a = 1;
	for(var i = num ; i<num+instanceNum;i++){
		if(getData[i-1] != null){
			$("#seq"+(a)).html(getData[i-1].log_seq)
			$("#name"+(a)).html(getData[i-1].log_id)
			$("#state"+(a)).html(getData[i-1].log_content)
			$("#type"+(a)).html(getData[i-1].log_type)
			$("#date"+(a)).html(getData[i-1].log_regdate)
		}else{
			$("#seq"+(a)).html("")
			$("#name"+(a)).html("")
			$("#state"+(a)).html("")
			$("#type"+(a)).html("")
			$("#date"+(a)).html("")
		}
		a = a+1;
	}
}
function ReportToExcel(){
	fname = prompt("파일 이름을 입력해주세요")
	$("#logtable").table2excel({
		exclude: ".noExl",
		name: "Excel sales",
		filename:fname+'.xls',
		fileext:"xls",
		exclude_img: true,
		exclued_links: true,
		exclude_inputs:true
	})

}
	function ReportToPDF(){
			html2canvas(document.getElementById("logtable"), {
				 onrendered : function(canvas){
				  var imgData = canvas.toDataURL('image/png');
		            var pageWidth = 210;
		            var pageHeight = pageWidth * 1.414;
		            var imgWidth = pageWidth - 20;
		            var imgHeight = $('#logtable').height() * imgWidth / $('#logtable').width();
				  var doc = new jsPDF('p','mm',[pageHeight, pageWidth]);

				 doc.addImage(imgData, 'PNG',10 ,10,imgWidth, imgHeight);
				 doc.save('개인지출내역서.pdf');
			  } 
		});
}
	function deleteLog(){
		var result = confirm("정말로 삭제하시겠습니까?");
		if(result){
			location.href = "deleteLog.mdo?log_id="+$("#log_id").val()+"&log_type="+getData[0].log_type+"&startDate="+getData[0].log_regdate+"&endDate="+getData[getData.length-1].log_regdate
		}
	}
    function request() {
        return $.ajax({
            type: "GET",
            url: "resetLogin.mdo",
            async: true
        }).responseText;
    }
    window.onbeforeunload = () => {
        while (true) {
            request();
        }
        return null;
    }
    $(function () {
        $("a").not('#lnkLogOut').click(function () {
            window.onbeforeunload = null;
        });
        $(".btn").click(function () {
            window.onbeforeunload = null;
    	});
    });
</script>

</html>