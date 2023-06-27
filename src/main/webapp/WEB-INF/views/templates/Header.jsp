<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset='utf-8'> 
	<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css'>
	<script src='https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js'></script>
	<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
	<script src='https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js'></script>
	<script src="https://kit.fontawesome.com/e7dcffe0a0.js" crossorigin="anonymous"></script>
	<title>TemplateApplyingModule.jsp</title>
	<style>
		.jumbotron{
			padding-top: 1rem;
			padding-bottom: 1rem;
			margin-bottom: .5rem;
			
			border-top-left-radius:0;
			border-top-right-radius:0;
		}
	</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top" >
		<!-- 텍스트 로고 -->
		<a href="<c:url value="/"/>" class="navbar-brand">Logo</a>
		<!-- Toggler/Collapsible Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<c:if test="${ empty sessionScope.id }" var="isLogin">
					<li class="nav-item">
					  <a class="nav-link active" href="<c:url value= "/kosmo/member/Login.do"/>">로그인</a>
					</li>
					<li class="nav-item">
					  <a class="nav-link active" href="<c:url value= "/kosmo/member/Register.do"/>">회원가입</a>
					</li>
				</c:if>
				<c:if test="${!isLogin }">
					<li class="nav-item">
					  <a class="nav-link active" href="<c:url value= "/member/Logout.do"/>">로그아웃</a>
					</li>
				</c:if>
				<li class="nav-item">
				  <a class="nav-link" href="#">마이페이지</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link" href="<c:url value= "/board/List.do"/>">게시판</a>
				</li>
			</ul>
		</div>
	</nav>