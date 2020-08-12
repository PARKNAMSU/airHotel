<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Theme Travel</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
    />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css" />
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/resources/css/hostregister.css"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/resources/css/SUHWAN.css"
    />
    <link
            href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
            rel="stylesheet"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/resources/css/theme_search.css" />
    <style>
        @media screen and (max-width: 768px) {
            span {
                display: none;
            }
        }
    </style>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/javascript/jquery-3.5.1.min.js"></script>
    <style>
        @media screen and (max-width: 768px) {
            span {
                display: none;
            }
        }
    </style>
</head>
<body>
<!-- header-start -->
<header class="logo">
      <span style="color: #ff5a5f;">
          <i
              class="fas fa-dog"
              style="
            font-size: 35px;
            padding-left: 20px;
            float: left;
          ">

          </i>
      </span>
    <label for="" style="font-size: 40px;">강아지 테마 페이지</label
    >
</header>
<!-- header-end -->

<!-- 메인화면  -->
<div class="popular_destination_area" style="text-align: center;">
    <div class="container">
        <div class="slideshow-container">

            <div class="mySlides fade">
                <img src="${pageContext.request.contextPath}/resources/images/doghotel.jpg" style="width:100%">
            </div>

            <div class="mySlides fade">
                <img src="${pageContext.request.contextPath}/resources/images/dog.jpg" style="width:100%">
            </div>

            <div class="mySlides fade">
                <img src="${pageContext.request.contextPath}/resources/images/doghotel2.jpg" style="width:100%">
            </div>

        </div>
        <br>

        <div style="text-align:center">
            <span class="dot"></span>
            <span class="dot"></span>
            <span class="dot"></span>
        </div>


        <div id="mother" class="row" style="padding-top: 30px; color: black">
            <script>
                function goReservationHouse(seq) {
                    document.getElementById(seq).submit();
                }
            </script>
        </div>
        <div class="btn" style="padding-top: 15px;">
            <button id="moreBtn" class="btn1" type="submit" style="float: right;" onclick="getMoreData()">
                더보기
            </button>
        </div>

        <div class="btn" style="padding-top: 15px;">
            <button class="btn1" type="submit" style="float: right;">
                <a href="http://localhost:8090/cnc/indexView.do">뒤로가기</a>
            </button>
        </div>
    </div>
</div>


<script>
    var getData = [];
    var showed = 0;
    window.onload = function () {
        $.ajax({
            type: "GET",
            url: "getMoreThemeHouse.do",
            dataType: "json",
            data: {theme_type: "house_condition_petok"},
            success: function (data) {
                getData = data;
                var max = getData.length;
                var accessType = "notres";
                for (var i = 0; i < 10; i++) {
                    $("#mother").append(
                        "<div class=\"col-lg-4 col-md-1\">" +
                        "<form id=" + getData[i].house_seq + " name=\"houseInfo\" method=\"post\" action=\"/cnc/reservationHouse.do\" onclick=\"goReservationHouse(" + getData[i].house_seq + ")\">" +
                        "<input type=\"hidden\" name=\"house_seq\" value=" + getData[i].house_seq + ">" +
                        "<input type=\"hidden\" name=\"accessType\" value=" + accessType + ">" +
                        "<div class=\"single_destination2\" onclick=\"goReservationHouse()\">" +
                        "<div class=\"thumb\">" +
                        "<img src='${pageContext.request.contextPath}/resources/images/theme_search/sample2.jpg' alt=''/> " +
                        "</div>" +
                        " <div class=\"info\">" +
                        "<a href=\"#\">" +
                        "<p id=\"location\">" + getData[i].house_location + i + "번 째" + "</p>" +
                        "<p id=\"pricae\">" + getData[i].house_price_default + "</p>" +
                        "</a>" +
                        "</div>" +
                        "</div>" +
                        "</form>"
                    );
                }
                showed = 10;
                if (max < 10) {
                    showed = max;
                }
            },
            error: function () {
                alert("에러")
            }
        });
    }

    function getMoreData() {
        for (var i = showed; i < showed + 1; i++) {
            $("#mother").append(
                "<div class=\"row\" style=\"padding-top: 30px; color: black;\">" +
                "<div class=\"col-lg-4 col-md-1\">" +
                "<form id=\"houseInfo\" name=\"houseInfo\" method=\"post\" action=\"/cnc/reservationHouse.do\" onclick=\"goReservationHouse()\">" +
                "<input type=\"hidden\" name=\"house_seq\" value=" + getData[i].house_seq + ">" +
                "<div class=\"single_destination2\" onclick=\"goReservationHouse()\">" +
                "<div class=\"thumb\">" +
                "<img src='${pageContext.request.contextPath}/resources/images/theme_search/jejusample.jpeg' alt=''/> " +
                "</div>" +
                " <div class=\"info\">" +
                "<a href=\"#\">" +
                "<p id=\"location\">" + getData[i].house_location + i + "번 째" + "</p>" +
                "<p id=\"pricae\">" + getData[i].house_price_default + "</p>" +
                "</a>" +
                "</div>" +
                "</div>" +
                "</form>"
            );
        }
        showed++;
    }
</script>

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
<script
        src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"
></script>
<script>
    var slideIndex = 0;
    showSlides();

    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";
        dots[slideIndex-1].className += " active";
        setTimeout(showSlides, 2000); // Change image every 2 seconds
    }
</script>
</body>
</html>