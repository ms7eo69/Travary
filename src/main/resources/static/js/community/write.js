/*모달열기 */
document.querySelector('.PublishButton').addEventListener('click', function() {
  openWriteModal();
});

function openWriteModal() {
  document.querySelector('.sw1').style.display = 'flex';
  document.querySelector('.bo1').style.display = 'block';
  document.querySelector('.bo2').style.display = 'none';

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
  document.querySelectorAll('.sw2 input').forEach(function(){
	  this.textContent=""
  })	
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
  document.querySelector('.bo2').style.display = 'none'; // bo2 모달 숨김
}

document.querySelector('.btn-yes').addEventListener('click', function() {
  closeAlertModal();
  closeWriteModal();
  // 게시글 작성 취소 로직 추가
});

document.querySelector('.btn-no').addEventListener('click', function() {
  closeAlertModal();
});



