<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin_singo_complete.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/front-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <title>관리자 삭제 파일</title>
</head>
<body>
<!-- header-start -->
<header class="menudiv1" style="position : static">
    <div class="menudiv2-1">
        <img alt="" src="${pageContext.request.contextPath}/resources/images/logo2.png">
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
<%--<div class="slider_area">
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
<br>--%>
<!-- slider_area_end -->
<div class="total_container">
    <div id="sidediv">
        <ul id="sidemenu">
            <li class="menu"><a href="admin_singo_complete_list.html">처리된 신고 내역</a></li>
            <li class="menu"><a href="/cnc/blamelist.mdo">신규 신고 내역</a></li>
            <li class="menu"><a href="admin_singo_judge.html">신고사항 처리</a></li>
            <li class="menu"><a href="/cnc/blacklist.mdo">블랙리스트 보기</a></li>
            <li class="menu"><a href="admin_remove.html">계정삭제 내역</a></li>
        </ul>
    </div>

    <div id="admin_singo_main">
        <div class="singo_history">
            <table class="table">
                <c:set var="blameHostJudgeInfo" value="${blameHostJudgeInfo}"/>
                <c:set var="blameCustomerJudgeInfo" value="${blameCustomerJudgeInfo}"/>
                <c:set var="blame_type" value="${sessionScope.blame_type}"/>
                <tr>
                    <td>신고당한 아이디 ${sessionScope.target_member_id}</td>
                    <td>누적경고횟수 :
                    <c:if test="${blameHostJudgeInfo eq null}" >
                        <c:out value="${blameCustomerJudgeInfo.customer_blame_warn}"/>
                    </c:if>
                    <c:if test="${blameCustomerJudgeInfo eq null}" >
                        <c:out value="${blameHostJudgeInfo.host_blame_warn}"/>
                    </c:if>
                    </td>
                    <td>정지여부 :
                        <c:if test="${blameHostJudgeInfo eq null}">
                            <c:out value="${blameCustomerJudgeInfo.customer_blame_stop}"/>
                        </c:if>
                        <c:if test="${blameCustomerJudgeInfo eq null}">
                            <c:out value="${blameHostJudgeInfo.host_blame_stop}"/>
                        </c:if>
                    </td>
                </tr>
            </table>
        </div>

        <div class="warning_message">

            <form method="post" action="/cnc/blameWarnMessage.mdo">
                <input type="text" name="warn_message" value="경고 메세지 입력란" size="100">
                <input type="submit" value="전송">
            </form>
        </div>

        <div class="account_susspend">
            <form method="post" action="/cnc/blameSuspend.mdo">
                <input type="text" name="suspend_day" value="3"  size="10"> 일
                <input id="suspend_btn" type="submit" value="정지부여">
            </form>
        </div>

        <div class="black_list">
            <form action="/cnc/addBlacklist.mdo" method="get">
                <input type="submit" value="블랙리스트 추가하기">
            </form>
        </div>
    </div>
</div>


<footer>
    <hr style="width:100%">
    <div class="admin_footer">
        <div class="admin_image_container">
            <img alt="logo" src="${pageContext.request.contextPath}/resources/images/admin_logo.jpeg.jpg" style="margin-top: 10px;">
        </div>
        <div class="admin_phone_num_container">
            <i class="fas fa-phone fa-2x ">02)1234-5678</i>
        </div>
    </div>
</footer>
</body>
</html>