<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> 
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	811cfc852fdf2dfcea71594f0a24a256"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/menu.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reservationhouse.css?version=123">
	<meta charset="UTF-8">
	<style type="text/css">
	    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	    .wrap * {padding: 0;margin: 0;}
	    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	    .info .close:hover {cursor: pointer;}
	    .info .body {position: relative;overflow: hidden;}
	    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
	    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	    .info .link {color: #5085BB;}    
	</style>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"/>
<title>Insert title here</title>
</head>
<body>
	<!-- header-start -->
    <header class="logo">
      <span style="color: #ff5a5f;"
        ><i
          class="fas fa-question"
          style="font-size: 35px; padding-left: 20px; float: left;"
        ></i
      ></span>
      <label for="fas fa-question" style="font-size: 40px;"
        >숙소 등록(관리자)</label
      >
      <div
        style="
          width: 35px;
          height: 35px;
          margin-left: 15px;
          border-radius: 30px 30px 30px 30px;
          float: right;
          background-color: white;
          margin-right: 50px;
          overflow: hidden;
        "
        id="myinfo"
      >
        <img
          alt=""
          src="/0813/images/chat/my1.jpg"
          style="max-width: 120%; max-height: 120%;"
        />
      </div>
      <div
        id="mydiv"
        style="
          display: none;
          margin-top: 20px;
          margin-left: 85%;
          width: 200px;
          background-color: #000000;
          font-size: 20px;
          border-radius: 15px 15px 15px 15px;
          font-family: 'Jua', sans-serif;
          z-index: 100;
        "
      >
        <ul>
          <li>
            <a href="http://localhost:8080/cnc/blamelist.mdo">신고관리</a>
          </li>
          <li>
            <a href="http://localhost:8080/cnc/salesChart.mdo">통계</a>
          </li>
          <li>
            <a href="http://localhost:8080/cnc/getRegisterWaitingList.mdo"
              >호스트관리</a
            >
          </li>
          <li>
            <a href="http://localhost:8080/cnc/logPage.mdo">로그관리</a>
          </li>
          <li>
            <a href="http://localhost:8080/cnc/makeCuponView.mdo">쿠폰관리</a>
          </li>
          <li>
            <a href="http://localhost:8080/cnc/goNoticeListAdmin.mdo"
              >게시판관리</a
            >
          </li>
          <li><a href="/cnc/logout.mdo">로그아웃</a></li>
        </ul>
      </div>
    </header>
	<!-- header-end -->
	<br><br><br><br>
	<div class="headdiv" style="font-family: 'Jua', sans-serif;">
		<span style="font-size:50px;">${registerHouse.house_name }</span>
	</div>
	<br><br><br><br>
	<div class="imgdiv" style="font-family: 'Jua', sans-serif;">
		<div class="mainimg">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/house1.png" id="mainimg1">
		</div>
		<div class="subimgs">
			<div class="subimg" style="margin-bottom:1%;"><img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/house1.png" class="img" id="img1"></div>
			<div class="subimg" style="margin-bottom:1%;"><img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/house1.png" class="img" id="img2"></div>
			<div class="subimg" ><img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/house1.png" class="img" id="img3"></div>
			<div class="subimg" ><img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/house1.png" class="img" id="img4"></div>
		</div>
	</div>
	<div style="clear:both;"></div><br><br>
	<div id="introdiv" style="font-family: 'Jua', sans-serif;">
		<p style="font-size:40px;" style="font-family: 'Jua', sans-serif;">${house.house_location } ${house.house_location_sido } ${house.house_location_gugun }<br>${house.house_location_postnum }</p><br><br>
		<div id="hostname">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/human.png" style="width:64px;height:64px;"><b style="font-size:20px;">${house.host_name }</b><br><br>
			<p style="font-family: 'Jua', sans-serif;">회원가입일: ${house.host_regdate }</p>
		</div><br>
		<div id="hostcondition">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/star.png" style="width:25px;height:25px;"><b>후기 ${commentsList.size() }개</b>&nbsp;
			<img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/medal.png" style="width:25px;height:25px;"><b>슈퍼호스트</b><!-- 슈퍼호스트일 경우에만 -->
		</div><br>
		<div id="hostintro" style="	line-height: 23px;width:50%;float:left;"> 
			<p style="font-family: 'Jua', sans-serif;">숙소소개<br>${house.house_desc1 }<br>${house.house_desc2}<br><br>주변 관광지<br>${house.house_desc4 }<br><br>숙소근처 교통<br>${house.house_desc5}</p>
		</div><br><br>
	</div>
	<div style="clear:both;"></div>
	<br><br>
	<div class="infodiv" style="font-family: 'Jua', sans-serif;">
		<hr>
		<div class="subinfodiv">
			<span id="title" >${house.host_id } 님의 숙소</span>
			<br><br><br><br>
			<p >최대인원 ${house.house_maxperson}명, 욕실 ${house.house_bathroom_amount}개<br>
			싱글침대 ${house.house_bed_type_single }, 더블침대 ${house.house_bed_type_double }, 퀸사이즈 침대 ${house.house_bed_type_queen }</p>
			
		</div>
		<hr>
		<div class="subinfodiv" style="font-family: 'Jua', sans-serif;">
			<span id="title" style="font-family: 'Jua', sans-serif;">편의시설</span><br><br><br><br>
			<h3 style="font-family: 'Jua', sans-serif;">
			<c:forEach begin="1" end="${house.convinList.size() }" var="i">
			<c:if test="${i <house.convinList.size() }">
			${house.convinList.get(i-1) },&nbsp;
			</c:if>
			<c:if test="${i == house.convinList.size() }">
			${house.convinList.get(i-1)}
			</c:if>
			</c:forEach>
			</h3>
			
		</div>
		<hr>
		<div class="subinfodiv">
			<span id="title" style="font-family: 'Jua', sans-serif;">특이사항</span><br><br><br><br>
			<p style="font-family: 'Jua', sans-serif;">
			<c:forEach begin="1" end="${house.restricList.size() }" var="i">
			<c:if test="${i < house.restricList.size()}">
			${house.restricList.get(i-1) },&nbsp;
			</c:if>
			<c:if test="${i == house.restricList.size()}">
			${house.restricList.get(i-1) }
			</c:if>
			</c:forEach>
			</p>
		</div><hr>
		<div class="subinfodiv" style="font-family: 'Jua', sans-serif;">
			<span id="title" style="font-family: 'Jua', sans-serif;">제약사항</span><br><br><br><br>
			<p style="font-family: 'Jua', sans-serif;">
			<c:forEach begin="1" end="${house.conditionList.size() }" var="i">
			<c:if test="${i < house.conditionList.size()}">
			${house.conditionList.get(i-1) },&nbsp;
			</c:if>
			<c:if test="${i == house.conditionList.size()}">
			${house.conditionList.get(i-1) }
			</c:if>
			</c:forEach>
			</p>
		</div>
		<hr>
		<div class="subinfodiv" style="font-family: 'Jua', sans-serif;">
			<span id="title" style="font-family: 'Jua', sans-serif;">체크인 / 체크아웃 시간</span><br><br>
			<div class="check">
				<strong style="font-family: 'Jua', sans-serif;">체크인</strong><br><br>
				<p style="font-family: 'Jua', sans-serif;">${house.house_checkin_time }</p>
			</div>
			<div class="check" style="border: none;">
				<strong style="font-family: 'Jua', sans-serif;">체크아웃</strong><br><br>
				<p style="font-family: 'Jua', sans-serif;">${house.house_checkout_time }</p>
			</div>
		</div><br><br><br><br>
		<hr>
	</div>
	<div class="buttondiv" style="font-family: 'Jua', sans-serif; float:left;">
		<a href="registerHouse.mdo?house_seq=${house.house_seq}"><input type="button" value="등록" class="btn btn-outline-danger" style="font-size:30px;"/></a>
		<a href="cancelRegister.mdo?house_seq=${house.house_seq}"><input type="button" value="취소" class="btn btn-outline-danger" style="font-size:30px;"/></a>
	</div>
	<div style="clear:both;"></div>
	<br><br>
	<div class="mapdiv" style="font-family: 'Jua', sans-serif;margin-bottom:30%;">
		<p style="font-family: 'Jua', sans-serif;">지도</p><br><br>
		<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div><br>
		<button class="btn btn-outline-danger" style="font-size:30px;" onclick="openFindMap('${house.house_name}',${house.fhouse_xlocation},${house.fhouse_ylocation})">길찾기</button>
	</div>
	<footer>
		<%@include file="../html/footer.jsp" %>
	</footer>
	
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
</body>
</html>