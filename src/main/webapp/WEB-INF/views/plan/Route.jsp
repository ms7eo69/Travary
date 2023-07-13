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
<script src="<c:url value="js/plan/route/direction.js"/>"></script>
</head>
<body>
	<!-- 상단 바 -->
	<div id="route_header" class="route_top">
	    <label class="main_logo">TRAVARY</label>  
	    <div class="header_menu">
	       	<button class="btn btn-danger">알림</button>
	       	<i class="material-icons">settings</i>
	       	<img src="<c:url value="/images/route/profile.png"/>"
	       	class="dropdown dropdown-toggle dropdown-toggle-no-caret"
	       	id="profile_img" data-toggle="dropdown">
	       	<div class="dropdown-menu">
	       		<a class="dropdown-item" data-target="profile_img">로그인</a>	       		
	       	</div>
		</div>
    </div>
    <div class="row">        
		<div class="col-2">
			<jsp:include page="/WEB-INF/views/templates/Sidebar.jsp"/>
		</div>
		<div class="col-8">
			<div>
				<div id="map" class="nmap-main"></div>
			</div>
		</div>
		<div class="col-2">			
            <nav class="navbar spot_sidebar">
            	<ul class="navbar-nav" id="spot_list">
            		<li class="spot_card">
            			<div>
           					<img alt="Image" src="https://www.myro.co.kr/getSpotImage/jeju?no=1000" id="card_img1">
       						<div class="spot_state_div">
       							<div class="loc_state">
       								<i class="material-icons">place</i>            								
       							</div>            							
       						</div>
            			</div>
            			<div class="spot_info">
            				<span class="spot_list1">
            					<h6>
            						성산일출봉
            						<br>
            						<div class="spot_eng">
	            						Seongsan
	            						<div></div>
	            						<div>
		            						<div class="btn spot_btn_icon">
		            							<i class="material-icons">info</i>
		            						</div>
		            					</div>    						
            						</div>
            					</h6>
            				</span>
            			</div>
            		</li>
            	</ul>
            </nav>
		</div>
	</div>
</body>
</html>