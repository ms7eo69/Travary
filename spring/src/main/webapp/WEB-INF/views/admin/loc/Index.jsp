<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://kit.fontawesome.com/c4d27926f7.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value='/css/admin/admin_loc.css'/>">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/nav.jsp"></jsp:include>
	<div class="cont">
      <div class="pageinfo">
        <span>여행 관련</span>
      </div>
      <div class="info row">
        <!-- <div class="chart">
          <ul class="list-unstyled Mloc">
            <span>선택한 여행지역 순</span>
            <li>
              <img src="images/1.jpg">
              <div class="box_name">부산</div>
              <div class="box_vCount">선택수: 230</div>
            </li>
            <li>
              <img src="images/2.jpg">
              <div class="box_name">제주</div>
              <div class="box_vCount">선택수: 152</div>
            </li>
            <li><img src="images/3.jpg">
              <div class="box_name">전주</div>
              <div class="box_vCount">선택수: 123</div></li>
            <li><img src="images/4.jpg">
              <div class="box_name">인천</div>
              <div class="box_vCount">선택수: 98</div></li>
            <li><img src="images/6.jpg">
              <div class="box_name">서울</div>
              <div class="box_vCount">선택수: 62</div></li>
            <li><img src="images/8.jpg">
              <div class="box_name">대구</div>
              <div class="box_vCount">선택수: 51</div>
            </li>
            <li><img src="images/9.jpg">
              <div class="box_name">충북</div>
              <div class="box_vCount">선택수: 48</div>
            </li>
          </ul>
        </div> -->
        <div class="chart">
          <div id="travMon"></div>
        </div>
        <div class="chart">
          <div id="with"></div>
        </div>
        <div class="chart">
          <div id="mtheme"></div>
        </div>
        <div class="chart">
          <div id="stheme"></div>
        </div>
      </div>
    </div>
</body>
<script>
var regidata = [
    {name:'5월', value:254},
    {name:'6월', value:321},
    {name:'7월', value:432}
  ];
Highcharts.chart('travMon', {
chart: {
  height: 300,
  type: 'line',
},
title: {
  text: '월별 이용 횟수'  // 그래프 제목
},
xAxis: {
  categories: regidata.map(function(d) { return d.name; })
},
yAxis: {
  title: ''
},
plotOptions: {
  line: {
    dashStyle: 'dash', // 점선 스타일 설정
  }
},
series: [{
  name: '이달 이용 횟수',
  data: regidata.map(function(d) {return d.value}) // 점선 그래프의 데이터
}]
});

var mthemeoption = {
chart: {
  width: 400,
  height: 300,
  type: 'pie'  // 그래프 유형: 파이 그래프
},
title: {
  text: '메인테마 선호도'  // 그래프 제목
},
series: [{
  name: '테마',  // 시리즈 이름
  data: [
    ['선택안함', 60],
    ['액티비티', 20],
    ['힐링', 30],
    ['테마파크', 50]
  ]  // 그래프 데이터
}]
};
Highcharts.chart('mtheme', mthemeoption);

var sthemeoption = {
    chart: {
      width: 400,
      height: 300,
      type: 'pie'  // 그래프 유형: 파이 그래프
    },
    title: {
      text: '소테마 선호도'  // 그래프 제목
    },
    series: [{
      name: '소테마',  // 시리즈 이름
      data: [
        ['선택안함', 40],
        ['계곡', 30],
        ['강', 20]
      ]  // 그래프 데이터
    }]
  }
Highcharts.chart('stheme', sthemeoption);

var sthemeoption = {
    chart: {
      width: 400,
      height: 300,
      type: 'pie'  // 그래프 유형: 파이 그래프
    },
    title: {
      text: '반려동물 및 미성년자 동반 여부'  // 그래프 제목
    },
    series: [{
      name: '동반자',  // 시리즈 이름
      data: [
        ['선택안함', 40],
        ['미성년', 30],// ajax data 받아서 값 넣기
        ['반려동물', 20],
        ['둘 다 포함된 경우', 8]
      ]  // 그래프 데이터
    }]
  }
Highcharts.chart('with', sthemeoption);
</script>
</html>