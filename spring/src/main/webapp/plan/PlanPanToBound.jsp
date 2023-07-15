<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ohzsg7u4i3"></script>
<style>
	.control-btn{
	z-index:3;
	position : relative;
	    margin: 0;
    color: #555;
    padding: 2px 6px;
    background: #fff;
    border: solid 1px #333;
    cursor: pointer;
    -webkit-border-radius: 5px;
    outline: 0 none;
    border-radius: 5px;
    box-shadow: 2px 2px 1px 1px rgba(0, 0, 0, 0.5)
	}
	input{
		margin-top: 50px !important;
		overflow: visible; 
		    appearance: auto;
    user-select: none;
    white-space-collapse: preserve;
    text-wrap: nowrap;
    align-items: flex-start;
    text-align: center;
    cursor: default;
    box-sizing: border-box;
    background-color: buttonface;
    color: buttontext;
    padding: 1px 6px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonborder;
    border-image: initial;
	}
</style>
<div id="map" style="width:100%;height:1200px; position:absolute; z-index:0;" >
	<div class="buttons">
        <input id="to-jeju" type="button" value="제주도로 setCenter" class="control-btn">
        <input id="to-1" type="button" value="6레벨로 setZoom" class="control-btn">
        <input id="to-dokdo" type="button" value="독도로 fitBounds" class="control-btn">
        <input id="to-busan" type="button" value="부산으로 panTo" class="control-btn">
        <input id="to-seoul" type="button" value="서울로 panToBounds" class="control-btn">
        <input id="panBy" type="button" value="panBy로 조금씩 이동하기" class="control-btn">
   </div>
</div>
<script>
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.5666805, 126.9784147),
    zoom: 9
});

var jeju = new naver.maps.LatLng(33.3590628, 126.534361),
    busan = new naver.maps.LatLng(35.1797865, 129.0750194),
    dokdo = new naver.maps.LatLngBounds(
                new naver.maps.LatLng(37.2380651, 131.8562652),
                new naver.maps.LatLng(37.2444436, 131.8786475)),
    seoul = new naver.maps.LatLngBounds(
                new naver.maps.LatLng(37.42829747263545, 126.76620435615891),
                new naver.maps.LatLng(37.7010174173061, 127.18379493229875));

$("#to-jeju").on("click", function(e) {
    e.preventDefault();

    map.setCenter(jeju);
});

$("#to-1").on("click", function(e) {
    e.preventDefault();

    map.setZoom(6, true);
});

$("#to-dokdo").on("click", function(e) {
    e.preventDefault();

    map.fitBounds(dokdo);
});

$("#to-busan").on("click", function(e) {
    e.preventDefault();

    map.panTo(busan);
});

$("#to-seoul").on("click", function(e) {
    e.preventDefault();

    map.panToBounds(seoul);
});

$("#panBy").on("click", function(e) {
    e.preventDefault();

    map.panBy(new naver.maps.Point(10, 10));
});
</script>
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>