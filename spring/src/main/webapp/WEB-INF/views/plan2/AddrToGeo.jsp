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
        	<div class="form-group">
        		<!-- <button type="submit" class="btn btn-info">주소 변환</button> -->
        	</div>
        </form> 
		<button class="btn btn-info">주소 변환</button>
        <h3>위도 경도 : ${data.addresses}</h3>
        <h3>데이터 : ${data }<small><span class="text-dagner">${error }</span></small></h3>
    </div><!--container-->
<script>	
	$('.btn').click(function(e){
		var addr=$('#addr').val()
		console.log(addr);
		$.ajax({
			url:'/plan/GetgeoLocation.do',
			method:'post',
			dataType:'json',
			data:'addr='+addr
		}).done((data)=>{
			console.log('서버로부터 받은 데이터:',data);
		}).fail((error)=>{
			console.log(error);
		});
	})
</script>
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>