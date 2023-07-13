<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href='<c:url value="/css/admin/nav.css" />'>
<nav class="navbar bg-dark v_nav sticky-top">
  <ul class="navbar-nav">
    <li class="nav-item tab">
      <a class="nav-link maintab" href="#user">회원관련</a>
    </li>
    <li class="nav-item user sub"><a href="<c:url value='/Admin/user/Index.do'/>">회원관련</a></li>
    <li class="nav-item user sub"><a href="<c:url value='/Admin/user/All.do'/>">회원정보 관리</a></li>
    <li class="nav-item tab">
      <a class="nav-link maintab" href="#loc">여행관련</a>
    </li>
    <li class="nav-item loc sub"><a href="<c:url value='/Admin/loc/Index.do'/>">간이 통계</a></li>
    <li class="nav-item loc sub"><a href="<c:url value='/Admin/loc/All.do'/>">여행지 통계</a></li>
    <li class="nav-item loc sub"><a href="<c:url value='/Admin/loc/Edit.do'/>">관광지</a></li>
    <li class="nav-item tab">
      <a class="nav-link" href="<c:url value='/Admin/anno/List.do'/>">공지사항</a>
    </li>
    <li class="nav-item tab">
      <a class="nav-link" href="<c:url value='/Admin/qna/List.do'/>">자주묻는질문</a>
    </li>
    <li><a href="<c:url value='/Admin/loc/Boundary.do'/>">바운더리 설정</a></li>
  </ul>
</nav>
<script src='<c:url value="/js/admin/nav.js"/>'></script>
