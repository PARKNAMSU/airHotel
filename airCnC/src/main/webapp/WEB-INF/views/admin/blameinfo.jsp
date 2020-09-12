<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/admin/admin_singo_complete.css">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin_log.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostregister.css">
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
<header class="logo" style="position: sticky;">
    <div class="headermenu">
        <span><i class="fas fa-user-slash" style="font-size: 35px; float: left;"></i></span>
        <label for class="loglabel">신고내역 페이지</label>
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
<div class="total_container">
    <div id="sidediv">
        <ul id="sidemenu">
            <li class="menu"><a href="/cnc/blamelist.mdo">신규 신고 내역</a></li>
            <li class="menu"><a href="/cnc/blacklist.mdo">블랙리스트 보기</a></li>
        </ul>
    </div>
    <c:set var="blameinfo" value="${blameinfo}"/>

    <div class="table-responsive" style="color: black">
        <table style="color: black" class="table">
            <thead>
                <tr>
                    <th>신고자</th>
                    <th>신고내용</th>
                    <th>HOST/CUSTOMER</th>
                </tr>
            </thead>
            <c:set var="blame_target_member_id" value="${blameinfo.get(0).blame_target_member_id}"/>
            ${blame_target_member_id}
            <c:forEach var="item" items="${blameinfo}" begin="0" end="${blameinfo.size()}" step="1">
                <tr>
                    <td>${item.blame_member_id}</td>
                    <td>${item.blame_content}</td>
                    <td><c:set var="blame_type" value="${item.blame_type}"/>
                        <c:if test="${blame_type eq 0}">
                            <a href="/cnc/blamejudge.mdo?target_member_id=${blame_target_member_id}&blame_type=${blame_type}"><c:out value="HOST"/></a>
                        </c:if>
                        <c:if test="${blame_type eq 1}">
                            <a href="/cnc/blamejudge.mdo?target_member_id=${blame_target_member_id}&blame_type=${blame_type}"><c:out value="CUSTOMER"/></a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>


</body>
</html>