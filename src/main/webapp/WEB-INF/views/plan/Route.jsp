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
<script>
	$(function(){
		if ($()) {
			
		}
	});
</script>
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
		<div class="col-2" id="travary_sidebar">
			<jsp:include page="/WEB-INF/views/templates/Sidebar.jsp"/>
		</div>
		<div class="col-7" id="route_center">
			<div>
				<div id="map" class="nmap-main"></div>
			</div>
		</div>
		<div class="col-3" id="route_right">			
			<div class="row" style="height: 65px;display: flex;text-align: center;">
				<div class="col-6" style="padding-top:20px;border-right: 1px solid black;background: rgba(123,255,255);height: 65px;">
					추천 장소
				</div>
				<div class="col-6" style="padding-top:20px;">
					추천 호텔
				</div>
			</div>			
			<hr>
            <nav class="navbar spot_sidebar" style="height: 700px">            	
            	<ul class="navbar-nav" id="spot_list">
            		<div class="card mb-3">            		
					  	<div class="row no-gutters">
						    <div class="col-4">
						    	<img src="<c:url value="/images/landing/landing1.jpg"/>" style="width: 100%;height: 110px; border-radius: 8px 0 0 8px;">
						    </div>
						    <div class="col-8">
						    	<legend>title</legend>
						    	<span>jsdklfjdslkfjdslk</span>
						    </div>
					    </div>			
				    </div>		
					<div class="card mb-3">            		
					  	<div class="row no-gutters">
						    <div class="col-4">
						    	<img src="<c:url value="/images/landing/landing1.jpg"/>" style="width: 100%;height: 110px; border-radius: 8px 0 0 8px;">
						    </div>
						    <div class="col-8">
						    	<legend>title</legend>
						    	<span>jsdklfjdslkfjdslk</span>
						    </div>
					    </div>			
				    </div>		
					<div class="card mb-3">            		
					  	<div class="row no-gutters">
						    <div class="col-4">
						    	<img src="<c:url value="/images/landing/landing1.jpg"/>" style="width: 100%;height: 110px; border-radius: 8px 0 0 8px;">
						    </div>
						    <div class="col-8">
						    	<legend>title</legend>
						    	<span>jsdklfjdslkfjdslk</span>
						    </div>
					    </div>			
				    </div>
				    <div class="card mb-3">            		
					  	<div class="row no-gutters">
						    <div class="col-4">
						    	<img src="<c:url value="/images/landing/landing1.jpg"/>" style="width: 100%;height: 110px; border-radius: 8px 0 0 8px;">
						    </div>
						    <div class="col-8">
						    	<legend>title</legend>
						    	<span>jsdklfjdslkfjdslk</span>
						    </div>
					    </div>			
				    </div>		
				    <div class="card mb-3">            		
					  	<div class="row no-gutters">
						    <div class="col-4">
						    	<img src="<c:url value="/images/landing/landing1.jpg"/>" style="width: 100%;height: 110px; border-radius: 8px 0 0 8px;">
						    </div>
						    <div class="col-8">
						    	<legend>title</legend>
						    	<span>jsdklfjdslkfjdslk</span>
						    </div>
					    </div>			
				    </div>		
            	</ul>
            </nav>
            <hr>
            <div class="row" style="display: flex;align-items: flex-end;text-align: center;z-index: 1;box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.35);">
				<div class="col">&lt;</div>
				<div class="col">&gt;</div>
			</div>		
		</div>
	</div>
</body>
</html>