<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container" style="margin-top: 50px">
	<div class="jumbotron bg-info">
		<h1>
			수정 페이지
		</h1>
	</div>
	<!--jumbotron-->
	<c:if test="${! empty InputError}">
		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>Failure!</strong> ${InputError}
		</div>
	</c:if>
	
	<form method="post" action="<c:url value="/onememo/bbs/Edit.do"/>">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="no" value="${empty record.no ? param.no :record.no}" />
		<div class="form-group">
			<label><kbd class="lead">제목</kbd></label> <input type="text"
				value="${record.title}${param.title}" class="form-control" placeholder="제목을 입력하세요"
				name="title">
		</div>
		<div class="form-group">
			<label><kbd class="lead">내용</kbd></label>
			<textarea class="form-control" rows="10" name="content">${record.content}${param.content}</textarea>
		</div>
		<button type="submit" class="btn btn-primary">수정</button>
	</form>


</div>
<!--container-->
