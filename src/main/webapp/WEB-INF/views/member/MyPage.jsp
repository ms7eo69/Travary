<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
    <div
	class="container d-flex flex-column justify-content-center align-items-center">
        <div class="jumbotron" style="">
			<h1>환영합니다</h1>
			<div id="naver_id_login"></div>
        </div><!--jumbotron-->
    </div><!--container-->
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
var naver_id_login = new naver_id_login("GsYVpg82aBYC9e00ww1B", "http://localhost:7070/callback");
naver_id_login.get_naver_userprofile("naverSignInCallback()");

function naverSignInCallback() {
    var email = naver_id_login.getProfileData('email');
    console.log(email);
    var nickname = naver_id_login.getProfileData('nickname');
    var ageRange = naver_id_login.getProfileData('age');
    var uniqueId = naver_id_login.getProfileData('id');
    var gender = naver_id_login.getProfileData('gender');
    var birthday = naver_id_login.getProfileData('birthday');

    $.ajax({
        url: '/member/MyPage.do',
        data: {
            email: email,
            nickname: nickname,
            ageRange: ageRange,
            uniqueId: uniqueId,
            gender: gender,
            birthday: birthday
        },
        success: function(response) {
            console.log(response);
            // 여기서 서버로부터 받은 응답을 처리할 수 있습니다.
        },
        error: function(xhr, status, error) {
            console.log(error);
            // 에러 처리를 수행할 수 있습니다.
        }
    });
}


</script>