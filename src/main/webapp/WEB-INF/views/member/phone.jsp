<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
 <script>
$(function(){
//휴대폰 번호 인증var code2 = "";
$("#phoneChk").click(function(){
    alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
    var phone = $("#phoneNumber").val();
    $.ajax({
        type:"POST", // post 형식으로 발송
        url:"/shop/member/sendSMS1.do", // controller 위치
        data: {phoneNumber:phone}, // 전송할 ㅔ이터값
        cache : false,
        success:function(data){
            if(data == "error"){ //실패시
                alert("휴대폰 번호가 올바르지 않습니다.")
            }else{            //성공시
                alert("휴대폰 전송이  됨.")
                code2 = data; // 성공하면 데이터저장
            }
        }
    });
});
//휴대폰 인증번호 대조
  $("#phoneChk2").click(function(){
      if($("#phone2").val() == code2){ // 위에서 저장한값을 ㅣ교함
           alert('인증성공')
      }else{
          alert('인증실패')
      }
  });
 </script>
  <div class="input_text">
           <input  class="signin_pass" id="phoneNumber" type="text" name="phoneNumber" title="전화번호 입력" placeholder="전화번호 입력해주세요">
            <input  class="signin_pass" type="button" value="입력" id="phoneChk"> // phoneChk 클릭시 함수 발동
            <input  class="signin_pass" id="phone2" type="text" name="phone" title="전화번호 입력" placeholder="인증번호 입력해주세요">
            <input  class="signin_pass" type="button" value="인증확인" id="phoneChk2"> // phoneChk 클릭시 함수 발동
  </div>
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>
