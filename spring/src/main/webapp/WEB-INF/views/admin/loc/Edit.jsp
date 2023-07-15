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
            <span>지역별 관광지</span>
            <div class="filter container">
	            <label for="loc_select">대분류 지역을 골라줘용</label>
	            <select id="loc_select">
	                <option value="">전체</option>
	                <!-- foreach돌려서 옵션생성 -->
	                <option value="제주">제주</option> 
	                <option value="전주">전주</option>
	                <option value="인천">인천</option>
	                <option value="서울">서울</option>
	            </select>
	            <label for="cat_select" class="ml-5">카테고리도 골라줘용</label>
	            <select id="cat_select">
	                <option value="">전체</option>
	                <option value="관광지">관광지</option>
	                <option value="레포츠">레포츠</option>  
	                <option value="문화시설">문화시설</option>
	                <option value="숙박">숙박</option>
	                <option value="시장">시장</option> 
	                <option value="축제/공연">축제/공연</option>  
	            </select>
            </div>
            <input id="searchInput" type="text" placeholder="찾을 관광지">
            <li>
              <img src="images/1.jpg">
              <input name="no" value="314" hidden>
              <div class="box _name" name="name">안데르센 동화마을</div>
              <div class="box _category" name="category">관광지</div>
              <div class="box _detail" name="detail">부산 기장군 장안읍에 있는 도예 관광 힐링촌에 들어선 안데르센 동화마을은 어린이뿐 아니라 어른들도 아우르는 힐링 체험 공간으로 수많은 동화를 집필해 전 세계 아동들에게 사랑받는 안데르센의 생애와 그의 작품 세계를 한눈에 알 수 있다. 18세기 바로크 양식으로 재현한 안데르센 정원, 아이들과 함께하는 다양한 놀이시설이 있다.</div>
              <button class="edit_loc">수정</button>
            </li>
            <li>
              <img src="images/2.jpg">
              <input name="no" value="2745" hidden>
              <div class="box _name" name="name">국립일제강제동원역사관</div>
              <div class="box _category" name="category">문화시설</div>
              <div class="box _detail" name="detail">국립일제강제동원역사관은 일제강점기 강제동원의 실상을 규명함으로써 성숙한 역사의식을 고취하고, 인권과 세계평화에 대한 국민 교육의 장을 제공하는 것을 목적으로 건립되었다. 총 7만 5465㎡의 부지에 지상3층 지하4층, 건물 연면적 1만 2062㎡ 규모로 정부에서 수집한 강제 동원 수기, 사진, 박물류 등을 전시하고 있다. 역사관은 유족을 위한 추도·기념시설로서는 물론, 일제 강제동원 역사교육 공간이자 지역 주민의 친환경적 휴식 공간의 역할을 수행하고자 한다. UN기념공원, UN평화기념관과 함께 UN평화문화특구로 지정되어 있어 평화와 인권의 역사를 기억하고 체험하는 역사 관광 명소로 거듭날 것이다.</div>
              <button class="edit_loc">수정</button>
            </li>
            <li><img src="images/3.jpg">
              <div class="box _name">전주</div>
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
	const searchInput = document.getElementById('searchInput');
	const listItems = document.querySelectorAll('#usa .list-unstyled.Mloc li');

    searchInput.addEventListener('input', function() {
      	const searchText = searchInput.value.trim();

      	listItems.forEach(function(li) {
        	const box1Text = li.querySelector('#name').textContent;
        	const shouldShow = box1Text.includes(searchText)
        	li.style.display = shouldShow ? 'flex' : 'none';
      	});
    });
    
    
    $('#cat_select').on('change',function(){
		var text = $(this).val().trim().toLowerCase();
		$('._category').each(function(){
            var shouldShow = $(this).text().includes(text);
            $(this).parent().css('display', shouldShow?'flex':'none');
        })
	})

    $('#loc_select').change(function(){
        var selectVal = $(this).val();
        console.log(selectVal)
        $.ajax({
          	url: '',
          	method: 'POST',
          	data: {val:selectVal}
        });
    });

    $('.box').on('dblclick', function() {
    	var this_= $(this);
    	this_.css('overflow','inherit')
	  	const divElement = $(this);
	  	const originalText = divElement.text();
	  	const inputElement = $('<textarea>', {
	  		class: 'editInput form-control',
	  		rows: "5",
	    	/* value: originalText */
    	});

  		inputElement.on('blur', function() {
    		const newText = $(this).val().trim();
    		divElement.text(newText);
    		this_.css('overflow','hidden');
  		});

  		divElement.empty().append(inputElement);
  		$('.editInput').append(originalText);
	  	inputElement.focus();
	});

  	$('.box').change('change', function(){
    	$(this).siblings("button").css('display','block')
  	});
  	
  
    $('.edit_loc').click(function(event){
    	var this_ = $(this);
    	var emptyBox = false;
    	$('.box').each(function() {
   		  	if ($(this).text().trim() === '') {
   		    	console.log('빈 문자열이 포함된 .box 요소가 있습니다.');
   		    	emptyBox = true;
   		    	return false;
   		  	}
   		}); 
    	if(emptyBox){
    		event.preventDefault();
    		event.stopPropagation();
    		return false;
    	}
    	else{
    		var parentLi = this_.closest('li');
	  		var name = parentLi.find('.box._name').text();
	  		var category = parentLi.find('.box._category').text();
	  		var detail = parentLi.find('.box._detail').text();
	  		$.ajax({
	  			url: '',
	  			method: 'POST',
	  			data:{
	  				name: name,
	  				category: category,
	  				detail: detail
	  			}
	  		}).done(function(){
	  			this_.css('display','block');
	  		})
    	}
  		
    });
</script>
</html>