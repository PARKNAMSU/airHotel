<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Theme Travel</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/resources/images/favicon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/theme_search.css"/>
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/resources/css/hostregister.css"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/resources/css/SUHWAN.css"
    />
    <script type="text/javascript" src="../js/hostregister.js"></script>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <link
            href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
            rel="stylesheet"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
    />
</head>
<body>
<!-- header-start -->
<header class="logo">
      <span style="color: #ff5a5f;"
      ><i
              class="fas fa-dog"
              style="
            font-size: 35px;
            padding-left: 20px;
            float: left;
            padding-top: 10px;
          "
      ></i
      ></span>
    <label for="fas fa-question" style="font-size: 40px;">체험농장 테마 페이지</label>
</header>
<!-- header-end -->

<!-- 메인화면  -->
<div class="popular_destination_area" style="text-align: center;">
    <div class="container">
        <div class="theme_image">
            <img src="${pageContext.request.contextPath}/resources/images/theme_search/dog.jpg"
                 style="border-radius: 20px;"/>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div id="theme_title" class="section_title text-center mb_70">
                    <!-- 선택한 테마에 따라서 동적으로 변환 -->
                    <h3 class="theme_title" style="padding-top: 30px;">
                        체험농장
                    </h3>
                </div>
            </div>
        </div>
        <c:set var="themeList" value="${themeList}"/>
        <c:forEach var="item" items="${themeList}" begin="0" end="${themeList.size()}" step="1">
            <div class="col-lg-4 col-md-1">
                <script>
                    function goReservationHouse() {
                        $("#houseInfo").submit();
                    }
                </script>
                <form id="houseInfo" name="houseInfo" method="post" action="/cnc/reservationHouse.do" onclick="goReservationHouse()">
                    <input type="hidden" name="house_seq" value="${item.house_seq}">
                    <div class="single_destination2">
                        <div class="thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/theme_search/jejusample.jpeg"
                                 alt=""/>
                        </div>
                        <div class="info">
                            <a href="#">
                                <p>${item.house_location}</p>
                                <p>1박 기준 ${item.house_price_default}</p>
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </c:forEach>
        <div class="btn" style="padding-top: 15px;">
            <button class="btn1" type="submit" style="float: right;">
                <a href="/html/reservation_map.html">상세페이지로 가기</a>
            </button>
        </div>
    </div>
</div>
</div>
<!-- 메인화면  -->

<!-- footer-start -->
<footer class="first" id="bottom">
    <div class="second">
        회사소개 | 이용약관 | 개인정보처리방침 |사업자 정보확인 | 여기어때
        마케팅센터 | 액티비티 호스트센터 | HOTEL 여기어때
        |콘텐츠산업진흥법에의한 표시<br/>
        <br/>
        고객행복센터 1670-6250 오전 9시 - 새벽 3시, 점심시간: 오후 12시 - 오후
        1시<br/><br/>
        (주) 여기어때컴퍼니<br/><br/>
        주소 : 서울특별시 강남구 봉은사로 479, 479타워 11층<br/>
        대표이사 : 박남수 | 사업자등록번호: 742-86-00224<br/>
        통신판매번호 : 2017-서울강남-01779 | 관광사업자 등록번호: 제1026-24호<br/>
        전화번호 : 1670-6250<br/>
        전자우편주소 : skatn7979@gmail.com<br/>
        Copyright GC COMPANY Corp. All rights reserved.<br/>
        <hr id="bline"/>
        <img src="${pageContext.request.contextPath}/resources/images/face.png" id="blogo"/>
        <img src="${pageContext.request.contextPath}/resources/images/insta.png" id="blogo"/>
    </div>
</footer>
<!-- footer-end -->
</body>
</html>