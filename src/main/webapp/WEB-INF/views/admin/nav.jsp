<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar bg-dark v_nav sticky-top">
   <ul class="navbar-nav">
     <li class="nav-item tab">
       <a class="nav-link" href="<c:url value='/Admin_user.do'/>">회원관련</a>
       <ul class="subtab">
         <li><a href="<c:url value='/Admin_user_All.do'/>">회원정보 관리</a></li>
       </ul>
     </li>
     <li class="nav-item tab">
       <a class="nav-link" href="#">여행관련</a>
       <ul class="subtab">
         <li><a href="<c:url value='/Admin_loc.do'/>">간이 통계</a></li>
         <li><a href="<c:url value='/Admin_loc_All.do'/>">여행지 통계</a></li>
         <li><a href="<c:url value='/Admin_loc_edit.do'/>">관광지</a></li>
       </ul>
     </li>
     <li class="nav-item tab">
     	<a class="nav-link" href="<c:url value='/Admin_anno_List.do'/>">공지사항</a>
     </li>
     <li><a href="<c:url value='/admin/loc_boundary.do'/>">바운더리 설정</a></li>
      </ul>
    </li>
   </ul>
 </nav>
