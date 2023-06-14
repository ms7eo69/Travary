<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ohzsg7u4i3"></script>
<div id="map" style="width:100%;height:1200px;"></div>
<script>
	var map = new naver.maps.Map('map', {
	 	  center: new naver.maps.LatLng(37.3595704, 127.105399),
	 	  zoom: 10
	});
	$('#ajax').click(function(){
		console.log('버튼 클릭');
		$.ajax({	$('#ajax').click(function(){
			console.log('버튼 클릭');
			$.ajax({
				url:"https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving",
						dataType:"json",
						 headers: {
							    'Content-Type': 'application/json',
							    'X-NCP-APIGW-API-KEY-ID': 'ohzsg7u4i3',
							    'X-NCP-APIGW-API-KEY-ID': 'KS4Y6EwbXgwCr4EOIZKp5gDcxLihq2lAphJucVbX'
							  },
			}).done((data)=>{
				console.log('서버로부터 받은 데이터:',data);
				console.log('아이디:%s,비밀번호:%s,파라미터:%s',data.username,data['password'],data.parameter);
			}).fail((error)=>{
				console.log(error);
			});
		});
		
	</script>
			url:"https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving",
					dataType:"json",
					 headers: {
						    'Content-Type': 'application/json',
						    'X-NCP-APIGW-API-KEY-ID': 'ohzsg7u4i3',
						    'X-NCP-APIGW-API-KEY-ID': 'KS4Y6EwbXgwCr4EOIZKp5gDcxLihq2lAphJucVbX'
						  },
		}).done((data)=>{
			console.log('서버로부터 받은 데이터:',data);
			console.log('아이디:%s,비밀번호:%s,파라미터:%s',data.username,data['password'],data.parameter);
		}).fail((error)=>{
			console.log(error);
		});
	});
	
</script>
</script>
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>