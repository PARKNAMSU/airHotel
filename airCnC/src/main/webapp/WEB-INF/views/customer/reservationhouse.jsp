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
div {
  font-family: 'Jua', sans-serif;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<header>
		<%@include file="../html/menu.jsp" %>
	</header>
	<div style="clear:both;"></div>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<div class="headdiv">
		<span style="font-size:50px;font-family: 'Jua', sans-serif;">${house.house_name }</span>
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
	<div class="imgdiv">
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
		<div id="introdiv">
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
			<button class="btn btn-outline-danger" onclick="openMessage('${session_login}',${house.host_id })" style="font-family: 'Jua', sans-serif;">호스트에게 메세지 보내기</button>
		</div>
	</div>
	<div style="clear:both;"></div>
	<div class="infodiv">
		<div class="subinfodiv">
			<span id="title" style="font-family: 'Jua', sans-serif;">${house.host_id } 님의 숙소</span>
			<br><br><br><br>
			<p style="font-family: 'Jua', sans-serif;">최대인원 ${house.house_maxperson}명, 욕실 ${house_bathroom_amount}개<br>
			싱글침대 ${house.house_bed_type_single }, 더블침대 ${house.house_bed_type_double }, 퀸사이즈 침대 ${house.house_bed_type_queen }</p>
			
		</div>
		<hr>
		<div class="subinfodiv">
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
		</div>
		<div class="subinfodiv">
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
		<div class="subinfodiv">
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
		</div>
		<br><br><hr>
		<div class="subinfodiv">
			<span id="title" style="font-family: 'Jua', sans-serif;">숙소 소개</span><br><br><br><br>
			<h3 style="font-family: 'Jua', sans-serif;">안녕하세요</h3>
		</div>
		<hr>
	</div>
	<div class="buttondiv">
			<button class="btn btn-outline-danger" id="btn" onclick="openDeclaration()" style="font-family: 'Jua', sans-serif;">호스트 신고</button>
			<button class="btn btn-outline-danger" id="btn" style="font-family: 'Jua', sans-serif;">예약 취소</button>
	</div>
	<div style="clear:both;"></div>
	<br><br>
	
	<div class="reviewdiv">
		
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
				<input type="hidden" name="comments_id" value="${session_login}">
				<input type="button" onclick="openSetRate()" class="btn btn-outline-danger" value="입력" style="width:150px;height:75px;font-family:'Jua', sans-serif;" >
				<input type="button" onclick="openSetRateUpdate()" class="btn btn-outline-danger" value="수정" style="width:150px;height:75px;font-family:'Jua', sans-serif;display: none;" >
				<input type="reset" value="취소" class="btn btn-outline-danger" style="width:150px;height:75px; 'Jua', sans-serif;" >
			</form>
			</c:if>
		</div>
		
		<div id="commantdiv">
			<c:forEach items="${commentsList}" var="item" varStatus="i">
			<div class="commantform">
				<img alt="64x64" src="${pageContext.request.contextPath}/resources/images/reservationhouse/human.png" style="width:64px;height:64px;"><b style="font-size:20px;">${item.comments_name }</b>&nbsp;&nbsp;<c:forEach begin="1" end="${item.comments_rate}" step="1"><img alt="" src="${pageContext.request.contextPath}/resources/images/reservationhouse/star.png" class="headimg"></c:forEach>
				<c:if test="${item.comments_id eq session_login }">
				<input type="hidden" id="hidseq${i.index}" value="${item.comments_seq }">
				<input type="hidden" id="hidhouse${i.index}" value="${house.house_seq }">
				<input type="hidden" id="hidcontent${i.index}" value="${item.comments_content }">
				<p><a style="margin-left:94%;" onclick="openSetRateUpdate(document.getElementById('hidseq${i.index}').value,document.getElementById('hidhouse${i.index}).value'),document.getElementById('hidcontent${i.index}').value)" style="font-family: 'Jua', sans-serif;" >수정</a> | <a href="deleteComments.do?comments_seq=${item.comments_seq}&comments_house_seq=${house.house_seq}" style="font-family: 'Jua', sans-serif;">삭제</a></p>
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
	<div class="mapdiv">
		<p style="font-family: 'Jua', sans-serif;">지도</p><br><br>
		<div id="map" ></div>
	</div>

	<footer>
		<%@include file="../html/footer.jsp" %>
	</footer>
</body>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/reservationhouse.js?version=124"></script>

<script type="text/javascript">
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};
var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>

</html>