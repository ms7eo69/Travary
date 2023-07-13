/*모달열기 */
document.querySelector('.PublishButton').addEventListener('click', function() {
  openWriteModal();
});

function openWriteModal() {
  document.querySelector('.snsWrite').style.display = 'flex';
  document.querySelector('.pickCourse').style.display = 'block';

  // snsWrite 외부 클릭 이벤트 리스너 추가
  document.querySelector('.pickCourse').addEventListener('click', function() {
    openAlertModal();
  });

  // snsWrite 내부 클릭 이벤트 리스너 추가
  document.querySelector('.snsWrite').addEventListener('click', function(event) {
    event.stopPropagation(); // 이벤트 전파 중단
  });
}

//close 모달
  function closeWriteModal() {
	document.querySelector('.writeForms').style.display = 'none';
    document.querySelector('.pickCourse').style.display = 'none';
  }

  function openAlertModal() {
    document.querySelector('.alert-modal').style.display = 'block';
  }

  function closeAlertModal() {
    document.querySelector('.alert-modal').style.display = 'none';
  }

  function cancelPost() {
    closeAlertModal();
  }

  function stopPropagation(event) {
    event.stopPropagation();
  }
  
document.querySelectorAll('.courses').forEach(function(course) {
  course.addEventListener('click', function() {
    document.querySelector('.writeForms').style.display = 'block';
  });
});


// 파일 선택 시 미리보기 함수
function previewImages(event) {
  var imagePreviews = document.querySelector('.imagePreviews');
  imagePreviews.innerHTML = '';

  var files = event.target.files;
  for (var i = 0; i < files.length; i++) {
    var reader = new FileReader();
    reader.onload = function (e) {
      var imagePreview = document.createElement('div');
      imagePreview.classList.add('imagePreview');
      imagePreview.innerHTML = '<img src="' + e.target.result + '" alt="미리보기">';
      imagePreviews.appendChild(imagePreview);
    };
    reader.readAsDataURL(files[i]);
  }
}

// uploadPic div를 클릭했을 때 파일 선택 input을 트리거하는 함수
function openFileUpload() {
  document.getElementById('imageUpload').click();
}

// uploadPic div 클릭 시 파일 선택 input 트리거
document.querySelector('.uploadPic').addEventListener('click', openFileUpload);



function collapse(element) {
    var before = document.getElementsByClassName("active")[0]               // 기존에 활성화된 버튼
    if (before && document.getElementsByClassName("active")[0] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
        before.nextElementSibling.style.maxHeight = null;   // 기존에 펼쳐진 내용 접고
        before.classList.remove("active");                  // 버튼 비활성화
    }
    element.classList.toggle("active");         // 활성화 여부 toggle

    var content = element.nextElementSibling;
    if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
        content.style.maxHeight = null;         // 접기
    } else {
        content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
    }
}
        
        
