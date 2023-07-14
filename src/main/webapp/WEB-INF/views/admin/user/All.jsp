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
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/nav.jsp"></jsp:include>
    <div class="cont">
      <div class="pageinfo">
        <span>회원 정보</span>
      </div>
      <div class="info row">
        <div id="usa" class="col-12">
          <ul class="list-unstyled rpt">
            
            <!-- <span><i class="fa-solid fa-circle-exclamation"></i>신고당한 게시글</span> -->
            <table class="table table-dark table-hover text-center">
            <thead>
                <tr>
                    <th class="col-2">닉네임</th>
                    <th class="col-2">아이디</th>
                    <th class="col-2">성별</th>
                    <th class="col-2">나이</th>
                    <th class="col-2">휴대폰번호</th>
                    <th class="col-2">가입일</th>
                </tr>
            </thead>
            <tbody class="table-sm down-file-body">
			    <c:if test="${empty records}" var="result">
			        <tr>
			            <td colspan="8">회원 정보가 없습니다</td>
			        </tr>
			    </c:if>
			    <c:if test="${! result}">
			        <c:forEach var="record" items="${records}">
			            <tr>
			                <td>${record.NICKNAME}</td>
			                <td>${record.ID}</td>
			                <td>${record.GENDER}</td>
			                <td>${record.AGE}</td>
			                <td>${record.PHONE}</td>
			                <td>${record.REGIDATE}</td>
			            </tr>
			        </c:forEach>
			    </c:if>
			</tbody>
        </table>
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