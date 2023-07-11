<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href='<c:url value="/css/plan/route/Route.css"/>'/>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ohzsg7u4i3"></script>
<script>
	var lregion = '${lregion}'
	var contextRoot = '<c:url value="/"/>'
</script>
<!-- <script src="<c:url value="js/plan/route/direction.js"/>"></script> -->
<script>
	$(function(){
		var map = new N.Map('map', {
			zoom: 10,
			center: new N.LatLng(37.3614483, 127.1114883)
		});	
		$.ajax({
			url:'/travary/plan/getAllPlaceWithMarkers.do',
			dataType:'json',
			data:'lregion=${lregion}'
		}).done(function(data){
			data.forEach(function(item){
				var marker = new N.Marker({
					position: item,
					map: map
				});	
			})
		}).fail(function(error){
			console.log(error);
		})
	})
</script>
</head>
<body>
	<!-- 상단 바 -->
	<div id="route_header" class="route_top">
        
    </div>
    <div class="row">        
		<div class="col-2" style="background-color: red;height: inherit;">            
			<nav class="navbar">
                <div>
                        a
                </div>
                <ul>
                    <li>
                        a
                    </li>
                    <li>
                        a
                    </li>
                    <li>
                        a
                    </li>
                    <li>
                        a
                    </li>
                    <li>
                        a
                    </li>
                    <li>
                        a
                    </li>
                </ul>
            </nav>
		</div>
		<div class="col-7">
			<div>
				<div id="map" class="nmap-main" style="width: 300px;height: 300px"></div>
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