<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/admin_singo_complete.css">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"/>
    <title>관리자 삭제 파일</title>
</head>
<body>
<!-- header-start -->
<header style="color: #ff5a5f;">
    <div class="headermenu">
        <span><i class="fas fa-user-slash" style="font-size: 35px; float: left;"></i></span>
        <label for="" style="font-size: 40px; background-color: black; color: #ff5a5f;">신고관련 페이지</label>
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
    <c:set var="blamelist" value="${blamelist}"/>

    <div class="table-responsive" style="color: black">
        <table class="table" style="color:black;">
            
            <c:forEach var="bl" items="${blamelist}" begin="0" end="${blamelist.size()}" step="1">
                <tr>
                    <td><a href="/cnc/blameinfo.mdo?target_member_id=${bl.key}">${bl.key}</a></td>
                    <td>신규 신고 합 : ${bl.value}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>