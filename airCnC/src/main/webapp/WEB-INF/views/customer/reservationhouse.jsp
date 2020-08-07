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
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	811cfc852fdf2dfcea71594f0a24a256"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reservationhouse.css">
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
	<header>
		<%@include file="../html/menu.jsp" %>
	</header>
	<div style="clear:both;"></div>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<div class="headdiv" style="font-family: 'Jua', sans-serif;">
		<span style="font-size:50px;">${house.house_name }</span>
		<div id="belike">
			<div class="headimgdiv">
				<a href="#rate" style="font-family: 'Jua', sans-serif;">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/star.png" class="headimg">
				${commentsList.get(0).comments_average }(${commentsList.size() })</a><!-- 평점, 후기 개수 -->
			</div>
			<div class="headimgdiv" style="margin-left:2%;">
				<a href="" style="font-family: 'Jua', sans-serif;">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/heart.png" class="headimg">
				저장</a><!-- 좋아하는 숙소 등록 -->
			</div>
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
				<button class="btn btn-outline-danger" onclick="openMessage('${session_login}','${house.host_id }')" style="font-family: 'Jua', sans-serif;">호스트에게 메세지 보내기</button>
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
			<p >최대인원 ${house.house_maxperson}명, 욕실 ${house_bathroom_amount}개<br>
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
				<p style="font-family: 'Jua', sans-serif;">2020/07/21</p><br>
				<p style="font-family: 'Jua', sans-serif;">${house.house_checkin_time }</p>
			</div>
			<div class="check" style="border: none;">
				<strong style="font-family: 'Jua', sans-serif;">체크아웃</strong><br><br>
				<p style="font-family: 'Jua', sans-serif;">2020/07/22</p><br>
				<p style="font-family: 'Jua', sans-serif;">${house.house_checkout_time }</p>
			</div>
		</div><br><br><br><br>
		<hr>
	</div>
	<div class="buttondiv" style="font-family: 'Jua', sans-serif;">
			<c:if test="${house.accessType eq 'host' }">
				<button class="btn btn-outline-danger" id="btn0" onclick="deleteHouse(${house.house_seq})" style="font-family: 'Jua', sans-serif;">숙소 삭제 신청</button>
			</c:if>
			<c:choose>
				<c:when test="${house.accessType eq 'host' }">
					<button class="btn btn-outline-danger" id="btn1" onclick="openResList(${house.house_seq})" style="font-family: 'Jua', sans-serif;">예약 명단 확인</button>
				</c:when>
				<c:otherwise>
					<button class="btn btn-outline-danger" id="btn2" onclick="openDeclaration('${house.host_id}','${login_session}')" style="font-family: 'Jua', sans-serif;">호스트 신고</button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${house.accessType eq 'nowres' }">
				<button class="btn btn-outline-danger" id="btn3" style="font-family: 'Jua', sans-serif;">예약취소</button>
				</c:when>
				<c:when test="${house.accessType eq 'host' }">
				<button class="btn btn-outline-danger" id="btn4" style="font-family: 'Jua', sans-serif;">수정하기</button>
				</c:when>
				<c:otherwise>
				<button class="btn btn-outline-danger" id="btn5" style="font-family: 'Jua', sans-serif;">예약하기</button>
				</c:otherwise>
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
	</div>
	<div class="mapdiv" style="font-family: 'Jua', sans-serif;">
		<p style="font-family: 'Jua', sans-serif;">지도</p><br><br>
		<div id="map" ></div>
	</div>

	<footer>
		<%@include file="../html/footer.jsp" %>
	</footer>
</body>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/reservationhouse.js?version=127"></script>

<script type="text/javascript">
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var mposition = new kakao.maps.LatLng(37.570988,126.992540)
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
</script>

</html>