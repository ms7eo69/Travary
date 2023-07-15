$(function(){
	index=1;
	$('.next').on('click', function() {
	    if(index < 3){
	        if(index == 1)
	            $('.form'+index).css('transform', 'translate(-600vw)');
	        else
	            $('.form'+index).css('transform', 'translate(-600vw)');
	        index++;
	        $('.form'+index).css('transform', 'translate(-300vw)');
	    }
	});	
});
