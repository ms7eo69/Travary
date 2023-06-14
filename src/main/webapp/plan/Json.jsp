<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ohzsg7u4i3"></script>
<div class="container" style="margin-top:50px">
        <div class="jumbotron bg-info">
            <h1>JSON데이터 받기 연습</h1>            
        </div><!--jumbotron-->
        <button class="btn btn-info" id="ajax">Json데이터받기</button>
    </div><!--container-->
<script>
	$('#ajax').click(function(){
		console.log('버튼 클릭');
			$.ajax({
				url:"https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?start=",
						 headers: {
							    'Content-Type': 'application/json',
							    'X-NCP-APIGW-API-KEY-ID': 'ohzsg7u4i3',
							    'X-NCP-APIGW-API-KEY-ID': 'KS4Y6EwbXgwCr4EOIZKp5gDcxLihq2lAphJucVbX'
							  }
			}).done((data)=>{
				console.log('서버로부터 받은 데이터:',data);
				console.log('아이디:%s,비밀번호:%s,파라미터:%s',data.username,data['password'],data.parameter);
			}).fail((error)=>{
				console.log(error);
			});
		});	
</script>
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>