<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/css/plan/route/Route.css"/>"/>
<link rel="stylesheet" href="<c:url value="/css/plan/route/Sidebar.css"/>"/>
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

		//지역별 경계선	
		urlPrefix = contextRoot+'/data/region/region',
		urlSuffix = '.json',
		regionGeoJson = [],
		loadCount = 0;
		naver.maps.Event.once(map, 'init', function () {
			for (var i = 1; i < 18; i++) {
				var keyword = i +'';

				if (keyword.length === 1) {
					keyword = '0'+ keyword;
				}

				$.ajax({
					url: urlPrefix + keyword + urlSuffix,
					success: function(idx) {
						return function(geojson) {
							regionGeoJson[idx] = geojson;

							loadCount++;

							if (loadCount === 17) {
									startDataLayer();
							}
						}
					}(i - 1)
				});
			}
		});

		var tooltip = $('<div style="position:absolute;z-index:1000;padding:5px 10px;background-color:#fff;border:solid 2px #000;font-size:14px;pointer-events:none;display:none;"></div>');

		tooltip.appendTo(map.getPanes().floatPane);

		function startDataLayer() {
			map.data.setStyle(function(feature) {
				var styleOptions = {
					fillColor: '#ff0000',
					fillOpacity: 0.0001,
					strokeColor: '#ff0000',
					strokeWeight: 2,
					strokeOpacity: 0.4
				};

				if (feature.getProperty('focus')) {
					/* styleOptions.fillOpacity = 0.6;
					styleOptions.fillColor = '#0f0';
					styleOptions.strokeColor = '#0f0'; */
					styleOptions.strokeWeight = 6;
					styleOptions.strokeOpacity = 1;
				}

				return styleOptions;
			});

			regionGeoJson.forEach(function(geojson) {
				map.data.addGeoJson(geojson);
			});

			map.data.addListener('click', function(e) {
				var feature = e.feature;
				console.log(e);
				map.panToBounds( 
						new N.LatLngBounds(
							feature.bounds._max,
							feature.bounds._min
						)
					
				)
				if (feature.getProperty('focus') !== true) {
					feature.setProperty('focus', true);
				} else {
					feature.setProperty('focus', false);
				}
				// 지역별로 모든 관광지에 Marker를 표시
				$.ajax({
					url:'/travary/plan/getAllPlaceWithMarkers.do',
					dataType:'json',
					data:'lregion='+feature.property_area1
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
			});

			// 마우스 오버시 지역 이름이 보이는 툴팁
			map.data.addListener('mouseover', function(e) {
				var feature = e.feature,
					regionName = feature.getProperty('area1');
				tooltip.css({
					display: '',
					left: e.offset.x,
					top: e.offset.y
				}).text(regionName);
				
				// 마우스 오버시 css 변화
				map.data.overrideStyle(feature, {
					fillOpacity: 0.6,
					strokeWeight: 4,
					strokeOpacity: 1
				});
			});

			map.data.addListener('mouseout', function(e) {
				tooltip.hide().empty();
				map.data.revertStyle();
			});
		}
	})
</script>
</head>
<body>
	<!-- 상단 바 -->
	<div id="route_header" class="route_top">
        <label class="main_logo">LOGO</label>  
        <div class="header_menu">
        	<button class="btn btn-danger">알림</button>
        	<i>설정</i>
        	<a>사용자 정보</a>
        </div>      
    </div>
    <div class="row">        
		<div class="col-2" style="background-color: red;height: inherit">         
			<jsp:include page="/WEB-INF/views/templates/Sidebar.jsp"/>
		</div>
		<div class="col-7">
			<div>
				<div id="map" class="nmap-main"></div>
			</div>
		</div>
		<div class="col-3" style="background-color: blue;">
            <ul>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
		</div>
	</div>
</body>
</html>