<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/templates/Header.jsp"></jsp:include>
<div class='container' style="margin-top: 50px">
	<div class='jumbotron bg-info'>
		<h1>Spring Framework<small>전체 목록 페이지</small></h1>
	</div>
	<!--jumbotron-->
	<div class="text-right mb-2">
		<a href="<c:url value="/onememo/bbs/Write.do"/>" class="btn btn-danger">글등록</a>
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
			
				<tr>
					<td colspan="4">등록된 글이 없습니다.</td>
				</tr>
			
				
					<tr>
						<td>1</td>
						<td class="text-left"><a
							href="#">제목입니다</a> <span class="badge badge-light">56</span></td>
						<td>김길동</td>						
						<td>2023-12-12</td>
					</tr>
				
		</tbody>
	</table>
	<!-- 페이징 출력 -->
	<div>1 2 3 4 5 6  7 8 9</div>
	<!-- 검색 UI -->
	<form class="form-inline justify-content-center" method="post">
       <select class="form-control" name="searchColumn">
	    <option value="title">제목</option>
	    <option value="content">내용</option>
	    <option value="name">작성자</option>	   
	  </select>
      <input type="text" class="form-control mx-2 my-2" placeholder="검색어를 입력하세요" name="searchWord"/>
      <button type="submit" class="btn btn-primary">검색</button>
    </form>
</div>
<!--container-->
<jsp:include page="/WEB-INF/views/templates/Footer.jsp"></jsp:include>