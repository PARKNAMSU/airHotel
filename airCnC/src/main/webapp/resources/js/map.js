var coordXY = document.getElementById("coordXY"); //검색 지도 경도위도 알아내기 
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스 
var options = {
	center: new kakao.maps.LatLng(37.402056,127.108212), // 위도경도 37.402056,127.108212
	level: 3 //지도의 레벨(확대, 축소 정도) 
};
var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴 
// 지도타입 컨트롤, 줌 컨트롤 생성 
var mapTypeControl = new kakao.maps.MapTypeControl();
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
// ★ 주소-좌표 변환 객체를 생성 
var geocoder = new kakao.maps.services.Geocoder();
// ★ 주소로 좌표를 검색 
geocoder.addressSearch('신 주소 입력', function (result, status) {
	// 정상적으로 검색이 완료됐으면 
	if (status === kakao.maps.services.Status.OK) {
		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		yy = result[0].x;
		xx = result[0].y;
		// 결과값으로 받은 위치를 마커로 표시 
		var marker = new kakao.maps.Marker({
			map: map,
			position: coords
		});
		// 인포윈도우로 장소에 대한 설명을 표시 
		var iwContent = '<div style="padding:5px;">이피엔스<br>' + '<a href="https://map.kakao.com/link/map/이피엔스,37.51128, 127.04232" style="color:blue" target="_blank">큰지도보기</a>' + '<a href="https://map.kakao.com/link/to/이피엔스,37.51128, 127.04232" style="color:blue" target="_blank">길찾기</a>' + '</div>'
		var infowindow = new kakao.maps.InfoWindow({
			content: iwContent
		});
		infowindow.open(map, marker);
		// 지도의 중심을 결과값으로 받은 위치로 이동 
		map.setCenter(coords);
		// ★ resize 마커 중심 
		var markerPosition = marker.getPosition();
		$(window).on('resize', function () {
			map.relayout();
			map.setCenter(markerPosition);
		});
		coordXY.innerHTML = "<br>X좌표 : " + xx + "<br><br>Y좌표 : " + yy;
	} else {
		console.log('에러');
	}
}); var coordXY = document.getElementById("coordXY");

// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '카카오', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        title: '생태연못', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        title: '텃밭', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        title: '근린공원',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
	});
}

var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

geocoder.addressSearch('경기도 성남시 수정구 수진동 4763-1', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">테스트</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    