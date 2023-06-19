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
<script type="text/javascript">	
	var naver_id_login = new naver_id_login("GsYVpg82aBYC9e00ww1B", "http://localhost:7070/member/MyPage.do");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	//naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>
<script type="text/javascript">
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		// naver_id_login.getProfileData('프로필항목명');
		// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
		console.log(naver_id_login.getProfileData('email'));
		console.log(naver_id_login.getProfileData('nickname'));
		console.log(naver_id_login.getProfileData('age'));
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
		alert(naver_id_login.getProfileData('age'));
	}


	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	//https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=GsYVpg82aBYC9e00ww1B&client_secret=MD3o8KGeb3&access_token=AAAAO9HNcPqrmqK_tQQQjNjNbucv2MyAZ7XIFhcNDksRDDbaI1lVig_i0cpsKWkR4QgmW6CZd_yVyxCF7CQB8uSHS6k&service_provider=NAVER
</script>