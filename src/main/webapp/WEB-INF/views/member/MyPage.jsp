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
        },
        error: function(xhr, status, error) {
            console.log(error);
        }
    });
}



</script>
<script>
var xhr = new XMLHttpRequest();
xhr.open("POST", "https://www.googleapis.com/oauth2/v4/token");
xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
var googleCode = new URL(window.location.href).searchParams.get("code");

if (googleCode != null) {
  var data = "code=" + googleCode +
    "&client_id=971116911703-f7afs5url9crbvhm5lsc0l0fpn3toens.apps.googleusercontent.com" +
    "&client_secret=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" +
    "&redirect_uri=http://localhost:7070/member/MyPage.do" +
    "&grant_type=authorization_code";

  xhr.onreadystatechange = function() {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      if (xhr.status === 200) {
        var response = JSON.parse(xhr.responseText);
        var accessToken = response.access_token;
        console.log("Access Token:", accessToken);

        // 사용자 정보 요청
        var userInfoXhr = new XMLHttpRequest();
        userInfoXhr.open("GET", "https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + accessToken);

        userInfoXhr.onreadystatechange = function() {
          if (userInfoXhr.readyState === XMLHttpRequest.DONE) {
            if (userInfoXhr.status === 200) {
              var userInfo = JSON.parse(userInfoXhr.responseText);
              console.log("User Info:");
              console.log("Name:", userInfo.name);
              console.log("Email:", userInfo.email);
              console.log("Profile Picture:", userInfo.picture);
              // 추가적인 사용자 정보를 출력하거나 활용할 수 있습니다.
            } else {
              console.log("Error:", userInfoXhr.status);
            }
          }
        };

        userInfoXhr.send();
      } else {
        console.log("Error:", xhr.status);
      }
    }
  };

  xhr.send(data);
}





</script>