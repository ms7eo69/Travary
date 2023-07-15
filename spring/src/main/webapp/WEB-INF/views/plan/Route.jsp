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
        <label class="main_logo">LOGO</label>  
        <div class="header_menu">
        	<button class="btn btn-danger">알림</button>
        	<i>설정</i>
        	<a>사용자 정보</a>
        </div>      
    </div>
    <div class="row">        
		<div class="col-2">         
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