<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>      
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
        
    <title>Document</title>
</head>
<body>
    <nav class="main-menu position-fixed">
        <div class="outerDiv">
            <div class="innerDiv">
                <div id="nav-header">
                    <div class="logo">
                        <a href="#"><img src="resources/images/logo/logo.png" class="nav-logo"></a>
                    </div>         
                    <div class="settings"></div>       
                </div>
                <div id="nav-body">
                    <div class="menu-style">
                        <ul>                                
                            <li>
                                <a href="#">
                                    <i class="fa fa-sharp fa-solid fa-house-chimney-window"></i>
                                    <span class="nav-text">홈</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-sharp fa-solid fa-magnifying-glass"></i>
                                    <span class="nav-text">검색</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-sharp fa-regular fa-compass"></i>
                                    <span class="nav-text">탐색</span>                        
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-solid fa-circle-play"></i>
                                    <span class="nav-text">릴스</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-sharp fa-solid fa-paper-plane"></i>
                                    <span class="nav-text">메시지</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-sharp fa-regular fa-heart"></i>
                                    <span class="nav-text">알림</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-regular fa-square-plus"></i>
                                    <span class="nav-text">만들기</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-solid fa-circle-user"><img class="rounded-circle" src=""></i>
                                    <span class="nav-text">프로필</span>
                                </a>
                            </li>
                        </ul>
                    </div>   
                </div>
                <div class="settings2"></div>
                <div id="nav-footer">
                    <div class="dropup">
                        <a href="" class="dropdown-toggle dropdown-toggle-no-caret" data-toggle="dropdown">
                            <i class="fa fa-solid fa-bars" ></i>더 보기
                        </a> 
                        <div class="dropdown-menu">
                            <a class="dropdown-item" data-toggle="modal" data-target="#loginModal" href="#">로그인</a>
                            <a class="dropdown-item" href="../member/regist/regi.html">회원가입</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>   
</body>
</html>

