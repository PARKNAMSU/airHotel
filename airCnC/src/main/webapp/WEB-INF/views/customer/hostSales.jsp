<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin_salesChart.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- jQuery Excel -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/jquery.table2excel.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/menu.css">
<!-- PDF -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.2/jspdf.plugin.autotable.js"></script>
<script src="${pageContext.request.contextPath}/resources/javascript/html2canvas.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/javascript/bluebird.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${login_session == null }">
		<script type="text/javascript">location.href ='loginView.do'</script>
	</c:if>
	<header class="menudiv1">
		<div class="menudiv2-1">
			<a href="/cnc/indexView.do"><img alt=""
				src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1" style="float:left;">
				<ul id="menuItems">	
						<li class="item"><p><a href="/cnc/indexView.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;">메인페이지</a></p></li>
						<li class="item">
							<p>
								<a href="/cnc/selectBoardList.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >공지사항</a>
							</p>
						</li>
						<li class="item"><p><a href="myHouse.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >호스트</a></p></li>
				</ul>
			</div>
			<div style="width:50px;height:50px;margin-left:35px;margin-top:12px;border-radius: 30px 30px 30px 30px;float:left;background-color:white;overflow:hidden;" id="myinfo">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/my1.jpg" style="max-width:120%;max-height:120%;">
			</div>
		</div>
		<div id="mydiv" style="display:none;margin-left:88%;z-index:100;width:200px;background-color:#d2d2d2;font-size:20px;border-radius: 15px 15px 15px 15px;font-family: 'Jua', sans-serif;" >
					<ul>
						<li><br></li>
						<li style="margin-bottom:20px;"><a href="">내정보</a></li>
						<li style="margin-bottom:20px;"><a href="reservationPage.do">예약한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="myFavoriteHouse.do">저장한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="">쿠폰함</a></li>
						<li style="margin-bottom:20px;"><a href="chat.do">메세지</a></li>
						<li style="margin-bottom:20px;"><a href="logout.do">로그아웃</a></li>
						<li ><br></li>
					</ul>
		</div>
	</header>
	<script type="text/javascript">
		$(function(){
			$("#myinfo").click(function(){
				$("#mydiv").fadeToggle("slow");
			})
		})
	</script>
	<div style="clear:both;"></div>
	    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider  d-flex align-items-center slider_bg_2">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3>Host Sales Chart</h3>
                                <p>Pixel perfect design with awesome contents</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>

    </div>
	<div style="width:100%;border: solid;font-family: 'Jua', sans-serif;">
		<div class="top_first" style="margin-left:23.5%">
			<div class="maindiv" ><a class="maintext" id="searchYears" style="color:black;"><img alt="" src="${pageContext.request.contextPath}/resources/images/admin/admintri.png" style="width:22px;height:22px">년도별 검색</a></div>
			<div class="maindiv"><a class="maintext" id="searchYear" style="color:black;"><img alt="" src="${pageContext.request.contextPath}/resources/images/admin/admintri.png" style="width:22px;height:22px">년도 검색</a></div>
			<div class="maindiv"><a class="maintext" id="searchMonth" style="color:black;"><img alt="" src="${pageContext.request.contextPath}/resources/images/admin/admintri.png" style="width:22px;height:22px">월별 검색</a></div>
			<div class="maindiv"><a class="maintext" id="searchCondition" style="color:black;"><img alt="" src="${pageContext.request.contextPath}/resources/images/admin/admintri.png" style="width:22px;height:22px">사용자 정의 검색</a></div>
		</div>
		<div class="top_second" style="margin-left:23.5%">
			<div class="subdiv" id="years" style="display:initial;">
				<form action="myHouseSales.do" id="yearsForm">
					from year<input type="number" min="2000" max="2020" name="searchConditionFirst" id="yearsCondition1" class="form-control"><br><br>
					to year<input type="number" min="2000" max="2020" name="searchConditionSecond"  id="yearsCondition2" class="form-control">
					<br>
					<input type="hidden" name="searchType" value="years">
					<input type="submit" value="검색" class="btn btn-outline-danger">
				</form>
			</div>
			<div class="subdiv" id="year" style="display:initial;">
				<form action="myHouseSales.do" >
					year
					<select name="searchConditionFirst" class="form-control">
						<c:forEach var="i" begin="2000" end="2020">
							<option value="${i}">${i}년</option>
						</c:forEach>
					</select><br><br>
					<input type="hidden" name="searchType" value="year">
					<input type="submit" value="검색" class="btn btn-outline-danger">
				</form>
			</div>
			<div class="subdiv" id="month" style="display:initial;">
				<form action="myHouseSales.do">
					month
					<input type="month" name="searchConditionFirst"  class="form-control" ><br><br>
					<input type="hidden" name="searchType" value="month">
					<input type="submit" value="검색" class="btn btn-outline-danger">
				</form>
			</div>
			
			<div class="subdiv" id="condition" style="display:initial;">
				<form action="myHouseSales.do">
					from <br><input type="date" class="form-control" name="searchConditionFirst" id="dayCondition1"><br><br>
					to <input type="date" class="form-control" name="searchConditionSecond" id="dayCondition2"><br><br>
					<input type="hidden" name="searchType" value="days">
					<input type="submit" value="검색" class="btn btn-outline-danger">
				</form>
			</div>
		</div>	
	</div>
	<div style="clear:both;"></div>
	<div class="temp" ></div>
	<div style="width:100%;border: solid;">
	<div class="sales" style="font-family: 'Jua', sans-serif;float:none;margin-left: 23.5%;">
		<p style="font-size:30px;color:black;">매출 현황</p>
		<div id="salesArea">
			<table class="table table-striped" id="salesTable">
				<tr>
					<th>년도</th>
					<th>매출액</th>
					<th>전 년/월/일 대비 증감</th>
					<th>수입비율</th>
				</tr>
				<c:if test="${salesList != null}">
					<c:if test="${salesList.size() >0 }">
					<c:forEach begin="0" end="${salesList.size()-1}" var="i">
					<c:if test="${i == 0}">
					<tr>
						<td>${salesList.get(i).host_sales_date }</td>
						<td>${salesList.get(i).host_sales}￦</td>
						<td>N/A</td>
						<td>${salesList.get(i).host_sales_persant }%</td>
					</tr>
					</c:if>
					<c:if test="${i > 0 }">
					<tr>
						<td>${salesList.get(i).host_sales_date }</td>
						<td>${salesList.get(i).host_sales}￦</td>
						<td>${salesList.get(i).host_sales_compare_before}￦</td>
						<td>${salesList.get(i).host_sales_persant }%</td>	
					</tr>
					</c:if>
					</c:forEach>
					</c:if>
				</c:if>
			</table>
			<c:if test="${salesList2 != null }">
				<c:if test="${salesList2.size()>0 }">
					<br><hr>
					<p style="color:black;">숙소별 매출</p><br>
					<table class="table table-striped">
						<tr>
							<th>숙소번호</th>
							<th>날짜</th>
							<th>매출</th>
							<th>숙소합계 매출</th>
							<th>매출 총 합계</th>
						</tr>
						<c:set var="a" value="0"></c:set>
						<c:forEach begin="0" end="${salesList2.size()-1 }" var="i">
							<c:if test="${i == 0 }">
							<tr>
								<td>No.${salesList2.get(i).host_house_seq }</td>
								<td>${salesList2.get(i).host_sales_date}</td>
								<td>${salesList2.get(i).host_sales }￦</td>
								<td>${salesList2.get(0).sumSalesEachHouse.get(salesList2.get(0).house_seq_list.get(a)) }￦</td>
								<td>${salesList2.get(0).sumSales }￦</td>
								<c:set var="a" value="${a+1 }"></c:set>					
							</tr>
							</c:if>
							<c:if test="${i >0 }">
							<tr>
								<td>No.${salesList2.get(i).host_house_seq }</td>
								<td>${salesList2.get(i).host_sales_date}</td>
								<td>${salesList2.get(i).host_sales }￦</td>
								<c:choose>
								<c:when test="${salesList2.get(i).host_house_seq == salesList2.get(0).house_seq_list.get(a) }">
									<td>${salesList2.get(0).sumSalesEachHouse.get(salesList2.get(0).house_seq_list.get(a)) }￦</td>
									<td>N/A</td>
									<c:set var="a" value="${a+1 }"></c:set>
								</c:when>
								<c:otherwise>
									<td>N/A</td>
									<td>N/A</td>
								</c:otherwise>
								</c:choose>
							</tr>
							</c:if>
						</c:forEach>
					</table>
				</c:if>
			</c:if>
		</div>
					
			<button onclick="ReportToExcel()" class="btn btn-outline-danger" style="font-size:30px;margin-top:10px;">보고서 다운로드(Excel)</button>&nbsp;&nbsp;
			<button id="reportPDF" class="btn btn-outline-danger" style="font-size:30px;margin-top:10px;">보고서 다운로드(PDF)</button>
	</div>
	
	<div class="chart" style="margin-bottom:5%;margin-left: 23.5%;font-family: 'Jua', sans-serif;float:none;">
		<p style="font-size:30px;color:black;">매출 그래프</p>
		<div id="salesChart"></div>
		<c:if test = "${salesList != null }">
		<button onclick="getChart()" class="btn btn-outline-danger" style="font-size:30px;margin-top:10px;">매출 보기</button>&nbsp;&nbsp;
		<button onclick="getPieChart()" class="btn btn-outline-danger" style="font-size:30px;margin-top:10px;">수입비율 보기</button>&nbsp;&nbsp;
		<button onclick="getPieChartForHouse()" class="btn btn-outline-danger" style="font-size:30px;margin-top:10px;">숙소별 비율 보기</button><br><br><br><br>
		</c:if>
		<button onclick="location.href='myHouse.do'" class="btn btn-outline-danger" style="font-size:30px;margin-top:10px;">숙소리스트</button> 
	</div>
	</div>
	<div style="clear: both;"></div>
	<footer>
		<%@ include file="../html/footer.jsp" %>
	</footer>
</body>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
var list = "${salesList}"
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
	$(function(){
		$('#reportPDF').click(function(){
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
		})
	})
		function getChart(){
		    google.charts.load('current', {'packages':['bar']});
		    google.charts.setOnLoadCallback(drawChart);
	
		    function drawChart() {
		      var data = google.visualization.arrayToDataTable([
		        ['chart', 'Sales'],
		        <c:forEach items="${salesList}" var="list">
		        	['${list.host_sales_date}',${list.host_sales}],
		        </c:forEach>
		      ]);
	
		      var options = {
		        chart: {
		          title: '나의 매출현황',
		          subtitle: 'Sales, Expenses',
		        }
		      };
	
		      var chart = new google.charts.Bar(document.getElementById('salesChart'));
	
		      chart.draw(data, google.charts.Bar.convertOptions(options));
		    }
		    
		}
		function getPieChart(){
		      google.charts.load('current', {'packages':['corechart']});
		      google.charts.setOnLoadCallback(drawChart);
		   
		      function drawChart() {

		        var data = google.visualization.arrayToDataTable([
		          ['Task', 'Hours per Day'],
			        <c:forEach items="${salesList}" var="list">
		        		['${list.host_sales_date}',${list.host_sales}],
		        	</c:forEach>
		        ]);

		        var options = {
		          title: '수입비율',
		          pieSliceText: 'label'
		        };

		        var chart = new google.visualization.PieChart(document.getElementById('salesChart'));

		        chart.draw(data, options);
		      }
		      
		}
		function getPieChartForHouse(){
		      google.charts.load('current', {'packages':['corechart']});
		      google.charts.setOnLoadCallback(drawChart);
	
		      function drawChart() {
				var a = 0;
		        var data = google.visualization.arrayToDataTable([
		          ['Task', 'Each House'],
		          	<c:if test="${salesList2 != null}">
				      <c:forEach begin="0" end="${salesList2.get(0).house_seq_list.size()-2}" var="i" >
		        		['No.${salesList2.get(0).house_seq_list.get(i)}',${salesList2.get(0).sumSalesEachHouse.get(salesList2.get(0).house_seq_list.get(i))}],
		        	</c:forEach>
		        	</c:if>
		        ]);

		        var options = {
		          title: '수입비율',
		          pieSliceText: 'label'
		        };

		        var chart = new google.visualization.PieChart(document.getElementById('salesChart'));

		        chart.draw(data, options);
		      }
		      
			
		}
	
</script>
</html>