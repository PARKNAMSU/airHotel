<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/jquery.table2excel.js"></script>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- excel -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/jquery.table2excel.js"></script>
<!-- PDF -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.2/jspdf.plugin.autotable.js"></script>
<script src="${pageContext.request.contextPath}/resources/javascript/html2canvas.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/javascript/bluebird.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style type="text/css">
#salesArea{
	width:1200px;
	height:800px;
	margin-top:3%;
	overflow:scroll; 
	overflow-x:hidden;
	align-self:center;
	box-shadow: 2px 2px 2px 2px gray;
}
#salesArea::-webkit-scrollbar {
  width: 15px;
}
#salesArea::-webkit-scrollbar-track {
  background-color: transparent;
}
#salesArea::-webkit-scrollbar-thumb {
  border-radius: 5px;
  background-color: #bebebe;
}
#salesArea::-webkit-scrollbar-button {
  width: 0;
  height: 0;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin-left: 50px;">
		<h1 style="margin-top: 20px;">호스트 신청 상세검색</h1><br>
		<div style="width:400px;">
		<form action="" >
			<input type="date" name="reschart_date" class="form-control"><br>
			<input type="submit" value="검색" class="btn btn-outline-danger"> 
		</form><br>
		</div>
		<div id="salesArea">
			<h1>${resList.get(0).reservation_regdate } 신청</h1>
			<table class="table table-striped" id="salesTable">
				<tr>
					<th>날짜</th>
					<th>예약 번호</th>
					<th>호스트 아이디</th>
					<th>고객 아이디</th>
					<th>숙소 번호</th>
					<th>예약 가격</th>
					<th>예약 계좌</th>
					<th>예약 은행</th>
				</tr>
				<c:if test="${resList != null}">
					<c:forEach begin="0" end="${resList.size()-1}" var="i">
					<tr>
						<td>${resList.get(i).reservation_regdate }</td>
						<td>${resList.get(i).reservation_seq }</td>
						<td>${resList.get(i).reservation_host_id }</td>
						<td>${resList.get(i).reservation_customer_id }</td>
						<td>${resList.get(i).reservation_house_seq }</td>
						<td>${resList.get(i).reservation_price }</td>
						<td>${resList.get(i).reservation_account }</td>
						<td>${resList.get(i).reservation_bank }</td>
					</tr>
					</c:forEach>
				</c:if>
			</table>
			<button onclick="ReportToExcel()" class="btn btn-outline-danger" style="font-size:30px;margin-top:10px;">보고서 다운로드(Excel)</button>&nbsp;&nbsp;
						<button onclick="ReportToPDF()" class="btn btn-outline-danger" style="font-size:30px;margin-top:10px;">보고서 다운로드(PDF)</button>&nbsp;&nbsp;
			<button onclick="self.close()" class="btn btn-outline-danger" style="font-size:30px;margin-top:10px;">닫기</button>
		</div>
	</div>
</body>
<script type="text/javascript">
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
				 doc.save('개인지출내역서.pdf');
			  } 
		});
		}
}
</script>
</html>