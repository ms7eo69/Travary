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
<link rel="stylesheet" href='<c:url value="/css/admin/admin_user.css" />'>
<script src="<c:url value="/js/admin/user/Index.js"/>" defer></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/nav.jsp"></jsp:include>
    <div class="cont">
      <div class="pageinfo">
        <span>회원 관리</span>
      </div>
      <div class="info row">
        <div class="col-12">
          <div class="sns_users ">
            <ul class="nav nav-tabs" role="tablist">
              <li class="nav-item ">
                <a class="nav-link active" data-toggle="tab" href="#rpt1">신고된 게시물</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#rpt2">신고된 사용자</a>
              </li>
            </ul>
          
            <!-- Tab panes -->
            <div class="tab-content chart">
              <div id="rpt1" class="tab-pane active _best">
                <ul class="list-unstyled rpt">
                  <span><i class="fa-solid fa-circle-exclamation"></i>신고당한 게시글</span>
                  <li>
                    <img src="<c:url value='/images/admin/8.jpg'/>">
                    <div class="box1">Yuna</div>
                    <div class="box2">정치적 성향이 강한 게시물</div>
                    <div class="box_title">파란거보단 빨간색으로 칠한게 예로부터 더 좋다고했음ㅎㅎ</div>
                    <button class="delete_sns"><i class="fa-solid fa-trash-can"></i></i></button>
                    <button class="noport"><i class="fa-solid fa-x"></i></button>
                  </li>
                  <li><img src="<c:url value='/images/admin/1.jpg'/>">1</li>
                  <li><img src="<c:url value='/images/admin/2.jpg'/>">2</li>
                  <li><img src="<c:url value='/images/admin/3.jpg'/>">3</li>
                  <li><img src="<c:url value='/images/admin/7.jpg'/>">3</li>
                  <li><img src="<c:url value='/images/admin/3.jpg'/>">3</li>
                </ul>
              </div>
              <div id="rpt2" class="tab-pane fade _best">
                <ul class="list-unstyled rpt">
                  <span><i class="fa-solid fa-circle-exclamation"></i>신고당한 유저</span>
                  <li>
                    <img src="images/3.jpg">
                    <div class="box1">Hola</div>
                    <div class="box2">언어폭력</div>
                    <button class="delete_sns"><i class="fa-solid fa-trash-can"></i></button>
                    <button class="noport"><i class="fa-solid fa-x"></i></button>
                  </li>
                  <li><img src="<c:url value='/images/admin/1.jpg'/>">1</li>
                  <li><img src="<c:url value='/images/admin/2.jpg'/>">2</li>
                  <li><img src="<c:url value='/images/admin/3.jpg'/>">3</li>
                  <li><img src="<c:url value='/images/admin/7.jpg'/>">3</li>
                  <li><img src="<c:url value='/images/admin/3.jpg'/>">3</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="chart _pie">
          <div id="gender"></div>
        </div>
        <div class="chart _line">
          <div id="regimon"></div>
        </div>
        <div class="chart _bar">
          <div id="age"></div>
        </div>
        <div class="col-12">
          <div class="sns_users ">
            <ul class="nav nav-tabs" role="tablist">
              <li class="nav-item ">
                <a class="nav-link active" data-toggle="tab" href="#home">조회수</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menu2">추천수</a>
              </li>
            </ul>
          
            <!-- Tab panes -->
            <div class="tab-content chart">
              <div id="home" class="tab-pane active _best">
                <ul class="list-unstyled snsMV" >
                  <span>금일 가장 많이본 게시물</span>
                  <li>
                    <img src="images/1.jpg">
                    <div class="box_name">Enma</div>
                    <div class="box_title">문뜩 생각나서 아무생각없이 논산에 놀러가서 하늘만 보고있었네요~</div>
                    <div class="box_vCount">조회수: 52</div>
                  </li>
                  <li><img src="images/2.jpg">2</li>
                  <li><img src="images/3.jpg">3</li>
                  <li><img src="images/4.jpg">4</li>
                  <li><img src="images/6.jpg">5</li>
                </ul>
              </div>
              <div id="menu2" class="tab-pane fade _best">
                <ul class="list-unstyled snsMV" >
                  <span>금일 추천 게시물</span>
                  <li>
                    <img src="images/1.jpg">
                    <div class="box_name">Enma</div>
                    <div class="box_title">문뜩 생각나서 아무생각없이 논산에 놀러가서 하늘만 보고있었네요~</div>
                    <div class="box_vCount">조회수: 52</div>
                  </li>
                  <li><img src="images/2.jpg">2</li>
                  <li><img src="images/3.jpg">3</li>
                  <li><img src="images/4.jpg">4</li>
                  <li><img src="images/6.jpg">5</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        
      </div>
    </div>
    
</body>

</html>