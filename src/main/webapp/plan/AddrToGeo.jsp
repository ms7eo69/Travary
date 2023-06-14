<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ohzsg7u4i3"></script>
<div class="container" style="margin-top:50px">
        <div class="jumbotron bg-info">
            <h1>도로명주소 경도/위도로 변환하기</h1>            
        </div><!--jumbotron-->
        <button class="btn btn-info" id="ajax">변환</button>
    </div><!--container-->
<script>
	$('#ajax').click(function(){
			$.ajax({
				url:"https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=대구광역시 중구 동성로12길 9",
						 headers: {
							    'Content-Type': 'application/json',
							    'X-NCP-APIGW-API-KEY-ID': 'ohzsg7u4i3',
							    'X-NCP-APIGW-API-KEY-ID': 'KS4Y6EwbXgwCr4EOIZKp5gDcxLihq2lAphJucVbX'
							  }
			}).done((data)=>{
				console.log('서버로부터 받은 데이터:',data);
			}).fail((error)=>{
				console.log(error);
			});
		});	
</script>
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>