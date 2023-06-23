<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<style>
.wrap {
	width: 490px;
	padding: 40px 20px 20px 20px;
	background-color: #f5f6f7;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border-radius: 30px;
	box-sizing: border-box;
}

.title {
	margin: 0 auto;
	width: 240px;
	height: 44px;
	text-align: center;
	font-size: 25px;
	background-repeat: no-repeat;
	background-position: 0 0;
	background-size: 240px auto;
	margin-bottom: 20px;
}

.kakao {
	margin-top: 15px;
	height: 60px;
	border: solid 1px #FEE500;
	background: #FEE500;
	color: #3c1d1e;
	font-size: 18px;
	box-sizing: border-box;
	border-radius: 5px;
	cursor: pointer;
	width: 450px;
	display: flex;
}

.kakao_i {
	width: 40px;
	height: 100%;
	background-size: 90%;
	background-position: 50%;
	margin: 0 20px;
}

.kakao_txt {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 16px;
	padding-right: 60px;
}

a {
	text-decoration: none;
}
</style>
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
				type="submit" class="btn btn-danger mx-2" value="로그인" />
			<div id="naver_id_login"></div>
			<a class="kakao"
				href="https://kauth.kakao.com/oauth/authorize?client_id=ce24a312ecf7ce42435f8de5f549dd5b&redirect_uri=http://localhost:7070/member/kakaoLogin&response_type=code">
				<!-- REST_API키 및 REDIRECT_URI는 본인걸로 수정하세요 -->
				<div class="kakao_i"></div>
				<div class="kakao_txt">카카오톡으로 간편로그인</div>
			</a>
			<a href="https://accounts.google.com/o/oauth2/auth?client_id=971116911703-f7afs5url9crbvhm5lsc0l0fpn3toens.apps.googleusercontent.com&redirect_uri=http://localhost:7070/member/MyPage.do&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile">
				<img src="${pageContext.request.contextPath}/images/G_Logo.png" style="width: 50px; height: 50px;"/>
			</a>
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
</div>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
    var naver_id_login = new naver_id_login("GsYVpg82aBYC9e00ww1B", "http://localhost:7070/member/MyPage.do");
    var state = naver_id_login.getUniqState();
    naver_id_login.setButton("white", 2,40);
    naver_id_login.setDomain("MD3o8KGeb3");
    naver_id_login.setState(state);
    naver_id_login.init_naver_id_login();
</script>
<!--container-->
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>