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
		<h1>공지사항 작성</h1>
	</div>
	<!--jumbotron-->
	<c:if test="${! empty InputError}">
		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>Failure!</strong> ${InputError}
		</div>
	</c:if>
	
	<form method="post" action="<c:url value="/board/Admin/anno/Write"/>">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="form-group">
			<label><kbd class="lead">제목</kbd></label> 
			<input type="text" class="form-control" placeholder="제목을 입력하세요" name="title">
		</div>
		<div class="form-group">
			<label><kbd class="lead">내용</kbd></label>
			<textarea class="form-control" rows="10" name="content"></textarea>
		</div>
		<button type="submit" class="btn btn-primary">등록</button>
	</form>


</div>
<!--container-->
