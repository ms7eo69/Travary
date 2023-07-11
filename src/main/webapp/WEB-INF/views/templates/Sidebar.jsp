<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<nav class="main-menu position-fixed shadow">
        <div class="outerDiv">
            <div class="innerDiv">               
                <div id="nav-body ">
                    <div class="menu-style">
                        <ul class="navfont">                                
                            <li>
                                <a href="<c:url value="/"/>">
                                    <i class="fa fa-sharp fa-solid fa-house-chimney-window"></i>
                                    <span class="nav-text">홈</span>
                                </a>
                            </li>
                            <li>
                                 <a href="<c:url value="/"/>">
                                    <i class="fa fa-sharp fa-solid fa-magnifying-glass"></i>
                                    <span class="nav-text">검색</span>
                                </a>
                            </li>
                            <li>
                                 <a href="<c:url value="/"/>">
                                    <i class="fa fa-sharp fa-regular fa-compass"></i>
                                    <span class="nav-text">탐색</span>                        
                                </a>
                            </li>
                            <li>
                                 <a href="<c:url value="/"/>">
                                    <i class="fa fa-solid fa-circle-play"></i>
                                    <span class="nav-text">릴스</span>
                                </a>
                            </li>
                            <li>
                                 <a href="<c:url value="/"/>">
                                    <i class="fa fa-sharp fa-solid fa-paper-plane"></i>
                                    <span class="nav-text">메시지</span>
                                </a>
                            </li>
                            <li>
                                 <a href="<c:url value="/"/>">
                                    <i class="fa fa-sharp fa-regular fa-heart"></i>
                                    <span class="nav-text">알림</span>
                                </a>
                            </li>
                            <li>
                                 <a href="<c:url value="/"/>">
                                    <i class="fa fa-regular fa-square-plus"></i>
                                    <span class="nav-text">만들기</span>
                                </a>
                            </li>
                            <li>
                                 <a href="<c:url value="/"/>">
                                    <i class="fa fa-solid fa-circle-user"><img class="rounded-circle" src=""></i>
                                    <span class="nav-text">프로필</span>
                                </a>
                            </li>
                            <li>
                                <a href="<c:url value="/plan/Route.do"/>">
                                    <i class="fa fa-solid fa-circle-user"><img class="rounded-circle" src=""></i>
                                    <span class="nav-text">경로</span>
                                </a>
                            </li>
                            <li>
                                <a href="<c:url value="/Community.do"/>">
                                    <i class="fa fa-solid fa-circle-user"><img class="rounded-circle" src=""></i>
                                    <span class="nav-text">커뮤니티</span>
                                </a>
                            </li>
                        </ul>
                    </div>   
                </div>
                <div class="settings2"></div>
                <div id="nav-footer">
                    <div class="dropup">
                        <a href="" class="dropdown-toggle dropdown-toggle-no-caret" data-toggle="dropdown">
                            <i class="fa fa-solid fa-bars" ></i>더 보기${validate }
                        </a> 
                        <div class="dropdown-menu">
                            <a class="dropdown-item" data-toggle="modal" data-target="#loginModal" 
                            >로그인</a>
                            <a class="dropdown-item" href='<c:url value="/member/Register"/>'>회원가입</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>