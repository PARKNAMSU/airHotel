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
	<link href="${pageContext.request.contextPath}/resources/css/hostdtail1.css"/>
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"/>
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
    <script src="${pageContext.request.contextPath}/resources/javascript/processWithforceStop.js"></script>
    <title>Insert title here</title>
  </head>
  <body>
    <header style="color: #ff5a5f;">
      <span
        ><i
          class="fas fa-paper-plane"
          style="font-size: 35px; padding-left: 20px; float: left; padding-top: 7px;"
        ></i
      ></span>
      <label
        for=""
        style="font-size: 40px; background-color: black; color: #ff5a5f;"
        >쿠폰발송페이지(관리자)</label
      >
    </header>

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
        <label for="">쿠폰발송정보</label>
        <form action="makeCupon.mdo">
        <div
          class="couponbox"
          style="
            font-size: 20px;
            border-top: 3px solid black;
            padding-top: 15px;
          "
        >

          <input type="radio" id="aaa" name="abcd" value="00" onchange="setDisplay()"><label for="aaa">할인률</label>
          <input type="radio" id="bbb" name="abcd" value="10" onchange="setDisplay()"><label for="bbb">할인금액</label>
        <div id="pop1">할인률(%) : <input type="text" name="rate" id="rat"></div>
        <div id="pop2">할인금액(WON) : <input type="text" name="money" id="mon"></div>
          <label for="">받는사람 아이디 : </label
          ><input type="text" name="id" id="" /></br>
          <label for="">쿠폰번호 : </label
            ><input type="text" name="number" id="" /></br>
          <label for="">유효기간(일) : </label>
          	<input type="text" name="limit">
            <input type="submit" value="발송" onclick="success()">
        </div>
        </form>
      </div>
    </div>
    <script type="text/javascript">
      function openChat(url) {
        var openWin = window.open(
          url,
          "rankpopup",
          "width=750, height=900, resizable = no, scrollbars = no"
        );
      }
    </script>
  <script>
    function setDisplay(){
    if($('input:radio[id=aaa]').is(':checked')){
      $('#pop1').show();
      $('#pop2').hide();       
    }else if ($('input:radio[id=bbb]').is(':checked')) {
      $('#pop1').hide();
      $('#pop2').show();         
    }
}
  </script>
  <script>
  	window.onload = function() {
  		document.getElementById("aaa").checked = true;
  	  	setDisplay();
  	}
  </script>
  <script>
  	var success = function() {
  		if($('input:radio[id=aaa]').is(':checked')){
  			console.log("rate 체크");
  			document.getElementById("mon").value=0;
  		}
  		else if($('input:radio[id=bbb]').is(':checked')){
  			console.log("money 체크");
  			document.getElementById("rat").value=0;
  		}
  	}
  </script>
  </body>
</html>