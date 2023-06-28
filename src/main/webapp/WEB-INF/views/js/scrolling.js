function loadData(){
        $.ajax({
          url:'<c:url value=" 경로 넣어주세요! "',
          // method:'post',
          dataType:'json',
          // data:{'page':page}
        }).done(function(data){
          
        })
      }
      var page=1;
      var index=0;
      var content = $('.scroll_add').clone();
      $(window).scroll(function() {
        // console.log($(window).scrollTop(),$(document).height() - $(window).height());
        if ( 100 > $(document).height() - $(window).height() - $(window).scrollTop()) {
          console.log('간닷!');

          // loadData()//ajax 함수 호출!
          
          // var src = '../images/'+(index++)+'.jpg';
          for(var i=0;i<content.find('img').length;i++)
            content.find('img:eq('+i+')').prop('src','../images/'+(index+i)+'.jpg');
          // content.find('img:eq(1)').prop('src','../images/2.jpg');
          // content.find('img:eq(2)').prop('src','../images/3.jpg');
          // content.find('img:eq(3)').prop('src','../images/4.jpg');
          $(".scroll_add").append(content.html());
          page++;
          index++;
          console.log(index);
        }
      });
