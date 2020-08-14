<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
<title>Insert title here</title>
</head>
<body>
	<c:if test="${house == null }">
		<script type="text/javascript">
			alert("잘못 접근된 경로입니다.")
			history.go(-1);
		</script>
	</c:if>
	<!-- header-start -->
	<c:if test="${login_session eq null }">
	<header class="menudiv1">
		<div class="menudiv2-1">
			<a href="/cnc/indexView.do"><img alt=""
				src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1">
				<ul id="menuItems">		
						<li class="item">
							<p>
								<a href="/cnc/registerView.do" style="color:white;font-family:'Jua', sans-serif;">회원가입</a>
							</p>
						</li>
						<li class="item">
							<p>
								<a href="/cnc/loginView.do" style="color:white;font-family:'Jua', sans-serif;">로그인</a>
							</p>
						</li>
						<li class="item">
							<p>
								<a href="/cnc/selectBoardList.do" style="color:white;font-family:'Jua', sans-serif;">공지사항</a>
							</p>
						</li>

				</ul>
			</div>
		</div>
	</header>
	</c:if>
	<c:if test="${login_session ne null }">
	<header class="menudiv1">
		<div class="menudiv2-1">
			<a href="/cnc/indexView.do"><img alt=""
				src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1" style="float:left;">
				<ul id="menuItems">	
						<li class="item"><p><a href="/cnc/indexView.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;">메인페이지</a></p></li>
						<li class="item">
							<p>
								<a href="/cnc/selectBoardList.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >공지사항</a>
							</p>
						</li>
						<li class="item"><p><a href="myHouse.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >호스트</a></p></li>
				</ul>
			</div>
			<div style="width:50px;height:50px;margin-left:15px;margin-top:12px;border-radius: 30px 30px 30px 30px;float:left;background-color:white;overflow:hidden;" id="myinfo">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/my1.jpg" style="max-width:120%;max-height:120%;">
			</div>
		</div>
		<div id="mydiv" style="display:none;margin-left:86%;z-index:100;width:200px;background-color:#d2d2d2;font-size:20px;border-radius: 15px 15px 15px 15px;font-family: 'Jua', sans-serif;" >
					<ul>
						<li><br></li>
						<li style="margin-bottom:20px;"><a href="">내정보</a></li>
						<li style="margin-bottom:20px;"><a href="reservationPage.do">예약한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="myFavoriteHouse.do">저장한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="">쿠폰함</a></li>
						<li style="margin-bottom:20px;"><a href="chat.do">메세지</a></li>
					<c:choose>
						<c:when test="${social_type ne null }">
						<li style="margin-bottom:20px;"><a href="kakaologout.do">로그아웃</a></li>
						</c:when>
						<c:otherwise>
						<li style="margin-bottom:20px;"><a href="logout.do">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
						<li ><br></li>
					</ul>
		</div>
	</header>
	<script type="text/javascript">
		$(function(){
			$("#myinfo").click(function(){
				$("#mydiv").fadeToggle("slow");
			})
		})
	</script>
	</c:if>
	<div style="clear:both;margin-bottom:3%;"></div>
	<c:if test="${house.accessType eq 'beforeres' || house.accessType eq 'notres'}">
	<div id="middle2" style="width:80%;font-size:30px;margin-left:10%;">
		<form action="payment.do" method="post" class="form-inline" id="dateForm">
			<b>인원:</b>&nbsp;&nbsp;&nbsp;<input type="number" name="number" class="form-control" min="1" max="${house.house_maxperson}" id="numPerson" value="${house.house_person}" onkeydown="filterNumber(event);">&nbsp;&nbsp;&nbsp;
			<b>체크인:</b>&nbsp;&nbsp;&nbsp;<input type="text" name="checkin" id="checkin"  max="" class="form-control" value="${house.check_in }">&nbsp;&nbsp;&nbsp;
			<b>체크아웃:</b>&nbsp;&nbsp;&nbsp;<input type="text" name="checkout"  id="checkout" min="" class="form-control" value="${house.check_out }">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="초기화" class="btn btn-outline-danger" style="font-size:30px;" onclick="resetDate()">&nbsp;&nbsp;&nbsp;
			<input type="button" value="예약하기" class="btn btn-outline-danger" style="font-size:30px;" onclick="dateFormSubmit()">
		</form>
	</div>
	</c:if>
	<br><br><br><br>
	<div class="headdiv" style="font-family: 'Jua', sans-serif;">
		<span style="font-size:50px;">${house.house_name }</span>
		<div id="belike">
			
				<div class="headimgdiv">
					<a href="#rate" style="font-family: 'Jua', sans-serif;">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/star.png" class="headimg">
					${commentsList.get(0).comments_average }<c:if test="${commentsList != null }">(${commentsList.size() })</c:if></a><!-- 평점, 후기 개수 -->
				</div>
			
			<c:if test="${house.accessType != 'host' }">
				<c:choose>
				<c:when test="${house.favorite_state eq 'false' }">
				<div class="headimgdiv" style="margin-left:2%;" onclick="storeFavoriteHouse(${house.house_seq})">
					<b style="font-family: 'Jua', sans-serif;">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/heart2.png" class="headimg">
					저장</b><!-- 좋아하는 숙소 등록 -->
				</div>
				</c:when>
				<c:when test="${house.favorite_state eq 'true' }">
				<div class="headimgdiv" style="margin-left:2%;" onclick="removeFavoriteHouse(${house.house_seq})">
					<b style="font-family: 'Jua', sans-serif;">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/heart.png" class="headimg">
					취소</b><!-- 좋아하는 숙소 등록 -->
				</div>
				</c:when>
				</c:choose>
			</c:if>
		</div>
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
		<div id="" style="float:left;width:50%;padding-top:5%;padding-left: 16%">
			<c:if test="${house.accessType != 'host' }">
				<button class="btn btn-outline-danger" onclick="openMessage('${login_session}','${house.host_id }')" style="font-family: 'Jua', sans-serif;">호스트에게 메세지 보내기</button>
			</c:if>
		</div>
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
	<div class="buttondiv" style="font-family: 'Jua', sans-serif;">
			<c:if test="${house.accessType eq 'host' }">
				<button class="btn btn-outline-danger" id="btn0" onclick="deleteHouse(${house.house_seq})" style="font-family: 'Jua', sans-serif;font-size:20px;">숙소 삭제 신청</button>
			</c:if>
			<c:choose>
				<c:when test="${house.accessType eq 'host' }">
					<button class="btn btn-outline-danger" id="btn1" onclick="openResList(${house.house_seq})" style="font-family: 'Jua', sans-serif;font-size:20px;">예약 명단 확인</button>
				</c:when>
				<c:otherwise>
					<button class="btn btn-outline-danger" id="btn2" onclick="openDeclaration('${house.host_id}','${login_session}')" style="font-family: 'Jua', sans-serif;font-size:20px;">호스트 신고</button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${house.accessType eq 'nowres' }">
				<button class="btn btn-outline-danger" id="btn3" style="font-family: 'Jua', sans-serif;font-size:20px;" onclick="cancelReservation(${house.reservation_seq})">예약취소</button>
				</c:when>
				<c:when test="${house.accessType eq 'host' }">
				<button class="btn btn-outline-danger" id="btn4" style="font-family: 'Jua', sans-serif;font-size:20px;" onclick="openHouseModify(${house.house_seq})" >수정하기</button>
				</c:when>
			</c:choose>
	</div>
	<div style="clear:both;"></div>
	<br><br>
	<div class="reviewdiv" style="font-family: 'Jua', sans-serif;">
		<div id="rate">
			<p style="font-size:40px" style="font-family: 'Jua', sans-serif;">후기</p><br><br>
			<a id="star" style="font-family: 'Jua', sans-serif;"><img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/star.png" class="headimg">
			${commentsList.get(0).comments_average }(${commentsList.size() })</a><!-- 평점, 후기 개수 -->
			<br><br>
			<c:if test="${house.accessType eq 'beforeres' }">
			<form action="insertComments.do" id="commentsForm">
				<textarea rows="5" cols="100" id="commant" name="comments_content" class="form-control"></textarea><br>
				<input type="hidden" value="0" id="comments_rate" name="comments_rate">
				<input type="hidden" name="comments_house_seq" value="${house.house_seq}">
				<input type="hidden" name="comments_id" value="${login_session}">
				<input type="button" onclick="openSetRate()" class="btn btn-outline-danger" value="입력" style="width:150px;height:75px;font-family:'Jua', sans-serif;" >
				<input type="reset" value="취소" class="btn btn-outline-danger" style="width:150px;height:75px; 'Jua', sans-serif;" >
			</form>
			</c:if>
		</div>
		<c:if test="${commentsList != null }">
		<div id="commantdiv">
			<c:forEach items="${commentsList}" var="item" varStatus="i">
			<div class="commantform">
				<img alt="64x64" src="${pageContext.request.contextPath}/resources/images/reservationhouse/human.png" style="width:64px;height:64px;"><b style="font-size:20px;">${item.comments_name }</b>&nbsp;&nbsp;<c:forEach begin="1" end="${item.comments_rate}" step="1"><img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/star.png" class="headimg"></c:forEach>
				<c:if test="${item.comments_id eq login_session }">
				<input type="hidden" id="hidseq${i.index}" value="${item.comments_seq }">
				<input type="hidden" id="hidhouse${i.index}" value="${house.house_seq }">
				<input type="hidden" id="hidcontent${i.index}" value="${item.comments_content }">
				<p><a style="margin-left:94%;" onclick="openSetRateUpdate(document.getElementById('hidseq${i.index}').value,document.getElementById('hidhouse${i.index}).value'),document.getElementById('hidcontent${i.index}').value)" style="font-family: 'Jua', sans-serif;" >수정</a> | <a onclick="deleteComments(${item.comments_seq},${house.house_seq},'${house.accessType }')" style="font-family: 'Jua', sans-serif;">삭제</a></p>
				</c:if>
				<br>
				<p style="font-family: 'Jua', sans-serif;">${item.comments_date}</p>
				<br><br>
				<p style="font-family: 'Jua', sans-serif;">${item.comments_content}</p>
			<hr>
			</div>
			</c:forEach>
		</div>
		</c:if>
	</div>
	<div class="mapdiv" style="font-family: 'Jua', sans-serif;">
		<p style="font-family: 'Jua', sans-serif;">지도</p><br><br>
		<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div><br>
		<button class="btn btn-outline-danger" style="font-size:30px;" onclick="openFindMap('${house.house_name}',${house.fhouse_xlocation},${house.fhouse_ylocation})">길찾기</button>
	</div>

	<footer>
		<%@include file="../html/footer.jsp" %>
	</footer>
</body>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/reservationhouse.js?version=127"></script>

<script type="text/javascript">

var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var mposition = new kakao.maps.LatLng('${house.fhouse_xlocation}','${house.fhouse_ylocation}')
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: mposition, //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};
var markerPosition  = mposition; 
var marker = new kakao.maps.Marker({
	map: map,
    position: markerPosition
});
var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

var content = '<div class="wrap">' + 
'    <div class="info">' + 
'        <div class="title">' + 
'            ${house.house_name }' + 
'        </div>' + 
'        <div class="body">' + 
'            <div class="img">' +
'                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
'           </div>' + 
'            <div class="desc">' + 
'                <div class="ellipsis">'+'${house.house_location }' +'${house.house_location_sido }' +'${house.house_location_gugun }'+'</div>' + 
'                <div class="jibun ellipsis">'+'${house.house_location_postnum }'+'</div>' + 
'            </div>' + 
'        </div>' + 
'    </div>' +    
'</div>';

//마커 위에 커스텀오버레이를 표시합니다
//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
var overlay = new kakao.maps.CustomOverlay({
	content: content,
	map: map,
	position: marker.getPosition()       
});

//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
kakao.maps.event.addListener(marker, 'click', function() {
	overlay.setMap(map);
});
var deleteHouse = function(house){
	var result = confirm("정말로 삭제하시겠습니까?\n※삭제 요청시 10일이내에 취소하지 않을 시 삭제됩니다")
	if(result){
	     $.ajax({
	           type:"POST",
	           url:"deleteHouse.do",
	           dataType:"text",
	           data:{
	        	   house_seq:house
	           },
	           success : function(data) {
			   		alert(data);
			   		location.href="myHouse.do"
	           },
	           error : function(request, status, error) {
	        	   alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
	           }
	     });	
	}
}

var cancelReservation = function(res){
	var result = confirm("정말로 취소하시겠습니까?\n※삭제 요청시 10일이내에 취소하지 않을 시 삭제됩니다")
	if(result){
		$.ajax({
			type:"POST",
			url:"cancelReservation.do",
			dataType:"text",
			data:{
				reservation_seq:res
			},
			success: function(data){
				alert(data);
				location.href="reservationPage.do"
			},
	        error : function(request, status, error) {
	        	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
	        }
		})
	}
}
var storeFavoriteHouse = function(house_seq){
		$.ajax({
			type:"POST",
			url:"addFavoritHouse.do",
			dataType:"text",
			data:{
				house_seq:house_seq
			},
			success:function(data){
				setTimeout(window.location.reload(true),1000)
			},
	        error : function(request, status, error) {
	        	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
	        }
		})

}
var removeFavoriteHouse = function(house_seq){

		$.ajax({
			type:"POST",
			url:"removeFavoritHouse.do",
			dataType:"text",
			data:{
				house_seq:house_seq
			},
			success:function(data){
				setTimeout(window.location.reload(true),1000)
				
			},
	        error : function(request, status, error) {
	        	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
	        }
		})

}

function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
}
var getData;
var dates = [];
	$(function(){
			$.ajax({
			type:"POST",
			url:"getCertainResDate.do",
			dataType:"json",
			success:function(data){
				getData = data;
				for(var i=0; i< getData.length;i++){
					var ci = getData[i].reservation_check_in;
					var co = getData[i].reservation_check_out;
					var ci_date = new Date(ci);
					var co_date = new Date(co);
					while(ci_date < co_date){
						var mon = (ci_date.getMonth()+1);
			  			mon = mon < 10 ? '0'+mon : mon;
			  			var day = ci_date.getDate();
			  			day = day < 10 ? '0'+day : day;
			   			dates.push(ci_date.getFullYear() + '-' + mon + '-' +  day);
			   			ci_date.setDate(ci_date.getDate() + 1);
					}
				}
				$("#checkout").datepicker('option', 'beforeShowDay',DisableDates)
				$("#checkin").datepicker('option', 'beforeShowDay',DisableDates)
			},
	        error : function(request, status, error) {
	        	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
	        }
		})
	
	})

function DisableDates(date) {
	var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
	return [dates.indexOf(string) == -1];
}
  
 $("#checkin").datepicker({
                 dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: getFormatDate(new Date()) //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate:""
                ,beforeShowDay: DisableDates 
 
 });
 $("#checkout").datepicker({
 	            dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: getFormatDate(new Date()) //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,beforeShowDay: DisableDates 
 });
 	$(function(){
		$("#checkin").change(function() {
			$("#checkout").datepicker('option', 'minDate',$("#checkin").datepicker('getDate').getFullYear()+"-"+($("#checkin").datepicker('getDate').getMonth()+1)+"-"+($("#checkin").datepicker('getDate').getDate()+1))
		}), 
		$("#checkout").change(function() {
			$("#checkin").datepicker('option','minDate',$("#checkin").datepicker('getDate'))
			$("#checkin").datepicker('option','maxDate',$("#checkout").datepicker('getDate').getFullYear()+"-"+($("#checkout").datepicker('getDate').getMonth()+1)+"-"+($("#checkout").datepicker('getDate').getDate()-1))
		})
	})

function dateFormSubmit(){
	if(document.getElementById("numPerson").value == null || document.getElementById("numPerson").value == ""){
		alert("인원수를 입력하세요")
	}else if(document.getElementById("checkin").value == null || document.getElementById("checkin").value == ""){
		alert("체크인 시간을 입력하세요")
	}else if(document.getElementById("checkout").value == null || document.getElementById("checkout").value == ""){
		alert("체크아웃 시간을 입력하세요")
	}else if(document.getElementById("numPerson").value == "0"){
		alert("1명이상 예약 가능합니다")
	}
	else{
		var ci_date = new Date(document.getElementById("checkin").value)
		var co_date = new Date(document.getElementById("checkout").value)		
		while(ci_date <= co_date){
			   var mon = (ci_date.getMonth()+1);
			   mon = mon < 10 ? '0'+mon : mon;
			   var day = ci_date.getDate();
			   day = day < 10 ? '0'+day : day;
			   for(var i=0; i < dates.length; i++){
			   		if((ci_date.getFullYear() + '-' + mon + '-' +  day) == dates[i]){
			   			alert("이미 예약된 날짜가 존재합니다.")
			   			$("#checkout").val("");
			   			$("#checkin").val("");
			   			$("#numPerson").val("");
			   			resetDate();
			   			return false;
			   		}
			   }
			   ci_date.setDate(ci_date.getDate() + 1);
		}
		document.getElementById("dateForm").submit();
	}
}
function resetDate(){
	$("#checkout").datepicker('option','minDate',getFormatDate(new Date()))
	$("#checkin").datepicker('option','minDate',getFormatDate(new Date()))
	$("#checkin").datepicker('option','maxDate',"")
}
function filterNumber(event) {
	  event.preventDefault(); 
	}
	
function openHouseModify(house_seq){
	var form = document.createElement("form");
	var input = new Array()
	var names = ["house_seq"]
	var values = [house_seq]
    form.action = "house_revise.do";
    form.method = "post";
    
    for (var i = 0; i < 3; i++) {
    	            
    	input[i] = document.createElement("input");
        input[i].setAttribute("type", "hidden");
        input[i].setAttribute('name', names[i]);
        input[i].setAttribute("value", values[i]);
        form.appendChild(input[i]);
    }
    document.body.appendChild(form);
    form.submit();
}
function openFindMap(house_name,xlocation,ylocation){
	var url = "https://map.kakao.com/link/to/"+house_name+","+xlocation+","+ylocation;
	openWin = window.open(url,"roadview","width=1200, height=800, resizable = no, scrollbars = no")
}
</script>

</html>