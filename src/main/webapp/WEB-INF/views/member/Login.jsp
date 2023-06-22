<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<div class='container' style="margin-top: 50px">
	<div class='jumbotron bg-info'>
		<h1>Spring Framework<small>로그인</small></h1>
	</div>
	<!--jumbotron-->
	<!-- 아이디와 비번 불일치시 -->
	<c:if test="${! empty NotMember }" >
		<div class="alert alert-success alert-dismissible fade show">
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong>Failure!</strong> ${requestScope.NotMember}
		</div>
	</c:if>
	<!--  로그인 전 -->
	<c:if test="${ empty sessionScope.id }" var="isLogin">
		<form class="form-inline"
			action="/kosmo/member/LoginProcess.do"
			method="post">				
			<label>아이디</label> <input type="text" name="id"
				class="form-control mx-2" /> <label>비밀번호</label> <input
				type="password" name="pwd" class="form-control mx-2" /> <input
				type="submit" class="btn btn-danger mx-2" value="로그인" />
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
<!--container-->
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>