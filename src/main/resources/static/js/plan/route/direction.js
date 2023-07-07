$(function(){
		var map = new N.Map('map', {
			zoom: 10,
			center: new N.LatLng(37.3614483, 127.1114883)
		});

		$.ajax({
			url: contextRoot+'plan/getRoute.do',
			dataType:'json',
			data:'lregion='+lregion	
		}).done((data)=>{
			console.log('서버로부터 받은 데이터:',data);
				var polylinePath = []; 
				data.result.route.traoptimal[0].path.forEach(function(item,index){
				polylinePath.push({y:item[1],x:item[0]})
				})
			//위의 배열을 이용해 라인 그리기
			var polyline = new N.Polyline({
				path: polylinePath,      //선 위치 변수배열
				strokeColor: 'blue', //선 색 빨강 #빨강,초록,파랑
				strokeOpacity: 0.8, //선 투명도 0 ~ 1
				strokeWeight: 8,   //선 두께
				strokeStyle: 'solid',
				strokeLineCap : 'round',
				strokeLineJoin : 'round',
				map: map           //오버레이할 지도
			});
			// 배열 마지막 위치를 마크로 표시함
			var markerPositions =[];
			data.wayPoints.forEach(function(item,index){
				markerPositions.push({x:item.LNT,y:item.LAT,title:item.NAME,content:item.DETAIL});
				})
				var startPosition = data.result.route.traoptimal[0].summary.start;
				var goalPosition = data.result.route.traoptimal[0].summary.goal;
				markerPositions.push({y:startPosition.location[1],x:startPosition.location[0],title:data.start.NAME,content:data.start.DETAIL});
				markerPositions.push({y:goalPosition.location[1],x:goalPosition.location[0],title:data.goal.NAME,content:data.goal.DETAIL});

				markerPositions.forEach(function (item,index) {
				var marker = new N.Marker({
					position: item, //마크 표시할 위치 배열의 마지막 위치
					title: item.title,
					map: map,
					icon: {
						url:  contextRoot+'img/example/sp_pins_spot_v3_over.png',
						size: new naver.maps.Size(24, 37),
						anchor: new naver.maps.Point(12, 37),
						origin: new naver.maps.Point(29*index, 150)
					}
				});	
				var infowindow = new naver.maps.InfoWindow({
					content: [
						'<div class="iw_inner">',
						'   <h3>'+item.title+'</h3>',
						// '   <p>'+item.content,
						'   <p> 관광지 설명입니다',
						'   </p>',
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
				infowindow.open(map, marker);	
				})	

				var xs = [];
				var ys = [];
				polylinePath.forEach(function (item) {
				xs.push(item.x)
				ys.push(item.y)
				})
				var minx = Math.min(...xs);
				var miny = Math.min(...ys)
				var maxx = Math.max(...xs);
				var maxy = Math.max(...ys)
				var minposition = {y: miny-0.001,x:minx-0.001}
				var maxposition = {y:maxy+0.001,x:maxx+0.001}
				$.ajax({
					url: contextRoot+'plan/getAnotherPlace.do',
					method:'post',
					dataType:'json',
					data: JSON.stringify({
						minposition: minposition,
						maxposition: maxposition
					}),
					contentType:'application/json'
				}).done((data1)=>{
					var filteredData = data1.filter(item1 => {
						return !data.wayPoints.some(item2 => item2.NO === item1.NO);
					});
					filteredData.forEach(function(item) {
						var marker = new N.Marker({
							position: {x:item.LNT,y:item.LAT}, 
							title: item.title,
							map: map
						});	
						var infowindow = new naver.maps.InfoWindow({
							content: [
								'<div class="iw_inner">',
								'   <h3>'+item.NAME+'</h3>',
								// '   <p>'+item.content,
								'   <p> 관광지 설명입니다',
								'   </p>',
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
				}).fail((error)=>{console.log(error);})
			map.panToBounds( 
					new N.LatLngBounds(
						minposition,
						maxposition
					)
			)
		}).fail((error)=>{
			console.log(error);
		}); 
	})