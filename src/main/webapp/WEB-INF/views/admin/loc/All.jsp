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
        <div class="col-12">
          <div class="sns_users ">
            <ul class="nav nav-tabs" role="tablist">
              <li class="nav-item ">
                <a class="nav-link" data-toggle="tab" href="#home">이번달</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menuSum">누적 총합</a>
              </li>
            </ul>
          
            <!-- Tab panes -->
            <div class="tab-content chart">
              <div id="home" class="tab-pane active _best">
                <ul class="list-unstyled snsMV Mloc">
                  <span>선택한 여행지역 순</span>
                  <li>
                    <img src="images/1.jpg">
                    <div class="box_name">부산</div>
                    <div class="box_vCount">선택수: 35</div>
                    <div class="box_rvCount">좋았어요: 29</div>
                  </li>
                  <li>
                    <img src="images/2.jpg">
                    <div class="box_name">제주</div>
                    <div class="box_vCount">선택수: 27</div>
                    <div class="box_rvCount">좋았어요: 18</div>
                  </li>
                  <li><img src="images/3.jpg">
                    <div class="box_name">전주</div>
                    <div class="box_vCount">선택수: 21</div></li>
                  <li><img src="images/4.jpg">
                    <div class="box_name">인천</div>
                    <div class="box_vCount">선택수: 15</div></li>
                  <li><img src="images/6.jpg">
                    <div class="box_name">서울</div>
                    <div class="box_vCount">선택수: 12</div></li>
                  <li><img src="images/8.jpg">
                    <div class="box_name">대구</div>
                    <div class="box_vCount">선택수: 9</div>
                  </li>
                  <li><img src="images/9.jpg">
                    <div class="box_name">충북</div>
                    <div class="box_vCount">선택수: 8</div>
                  </li>
                </ul>
              </div>
              <div id="menuSum" class="tab-pane _best">
                <ul class="list-unstyled snsMV Mloc">
                  <span>선택한 여행지역 순</span>
                  <li>
                    <img src="images/1.jpg">
                    <div class="box_name">부산</div>
                    <div class="box_vCount">선택수: 230</div>
                    <div class="box_rvCount">좋았어요: 209</div>
                  </li>
                  <li>
                    <img src="images/2.jpg">
                    <div class="box_name">제주</div>
                    <div class="box_vCount">선택수: 152</div>
                    <div class="box_rvCount">좋았어요: 123</div>
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
              </div>
            </div>
          </div>
        </div>
        <div id="usa" class="col-12">
          <ul class="list-unstyled Mloc edit_">
            <span>인기 관광지</span>
            <label for="loc_select">대분류 지역을 골라줘용</label>
            <select id="loc_select">
                <option value="">전체</option>
                <!-- foreach돌려서 옵션생성 -->
                <option value="제주">제주</option> 
                <option value="전주">전주</option>
                <option value="인천">인천</option>
                <option value="서울">서울</option>
            </select>
            <li>
              <img src="images/1.jpg">
              <div class="box_name">여행지 이름</div>
              <div class="box_name">여행지 이름</div>
              <button class="edit_loc">수정</button>
            </li>
            <li>
              <img src="images/2.jpg">
              <div class="box_name">제주</div>
              <button class="edit_loc">수정</button>
            </li>
            <li><img src="images/3.jpg">
              <div class="box_name">전주</div>
              <button class="edit_loc">수정</button>
            </li>
            <li><img src="images/4.jpg">
              <div class="box_name">인천</div>
              <button class="edit_loc">수정</button>
            </li>
            <li><img src="images/6.jpg">
              <div class="box_name">서울</div>
              <button class="edit_loc">수정</button>
            </li>
            <li><img src="images/8.jpg">
              <div class="box_name">대구</div>
              <button class="edit_loc">수정</button>
            </li>
            <li><img src="images/9.jpg">
              <div class="box_name">충북</div>
              <button class="edit_loc">수정</button>
            </li>
          </ul>
        </div>
    </div>
  </div>
</div>
</body>
<script>
    const searchInput = document.getElementById('loc_select');
    const listItems = document.querySelectorAll('#usa .list-unstyled.Mloc li');

    searchInput.addEventListener('input', function() {
      const searchText = searchInput.value.trim().toLowerCase();

      listItems.forEach(function(li) {
        const box1Text = li.querySelector('.box_name').textContent.toLowerCase();
        // const box2Text = li.querySelector('.box_').textContent.toLowerCase();
        const shouldShow = box1Text.includes(searchText)

        li.style.display = shouldShow ? 'flex' : 'none';
      });
    });
</script>
</html>