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
        <span>여행지 관리</span>
      </div>
      <div class="info row">
        <div id="usa" class="col-12">
          <ul class="list-unstyled Mloc edit_">
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
</body>

<script>
  var selectElement = document.getElementById("loc_select");//선택된 샐렉터 가져오기
  selectElement.addEventListener("change", function() {
      var selectedValue = selectElement.value;
      console.log("선택지역 : ", selectedValue);
  });



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




    $('.box_name').on('dblclick', function() {
  const divElement = $(this);
  const originalText = divElement.text();
  const inputElement = $('<input>', {
    type: 'text',
    value: originalText
  });

  inputElement.on('blur', function() {
    const newText = $(this).val().trim();
    divElement.text(newText);
  });

  divElement.empty().append(inputElement);
  inputElement.focus();
});

  $('.box_name').change('change', function(){
    $(this).siblings("button").css('display','block')
  })
</script>
</html>