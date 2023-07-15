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
    <div class="row mt-3" style="height: 1100px;">        
		<div class="col-2" style="background-color: rgba(217, 255, 0, 0.171);height: inherit">         
			<jsp:include page="/WEB-INF/views/templates/Sidebar.jsp"/>
		</div>
		<div class="col-3 d-flex justify-content-around align-items-center flex-column">
			<div>
				<div  style="height: 400px; width: 400px;overflow-y: auto; overflow-x: hidden;">
					<table class="table w-100">
						<thead>
							<tr class="row">
								<th class="col-8 text-center">관광지</th>
								<th class="col text-center">인기도</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			<div class="d-flex w-50 flex-column justify-content-between" style="height: 100px;">
				<div class="d-flex w-75 justify-content-between">
					<div>줌레벨:</div>
					<div>
						<span id="zoom">8</span>
					</div>
				</div>
				<div class="d-flex w-75 justify-content-between">
					<div>인기도합계:</div>
					<div>
						<span id="sum">0</span>
					</div>
				</div>
				<div>
					<button class="btn btn-primary" id="pinpoint">핀포인트 설정</button>
				</div>
			</div>
			<div>
			</div>
			<div>

			</div>
		</div>
		<div class="col">
			<div style="width: 900px;">
				<div id="map" class="nmap-main"></div>
			</div>
		</div>
	</div>
</body>
</html>