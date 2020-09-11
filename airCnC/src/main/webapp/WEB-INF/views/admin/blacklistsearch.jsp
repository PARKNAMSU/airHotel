<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/admin_singo_complete.css">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"/>
    <script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/javascript/processWithforceStop.js"></script>
    <title>관리자 삭제 파일</title>
</head>

<style>
    .menu a {
        cursor: pointer;
    }

    .menu .hide {
        display: none;
    }
</style>

<body>

<!-- header-start -->
<header style="color: #ff5a5f;">
    <div class="headermenu">
        <span><i class="fas fa-user-slash" style="font-size: 35px; float: left;"></i></span>
        <label for="" style="font-size: 40px; background-color: black; color: #ff5a5f;">블랙리스트 페이지</label>
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

<div class="total_container">
    <div id="sidediv">
        <ul id="sidemenu">
            <li class="menu"><a href="/cnc/blamelist.mdo">신규 신고 내역</a></li>
            <li class="menu"><a href="/cnc/blacklist.mdo">블랙리스트 보기</a></li>
        </ul>
    </div>
    <!-- 블랙리스트 테이블 -->
    <c:set var="blacklist" value="${blacklist}"/>
    <div style="color: black" class="table-responsive">
        <form class="blacklist-id-search-form" action="blacklistSearchEmail.mdo" method="get">
            검색할 이메일 : <input type="text" name="blackSearchEmail">
            <input type="submit" value="검색">
        </form>
        <input type="button" value="목록가기" onclick="location.href='/cnc/blacklist.mdo'">
        <table style="color: black" class="table">
            <tr>
                <td>아이디 : ${blacklist.black_id}</td>
                <td>블랙당한 날짜 : ${blacklist.regdate}</td>
                <td>블랙당한 이메일 : ${blacklist.black_email}</td>
                <td> <input type="submit" value="블랙해제" onclick="location.href='/cnc/blacklistRelease.mdo?blackEmail=${blacklist.black_email}'"></td>
            </tr>
        </table>
    </div>
</div>

</body>


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

</html>
