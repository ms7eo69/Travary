<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../templates/Header.jsp"></jsp:include>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ohzsg7u4i3"></script>
<div id="map" style="width:100%;height:1000px;"></div>
<script>
var MARKER_SPRITE_X_OFFSET = 29,
    MARKER_SPRITE_Y_OFFSET = 50,
    MARKER_SPRITE_POSITION = {
        "A0": [0, 0],
        "B0": [MARKER_SPRITE_X_OFFSET, 0],
        "C0": [MARKER_SPRITE_X_OFFSET*2, 0],
        "D0": [MARKER_SPRITE_X_OFFSET*3, 0],
        "E0": [MARKER_SPRITE_X_OFFSET*4, 0],
        "F0": [MARKER_SPRITE_X_OFFSET*5, 0],
        "G0": [MARKER_SPRITE_X_OFFSET*6, 0],
        "H0": [MARKER_SPRITE_X_OFFSET*7, 0],
        "I0": [MARKER_SPRITE_X_OFFSET*8, 0],

        "A1": [0, MARKER_SPRITE_Y_OFFSET],
        "B1": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET],
        "C1": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET],
        "D1": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET],
        "E1": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET],
        "F1": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET],
        "G1": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET],
        "H1": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET],
        "I1": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET],

        "A2": [0, MARKER_SPRITE_Y_OFFSET*2],
        "B2": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET*2],
        "C2": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET*2],
        "D2": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET*2],
        "E2": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET*2],
        "F2": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET*2],
        "G2": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET*2],
        "H2": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET*2],
        "I2": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET*2]
    };

var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
});

var bounds = map.getBounds(),
    southWest = bounds.getSW(),
    northEast = bounds.getNE(),
    lngSpan = northEast.lng() - southWest.lng(),
    latSpan = northEast.lat() - southWest.lat();

var markers = [];
for (var key in MARKER_SPRITE_POSITION) {

	console.log(MARKER_SPRITE_POSITION[key][0]);
    var position = new naver.maps.LatLng(
        southWest.lat() + latSpan * Math.random(),
        southWest.lng() + lngSpan * Math.random());

    var marker = new naver.maps.Marker({
        map: map,
        position: position,
        title: key,
        icon: {
            url: '<c:url value="/img/example/sp_pins_spot_v3.png"/>',
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(MARKER_SPRITE_POSITION[key][0], MARKER_SPRITE_POSITION[key][1])
        },
        zIndex: 100
    });

    markers.push(marker);
};

naver.maps.Event.addListener(map, 'idle', function() {
    updateMarkers(map, markers);
});

function updateMarkers(map, markers) {

    var mapBounds = map.getBounds();
    var marker, position;

    for (var i = 0; i < markers.length; i++) {

        marker = markers[i]
        position = marker.getPosition();

        if (mapBounds.hasLatLng(position)) {
            showMarker(map, marker);
        } else {
            hideMarker(map, marker);
        }
    }
}

function showMarker(map, marker) {

    if (marker.getMap()) return;
    marker.setMap(map);
}

function hideMarker(map, marker) {

    if (!marker.getMap()) return;
    marker.setMap(null);
}
</script>
<jsp:include page="../templates/Footer.jsp"></jsp:include>