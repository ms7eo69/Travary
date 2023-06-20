<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ohzsg7u4i3"></script>
<script>
	$(function(){
		$(':button').click(function(){
			 $.ajax({
				 	url: "/plan/GetRoute.do",
					dataType:'json',
					method:'GET'
				}).done((data)=>{
					console.log('서버로부터 받은 데이터:',data);
				}).fail((error)=>{
					console.log(error);
				}); 
		})
	})
</script>
<div class="container" style="margin-top:50px">
    <div style="position:absolute;z-index:2; justify-content:center">
    	<h1>여행 경로세우기</h1>            
   		<button type="submit" class="btn btn-info">경로 얻기</button>
    </div>
	<div id="map" style="width:100%;height:1000px;"></div>
</div><!--container-->
<script>
	//지도 표시
	var map = new naver.maps.Map('map', {
		zoom: 10,
		center: new naver.maps.LatLng(37.3614483, 127.1114883)
	});
	var polylinePath = [
		new naver.maps.LatLng(37.4526437, 126.49236)
	];
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