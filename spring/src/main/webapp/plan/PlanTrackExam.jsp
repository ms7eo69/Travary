<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ohzsg7u4i3"></script>
<div id="map" style="width:100%;height:1200px;"></div>
<script>
var mapOptions = {
	center: new naver.maps.LatLng(37.57152, 126.97714),
	zoom: 15
};
var map = new naver.maps.Map('map', mapOptions);
/* 
naver.maps.Service.geocode({ query: '불정로 6' }, function(status, response) {
	if (status === naver.maps.Service.Status.ERROR) {
		return alert('Something wrong!');
	}
	var result = response.v2, // 검색 결과의 컨테이너
			items = result.addresses; // 검색 결과의 배열
	console.log('%O',result);
		// do Something
	// 성공 시의 response 처리
});
*/
</script>
<script id="data">
	// 경로로 표시할 배열(array)
	// naver.maps.LatLng 위도 경도 변수
	var polylinePath = [
		new naver.maps.LatLng(37.4526437, 126.49236),
		new naver.maps.LatLng(37.4768068, 126.4847975),
		new naver.maps.LatLng(37.4988237, 126.4960839),
		new naver.maps.LatLng(37.5176422, 126.5392841),
		new naver.maps.LatLng(37.5398154, 126.5708743),
		new naver.maps.LatLng(37.5457857, 126.5968815),
		new naver.maps.LatLng(37.5646413, 126.6502792),
		new naver.maps.LatLng(37.5708896, 126.7197823),
		new naver.maps.LatLng(37.5710499, 126.7444216),
		new naver.maps.LatLng(37.5770001, 126.7733532),
		new naver.maps.LatLng(37.5817724, 126.799401),
		new naver.maps.LatLng(37.5841817, 126.8167752),
		new naver.maps.LatLng(37.5808037, 126.8313027),
		new naver.maps.LatLng(37.5716637, 126.8473288),
		new naver.maps.LatLng(37.56136, 126.8619116),
		new naver.maps.LatLng(37.5487926, 126.8852035),
		new naver.maps.LatLng(37.540747, 126.8910651),
		new naver.maps.LatLng(37.5303713, 126.8925982),
		new naver.maps.LatLng(37.5164746, 126.8825719),
		new naver.maps.LatLng(37.5002697, 126.8725686),
		new naver.maps.LatLng(37.4933399, 126.8711786),
		new naver.maps.LatLng(37.4760577, 126.8756663),
		new naver.maps.LatLng(37.4634352, 126.8887979),
		new naver.maps.LatLng(37.448467, 126.8947082),
		new naver.maps.LatLng(37.4346374, 126.8977132),
		new naver.maps.LatLng(37.4242394, 126.8949032),
		new naver.maps.LatLng(37.4033979, 126.8806084),
		new naver.maps.LatLng(37.3848775, 126.8691937),
		new naver.maps.LatLng(37.371033, 126.8693097),
		new naver.maps.LatLng(37.3724101, 126.9126676),
		new naver.maps.LatLng(37.3830471, 126.9660813),
		new naver.maps.LatLng(37.3807849, 126.9762181),
		new naver.maps.LatLng(37.3971504, 127.0267188),
		new naver.maps.LatLng(37.3961676, 127.0715545),
		new naver.maps.LatLng(37.3730718, 127.0659032),
		new naver.maps.LatLng(37.35114, 127.063139),
		new naver.maps.LatLng(37.3268898, 127.0575003),
		new naver.maps.LatLng(37.3210994, 127.0517556),
		new naver.maps.LatLng(37.3084352, 127.0590529),
		new naver.maps.LatLng(37.2877049, 127.0692822),
		new naver.maps.LatLng(37.2762087, 127.0808982)
	];
</script>

<script id="code">
	//지도 표시
	var map = new naver.maps.Map('map', {
		zoom: 5,
		center: new naver.maps.LatLng(37.3614483, 127.1114883)
	});

	//위의 배열을 이용해 라인 그리기
	var polyline = new naver.maps.Polyline({
		path: polylinePath,      //선 위치 변수배열
		strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
		strokeOpacity: 0.8, //선 투명도 0 ~ 1
		strokeWeight: 8,   //선 두께
		strokeStyle: 'solid',
		strokeLineCap : 'round',
		strokeLineJoin : 'round',
		map: map           //오버레이할 지도
	});

	// 배열 마지막 위치를 마크로 표시함
	var marker = new naver.maps.Marker({
		position: polylinePath[polylinePath.length-1], //마크 표시할 위치 배열의 마지막 위치
		map: map
	});
	
	
</script>
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>