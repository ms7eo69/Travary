<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ohzsg7u4i3"></script>
<div class="container" style="margin-top:50px">
        <div class="jumbotron bg-info">
            <h1>도로명주소 경도/위도로 변환하기</h1>            
        </div><!--jumbotron-->
        <form action="/plan/GetgeoLocation.do"  class="form-inline" method="post">
        	<div class="form-group">
        		 <label for="addr">도로명 주소</label>
        		<input type="text" class="form-control" id="addr" placeholder="주소를 입력하세요" name="addr"/>
        	</div>
        	<input type="hidden" name="url" id="url">
        	<div class="form-group">
        		<button type="submit" class="btn btn-info">주소 변환</button>
        	</div>
        </form>
        <h3>데이터 : ${data }<small><span class="text-dagner">${error }</span></small></h3>
    </div><!--container-->
<script>	
	$('.btn').click(function(e){
		var address = $('#addr').val();
		var url = 'https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query='+address;
		$('#url').val(url);
	})
</script>
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>