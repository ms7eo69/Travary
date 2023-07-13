/**
 * 게시글 상세보기 모달
 */
function openModal() {
  var modal = document.getElementById("myModal");
  modal.style.display = "flex";
}

function closeModal() {
  var modal = document.getElementById("myModal");
  modal.style.display = "none";
}

var div = document.querySelector(".viewbox");
div.addEventListener("click", openModal);

var modal = document.getElementById("myModal");
modal.addEventListener("click", function(event) {
  if (event.target === modal) {
    closeModal();
  }
});
