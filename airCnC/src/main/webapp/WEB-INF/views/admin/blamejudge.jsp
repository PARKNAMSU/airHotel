<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
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
                        <a href="http://localhost:8080/cnc/makeCupon.mdo">쿠폰관리</a>
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


</body>
</html>