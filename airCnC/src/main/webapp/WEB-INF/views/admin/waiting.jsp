<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/admin_singo_complete.css">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"/>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${registerHouse == null }">
		<script type="text/javascript">
			alert("잘못 접근된 경로입니다.")
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${session == 'null' }">
		<script type="text/javascript">
			alert("잘못 접근된 경로입니다.")
			history.go(-1);
		</script>
	</c:if>
	<!-- header-start -->
	<header style="color: #ff5a5f;">
    <div class="headermenu">
        <span><i class="fas fa-user-slash" style="font-size: 35px; float: left;"></i></span>
        <label for="" style="font-size: 40px; background-color: black; color: #ff5a5f;">쿠폰 페이지</label>
        <ul>
            <li class="menu" style="list-style: none;">
                <label for="" style="font-size: 40px;">메뉴</label>
                <ul class="hide" style="list-style: none; padding-top: 25px; float: initial; padding-right: 20px;">
                    <li class="item">
                        <a href="http://localhost:8080/cnc/blamelist.mdo">신고관리</a>
                    </li>
                    <li class="item">
                        <a href="http://localhost:8080/cnc/salesChart.mdo">통계</a>
                    </li>
                    <li class="item">
                        <a href="http://localhost:8080/cnc/getRegisterWaitingList.mdo">호스트관리</a>
                    </li>
                    <li class="item">
                        <a href="http://localhost:8080/cnc/logPage.mdo">로그관리</a>
                    </li>
                    <li class="item">
                        <a href="http://localhost:8080/cnc/makeCuponView.mdo">쿠폰관리</a>
                    </li>
                    <li class="item">
                        <a href="http://localhost:8080/cnc/goNoticeListAdmin.mdo">게시판관리</a>
                    </li>
                    <li class="item">
                        <a href="/cnc/logout.mdo" style="color: white;">로그아웃</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
	</header>
	<!-- header-end -->
	<div style="color:black">
		${registerHouse.house_seq}<br>
		${registerHouse.house_name }<br>
		${registerHouse.house_price_default }<br>
		${registerHouse.house_location_fulladdress }<br>
	</div>
	<a href="registerHouse.mdo?house_seq=${registerHouse.house_seq}"><input type="button" value="등록" /></a>
	<a href="cancelRegister.mdo?house_seq=${registerHouse.house_seq}"><input type="button" value="취소" /></a>
	<br></br>
	
	
	<script>
    jQuery(document).ready(function () {
        jQuery(".menu>label").click(function () {
            var submenu = jQuery(this).next("ul");
            if (submenu.is(":visible")) {
                submenu.slideUp();
            } else {
                submenu.slideDown();
            }
        });
    });
</script>
</body>
</html>