<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../templates/Header.jsp"></jsp:include>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ohzsg7u4i3"></script>
<div id="map" style="width:100%;height:1200px;"></div>
<script>
	var map = new naver.maps.Map('map', {
	 	  center: new naver.maps.LatLng(37.3595704, 127.105399),
	 	  zoom: 10
	});
</script>
<jsp:include page="../templates/Footer.jsp"></jsp:include>