<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<script
  type="text/javascript"
  src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ohzsg7u4i3"
></script>
<div class="container" style="margin-top: 50px">
  <div class="jumbotron bg-info">
    <h1>도로명주소 경도/위도로 변환하기</h1>
  </div>
  <!--jumbotron-->
  <form action="/plan/GetSearchTrend.do" class="form-inline" method="post">
    <div class="form-group">
      <label for="addr">도로명 주소</label>
      <input
        type="text"
        class="form-control"
        id="addr"
        placeholder="주소를 입력하세요"
        name="addr"
      />
    </div>
    <input type="hidden" name="url" id="url" />
    <div class="form-group">
      <button type="submit" class="btn btn-info">주소 변환</button>
    </div>
  </form>
  <h3>위도 경도 : ${data.addresses}</h3>
  <h3>
    데이터 : ${data }<small><span class="text-dagner">${error }</span></small>
  </h3>
</div>
<!--container-->
<script>
  $.ajax({
   	url: '<c:url value="/plan/GetSearchTrend.do"/>',
  	dataType:'json',
  	method:'post',
  	headers:{
  		'Content-Type': 'application/json',
  		"X-NCP-APIGW-API-KEY-ID":"ohzsg7u4i3",
        "X-NCP-APIGW-API-KEY":"KS4Y6EwbXgwCr4EOIZKp5gDcxLihq2lAphJucVbX"
  	},
   	data: JSON.stringify({
   		startDate: '2017-01-01',
   		endDate: '2017-04-30',
   		stimeUnit: 'month',
   		keywordGroups: [
   		    {
   		      groupName: '한글',
   		      keywords: ['한글', 'korean'],
   		    },
   		    {
   		      groupName: '영어',
   		      keywords: ['영어', 'english'],
   		    },
   		  ],
   		  device: 'pc',
   		  ages: ['1', '2'],
   		  gender: 'f',
   	})
  }).done((data)=>{
  	console.log('서버로부터 받은 데이터:',data);
  }).fail((error)=>{
  	console.log(error);
  });
</script>
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>