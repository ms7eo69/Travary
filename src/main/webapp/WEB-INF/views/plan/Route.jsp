<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href='<c:url value="/css/plan/route/Route.css"/>'/>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ohzsg7u4i3"></script>
<script>
	var lregion = '${lregion}'
	var contextRoot = '<c:url value="/"/>'
</script>
<!-- <script src="<c:url value="js/plan/route/direction.js"/>"></script> -->
<script>
	$(function(){
		//기본 지도 설정
		var map = new N.Map('map', {
			zoom: 10,
			center: new N.LatLng(37.3614483, 127.1114883)
		});	
		map.addListener('dragend', function() {
			console.log(map.getCenter());
			console.log(map.getBounds());
			console.log('%O',map);
		});
		map.addListener('zoom_changed', function() {
			console.log(map.getZoom());
		});
		//  지도 클릭시 latlnt값 표시하는 infoWindow
		map.addListener('click', function(e) {
			var latlng = e.coord
			console.log(latlng.toString());
			var infoWindow = new naver.maps.InfoWindow({
				content: [
					'<div style="padding:10px;width:380px;font-size:14px;line-height:20px;">',
					'<strong>LatLng</strong> : '+  latlng.toString() +'<br />',
					'</div>'
				].join('')
			});
			infoWindow.open(map, latlng);
		});

		// 지역별로 모든 관광지에 Marker를 표시
		$.ajax({
			url:'/travary/plan/getAllPlaceWithMarkers.do',
			dataType:'json',
			data:'lregion=${lregion}'
		}).done(function(data){
			data.forEach(function(item){
				var marker = new N.Marker({
					position: item,
					map: map
				});	
				if (item.CATEGORY==='숙박') 
					marker.setIcon({url:contextRoot+'images/route/pin_default.png'})
				var infowindow = new naver.maps.InfoWindow({
					content: [
						'<div class="iw_inner">',
						'<h3>'+item.NAME+'</h3>',
						'<h5> 인기도 : '+item.SUM+'</h5>',
						'</div>'
						].join('')
				});
				naver.maps.Event.addListener(marker, "click", function(e) {
					/* if (infowindow.getMap()) {
						infowindow.close();
					} else { */
						infowindow.open(map, marker);
					/* } */
				});
			})
		}).fail(function(error){
			console.log(error);
		})
	})
</script>
</head>
<body>		
	<div class="row">
		<div class="col-2">
			<nav class="navbar">
			</nav>
		</div>
		<div class="col-7">
			<div id="map" class="nmap-main" style="position: relative; overflow: hidden;"></div>
		</div>
		<div class="col-3">
		</div>
	</div>
</body>
</html>