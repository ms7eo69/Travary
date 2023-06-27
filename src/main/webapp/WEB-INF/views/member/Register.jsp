<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/templates/Header.jsp" %>
    <div class="container" style="margin-top:50px">
        <div class="jumbotron bg-dark">
            <h1>회원가입</h1>            
        </div><!--jumbotron-->
        <form action="RegisterController.kosmo" method="post">
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
						<input type="radio" class="custom-control-input" name="gender" value="man" id="male"> 
						<label for="male" class="custom-control-label">남자</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" class="custom-control-input" name="gender" value="woman" id="female"> 
						<label for="female"	class="custom-control-label">여자</label>
					</div>
				</div>
				<div class="form-group">
					<label><kbd class="lead">생년월일</kbd></label> 
					<input type="text" class="form-control" name="birth" placeholder="생년월일 입력하세요">
				</div>
				<div class="form-group">
					<label><kbd class="lead">전화번호</kbd></label> 
					<input type="text" class="form-control" name="phone" placeholder="전화번호를 입력하세요">
				</div>
			</div>
			<button type="submit" class="btn btn-primary">확인</button>
		</form>            
    </div><!--container-->
<%@ include file="/WEB-INF/views/templates/Footer.jsp" %>
