<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sideMenu.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chat.css" />

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/resources/css/hostdetail1.css"
    />
    <!-- Latest compiled and minified CSS -->

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <title>Insert title here</title>
  </head>
  <body>
    <header style="color: #ff5a5f;">
      <span
        ><i
          class="fas fa-images"
          style="font-size: 35px; padding-left: 20px; float: left;"
        ></i
      ></span>
      <label
        for=""
        style="font-size: 40px; background-color: black; color: #ff5a5f;"
        >쿠폰함</label
      >
    </header>

    <!-- slider_area_start -->

    <!-- slider_area_end -->
    <div style="clear: both;"></div>

    <div id="sidediv">
      <ul id="sidemenu">
        <li class="menu">
          <span id="topmenu" style="font-family: 'Jua', sans-serif;"
            >내정보 관리</span
          >
        </li>
        <li class="menu">
          <a href="reservationPage.do" style="font-family: 'Jua', sans-serif;"
            >예약내역</a
          >
        </li>
        <li class="menu">
          <a href="myFavoriteHouse.do" style="font-family: 'Jua', sans-serif;"
            >저장한 숙소</a
          >
        </li>
        <li class="menu">
          <a href="chat.do" style="font-family: 'Jua', sans-serif;">메세지</a>
        </li>
        <li class="menu">
          <a href="#" style="font-family: 'Jua', sans-serif;">회원탈퇴</a>
        </li>
        <li class="menu">
          <a href="#" style="font-family: 'Jua', sans-serif;">쿠폰함</a>
        </li>
      </ul>
    </div>
    <div class="coupon">
      <div class="coupontitle">
        <label for="">쿠폰관리</label>
      </div>
    </div>
    <div class="couponimage" style="margin-top: 50px;">
      <img src="/Mainwork2/images/partyroom.jpg" alt="" />
    </div>
    <footer></footer>
    <script type="text/javascript">
      function openChat(url) {
        var openWin = window.open(
          url,
          "rankpopup",
          "width=750, height=900, resizable = no, scrollbars = no"
        );
      }
    </script>
  </body>
</html>