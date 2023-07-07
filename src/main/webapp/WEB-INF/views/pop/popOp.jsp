<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
    function popSelectAll(source) {
      var allPop = document.querySelectorAll('input[type="checkbox"]');
      for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = source.checked;
      }
    }
  </script>

<body>
	<form action="#">
		<table>
			<tr>
				<td>이름(구분용)</td>
				<td>내가 준 점수(드롭다운)</td>
				<td>인기도(출력용)</td>
			</tr>
			<tr>
				<td></td>
				<td>
				<label for="lang">인기도</label><select name="popall" id="popall">
						<option value="five">5</option>
						<option value="four">4</option>
						<option value="three">3</option>
						<option value="two">2</option>
						<option value="one">1</option>
				</select>
				</td>
				<td></td>
			</tr>
			<c:forEach var="i" begin="0" end="10">
				<tr>
					<td>${ name }</td>
					<td>
						
							<label for="lang">인기도</label>
							<select name="pop${i}" id="pop${i}">
									<option value="five">5</option>
									<option value="four">4</option>
									<option value="three">3</option>
									<option value="two">2</option>
									<option value="one">1</option>
							</select>
					</td>
					<td>${ pop }</td>
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td></td>
				<td><input type="submit" value="submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>