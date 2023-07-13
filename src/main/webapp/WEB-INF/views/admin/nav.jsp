<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Caprasimo&family=Lexend+Peta:wght@700&family=Montserrat:wght@700&family=Noto+Sans+KR:wght@700&family=Noto+Serif+Makasar&family=Signika+Negative:wght@600&display=swap" rel="stylesheet">
<link rel="stylesheet" href='<c:url value="/css/admin/nav.css" />'>
<nav class="navbar bg-dark v_nav sticky-top">
  
  <ul class="navbar-nav">
  <div class="logo">
    <a href="<c:url value='/'/>" class="logo-font">TRAVARY</a>
  </div>
    <li class="nav-item tab">
      <a class="nav-link maintab" href="#user">회원관련</a>
    </li>
    <li class="nav-item user sub"><a href="<c:url value='/admin/user/Index.do'/>">회원관련</a></li>
    <li class="nav-item user sub"><a href="<c:url value='/admin/user/All.do'/>">회원정보 관리</a></li>
    <li class="nav-item tab">
      <a class="nav-link maintab" href="#loc">여행관련</a>
    </li>
    <li class="nav-item loc sub"><a href="<c:url value='/admin/loc/Index.do'/>">간이 통계</a></li>
    <li class="nav-item loc sub"><a href="<c:url value='/admin/loc/All.do'/>">여행지 통계</a></li>
    <li class="nav-item loc sub"><a href="<c:url value='/admin/loc/Edit.do'/>">관광지</a></li>
    <li class="nav-item tab">
      <a class="nav-link" href="<c:url value='/admin/anno/List.do'/>">공지사항</a>
    </li>
    <li class="nav-item tab">
      <a class="nav-link" href="<c:url value='/admin/qna/List.do'/>">자주묻는질문</a>
    </li>
    <li><a href="<c:url value='/admin/loc/Boundary.do'/>">바운더리 설정</a></li>
  </ul>
</nav>
<script src='<c:url value="/js/admin/nav.js"/>'></script>
