<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/templates/Header.jsp" %>
    <div class="container" style="margin-top:50px">
        <div class="jumbotron bg-dark">
            <h1>회원가입</h1>            
        </div><!--jumbotron-->
        <form action='<c:url value="/member/Register"/>' method="post">
			<div class="form-group">
				<label><kbd class="lead">아이디</kbd></label> 
				<input type="text" class="form-control" name="id" placeholder="아이디를 입력하세요">
			</div>
			<div class="form-group">
				<label><kbd class="lead">비밀번호</kbd></label> 
				<input type="password" class="form-control" name="pwd" placeholder="비밀번호를 입력하세요">
			</div>
			<div class="form-group">
				<label><kbd class="lead">비밀번호 확인</kbd></label> 
				<input type="password" class="form-control" name="pwd2"	placeholder="비밀번호 다시한번 입력하세요">
			</div>
			<div class="form-group">
				<label><kbd class="lead">닉네임</kbd></label> 
				<input type="text" class="form-control" name="nickname" placeholder="닉네임을 입력하세요">
			</div>
			<div class="form-group">
				<label><kbd class="lead">성별</kbd></label>
				<div class="d-flex">
					<div class="custom-control custom-radio mr-2">
						<input type="radio" class="custom-control-input" name="gender" value="남자" id="male"> 
						<label for="male" class="custom-control-label">남자</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" class="custom-control-input" name="gender" value="여자" id="female"> 
						<label for="female"	class="custom-control-label">여자</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label><kbd class="lead">연령대</kbd></label><br>
				<!--  -->
				<select name="age_group">
					<option value="">연령대를 선택하세요</option>
					<option value="10대">10 ~ 19</option>
					<option value="20대">20 ~ 29</option>
					<option value="30대">30 ~ 39</option>
					<option value="40대">40 ~ 49</option>
					<option value="50대">50 ~ 59</option>
					<option value="60대">60 ~ 69</option>
					<option value="70대 이상">70 ~ </option>
				</select> 
				<!--  
				<input type="text" class="form-control" name="age_group" placeholder="연령대를 입력하세요">
				-->
			</div>
			<div class="form-group" style="width:50%">
			    <label><kbd class="lead">전화번호</kbd></label> 
			    <div class="form-row">
			      <div class="col"><input type="text" class="form-control" name="phone1"></div>-
			      <div class="col"><input type="text" class="form-control" name="phone2"></div>-
			      <div class="col"><input type="text" class="form-control" name="phone3"></div>
			    </div>
			</div>
			<button type="submit" class="btn btn-primary">확인</button>
		</form>            
    </div><!--container-->
<%@ include file="/WEB-INF/views/templates/Footer.jsp" %>
