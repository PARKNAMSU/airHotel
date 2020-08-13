<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/admin_salesChart.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sideMenu.css?version=123">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">

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

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/admin_salesChart.js?version=124"></script>
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
	<div style="clear: both;"></div>
	<!-- slider_area_start -->
	<div class="slider_area">
		<div class="slider_active owl-carousel">
			<div class="single_slider  d-flex align-items-center slider_bg_2">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-xl-12 col-md-12">
							<div class="slider_text text-center">
								<h3>Host Reservation Chart</h3>
								<p>Pixel perfect design with awesome contents</p>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
	<!-- slider_area_end -->
	<div id="sidediv">
		<ul id="sidemenu">
			<li class="menu"><a href="salesChart.mdo">매출현황</a></li>
			<li class="menu"><a href="resChart.mdo">숙소이용 현황</a></li>
			<li class="menu"><a href="signupChart.mdo">회원가입 현황</a></li>
			<li class="menu"><a href="hostChart.mdo">호스트 신청 현황</a></li>
		</ul>
	</div>
	<div class="top_first">
		<div class="maindiv">
			<a class="maintext" id="searchYears" style="color:black;"><img alt=""
				src="${pageContext.request.contextPath}/resources/images/admin/admintri.png"
				style="width: 22px; height: 22px">년도별 검색</a>
		</div>
		<div class="maindiv">
			<a class="maintext" id="searchYear" style="color:black;"><img alt=""
				src="${pageContext.request.contextPath}/resources/images/admin/admintri.png"
				style="width: 22px; height: 22px">년도 검색</a>
		</div>
		<div class="maindiv">
			<a class="maintext" id="searchMonth" style="color:black;"><img alt=""
				src="${pageContext.request.contextPath}/resources/images/admin/admintri.png"
				style="width: 22px; height: 22px">월별 검색</a>
		</div>
		<div class="maindiv">
			<a class="maintext" id="searchCondition" style="color:black;"><img alt=""
				src="${pageContext.request.contextPath}/resources/images/admin/admintri.png"
				style="width: 22px; height: 22px">사용자 정의 검색</a>
		</div>
	</div>
	<div class="top_second">
		<div class="subdiv" id="years">
			<form action="resChartSearch.mdo" id="yearsForm">
				from year<input type="number" min="2000" max="2020"
					name="searchConditionFirst" class="form-control"
					id="yearsCondition1"><br> <br> to year<input
					type="number" min="2000" max="2020" name="searchConditionSecond"
					class="form-control" id="yearsCondition2"> <br> <input
					type="hidden" name="searchType" value="years"> <input
					type="submit" value="검색" class="btn btn-outline-danger">
			</form>
		</div>
		<div class="subdiv" id="year">
			<form action="resChartSearch.mdo">
				year <select name="searchConditionFirst" class="form-control">
					<c:forEach var="i" begin="2000" end="2020">
						<option value="${i}">${i}년</option>
					</c:forEach>
				</select><br> <br> <input type="hidden" name="searchType"
					value="year"> <input type="submit" value="검색"
					class="btn btn-outline-danger">
			</form>
		</div>
		<div class="subdiv" id="month">
			<form action="resChartSearch.mdo">
				month <input type="month" name="searchConditionFirst"
					class="form-control"><br> <br> <input
					type="hidden" name="searchType" value="month"> <input
					type="submit" value="검색" class="btn btn-outline-danger">
			</form>
		</div>
		<div class="subdiv" id="condition">
			<form action="resChartSearch.mdo">
				from <br> <input type="date" class="form-control"
					name="searchConditionFirst" id="dayCondition1"><br> <br>
				to <input type="date" class="form-control"
					name="searchConditionSecond" id="dayCondition2"><br> <br>
				<input type="hidden" name="searchType" value="days"> <input
					type="submit" value="검색" class="btn btn-outline-danger">
			</form>
		</div>
	</div>
	<div style="clear: both;"></div>
	<div class="temp"></div>
	<div class="sales">
		<p style="font-size: 30px; color: black;">숙소 예약 현황</p>
		<div id="salesArea">
			<table class="table table-striped" id="salesTable">
				<tr>
					<th>날짜</th>
					<th>숙소 예약 수</th>
					<th>전년/월/일 대비 증감</th>
					<th>예약비율</th>
					<th>총 예약 수</th>
				</tr>
				<c:if test="${resList != null }">
					<c:if test="${resList.size() >0 }">
						<c:forEach begin="0" end="${resList.size()-1 }" var="i">
							<c:if test="${i == 0 }">
								<tr>
									<td>${resList.get(i).reschart_date }</td>
									<td>${resList.get(i).reschart_num }명</td>
									<td>N/A</td>
									<td>${resList.get(i).reschart_persant }%</td>
									<td>${resList.get(i).reschart_sum }명</td>
								</tr>
							</c:if>
							<c:if test="${i > 0 }">
								<tr>
									<td>${resList.get(i).reschart_date }</td>
									<td>${resList.get(i).reschart_num }명</td>
									<td>${resList.get(i).reschart_compare_before }명</td>
									<td>${resList.get(i).reschart_persant }%</td>
									<td>N/A</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</c:if>
			</table>
			<button onclick="ReportToExcel()" class="btn btn-outline-danger"
				style="font-size: 30px; margin-top: 10px;">보고서 다운로드(Excel)</button>
			&nbsp;&nbsp;
			<button onclick="ReportToPDF()" id="reportPDF"
				class="btn btn-outline-danger"
				style="font-size: 30px; margin-top: 10px;">보고서 다운로드(PDF)</button>
			<button onclick="openResDetail()" class="btn btn-outline-danger"
				style="font-size: 30px; margin-top: 10px;">상세검색</button>
		</div>

	</div>
	<div class="chart" style="margin-bottom: 5%;">
		<p style="font-size: 30px; color: black;">숙소 예약 그래프</p>
		<div id="salesChart"></div>
		<button onclick="getCharts()" class="btn btn-outline-danger"
			style="font-size: 30px; margin-top: 10px;">예약현황 보기</button>
		&nbsp;&nbsp;
		<button onclick="getPieCharts()" class="btn btn-outline-danger"
			style="font-size: 30px; margin-top: 10px;">예약비율 보기</button>
	</div>
	<div style="clear: both;"></div>
	<footer>
		<%@ include file="../html/footer.jsp"%>
	</footer>
</body>

<script type="text/javascript">
$(function(){
	$("#yearsCondition1").change(function() {
		$("#yearsCondition2").attr("min", $("#yearsCondition1").val())
	}), 
	$("#yearsCondition2").change(function() {
		$("#yearsCondition1").attr("max", $("#yearsCondition2").val())
	}),
	$("#dayCondition1").change(function() {
		$("#dayCondition2").attr("min", $("#dayCondition1").val())
	}), 
	$("#dayCondition2").change(function() {
		$("#dayCondition1").attr("max", $("#dayCondition2").val())
	})
})

function ReportToExcel(){
	fname = prompt("파일 이름을 입력해주세요")
	if(fname != null || fname == ""){
	$("#salesTable").table2excel({
		exclude: ".noExl",
		name: "Excel sales",
		filename:fname+'.xls',
		fileext:"xls",
		exclude_img: true,
		exclued_links: true,
		exclude_inputs:true
	})
	}
}
	function ReportToPDF(){
		fname = prompt("파일 이름을 입력해주세요")
		if(fname != null || fname == ""){
			html2canvas(document.getElementById("salesTable"), {
				 onrendered : function(canvas){
				  var imgData = canvas.toDataURL('image/png');
		            var pageWidth = 210;
		            var pageHeight = pageWidth * 1.414;
		            var imgWidth = pageWidth - 20;
		            var imgHeight = $('#salesTable').height() * imgWidth / $('#salesTable').width();
				  var doc = new jsPDF('p','mm',[pageHeight, pageWidth]);

				 doc.addImage(imgData, 'PNG',10 ,10,imgWidth, imgHeight);
				 doc.save(fname+'.pdf');
			  } 
			});
		}
	}

	function getCharts(){
	    google.charts.load('current', {'packages':['bar']});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	      var data = google.visualization.arrayToDataTable([
	        ['chart', 'reservation'],
	        <c:forEach items="${resList}" var="list">
	        	['${list.reschart_date}',${list.reschart_num}],
	        </c:forEach>
	      ]);

	      var options = {
	        chart: {
	          title: '숙소 예약 그래프',
	          subtitle: 'Reservation, House',
	        }
	      };

	      var chart = new google.charts.Bar(document.getElementById('salesChart'));

	      chart.draw(data, google.charts.Bar.convertOptions(options));
	    }
	}
	function getPieCharts(){
	      google.charts.load('current', {'packages':['corechart']});
	      google.charts.setOnLoadCallback(drawChart);

	      function drawChart() {

	        var data = google.visualization.arrayToDataTable([
	          ['Task', 'Hours per Day'],
		        <c:forEach items="${resList}" var="list">
	        		['${list.reschart_date}',${list.reschart_num }],
	        	</c:forEach>
	        ]);

	        var options = {
	          title: '예약비율',
	          pieSliceText: 'label'
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('salesChart'));

	        chart.draw(data, options);
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