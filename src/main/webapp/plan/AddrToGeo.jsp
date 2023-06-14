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
	var query = '대구광역시 중구 동성로12길 9';
	var encodedQuery = encodeURIComponent(query);
	var url = 'https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode'
	/* $('#ajax').click(function(){
			$.ajax({
				url:"https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="+encodedQuery,
						dataType:"json",
						 headers: {
							    "Content-Type": "application/json",
							    "X-NCP-APIGW-API-KEY-ID": "ohzsg7u4i3",
							    "X-NCP-APIGW-API-KEY": "KS4Y6EwbXgwCr4EOIZKp5gDcxLihq2lAphJucVbX"
							  }
			}).done((data)=>{
				console.log('서버로부터 받은 데이터:',data);
			}).fail((error)=>{
				console.log(error);
			});
		});	 */
		var button = document.querySelector('#ajax');
		button.onclick=function(){
			// XMLHttpRequest 객체 생성
			var xhr = new XMLHttpRequest();
			// 요청 메서드 및 URL 설정
			xhr.open("GET",url+"?"+encodedQuery, true);
			//xhr.open("GET", "<c:url value="/ReturnType/Void.do"/>", true);
			
			//요청을 GET방식으로 설정시 파라미터값을 아래와같이 쿼리스트링으로 보내야함.
			//var params으로 파라미터 지정후 xhr.send(params)시 에러
			//xhr.open("GET", "<c:url value="/ReturnType/Void.do?returnType=Void!"/>", true);
			// 요청 헤더 설정(POST방식일때 반드시 Content-Type설정)
			xhr.setRequestHeader("Content-Type", "application/json");
			xhr.setRequestHeader("X-NCP-APIGW-API-KEY-ID", "ohzsg7u4i3");
			xhr.setRequestHeader("X-NCP-APIGW-API-KEY", "KS4Y6EwbXgwCr4EOIZKp5gDcxLihq2lAphJucVbX");
			//Conetent-Type : application/x-www-form-urlencoded :
			//요청 본문을 key=value 형태의 문자열로 인코딩하여 전송 (=form태그의 데이터 전송방식의 default값)
			
			// 요청 파라미터 생성 (요청이 POST방식일때, 필요한경우 지정(생략가능))
			//var params = "returnType=Void!";
			// 요청 완료 후 처리할 콜백 함수 설정
			xhr.onreadystatechange = function() {
			  if (xhr.readyState === XMLHttpRequest.DONE) {
				/* 
				server status : 200 -> 요청을 성공적으로 받음
				아래 if문은 요청을 성공적으로 받았을때 수행할 로직이며
				ajxa의 done(콜백함수)와 같다. 
				*/
			    if (xhr.status === 200) { 
			     /*
			      data에 서버로부터 받은 JSON형식의 문자열을 
			      JSON.parse(JSON형식의 문자열)으로 JSON객체로 변환하여 담음
			      즉 , 변수 data : JSON객체
			      */
			      var data = JSON.parse(xhr.responseText);
			      console.log('서버로부터 받은 데이터:',data);
				/* 
				server status : 200이 아님-> 요청 받기에 실패
				아래 else문은 요청을 받기에 실패했을때 수행할 로직이며
				ajxa의 fail(콜백함수)와 같다. 
				*/
			    } else {
			      console.error(xhr.status);
			    }
			  }
			};
			// 요청 전송
			// POST방식의 요청에서 파라미터를 추가적으로 전송할때
			//xhr.send(params); 
			//GET방식 요청 이거나 POST방식의 요청에서 파라미터를 추가적으로 전송하지 않을때
			xhr.send();
		}
</script>
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>