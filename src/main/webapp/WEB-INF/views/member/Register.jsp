<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<c:url value="/css/register/Register.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/css/register/Telephone.css"/>"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="<c:url value="/js/register/Register.js"/>"></script>
    <title>Register.jsp</title>
</head>
<body>
<div class="main">
        <div class="sub">
            <div class="top"></div>
            <form action="" method="post" class="regi mid">
                <div class="row">
                    <div class="form1 slide col-12">
                        <div class="inputFormDiv">
                            <button type="button" class="duplicBtn">중복체크</button>
                            <input placeholder="아이디를 입력하세요" maxlength="20" class="insId" name="id">
                            <img src="https://assets.triple.guide/images/btn-search-close@3x.png" class="formClose">                           
                        </div>                        
                        <div class="inputFormDiv">
                            <input placeholder="비밀번호를 입력하세요" maxlength="20" class="insPwd" name="pwd">
                            <img src="https://assets.triple.guide/images/btn-search-close@3x.png" class="formClose">
                        </div>
                        <div class="inputFormDiv">
                            <input placeholder="비밀번호 확인을 입력하세요" maxlength="20" class="insPwd2" name="pwd2">
                            <img src="https://assets.triple.guide/images/btn-search-close@3x.png" class="formClose">                            
                        </div>                        
                        <label class="errorMSG">기호는 사용할 수 없습니다. 다른 닉네임을 입력하세요.</label>
                        <button type="button" class="inputBtn nickBtn next">확인</button>
                    </div>                                    
                    <div class="form2 slide _2_ col-12">                        
                        <div class="inputFormDiv">
                            <input placeholder="성별을 선택하세요" class="insGend" name="gender" disabled>
                            <div class="dropdown">
                                <img src="https://assets.triple.guide/images/img-trip-arrow@3x.png" style="height: 14px;margin: 2px 0 0 10px;"
                                class="plusGend dropdown-toggle" data-toggle="dropdown">
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item male" href="#">남자</a>                                    
                                    <a class="dropdown-item female" href="#">여자</a>
                                </div>
                            </div>
                        </div>                        
                        <label class="errorMSG">기호는 사용할 수 없습니다. 다른 닉네임을 입력하세요.</label>
                        <div class="formInDiv3" style="margin-top: 40px;">
                            <div style="float: left;margin-right: 10px;" class="telCode">
                                <label class="codeLabel1">국가코드</label>
                                <div class="codeDiv">
                                    <button type="button" class="codeB nationB formB">+82</button>
                                    <img src="https://assets.triple.guide/images/img-trip-arrow@3x.png" alt style="height: 14px;margin: 2px 0 0 10px;">
                                </div>
                                <label class="codeLabel2"></label>
                            </div>
                            <div style="position: fixed; top: 1px; left: 1px; width: 1px;
                            height: 0px; padding: 0px; margin: -1px; overflow: hidden;
                            clip: rect(0px, 0px, 0px, 0px); white-space: nowrap;
                            border-width: 0px; display: none;"></div>
                            <div class="telCode">
                                <label class="codeLabel1">휴대폰 번호</label>
                                <div class="codeDiv">
                                    <input type="tel" placeholder="-빼고 숫자만 입력" name="phoneNumber"
                                    title="전화번호 입력" class="signin_pass" id="phoneNumber">
                                    <button disabled color="blue" type="button" class="codeB authB telB formB2 " id="phoneChk">
                                        인증하기
                                    </button>
                                </div>
                                <label for="telLabel"></label>
                            </div>
                            <div class="errorDiv">
                                <div size="13" color="gray500" class="helpDiv">문자가 전송되지 않는 경우</div>
                                <img src="https://triple.guide/auth-web/images/ico_priceinfo@3x.png" alt="도움말">
                            </div>
                        </div>
                        <div style="margin-top: 16px;" class="telCode">
                            <label class="codeLabel1">인증번호</label>
                            <div class="codeDiv">
                                <input type="tel" maxlength="6" placeholder="숫자 6자리,인증 번호 입력" name="phone"
                                title="전화번호 입력" class="signin_pass" id="phone2">
                                <div size="14" color="blue" class="authDiv"></div>
                            </div>
                            <label for="codeLabel2"></label>
                        </div>
                        <button disabled type="button" class="submB compleB formB3" id="phoneChk2">
                            인증완료
                        </button>
                        <button type="button" class="inputBtn2 nickBtn next">확인</button>
                    </div>                
                    <div class="form3 slide _3_ col-12">
                        <div class="inputFormDiv">
                            <input placeholder="생년월일을 입력하세요(예시:970925)" maxlength="6" class="insBir" name="birthday">
                            <img src="https://assets.triple.guide/images/btn-search-close@3x.png" class="formClose">
                        </div>
                        <div class="inputFormDiv">
                            <button type="button" class="duplicBtn">중복체크</button>
                            <input placeholder="닉네임을 입력하세요" maxlength="20" class="insNick" name="nickname">
                            <img src="https://assets.triple.guide/images/btn-search-close@3x.png" class="formClose">
                        </div>
                        <label class="errorMSG">기호는 사용할 수 없습니다. 다른 닉네임을 입력하세요.</label>
                        <button type="button" class="inputBtn3 nickBtn">확인</button>
                    </div> 
                </div>               
            </form>
        </div>
    </div> 
</body>
</html>