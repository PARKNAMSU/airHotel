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
		<h1 style="margin-top: 20px;">매출 상세검색</h1><br>
		<div style="width:400px;">
		<form action="salesChartDetail.mdo" >
			<input type="date" name="admin_sales_date" class="form-control"><br>
			<input type="submit" value="검색" class="btn btn-outline-danger"> 
		</form><br>
		</div>
		<div id="salesArea">
			<h1>${salesList.get(0).admin_sales_regdate } 매출</h1>
			<table class="table table-striped" id="salesTable">
				<tr>
					<th>날짜</th>
					<th>번호</th>
					<th>매출</th>
					<th>숙소번호</th>
				</tr>
				<c:if test="${salesList != null}">
					<c:forEach begin="0" end="${salesList.size()-1}" var="i">
					<tr>
						<th>${salesList.get(i).admin_sales_date }</th>
						<th>no.${salesList.get(i).admin_sales_seq}</th>
						<th>${salesList.get(i).admin_sales }￦</th>
						<th>no.${salesList.get(i).admin_sales_house_seq }</th>
					</tr>
					</c:forEach>
				</c:if>
			</table>
			<button onclick="ReportToExcel()" class="btn btn-outline-danger" style="font-size:30px;margin-top:10px;">보고서 다운로드(Excel)</button>&nbsp;&nbsp;
			<button onclick="self.close()" class="btn btn-outline-danger" style="font-size:30px;margin-top:10px;">닫기</button>
		</div>
	</div>
</body>
</html>