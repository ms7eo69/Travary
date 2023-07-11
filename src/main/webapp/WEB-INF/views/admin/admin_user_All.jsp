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
<link rel="stylesheet" href='<c:url value="css/admin/admin_user.css" />'>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/nav.jsp"></jsp:include>
    <div class="cont">
      <div class="pageinfo">
        <span>회원 관리</span>
      </div>
      <div class="info row">
        <div id="usa" class="col-12">
          <ul class="list-unstyled rpt">
            
            <!-- <span><i class="fa-solid fa-circle-exclamation"></i>신고당한 게시글</span> -->
            <li>
              <img src="images/8.jpg">
              <div class="nickname">Yuna</div>
              <div class="box2 id_">kosmo1234</div>
              <div class="box2">가입일 : 2023-07-09</div>
            </li>
            <li>
              <img src="images/1.jpg">
              <div class="nickname">hena</div>
              <div class="box2 id_">hanso24</div>
              <div class="box2">가입일 : 2023-07-08</div>
            </li>
            <li>
              <img src="images/2.jpg">
              <div class="nickname">hoi</div>
              <div class="box2 id_">roi5028</div>
              <div class="box2">가입일 : 2023-07-06</div>
            </li>
            <li>
              <img src="images/3.jpg">
              <div class="nickname">good</div>
              <div class="box2 id_">mosko9928</div>
              <div class="box2">가입일 : 2023-07-05</div>
            </li>
            <li>
              <img src="images/4.jpg">
              <div class="nickname">call</div>
              <div class="box2 id_">kosmo1234</div>
              <div class="box2">가입일 : 2023-07-04</div>
            </li>
            <li>
              <img src="images/7.jpg">
              <div class="nickname">backhome</div>
              <div class="box2 id_">kosmo1234</div>
              <div class="box2">가입일 : 2023-07-04</div>
            </li>
            <li class="create_user">
              <img src="images/8.jpg">
              <input type="text" class="box2" placeholder="nickname" name="nickname"> 
              <input type="text" class="box2" placeholder="id" name="id">
              <input type="text" class="box2" placeholder="pwd" name="pwd">
              <input type="text" class="box2" placeholder="callNum" name="callNum">
              <select class="box2" name="gender">
                <option value="G">Girl</option>
                <option value="M">Man</option>
              </select>

              <button class="createBtn" onclick="addItem()">새로운 계정 추가</button>
            </li>
          </ul>
        </div>        
      </div>
    </div>
</body>
<script src="admin_user.js"></script>
<script>
function addItem() {
    // 새로운 <li> 요소 생성
    var li = document.createElement("li");

    // <li> 내용 설정
    li.innerHTML = `
        <img src="images/8.jpg" onclick="handleClick(event)">
        <input type="text" class="cUser_ nickname" id="cNick">
        <input type="text" class="cUser_ id_" id="cId">
    `;

    // .rpt 요소에 <li> 추가
    var rpt = document.querySelector(".rpt");
    var firstLi = rpt.querySelector('li')
    rpt.insertBefore(li, firstLi);
}

function handleClick(event) {
  var target = event.target;
  console.log('1')
  if (target.tagName === 'IMG') {
      var src = target.getAttribute('src');
      var extension = src.substr(src.lastIndexOf('.') + 1).toLowerCase();
      console.log('2')
      if (extension === 'jpg') {
          // JPG 파일인 경우 동작 수행
          console.log('Clicked on a JPG image:', src);
      }
  }
}

const searchInput = document.getElementById('searchInput');
const listItems = document.querySelectorAll('#usa .list-unstyled.rpt li');

  searchInput.addEventListener('input', function() {
    const searchText = searchInput.value.trim().toLowerCase();

    listItems.forEach(function(li) {
      const box1Text = li.querySelector('.nickname').textContent.toLowerCase();
      const box2Text = li.querySelector('.id_').textContent.toLowerCase();
      const shouldShow = box1Text.includes(searchText) || box2Text.includes(searchText);

      li.style.display = shouldShow ? 'flex' : 'none';
    });
  });

  $('.nickname').on('dblclick', function() {
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