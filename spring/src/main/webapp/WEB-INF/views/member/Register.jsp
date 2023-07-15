<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/templates/Header.jsp" %>
    <div class="container" style="margin-top:50px">
        <div class="jumbotron bg-dark">
            <h1>회원가입</h1>            
        </div><!--jumbotron-->
        <form action='<c:url value="/member/Register"/>' method="post">
        	<c:if test="${not empty apiLoginMap.id}">
	        	<input type="hidden" name="id" value="${apiLoginMap.id}">
	        </c:if>
	        <c:if test="${not empty apiLoginMap.pwd}">
	        	<input type="hidden" name="pwd" value="${apiLoginMap.pwd}">
	        </c:if>
	        <c:if test="${not empty apiLoginMap.gender}">
	        	<input type="hidden" name="gender" value="${apiLoginMap.gender}">
	        </c:if>
	        <c:if test="${not empty apiLoginMap.age_group}">
	        	<input type="hidden" name="age_group" value="${apiLoginMap.age_group}">
	        </c:if>
			<c:if test="${not empty apiLoginMap.profile_link}">
	        	<input type="hidden" name="profile_link" value="${apiLoginMap.profile_link}">
	        </c:if>
        	<c:if test="${empty apiLoginMap.id}">
				<div class="form-group">
					<label><kbd class="lead">아이디</kbd></label> 
					<input type="text" class="form-control" name="id" placeholder="아이디를 입력하세요" value='${apiLoginMap.id }'>
				</div>
			</c:if>
			<c:if test="${empty apiLoginMap.pwd }">
				<div class="form-group">
					<label><kbd class="lead">비밀번호</kbd></label> 
					<input type="password" class="form-control" name="pwd" placeholder="비밀번호를 입력하세요" value='${apiLoginMap.pwd}'>
				</div>
			</c:if>
			<c:if test="${empty apiLoginMap.pwd }">
				<div class="form-group">
					<label><kbd class="lead">비밀번호 확인</kbd></label> 
					<input type="password" class="form-control" name="pwd2"	placeholder="비밀번호 다시한번 입력하세요" value='${apiLoginMap.pwd}'>
				</div>
			</c:if>
			<div class="form-group">
				<label><kbd class="lead">닉네임</kbd></label> 
				<input type="text" class="form-control" name="nickname" placeholder="닉네임을 입력하세요" >
			</div>
			<c:if test="${empty apiLoginMap.gender }">
				<div class="form-group">
					<label><kbd class="lead">성별</kbd></label>
					<div class="d-flex">
						<div class="custom-control custom-radio mr-2">
							<input type="radio" class="custom-control-input" name="gender" value="남자" id="male" <c:if test="${apiLoginMap.gender == '남자'}">checked</c:if>>
							<label for="male" class="custom-control-label" >남자</label>
						</div>
	
	
						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input" name="gender" value="여자" id="female" <c:if test="${apiLoginMap.gender == '여자'}">checked</c:if>>
							<label for="female"	class="custom-control-label">여자</label>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${empty apiLoginMap.age_group }">
				<div class="form-group">
					<label><kbd class="lead">연령대</kbd></label><br>
					<!--  -->
					<select name="age_group">
					    <option value="">연령대를 선택하세요</option>
					    <option value="10대" ${apiLoginMap.age_group == '10대' ? 'selected' : ''}>10 ~ 19</option>
					    <option value="20대" ${apiLoginMap.age_group == '20대' ? 'selected' : ''}>20 ~ 29</option>
					    <option value="30대" ${apiLoginMap.age_group == '30대' ? 'selected' : ''}>30 ~ 39</option>
					    <option value="40대" ${apiLoginMap.age_group == '40대' ? 'selected' : ''}>40 ~ 49</option>
					    <option value="50대" ${apiLoginMap.age_group == '50대' ? 'selected' : ''}>50 ~ 59</option>
					    <option value="60대" ${apiLoginMap.age_group == '60대' ? 'selected' : ''}>60 ~ 69</option>
					    <option value="70대 이상" ${apiLoginMap.age_group == '70대 이상' ? 'selected' : ''}>70 ~</option>
					</select>
					<!--  
					<input type="text" class="form-control" name="age_group" placeholder="연령대를 입력하세요">
					-->
				</div>
			</c:if>
			<div class="form-group" style="width:50%">
			    <label><kbd class="lead">전화번호</kbd></label> 
			    <div class="form-row">
			      <div class="col"><input type="text" class="form-control" name="phone1"></div>-
			      <div class="col"><input type="text" class="form-control" name="phone2"></div>-
			      <div class="col"><input type="text" class="form-control" name="phone3"></div>
			      <div class="col"><input  class="signin_pass" type="button" value="입력" id="phoneChk"></div>
			      <div class="col"><input  class="signin_pass" id="phone2" type="text" title="전화번호 입력" placeholder="인증번호 입력해주세요"></div>
	   			  <div class="col"><input  class="signin_pass" type="button" value="인증확인" id="phoneChk2"></div>
			    </div>
			</div>
			<button type="submit" class="btn btn-primary">확인</button>
		</form>            
    </div><!--container-->
<%@ include file="/WEB-INF/views/templates/Footer.jsp" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
//휴대폰 번호 인증
  $(function(){
    var code2 = "";
    $("#phoneChk").click(function(){
        alert('인증번호가 전송 되었습니다.\n휴대폰에서 인증번호를 확인해주세요');
        var phone = $("input[name='phone1']").val()+$("input[name='phone2']").val()+$("input[name='phone3']").val();
        console.log(phone);
        $.ajax({
            type: "POST",
            url: "/travary/member/sendSMS1.do",
            data: {phoneNumber: phone},
            cache: false,
            success: function(data){
                if(data == "error"){
                    alert("휴대폰 번호가 올바르지 않습니다.");
                } else {
                    alert("휴대폰 전송 완료");
                    code2 = data;
                }
            }
        });
    });

    // 인증번호 일치 여부
    $("#phoneChk2").click(function(){
        if($("#phone2").val() == code2){
            alert('인증성공');
            //인증 성공시 슬라이스 넘어가는 거 able로 그 전까진 disable
        } else {
            alert('인증실패');
        }
    });
  });
</script>