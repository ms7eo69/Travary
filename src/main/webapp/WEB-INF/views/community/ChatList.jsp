<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/templates/Header.jsp" />
<div class="container" style="margin-top: 50px">
	<div class="jumbotron" style="background-color: rgb(200, 20, 20);">
		<h1>
			오픈 채팅방 <small>여러분의 의견을 나눠보세요</small>
		</h1>
	</div>
	<!--jumbotron-->
	<div class="text-right mb-2">
		<a href="<c:url value="${chatRoomUrl}"/>" class="btn btn-danger">오픈 채팅방 생성</a>
	</div>
	<table class="table table-dark table-hover text-center">
		<thead>
			<tr>
				<th class="col-1">번호</th>
				<th>제목</th>
				<th class="col-4">작성자</th>

				<th class="col-1">인원수</th>
				<th class="col-1"></th>
				<th class="col-2">등록일</th>
			</tr>
		</thead>
		<tbody class="table-sm down-file-body">
			<!-- 이전 코드 생략 -->

			<c:if test="${empty records }" var="isEmpty">
				<tr>
					<td colspan="6">오픈 채팅방이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not isEmpty }">
				<c:forEach var="record" items="${records}" varStatus="loop">
					<tr>
						<td>${record.no}</td>
						<td class="text-left"><a
							href="<a href="/chat/enterChatRoom?roomId=${record.roomId}"><c:out value='${param.nowPage}' default='1'/>">${record.title}</a></td>
						<td>${record.id}</td>
						<td class="text-left"></td>
						<td id="down-count${loop.count}">${record.hitcount}</td>
						<td>${record.postdate}</td>
					</tr>
				</c:forEach>
			</c:if>

			<!-- 이하 생략 -->

		</tbody>
	</table>
	<!-- 페이징 출력 -->
	${paging}
</div>
<!--container-->
<jsp:include page="/WEB-INF/views/templates/Footer.jsp" />
<script>
	var tbody = document.querySelector('.down-file-body');
	tbody.onclick = function(e) {
		if (e.target.nodeName === 'A') {
			//a태그의 클래스명에서 끝에 숫자 추출
			var className = e.target.className;
			var numbering = className.substring('down-file'.length,
					className.length);
			console.log('넘버링 숫자:', numbering);
			//아이디로 다운수가 있는  td요소 얻기
			var td = tbody.querySelector('#down-count' + numbering);
			//다운수 읽어오기(숫자로 변환)
			var downCount = parseInt(td.textContent);
			//1을 더해서 다시 설정
			td.textContent = downCount + 1;
		}

	};
</script>
