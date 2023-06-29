<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ohzsg7u4i3"></script>
<script>
	$(function(){
		var map = new naver.maps.Map('map', {
			zoom: 10,
			center: new naver.maps.LatLng(37.3614483, 127.1114883)
		});
		$(':button').click(function(){
			var region = $('#sel').val()
			console.log(region);
			 $.ajax({
				 	url: "/plan/GetRoute.do",
					dataType:'json',
					data:'region='+region
				}).done((data)=>{
					console.log('서버로부터 받은 데이터:',data);
					 var polylinePath = []; 
					 data.route.traoptimal[0].path.forEach(function(item,index){
						polylinePath.push({y:item[1],x:item[0]})
					 })
					//위의 배열을 이용해 라인 그리기
					var polyline = new naver.maps.Polyline({
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
					data.route.traoptimal[0].summary.waypoints.forEach(function(item,index){
						markerPositions.push({y:item.location[1],x:item.location[0]})
					 })
					 var startPosition = data.route.traoptimal[0].summary.start;
					 var goalPosition = data.route.traoptimal[0].summary.goal;
					 markerPositions.push({y:startPosition.location[1],x:startPosition.location[0]});
					 markerPositions.push({y:goalPosition.location[1],x:goalPosition.location[0]})
					 markerPositions.forEach(function (item) {
						var marker = new naver.maps.Marker({
							position: item, //마크 표시할 위치 배열의 마지막 위치
							map: map
						});
					 })
					 var xs = [];
					 var ys = [];
					 markerPositions.forEach(function (item) {
						xs.push(item.x)
						ys.push(item.y)
					 })
					 var minx = Math.min(...xs);
					 var miny = Math.min(...ys)
					 var maxx = Math.max(...xs);
					 var maxy = Math.max(...ys)
					 console.log(markerPositions[0]);
					 var minposition = {y: miny,x:minx}
					 var maxposition = {y:maxy,x:maxx}
					map.panToBounds( 
							new naver.maps.LatLngBounds(
								/* markerPositions.forEach(function (item) {
									console.log(item);
									new naver.maps.LatLng(item)
								}) */
								/* new naver.maps.LatLng(markerPositions[0]),
								new naver.maps.LatLng(markerPositions[1]),
								new naver.maps.LatLng(markerPositions[2]),
								new naver.maps.LatLng(markerPositions[3]),
								new naver.maps.LatLng(markerPositions[4]),
								new naver.maps.LatLng(markerPositions[5]) */
								new naver.maps.LatLng(minposition),
								new naver.maps.LatLng(maxposition)
							)
			       )
				}).fail((error)=>{
					console.log(error);
				}); 
		})
	})
</script>
<div class="container  d-flex justify-content-between" style="margin-top:50px">
    <div class="d-flex align-items-center ml-5">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
			  	<select class="form-control" id="sel">
					<option>지역을 선택하세요</option>
					<c:forEach items="${sregionList }" var="sregion">
						<option>${sregion}</option>
					</c:forEach>
				</select>
			</div>
			<!-- <input type="text" class="form-control" placeholder="Search"> -->
			<div class="input-group-append">
			  <button class="btn btn-success" type="submit">Go</button>
			</div>
		</div>
    </div>
	<div class="" id="map" style="width:700px;height:700px;" ></div>
</div><!--container-->
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>