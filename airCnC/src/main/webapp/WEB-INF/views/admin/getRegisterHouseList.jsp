<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
    <title>관리자 대기 파일</title>
</head>
<body>
     <!-- header-start -->
     <header class="menudiv1" style="position : static">
		<div class="menudiv2-1" >
		<img alt="" src="">
		</div>
		<div class="menudiv2-2" style="overflow : hidden">
			<div class="menudiv3-1" id="div1">
				<ul id="menuItems">
                    <li class="item">계정관리</li>
                    <li class="item">통계</li>
                    <li class="item">숙소관리</li>
                    <li class="item">로그관리</li>
					<li class="item">로그인</li>
                </ul>
            </div>
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
                                <h3>AirBnB</h3>
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
			<li class="menu"><a id="topmenu" href="getRegisterWaitingList.mdo">호스트 등록 관리</a></li>
			<li class="menu"><a href="getRemoveWaitingList.mdo">호스트 삭제 관리</a></li>
			<li class="menu"><a href="getRemoveHostList.mdo">호스트 삭제</a></li>
		</ul>
    </div>
    <div class="container" style="margin-top : 3%">
        <h3>호스트 등록 관리</h3>
        <br>
        <c:forEach items="${waitingList}" var="house">
        <a href="getRegisterHouse.mdo?house_seq=${house.house_seq}">
        <div class="houseList">
            <img src="../images/face.png" alt="숙소 이미지" class="littleImg">
		    ${house.house_name }<br>
		         숙소 소개<br>
		    ${house.house_address}<br>
		    ${house.house_star }<br>					
		    ${house.house_price }<br>
        </div>
        </a>
        <hr>
        </c:forEach>
    </div>
    <footer>
        <hr>
        <div class="admin_footer">
            <div class="admin_image_container">
                <img alt="logo" src="../images/admin_logo.jpeg.jpg" style="margin-top: 10px;">
            </div>
            <div class="admin_phone_num_container">
                <i class="fas fa-phone fa-2x ">02)1234-5678</i>
            </div>
        </div>
    </footer>
</body>
</html>