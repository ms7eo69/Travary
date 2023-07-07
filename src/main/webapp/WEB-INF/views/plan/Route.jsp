<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<link rel="stylesheet" href='<c:url value="css/plan/route/Route.css"/>'/>
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
			<div id="map" class="nmap-main" style="width:1000px;height:1000px;"></div>
		</div>
	</div>
	<!-- sidebar -->
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
			<div class="ps position-top animate-right card" id="psbar" style="display: block;">
				<div class="psbarfirst">
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
							<span data-langnum="14">장소명을 검색하세요.</span>
							<br>
							<span data-langnum="15">검색어는 두 글자 이상 입력해주세요.</span>
						</hs>		
						<hs id="snlt2" style="color: rgb(170,170,170); margin-top: 10px; display: none">
							<i class="material-icons">add_location</i>
							<br>
							<span data-langnum="16">
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
											<img alt="Image" src="https://www.myro.co.kr/getSpotImage/jeju?no=1000" id="cartImg1">											
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="psbarsecond">
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