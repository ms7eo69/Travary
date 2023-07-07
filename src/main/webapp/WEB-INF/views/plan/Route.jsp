<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<link rel="stylesheet" href="../../../../resources/static/css/route/Route.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ejh6wsswo6"></script>
<style>
	.iw_inner {
    padding: 10px;
	}
	.iw_inner h3 {
		font-size: 16px;	
		font-weight: bold;
		padding-bottom: 5px;
		margin: 10px 0;
	}
	.iw_inner p {
		font-size: 12px;
		color: #333;
	}
</style>
<!-- <script>
	$(function(){
		var lat = 37.3614483
		var lnt = 127.1114883
		var map = new N.Map('map', {
				zoom: 10,
				center: new N.LatLng(37.3614483, 127.1114883)
			});
		map.panToBounds( 
			new N.LatLngBounds(
				new N.LatLng(lat+0.05, lnt+0.05),
				new N.LatLng(lat-0.05, lnt-0.05)
			)
		)
	})
</script> -->
<script>
	$(function(){
		var map = new N.Map('map', {
			zoom: 10,
			center: new N.LatLng(37.3614483, 127.1114883)
		});

		$.ajax({
			url: '<c:url value="/plan/getRoute.do"/>',
			dataType:'json',
			data:'sregion=${sregion}'	
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
						url:  '<c:url value="/img/example/sp_pins_spot_v3_over.png"/>',
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
					url: '<c:url value="/plan/getAnotherPlace.do"/>',
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
</script>
</head>
<body>		
	<div id="routeHeader">
		<nav id="routeNav" class="topNav" style="background-color: rgb(255,255,255);color: rgb(0,0,0);">
			<div class="nWrap nWidth">
				<a href="/" id="nltxt">
					<b>Travary</b>
					<h7 id="travContent">&nbsp;</h7>
				</a>
				<ul id="nBtn1" class="nbc">
					<li id="nloginout">
						<div class="npbc">
							<span id="loginout">
								<a onclick="">로그인</a>
							</span>
						</div>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="body2">
		<div class="feedWrap">
			<a onclick="">
				<i class="icons" style="font-size: 20px; cursor: pointer;">close</i>
			</a>
			<div id="feedBtn" class="chip we wl black blink2" onclick="">
				<i class="icons" style="font-size: 20px; color: #ffffff; vertical-align: -4px;">
					voiceCall
				</i>
			</div>
			<h8 id="feedTxt" style="color: #ffffff;" data-langnum="2">사용이 불편하신가요?</h8>
		</div>
		<a id="RecSelBtnH" class="tfb tooltip" data-position="left" data-attrnum="0"
		data-tooltip="" onclick="">
			<h8 data-langnum="3">추천호텔</h8>
		</a>
		<a id="RecSelBtnL" class="tfb tool" data-position="left" data-attrnum="1"
		data-tooltip="" onclick="">
			<h8 data-langnum="4">추천장소</h8>
		</a>
		<div class="multiBtn">
			<a id="gBtn" class="tfb tooltip" data-position="right" data-attrnum="2"
			data-tooltip="이용방법" onclick="">
				<h7 data-langnum="5">이용방법</h7>
			</a>
			<a id="sBtn" class="tfb tooltip" data-position="right" data-attrnum="3"
			data-tooltip="추천여행기" onclick="">
				<h7>여행기</h7>
			</a>
			<a id="spBtn" class="tfb tooltip" data-position="right" data-attrnum="4"
			data-tooltip="장소등록" onclick="">
				<h7 data-langnum="6">장소등록</h7>
			</a>
			<a id="cBtn" class="tfb tooltip" data-position="right" data-attrnum="5"
			data-tooltip="추천코스목록" onclick="">
				<h7 data-langnum="7">추천일정</h7>
			</a>
			<a id="fBtn" class="tfb tooltip" data-position="right" data-attrnum="6"
			data-tooltip="피드백 보내기" onclick="">
				<h7 data-langnum="8">피드백</h7>
			</a>
			<a id="tBtn" class="tfb tooltip" data-position="right" data-attrnum="7"
			data-tooltip="이동수단 : 대중교통">
				<input id="transit" class="rb tpBtn" type="radio" name="tpMode" checked>
				<i class="material-icons">directions_subway</i>
			</a>
			<a id="dBtn" class="tfb tooltip" data-position="right" data-attrnum="8"
			data-tooltip="이동수단 : 자동차">
				<input id="drive" class="rb tpBtn" type="radio" name="tpMode">
				<i class="material-icons">directions_car</i>
			</a>
			<a class="tfb tooltip" data-position="right" data-attrnum="8"
			data-tooltip="일정생성" onclick="">
				<h7 class="makeRoute" data-langnum="9">일정생성</h7>
			</a>
		</div>
		<div>
			<div id="naverMap" class="nmap-main" style="width:1000px;height:1000px;"></div>
		</div>
	</div>
	<div>		
		<div class="ssbar">
			<div>
				<div class="msc" id="sshkw">
					<div class="msic">
						<input id="sshk" type="text" class="center" data-attrnum="10"
						data-attrtype="placeholder" placeholder="검색어를 입력하세요." autocomplete="off">
					</div>
					<button class="msBtn" id="sshb" onclick="">
						<i class="material-icons msbi">search</i>
					</button>
				</div>
				<div class="center sRadio">
					<input id="selH" class="rii" type="radio" name="sshr"
					value="sel_hotel">
					<label class="ril" for="sel_hotel" style="width: 100%">
						<i class="material-icons">hotel</i>
						<span data-langnum="10">호텔</span>
					</label>
					<input id="selS" class="rii" type="radio" name="sshr"
					value="sel_spot" checked="checked">
					<label class="ril" for="sel_spot" style="width: 100%;">
						<i class="material-icons">place</i>
						<span data-langnum="11">장소</span>
					</label>
				</div>
			</div>
		</div>
		<div>
			<div class="psw"></div>
			<div class="ps position-top animate-right card" id="">
				<div>
					<div>
						<div>
							<b>
								<span></span>
								<span></span>
							</b>							
						</div>						
					</div>
					<div>
						<ul>
							<li></li>
						</ul>
					</div>
				</div>
				<div>
					<div>
						<a>
							<i></i>
						</a>
						<span></span>
						<a>
							<i></i>
						</a>
					</div>
				</div>
			</div>		
			<div>
				<div>
					<div>
						<div>
							<ul>
								<li>
									<div>
										<a>
											<i></i>
										</a>
										<div>
											<div>
												<div></div>
												<div></div>
												<div>
													<div></div>
												</div>
											</div>
											<div>
												<div>
													<input>
													<input>
												</div>
												<div>
													<button>
														<i></i>
														<img alt="" src="">
													</button>
												</div>
											</div>
										</div>
									</div>
									<div>
										<i></i>
										<h6>
											<span></span>
											<span>
												<span></span>
												<span></span>
												<span></span>
												<span></span>
												<span></span>
											</span>
										</h6>
										<i></i>
									</div>
								</li>
							</ul>
						</div>				
					</div>
				</div>
				<div>
					<div>
						<span></span>
					</div>
					<div>
						<ul>
							<li>
								<a></a>
							</li>
							<li>
								<a></a>
							</li>
							<li></li>
						</ul>
					</div>
					<div>
						<div>
							<span></span>
						</div>
						<div>
							<button>
								<h6></h6>
							</button>
						</div>
						<div>
							<h6>
								<span></span>
								<br>
								<span></span>
							</h6>		
						</div>
						<ul>
							<div>
								<input>
								<label>
									<div>
										<h6></h6>
										<h6></h6>
									</div>							
								</label>
								<div>
									<div>
										<div></div>
										<span></span>
										<span>
											<li>
												<h6></h6>
												<br>
												<i></i>
											</li>
										</span>
									</div>
								</div>
							</div>
							<div>
								<input>
								<label>
									<div>
										<h6></h6>
										<h6></h6>
									</div>
								</label>
								<div>	
									<div>	
										<div></div>
										<span></span>
										<span>
											<li>
												<h6></h6>
												<br>
												<i></i>
											</li>
										</span>
									</div>
								</div>
							</div>
						</ul>					
					</div>
					<div>
						<div>
							<span></span>
							<span>
								<span></span>
								<span></span>
								<span></span>
								<span></span>
								<span></span>
							</span>
						</div>
						<div>
							<button>
								<h6></h6>
							</button>
						</div>
						<ul>
							<li>
								<h6>
									<span></span>
									<br>
									<span></span>
									<br>
									<span></span>
								</h6>
								<br>
								<br>
								<i></i>
							</li>
						</ul>
					</div>				
				</div>
			</div>
		</div>
	</div>		
</body>
</html>