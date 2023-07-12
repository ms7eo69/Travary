$(function(){
		//기본 지도 설정
		var map = new N.Map('map', {
			zoom: 8,
			center: new N.LatLng(36.5, 127.7)
		});	
		var markers={}
		map.addListener('dragend', function() {
			console.log(map.getBounds());
		});
		map.addListener('zoom_changed', function() {
			$('#zoom').text(map.getZoom())
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
					styleOptions.strokeWeight = 4;
					styleOptions.strokeOpacity = 1;
				}
				return styleOptions;
			});

			regionGeoJson.forEach(function(geojson) {
				map.data.addGeoJson(geojson);
			});
	
			map.data.addListener('click', function(e) {
				var feature = e.feature;
				if (feature.getProperty('focus') !== true) {
					feature.setProperty('focus', true);
					markers[feature.property_navercode] = []
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
							markers[feature.property_navercode].push(marker)
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
								if (infowindow.getMap()) {
									infowindow.close();
								} else {
									infowindow.open(map, marker);
								}
							});
						})
					}).fail(function(error){
						console.log(error);
					})
					setTimeout(function(){
						if(feature.property_navercode==='01'||feature.property_navercode==='02')
							map.setZoom(9, true);
						map.panToBounds( 
							new naver.maps.LatLngBounds(
								feature.bounds._max,
								feature.bounds._min
							)
						)
					}, 1000);
				} 
				else {
					markers[feature.property_navercode].forEach(function(marker){
						marker.setMap(null)
					})
					markers[feature.property_navercode]=[]
					feature.setProperty('focus', false);
				}
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
				if (feature.getProperty('focus') !== true){
					map.data.overrideStyle(feature, {
						fillOpacity: 0.6,
						strokeWeight: 4,
						strokeOpacity: 1
					});
				}
			});
			map.data.addListener('mouseout', function(e) {
				tooltip.hide().empty();
				map.data.revertStyle();
			});
		}
	})