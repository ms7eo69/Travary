  var nowtab =false;
  var opensub = false;
  $(document).on('click', function(event) {//외부 클릭하면 지역선택장 없애기
    if(opensub){
        nowtab = $(event.target).closest('.maintab').length > 0;
      if (!nowtab) {
        $('.sub').css('display', 'none');
        opensub=false;
      }
    }
  });
  $('.maintab').on('click',function(){
    $('.sub').css('display','none');  
    var cls = '.'+$(this).prop('href').split('#')[1]
    $(cls).css('display','block');
    opensub = true;
  });