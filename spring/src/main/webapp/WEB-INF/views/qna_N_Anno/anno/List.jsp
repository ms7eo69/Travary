<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/0b4621b427.js" crossorigin="anonymous"></script>
<title></title>
<jsp:include page="/WEB-INF/views/admin/nav.jsp"></jsp:include>
<div class="container" style="margin-top: 50px">
	<div class="jumbotron bg-info">
		<h1>공지사항 <small>공지사항 전파를 위한 게시판입니다.</small></h1>
	</div>
	<!--jumbotron-->
	<div class="text-right mb-2">
		<a href="<c:url value="/admin/anno/Write.do"/>" class="btn btn-danger">글등록</a>
	</div>
	<table class="table table-dark table-hover text-center">
            <thead>
                <tr>
                    <th class="col-1">번호</th>
                    <th>제목</th>
                    <th class="col-2">글쓴이</th>
                    <th class="col-2">작성일</th>
                </tr>
            </thead>
            <tbody class="table-sm down-file-body">
			    <c:if test="${empty records}" var="result">
			        <tr>
			            <td colspan="4">등록된 글이 없습니다.</td>
			        </tr>
			    </c:if>
			    <c:if test="${! result}">
			        <c:forEach var="record" items="${records}">
			            <tr>
			                <td>${record.POSTNO}</td>
			                <td>${record.TITLE}</td>
			                <td>${record.NICKNAME}</td>
			                <td>${record.POSTDATE}</td>
			            </tr>
			        </c:forEach>
			    </c:if>
			</tbody>
        </table>
	<!-- 페이징 출력 -->
	<div>${listPagingData.pagingString}</div>
	<!-- 검색 UI -->
	<form class="form-inline justify-content-center" method="post">
		<select class="form-control" name="searchColumn">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="name">작성자</option>
		</select> <input type="text" class="form-control mx-2 my-2"
			placeholder="검색어를 입력하세요" name="searchWord" />
		<button type="submit" class="btn btn-primary">검색</button>
	</form>
</div>
<!--container-->