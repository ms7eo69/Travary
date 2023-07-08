/*모달열기 */
document.querySelector('.PublishButton').addEventListener('click', function() {
  openWriteModal();
});

function openWriteModal() {
  document.querySelector('.snsWrite').style.display = 'flex';
  document.querySelector('.bgOverlay').style.display = 'block';

  // snsWrite 외부 클릭 이벤트 리스너 추가
  document.querySelector('.bgOverlay').addEventListener('click', function() {
    openAlertModal();
  });

  // snsWrite 내부 클릭 이벤트 리스너 추가
  document.querySelector('.snsWrite').addEventListener('click', function(event) {
    event.stopPropagation(); // 이벤트 전파 중단
  });
}

function closeWriteModal() {
  document.querySelector('.snsWrite').style.display = 'none';
  document.querySelector('.bgOverlay').style.display = 'none';
}

function openAlertModal() {
  document.querySelector('.alert-modal').style.display = 'block';
}

function closeAlertModal() {
  document.querySelector('.alert-modal').style.display = 'none';
}

function cancelPost() {
  closeAlertModal();
  closeWriteModal();
  // 게시글 작성 취소 로직 추가
}

document.querySelector('.btn-yes').addEventListener('click', function() {
  closeAlertModal();
  closeWriteModal();
  // 게시글 작성 취소 로직 추가
});

document.querySelector('.btn-no').addEventListener('click', function() {
  closeAlertModal();
});


//사진 선택하기 
function openFileUploader() {
  document.querySelector('#fileInput').click();
}

document.querySelector('#fileInput').addEventListener('change', function() {
  var imagePreview = document.querySelector('#imagePreview');
  imagePreview.innerHTML = ''; // 이미지 미리보기 초기화

  var files = this.files;
  for (var i = 0; i < files.length; i++) {
    var file = files[i];
    var reader = new FileReader();

    reader.onload = function(e) {
      var img = document.createElement('img');
      img.src = e.target.result;
      img.classList.add('preview-image');
      imagePreview.appendChild(img);
    }

    reader.readAsDataURL(file);
  }
});