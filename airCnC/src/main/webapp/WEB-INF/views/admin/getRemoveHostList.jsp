<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_register_waiting.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN.css">
    <script src="${pageContext.request.contextPath}/resources/javascript/processWithforceStop.js"></script>
    <title>관리자 삭제 파일</title>
</head>
<body>
    <!-- header-start -->
    <header class="logo">
      <span style="color: #ff5a5f;"
        ><i
          class="fas fa-question"
          style="font-size: 35px; padding-left: 20px; float: left;"
        ></i
      ></span>
      <label for="fas fa-question" style="font-size: 40px;"
        >호스트삭제(관리자)</label
      >
      <div
        style="
          width: 35px;
          height: 35px;
          margin-left: 15px;
          border-radius: 30px 30px 30px 30px;
          float: right;
          background-color: white;
          margin-right: 50px;
          overflow: hidden;
        "
        id="myinfo"
      >
        <img
          alt=""
          src="/0813/images/chat/my1.jpg"
          style="max-width: 120%; max-height: 120%;"
        />
      </div>
      <div
        id="mydiv"
        style="
          display: none;
          margin-top: 20px;
          margin-left: 85%;
          width: 200px;
          background-color: #000000;
          font-size: 20px;
          border-radius: 15px 15px 15px 15px;
          font-family: 'Jua', sans-serif;
          z-index: 100;
        "
      >
        <ul>
          <li>
            <a href="http://localhost:8080/cnc/blamelist.mdo">신고관리</a>
          </li>
          <li>
            <a href="http://localhost:8080/cnc/salesChart.mdo">통계</a>
          </li>
          <li>
            <a href="http://localhost:8080/cnc/getRegisterWaitingList.mdo"
              >호스트관리</a
            >
          </li>
          <li>
            <a href="http://localhost:8080/cnc/logPage.mdo">로그관리</a>
          </li>
          <li>
            <a href="http://localhost:8080/cnc/makeCupon.mdo">쿠폰관리</a>
          </li>
          <li>
            <a href="http://localhost:8080/cnc/goNoticeListAdmin.mdo"
              >게시판관리</a
            >
          </li>
          <li><a href="/cnc/logout.mdo">로그아웃</a></li>
        </ul>
      </div>
    </header>
    <!-- header-end -->

     <!-- slider_area_start -->
     <div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider  d-flex align-items-center slider_bg_2">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3 style="margin-left:70%;">Remove Host</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div id="sidediv">
		<ul id="sidemenu">
			<li class="menu"><a href="getRegisterWaitingList.mdo">숙소 등록 관리</a></li>
			<li class="menu"><a href="getRemoveWaitingList.mdo">숙소 삭제 관리</a></li>
			<li class="menu"><a id="topmenu" href="getRemoveHostList.mdo">호스트 삭제</a></li>
		</ul>
    </div>
    <!-- <form action="deleteHost.mdo"> -->
    <h3 style="text-align: center; color:black;">호스트 삭제</h3>
    <div style="float: right; margin-right : 20%;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5명씩 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10명씩 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15명씩 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20명씩 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
	<div class="hostList">
        <ul>
        	<c:forEach items="${hostList}" var="host">
            	<li style="font-size : 25px;"><a href="deleteHost.mdo?host_id=${host.host_id}">${host.host_id}</a></li>
        	</c:forEach>
        </ul>
    </div>
    <div style="display: block; text-align: center; color: black; padding-right :5%; margin-top : 20px;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="getRemoveHostList.mdo?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		&nbsp;
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="getRemoveHostList.mdo?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="getRemoveHostList.mdo?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
    <!-- 
        <div style="text-align: center;">
        <input type="submit" class="btn btn" value="삭제">
    </div>
    </form>
	-->
    <footer>
        <hr style="width:100%">
        <div class="admin_footer">
            <div class="admin_image_container">
                <img alt="logo" src="../images/admin_logo.jpeg.jpg" style="margin-top: 10px;">
            </div>
            <div class="admin_phone_num_container">
                <i class="fas fa-phone fa-2x ">02)1234-5678</i>
            </div>
        </div>
    </footer>
    
    <script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="getRemoveHostList.mdo?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
	</script>
</body>
</html>