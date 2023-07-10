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
	<div class="row">
		<div class="col-2">
			<nav class="navbar">
			</nav>
		</div>
		<div class="col-7">
		</div>
		<div class="col-3">
		</div>
	</div>
</body>
</html>