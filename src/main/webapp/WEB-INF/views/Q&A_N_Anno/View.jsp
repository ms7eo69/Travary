<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="container" style="margin-top: 50px">
	<div class="jumbotron bg-info">
		<h1>
			공지 사항
		</h1>
	</div>
	<c:if test="${! empty FAILURE}">
		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="close" data-dismiss="alert">×</button>
			<strong>Failure!</strong> ${FAILURE }
		</div>
	</c:if>
	
	<table class="table table-bordered">
		<tbody class="table-sm">
			<tr>
				<th class="w-25 bg-dark text-white text-center">번호</th>
				<td>${record.no}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">글쓴이</th>
				<td>${record.name}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">작성일</th>
				<td>${record.postDate}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">제목</th>
				<td>${record.title}</td>
			</tr>
			<tr>
				<th class="bg-dark text-white text-center" colspan="2">내 용</th>
			</tr>
			<tr>
				<td colspan="2">${record.content}</td>
			</tr>
		</tbody>
	</table>
	<!-- 수정/삭제/목록 컨트롤 버튼 -->
	<div class="text-center">

		<c:if test="${sessionScope.id ==record.id }" var="isWriter">
			<a href="<c:url value="/onememo/bbs/Edit.do?no=${record.no}"/>"	class="btn btn-success">수정</a> 
			<a href="javascript:isDelete()" class="btn btn-success">삭제</a>
		</c:if>


		<a href="<c:url value="/onememo/bbs/List.do"/>"
			class="btn btn-success">목록</a>
	</div>
	<!-- 한줄 코멘트 입력/수정 폼 -->
</div>
<!--container-->

