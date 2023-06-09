<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset='utf-8'>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css'>
<script src='https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js'></script>
<script src="https://kit.fontawesome.com/e7dcffe0a0.js" crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
		<!-- 텍스트 로고 -->
		<a href="<c:url value="/"/>" class="navbar-brand">Logo</a>
		<!-- Toggler/Collapsible Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse justify-content-end"
			id="collapsibleNavbar">
			<ul class="navbar-nav">
				<c:if test="${ empty sessionScope.id }" var="isLogin">
					<li class="nav-item"><a class="nav-link active"
						href="<c:url value= "/member/Login.do"/>">로그인</a></li>
				</c:if>
				<c:if test="${!isLogin }">
					<li class="nav-item"><a class="nav-link active"
						href="<c:url value= "/member/Logout.do"/>">로그아웃</a></li>
				</c:if>
				<li class="nav-item"><a class="nav-link" href="/member/MyPage.do">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link" href='<c:url value="/plan/MultipleMarker.do"/>'>MultipleMarker</a></li>
				<li class="nav-item"><a class="nav-link" href='<c:url value="/plan/Direction.do"/>'>길찾기</a></li>
				<li class="nav-item"><a class="nav-link" href="/plan/Geo.do">Geocode</a></li>
				<li class="nav-item"><a class="nav-link" href='<c:url value="/plan/SearchTrend.do"/>'>SearchTrend</a></li>
				<li class="nav-item"><a class="nav-link" href="/plan/PlanTemplate.jsp">플랜</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="/plan/PlanTemplate.jsp" id="navbardrop"
					data-toggle="dropdown"> 지도</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/plan/PlanTrackExam.jsp">Track</a>
						<a class="dropdown-item" href="/plan/PlanPanToBound.jsp">PanToBound</a>
						<a class="dropdown-item" href="/plan/PlanTemplate2.jsp">예제</a>
						<a class="dropdown-item" href="/plan/PlanTrackExam.jsp">경로연습</a>
					</div></li>
					
				<li class="nav-item"><a class="nav-link"
					href="<c:url value= "/board/List.do"/>">게시판</a></li>
			</ul>
		</div>
	</nav>