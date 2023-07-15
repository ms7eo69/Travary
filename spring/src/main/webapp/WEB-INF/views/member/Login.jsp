<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<fmt:bundle basename="api.properties" var="bundle" />
<script>
	//카카오
	function handleKakaoLogin() {
		const Rest_api_key = ${bundle.KAKAO-LOGIN-ID}; // REST API KEY
		const redirect_uri = ${bundle.KAKAO-LOGIN-URI}; // Redirect URI
		const kakaoURL = "https://kauth.kakao.com/oauth/authorize?client_id="
				+Rest_api_key
				+"&redirect_uri="
				+redirect_uri;
		window.location.href = kakaoURL;
	}
	//네이버
	function handleNaverLogin() {
		const Rest_api_key = ${bundle.NAVER-LOGIN-ID}; // REST API KEY
		const redirect_uri = ${bundle.NAVER-LOGIN-URI}; // Redirect URI
		const naverAuthUrl = 'https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id='
				+ Rest_api_key
				+ '&redirect_uri='
				+ encodeURIComponent(redirect_uri);
		window.location.href = naverAuthUrl;
	}

	//구글
	function handleGoogleLogin() {
		const client_id = ${bundle.GOOGLE-LOGIN-ID}; // Client ID
		const redirect_uri = ${bundle.GOOGLE-LOGIN-ID}; // Redirect URI
		const googleURL = "https://accounts.google.com/o/oauth2/v2/auth?client_id="
				+ client_id
				+ "&response_type=code&scope=openid%20email%20profile&redirect_uri="
				+ encodeURIComponent(redirect_uri)
				+ "&access_type=offline"
				+ "&prompt=consent"; // 추가된 부분
		window.location.href = googleURL;
	}
</script>
<div class='container' style="margin-top: 50px">
	<div class='jumbotron bg-info'>
		<h1>
			Spring Framework<small>로그인</small>
		</h1>
	</div>
	<!--jumbotron-->
	<!-- 아이디와 비번 불일치시 -->
	<c:if test="${! empty NotMember }">
		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>Failure!</strong> ${requestScope.NotMember}
		</div>
	</c:if>
	<!--  로그인 전 -->
	<c:if test="${ empty sessionScope.id }" var="isLogin">
		<form class="form-inline"
			action="<c:url value="/member/LoginProcess.do"/>" method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <label>아이디</label> <input type="text"
				name="id" class="form-control mx-2" /> <label>비밀번호</label> <input
				type="password" name="pwd" class="form-control mx-2" /> <input
				type="submit" class="btn btn-danger mx-2" value="로그인" /> <img
				onclick="handleKakaoLogin()" src="images/kakao_login.png"
				style="width: 190px; cursor: pointer" /> <img
				onclick="handleNaverLogin()" src="images/naver_login.png"
				style="width: 190px; cursor: pointer" /> <img
				onclick="handleGoogleLogin()" src="images/google_login.png"
				style="width: 190px; cursor: pointer" />
</div>
</form>
</c:if>
<c:if test="${! isLogin }">
	<!-- 로그인 후 -->
	<div class="alert alert-success">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<strong>Success!</strong> ${sessionScope.id}님 즐감하세요!
	</div>
</c:if>
	<div class="input_text">
	    <input  class="signin_pass" id="phoneNumber" type="text" name="phoneNumber" title="전화번호 입력" placeholder="전화번호 입력해주세요">
	    <input  class="signin_pass" type="button" value="입력" id="phoneChk">
	    <input  class="signin_pass" id="phone2" type="text" name="phone" title="전화번호 입력" placeholder="인증번호 입력해주세요">
	    <input  class="signin_pass" type="button" value="인증확인" id="phoneChk2">
  	</div>
  	
  	<a href="<c:url value="/travary/chat/createOpenChat.do"/>">
  		<input class="open_chat" type="button" value="오픈 채팅방 개설" id="openchat"></input>
  	</a>
</div>
  
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
//휴대폰 번호 인증
  $(function(){
    var code2 = "";
    $("#phoneChk").click(function(){
        alert('인증번호가 전송 되었습니다.\n휴대폰에서 인증번호를 확인해주세요');
        var phone = $("#phoneNumber").val();
        console.log(phone);
        $.ajax({
            type: "POST",
            url: "/travary/member/sendSMS1.do",
            data: {phoneNumber: phone},
            cache: false,
            success: function(data){
                if(data == "error"){
                    alert("휴대폰 번호가 올바르지 않습니다.");
                } else {
                    alert("휴대폰 전송 완료");
                    code2 = data;
                }
            }
        });
    });

    // 인증번호 일치 여부
    $("#phoneChk2").click(function(){
        if($("#phone2").val() == code2){
            alert('인증성공');
            //인증 성공시 슬라이스 넘어가는 거 able로 그 전까진 disable
        } else {
            alert('인증실패');
        }
    });
  });
</script>
<!--container-->
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>