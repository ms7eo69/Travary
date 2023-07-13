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
	var contextRoot = '<c:url value="/"/>'
</script>
<script src="<c:url value='/js/admin/place/boundary.js'/>"></script>
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
		<div class="col-2" style="background-color: rgba(217, 255, 0, 0.171);height: inherit">         
			<jsp:include page="/WEB-INF/views/templates/Sidebar.jsp"/>
		</div>
		<div class="col-3 d-flex justify-content-around align-items-center flex-column">
			<div>
				<div  style="height: 300px; width: 200px;overflow-y: scroll;">
					<table class="table w-100">
						<thead>
							<tr class="row">
								<th class="col-8">관광지</th>
								<th class="col">인기도</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div>
					줌레벨:<span id="zoom">8</span>
				</div>
				<div>
					인기도합계:<span id="sum">0</span>
				</div>
			</div>
			<div>
				<div>
					<button class="btn btn-primary" id="pinpoint">핀포인트 설정</button>
				</div>
			</div>
			<div>

			</div>
		</div>
		<div class="col">
			<div>
				<div id="map" class="nmap-main"></div>
			</div>
		</div>
	</div>
</body>
</html>