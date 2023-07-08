<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<link rel="stylesheet" href='<c:url value="css/plan/route/Route.css"/>'/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ohzsg7u4i3"></script>
<script>
	var lregion = '${lregion}'
	var contextRoot = '<c:url value="/"/>'
</script>
<script src="<c:url value="js/plan/route/direction.js"/>"></script>
</head>
<body>		
	<!-- nav-header -->
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
	<!-- main-div -->
	<div class="body2">
		<div class="feedWrap">
			<a onclick="">
				<i class="icons" style="font-size: 20px; cursor: pointer;">close</i>
			</a>
			<div id="feedBtn" class="chip we wl black blink2" onclick="">
				<i class="icons" style="font-size: 20px; color: #ffffff; vertical-align: -4px;">
					voiceCall
				</i>			
				<h8 id="feedTxt" style="color: #ffffff;" data-langnum="1">사용이 불편하신가요?</h8>
			</div>
		</div>
		<a id="RecSelBtnH" class="tfb tooltip" data-position="left" data-attrnum="1"
		data-tooltip="" onclick="">
			<h8 data-langnum="2">추천호텔</h8>
		</a>
		<a id="RecSelBtnL" class="tfb tool" data-position="left" data-attrnum="2"
		data-tooltip="" onclick="">
			<h8 data-langnum="3">추천장소</h8>
		</a>
		<div class="multiBtn">
			<a id="gBtn" class="tfb tooltip" data-position="right" data-attrnum="3"
			data-tooltip="이용방법" onclick="">
				<h7 data-langnum="4">이용방법</h7>
			</a>
			<a id="sBtn" class="tfb tooltip" data-position="right" data-attrnum="4"
			data-tooltip="추천여행기" onclick="">
				<h7>여행기</h7>
			</a>
			<a id="spBtn" class="tfb tooltip" data-position="right" data-attrnum="5"
			data-tooltip="장소등록" onclick="">
				<h7 data-langnum="5">장소등록</h7>
			</a>
			<a id="cBtn" class="tfb tooltip" data-position="right" data-attrnum="6"
			data-tooltip="추천코스목록" onclick="">
				<h7 data-langnum="6">추천일정</h7>
			</a>
			<a id="fBtn" class="tfb tooltip" data-position="right" data-attrnum="7"
			data-tooltip="피드백 보내기" onclick="">
				<h7 data-langnum="7">피드백</h7>
			</a>
			<a id="tBtn" class="tfb tooltip" data-position="right" data-attrnum="8"
			data-tooltip="이동수단 : 대중교통">
				<input id="transit" class="rb tpBtn" type="radio" name="tpMode" checked>
				<i class="material-icons">directions_subway</i>
			</a>
			<a id="dBtn" class="tfb tooltip" data-position="right" data-attrnum="9"
			data-tooltip="이동수단 : 자동차">
				<input id="drive" class="rb tpBtn" type="radio" name="tpMode">
				<i class="material-icons">directions_car</i>
			</a>
			<a class="tfb tooltip" data-position="right" data-attrnum="10"
			data-tooltip="일정생성" onclick="">
				<h7 class="makeRoute" data-langnum="8">일정생성</h7>
			</a>
		</div>
		<div>
			<div id="map" class="nmap-main" style="width:1000px;height:1000px;"></div>
		</div>
	</div>
	<!-- sidebar -->
	<div>		
		<div class="ssbar">
			<div>
				<div class="msc" id="sshkw">
					<div class="msic">
						<input id="sshk" type="text" class="center" data-attrnum="11"
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
						<span data-langnum="9">호텔</span>
					</label>
					<input id="selS" class="rii" type="radio" name="sshr"
					value="sel_spot" checked="checked">
					<label class="ril" for="sel_spot" style="width: 100%;">
						<i class="material-icons">place</i>
						<span data-langnum="10">장소</span>
					</label>
				</div>
			</div>
		</div>
		<div>
			<div class="psw"></div>
			<div class="ps position-top animate-right card" id="psbar" style="display: block;">
				<div id="psbarfirst">
					<div class="center psbarfc">
						<div class="sst">
							<b>
								<span id="soReco">추천장소</span>
								<span id="srCnt"></span>
							</b>							
						</div>		
						<hs id="snlt" style="color: rgb(170,170,170); margin-top: 10px; display: none">
							<i class="material-icons">error_outline</i>
							<br>
							<span data-langnum="11">장소명을 검색하세요.</span>
							<br>
							<span data-langnum="12">검색어는 두 글자 이상 입력해주세요.</span>
						</hs>		
						<hs id="snlt2" style="color: rgb(170,170,170); margin-top: 10px; display: none">
							<i class="material-icons">add_location</i>
							<br>
							<span data-langnum="13">
								검색 결과가 없습니다.
								<br>
								찾으시는 장소를 좌측 장소등록버튼으로 등록 해주세요.
							</span>
						</hs>		
					</div>
					<div class="psbarSW">
						<ul class="ul-style" id="spotlists">
							<li class="spot-card" id="ad1">
								<div>
									<div>
										<div class="centered">
											<div class="spl">
												<div class="ssc">
													<h7 class="ssct">
														<i class="material-icons">place</i>
														"9,688"
													</h7>
												</div>
											</div>
											<img alt="Image" src="https://www.myro.co.kr/getSpotImage/jeju?no=1000"
											id="cartImg1" loading="lazy">											
										</div>
									</div>
								</div>
								<div class="placeBM" style="top:2px !important; background-color: undefined">
									<i title="장소" class="material-icons">account_balance</i>
								</div>
								<div class="placeLW">
									<span class="spotList1" title="성산 일출봉(Seongsan Ilchulbong Peak)">
										<h7>
											성산 일출봉
											<br>
											<div class="sest">
												Seongsan Ilchulbong Peak
												<div></div>
												<div class="spotBW">
													<div title="장소 정보" class="btn spotBC" onclick="">
														<i class="material-icons" style="color:#e0e0e0">info</i>
													</div>													
													<div title="선택목록 장소에 추가" class="btn spotBC" onclick="">
														<i class="material-icons">add</i>
													</div>
												</div>
											</div>
										</h7>
									</span>
								</div>
							</li>
							<li class="spot-card" id="ad1">
								<div>
									<div>
										<div class="centered">
											<div class="spl">
												<div class="ssc">
													<h7 class="ssct">
														<i class="material-icons">place</i>
														"8,972"
													</h7>
												</div>
											</div>
											<img alt="Image" src="https://www.myro.co.kr/getSpotImage/jeju?no=1401"
											id="cartImg2" loading="lazy">											
										</div>
									</div>
								</div>
								<div class="placeBM" style="top:2px !important; background-color: undefined">
									<i title="장소" class="material-icons">account_balance</i>
								</div>
								<div class="placeLW">
									<span class="spotList2" title="동문재래시장">
										<h7>동문재래시장</h7>
									</span>		
								</div>
								<div class="spotBW">
									<div title="장소 정보" class="btn spotBC" onclick="">
										<i class="material-icons" style="color:#e0e0e0">info</i>
									</div>													
									<div title="선택목록 장소에 추가" class="btn spotBC" onclick="">
										<i class="material-icons">add</i>
									</div>
								</div>
							</li>
							<li class="spot-card" id="ad1">
								<div>
									<div>
										<div class="centered">
											<div class="spl">
												<div class="ssc">
													<h7 class="ssct">
														<i class="material-icons">place</i>
														"8,635"
													</h7>
												</div>
											</div>
											<img alt="Image" src="https://www.myro.co.kr/getSpotImage/jeju?no=1002"
											id="cartImg3" loading="lazy">											
										</div>
									</div>
								</div>
								<div class="placeBM" style="top:2px !important; background-color: undefined">
									<i title="장소" class="material-icons">account_balance</i>
								</div>
								<div class="placeLW">
									<span class="spotList3" title="섭지코지(Seopjikoji)">
										<h7>
											섭지코지
											<br>
											<div class="sest">
												Seopjikoji
												<div></div>
												<div class="spotBW">
													<div title="장소 정보" class="btn spotBC" onclick="">
														<i class="material-icons" style="color:#e0e0e0">info</i>
													</div>													
													<div title="선택목록 장소에 추가" class="btn spotBC" onclick="">
														<i class="material-icons">add</i>
													</div>
												</div>
											</div>
										</h7>
									</span>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div id="psbarsecond" class="position-center">
					<div class="pssnav">
						<a id="spP" href="#" onclick="">
							<i class="material-icons">chevron_left</i>
						</a>
						<span id="pList"></span>
						<a id="spN" href="#" onclick="">
							<i class="material-icons">chevron_right</i>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div id="tstd">		
			<div class="tsbar animate-left" id="sidebar">
				<div>
					<div id="mscon">						
						<ul class="collapsible" style="border: none; box-sizing: unset">
							<li class="center nav-overlay" id="msconfirst">
								<div style="display: flex; justify-content: center;">
									<a href="/" id="mobileClose">
										<i class="material-icons" style="font-size: 30px; margin-top: 3px">keyboard_arrow_left</i>
									</a>
									<div>
										<div id="ttd" class="tic">
											<div id="korName" class="tit">제주도</div>
											<div id="engName" class="tist">JEJU</div>
											<div id="dayTxt" class="tidt">
												<div id="showingTD">3&nbsp;DAY</div>
											</div>
										</div>
										<div class="airC">
											<div class="dCount">
												<input type="hidden" value="3" id="travDay">
												<input type="text" id="calander" name="dRange" class="center" value onfocus="">
											</div>
											<div class="fBtnC">
												<button id="kfb" class="fBtn">
													<i class="material-icons air_icons">airplane_ticket</i>
													<img style="width: 80px" src=""
													alt="placephoto" loading="lazy">
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="collapsHead dCollapsMain" tabindex="0">
									<i class="material-icons dCollaps_mi">schedule</i>
									<h7>
										<span data-langnum="14">여행시간 상세설정</span>
										<span id="totalTravTA">
											<span data-langnum="15">(총</span>
											<span id="totalTravH">36</span>
											<span data-langnum="16">시간</span>
											<span id="totalTravH">0</span>
											<span data-langnum="17">분)</span>
										</span>
									</h7>
									<i id="operNcloseDtimeSet" title="일자별 시간 설정창 보기"
									class="material-icons dCollaps_mi">expand_more</i>
								</div>								
							</li>
						</ul>										
					</div>
				</div>
				<div class="sCard">
					<div class="sideST selST">
						<span data-langnum="18">선택목록</span>
					</div>
					<div class="center" style="margin: 16px 0px">
						<ul id="tabs" class="tabs tabs-fixed-width">
							<li class="tab">
								<a id="seLHTab" href="#test1" style="text-decoration: none !impoartant;"
								data-langnum="19">호텔</a>
							</li>
							<li class="tab">
								<a id="selSTab" href="#test2" style="text-decoration: none !important;"
								data-langnum="20">장소</a>
							</li>
							<li class="indcator" style="left: 135px; right: 0px;"></li>
						</ul>
					</div>
					<div id="test1" class="col h12" style="display: none;">
						<div class="center" style="margin: 8px 0px">
							<span></span>
						</div>
						<div style="display: flex; justify-content: center;
						align-items: center; width: 100%; padding: 8px 0px">
							<button class="btn center brn" onclick="">
								<h7 data-langnum="21">호텔전체삭제</h7>
							</button>
						</div>
						<div id="cart3NoList" class="center">
							<hs>
								<span>숙소는 일정의 시작 지점과 종료 지점으로 설정됩니다.</span>
								<br>
								<span>마지막 날은 시작 지점으로만 설정됩니다.</span>
							</hs>		
						</div>
						<ul class="ul-style" id="cart3">
							<div class="dayHdiv">
								<input id="day0Hinput" class="rii" type="radio"
								name="hotelDay" cheaked>
								<label id="day0HLN" class="rii addRIL" for="day0Hinput">
									<div id="dayHLT">
										 DAY&nbsp;
										<hs class="hotelDCount">1</hs>
										&nbsp;
										<hs>07.18&nbsp;-&nbsp;07.19</hs>
									</div>							
								</label>
								<div class="dayHdivFirstC" id="hotelHelpTxt1">
									<div>
										<div class="dayHdivSecondC"></div>
										<span id="day0SHI"></span>
										<span id="day0HI">
											<li class="center hInfoTxt">
												<hs>일자 버튼을 누르고 호텔을 추가하세요.</hs>
												<br>
												<i style="cursor: pointer;" class="material-icons" onclick="">add</i>
											</li>
										</span>
									</div>
								</div>
							</div>
							<div class="dayHdiv">
								<input id="day1Hinput" class="rii" type="radio" name="hotelDay">
								<label id="day1HLN" class="rii addRIL" for="day1Hinput">
									<div id="dayHLT">
										DAY&nbsp;
										<hs class="hotelDCount">2</hs>
										&nbsp;
										<hs>07.19&nbsp;-&nbsp;07.20</hs>
									</div>
								</label>
								<div class="dayHdivFirstC" id="hotelHelpTxt2">	
									<div>	
										<div class="dayHdivSecondC"></div>
										<span id="day1SHI"></span>
										<span id="day1HI">
											<li class="center hInfoTxt">
												<hs>일자 버튼을 누르고 호텔을 추가하세요.</hs>
												<br>
												<i style="cursor: pointer;" class="material-icons" onclick="">add</i>
											</li>
										</span>
									</div>
								</div>
							</div>
						</ul>					
					</div>
					<div id="test2" class="col p12">
						<div class="center" style="margin: 8px 0px">
							<span id="selSCnt">0</span>
							<span id="tsta">
								<span data-langnum="22">(총</span>
								<span id="sumSSHour">0</span>
								<span data-langnum="23">시간</span>
								<span id="sumSSMinute">0</span>
								<span data-langnum="24">분)</span>
							</span>
						</div>
						<div style="display: flex; justify-content: center;
						align-items: center; width: 100%; padding: 8px 0px">
							<button class="btn center border-radius-none">
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