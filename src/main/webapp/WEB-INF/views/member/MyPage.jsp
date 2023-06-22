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
    var naver_id_login = new naver_id_login("GsYVpg82aBYC9e00ww1B", "http://localhost:7070/member/MyPage.do");
    // 접근 토큰 값 출력
    alert(naver_id_login.oauthParams.access_token);
    // 네이버 사용자 프로필 조회
    naver_id_login.get_naver_userprofile("naverSignInCallback()");

    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
    function naverSignInCallback() {
        console.log(naver_id_login.getProfileData('email'));
        console.log(naver_id_login.getProfileData('nickname'));
        console.log(naver_id_login.getProfileData('age'));
        console.log(naver_id_login.getProfileData('id'));
        console.log(naver_id_login.getProfileData('birthday'));
        console.log(naver_id_login.getProfileData('gender'));
    }
 	// AJAX 요청 보내기
    $.ajax({
        url: '/member/MyPage.do',
        data: {
            email: naver_id_login.getProfileData('email'),
            nickname: naver_id_login.getProfileData('nickname'),
            ageRange: naver_id_login.getProfileData('age'),
            uniqueId: naver_id_login.getProfileData('id'),
            gender: naver_id_login.getProfileData('gender'),
            birthday: naver_id_login.getProfileData('birthday')
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

</script>