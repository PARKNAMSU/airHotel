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

<!-- slider_area_start -->
<div class="chartcount" style="text-align: center; margin-top: 150px;">
    <p id="counter1" style="float: left; width: 33%;"></p>
    <p id="counter2" style="float: left; width: 33%;"></p>
    <p id="counter3" style="float: left; width: 33%;"></p>
</div>
<div class="charttitle" style="text-align: center;">
    <label style="float: left; width: 33%;">하루동안 접수된 신고 횟수</label>
    <label style="float: left; width: 33%;">한달동안 접수된 신고 횟수</label>
    <label style="float: left; width: 33%;">어제까지 누적된 접수된 신고 횟수</label>
</div>
<br/>

<!-- 사이드 메뉴 -->
<div class="total_container">
    <div id="sidediv">
        <ul id="sidemenu">
            <li class="menu"><a href="/cnc/blamelist.mdo">신규 신고 내역</a></li>
            <li class="menu"><a href="/cnc/blacklist.mdo">블랙리스트 보기</a></li>
        </ul>
    </div>
    <!-- 블랙리스트 테이블 -->
    <c:set var="blacklist" value="${blacklist}"/>
    <div style="color: black;" class="table-responsive">
        <form class="blacklist-id-search-form" action="/cnc/blacklistSearchId.mdo" method="get">
            검색할 아이디 :
            <input type="text" name="blackSearchId"/>
            <input type="submit" value="검색"/>
        </form>
        <table style="color: black;" class="table">
            <c:forEach var="item" items="${blacklist}" begin="0" end="${blacklist.size()}" step="1">
                <tr>
                    <td>${item.black_id}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>


<script>
    function numberCounter(target_frame, target_number) {
        this.count = 0;
        this.diff = 0;
        this.target_count = parseInt(target_number);
        this.target_frame = document.getElementById(target_frame);
        this.timer = null;
        this.counter();
    }

    numberCounter.prototype.counter = function () {
        var self = this;
        this.diff = this.target_count - this.count;

        if (this.diff > 0) {
            self.count += Math.ceil(this.diff / 5);
        }

        this.target_frame.innerHTML = this.count
            .toString()
            .replace(/\B(?=(\d{3})+(?!\d))/g, ",");

        if (this.count < this.target_count) {
            this.timer = setTimeout(function () {
                self.counter();
            }, 20);
        } else {
            clearTimeout(this.timer);
        }
    };

    new numberCounter("counter1", 67);
    new numberCounter("counter2", 135);
    new numberCounter("counter3", 21988);
</script>
</html>
