<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../../resources/css/Route.css">
<title>Insert title here</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ejh6wsswo6"></script>
<script>
	window.addEventListener('DOMContentLoaded',function(){
		var map = new naver.maps.Map('map', {
		 	  center: new naver.maps.LatLng(37.3595704, 127.105399),
		 	  zoom: 10
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
			<a id="gBtn" class="tfb tooltip" data-position="right" data-attrnum="2">
				
			</a>
			<a ></a>
			<a ></a>
			<a ></a>
			<a ></a>
			<a ></a>
			<a ></a>
			<a ></a>
		</div>
		<div>
			<div id="map" style="width:1000px;height:1000px;"></div>
		</div>
	</div>
	<div>		
		<div class="">
			<div>
				<div class="" id="">
					<div class="">
						<input id="" type="text" class="center" data-attrnum="10"
						data-attrtype="placeholder" placeholder="" autocomplete="off">
					</div>
					<button class="" id="" onclick="">
						<i class="">search</i>
					</button>					
				</div>
				<div class="">
					<input id="" class="" type="radio" name=""
					value="">
					<label class="" for="" style="width: 100%">
						<i class="">hotel</i>
						<span data-langnum="12"></span>
					</label>
					<input id="" class="" type="radio">
					<label>
						<i></i>
						<span></span>
					</label>
				</div>
			</div>
		</div>
		<div>
			<div></div>
			<div>
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