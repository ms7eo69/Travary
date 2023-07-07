<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='ko'>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!--Font & Icon-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;800&display=swap" rel="stylesheet"/>
	<script src="https://kit.fontawesome.com/79655749c6.js" crossorigin="anonymous"></script> 
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Caprasimo&family=Lexend+Peta:wght@700&family=Montserrat:wght@700&family=Noto+Sans+KR:wght@700&family=Noto+Serif+Makasar&family=Signika+Negative:wght@600&display=swap" rel="stylesheet">
    <!-- Bootstrap-->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

    <!--date picker-->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"/>
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css"/>
    <!--page css-->
    <link rel="stylesheet" href="<c:url value="css/nav/navigationbar.css"/>"/>
    <link rel="stylesheet" href="<c:url value="css/index/main.css"/>"/>
    <!-- Optional JavaScript -->
    <script src="<c:url value="js/index/scrolling.js"/>" defer></script>
    <title>Travary</title>
  <style>
    .nav-text{
      font-family: Verdana, Geneva, Tahoma, sans-serif !important;
      font-weight: 500 !important;
    }
  </style>
  </head>
  <body>  
  <!---------------------------------------------네비게이션바 시작------------------------------------------- -->
    <div class="container-fluid " style="height: 100vh">
     <nav class="main-menu position-fixed shadow ">
        <div class="outerDiv ">
            <div class="innerDiv">
               <div id="nav-header">
                    <div class="logo">
                        <a href="<c:url value='/'/>" class="logo-font">TRAVARY</a>
                    </div>         
                    <div class="settings"></div>       
                </div>
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
                                <a href="<c:url value="/Route.do"/>">
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
     <!---------------------------------------------네비게이션바 끝------------------------------------------- -->  
      <!-------------------------------------------- 배경 이미지------------------------------------------- -->  
	
      <section class="section section-top section-full">
        <!-- Cover -->
        <div class="bg-cover" style="background-image:url('<c:url value='/images/landing/landing4.jpg'/>')"></div>


        <!-- Overlay -->
        <div class="bg-overlay"></div>

        <!-- Triangles -->
        <div class="bg-triangle bg-triangle-light bg-triangle-bottom bg-triangle-left"></div>
        <div class="bg-triangle bg-triangle-light bg-triangle-bottom bg-triangle-right"></div>

        <!-- Content -->
	        <div class="container">
	          <div class="row justify-content-center align-items-center">
	            <div class="col-md-8 col-lg-7"></div>
	          </div>
	          <!-- / .row -->
	        </div>
        <!-- / .container -->
      </section>
      <!--------------------------------------------------------------검색창--------------------------------------------------------------->
      <div class="container">
        <div class="row">
          <div class="col-md-7 ">
            <div class="card ">
              <div class="card-body">
                <h1 class="h3 mb-4">
                  Travary와 함께 </br>특별한 여행을 만들어보세요
                </h1>
                <form action='<c:url value="/Plan.do"/>'>
                  <div class="form-group">
                    <div class="row px-3 ">
                      <label class="mb-0" for="locationInput mb-0 mt-5">목적지</label>
                      <!-- <input type="text" class="form-control w-100 br0" id="locationInput" aria-describedby="locationInputHelp" placeholder="Anywhere"/> -->
                      <select class="form-control" id="sel" name="lregion">
                        <option>지역을 선택하세요</option>
                          <c:forEach items="${lregionList }" var="lregion">
                            <option>${lregion}</option>
                          </c:forEach>
                      </select>
                      <small id="locationInputHelp" class="form-text text-muted sr-only">떠나고 싶은 여행지를 검색해주세요!</small>
                    </div>
                  </div>
                  <div class="row px-3 ">
                    <div class="col-sm-6 px-0"> 여행 가는날 
                    	<input class="br0" id="startDate" />
                    </div>
                    <div class="col-sm-6 px-0 br0">돌아오는 날 
                    	<input class="br0" id="endDate" />
                    </div>
                  </div>
                  <div class="row px-3">
                    <div class="col-sm px-0 br0">
                      <div class="form-group">
                        <label class="mb-0 mt-3" for="exampleFormControlSelect1">몇 명이서 함께하나요?</label>
                        <select class="form-control" id="exampleFormControlSelect1">
                          <option selected>함께할 인원을 선택해주세요</option>
                          <option>1</option>
                          <option>2</option>
                          <option>3</option>
                          <option>4</option>
                          <option>5</option>
                          <option>6</option>
                          <option>7</option>
                          <option>8</option>
                          <option>9</option>
                          <option>10</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <button type="submit" class="btn btn-danger btn-block btn-lg">AI 여행 계획 생성</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<!----------------------------------------------------------------여행지 추천 섹션------------------------------------------------------------------>
    <div class="container-fluid container py-3 mt-5">
      <h2 class="h3">많이 찾는 여행지를 추천해드릴게요</h2>
      <div class="row mt-4">
        <div class="col-md-3">
          <div class="card mb-3 border-0 shadow ">
          <div class="card-img-wrap">
            <img src="<c:url value="/images/best-theme/busan.jpg"/> " class="card-img-top rounded rc-card" alt="..."/>
            </div>
            <div class="card-body">
              <h5 class="card-title mb-0">부산</h5>
              <p class="card-text text-info"> &#9733; &#9733; &#9733; &#9733; &#9733;</p>
              <p class="card-text">
                <small class="text-muted">Last updated 3 mins ago</small>
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card mb-3 border-0 shadow ">
          <div class="card-img-wrap">
            <img src="<c:url value='/images/best-theme/seoul.jpg'/>" class="card-img-top rounded rc-card" alt="..."/>
           	</div>
            <div class="card-body">
              <h5 class="card-title mb-0">서울</h5>
              <p class="card-text text-info"> &#9733; &#9733; &#9733; &#9733; &#9733;</p>
              <p class="card-text">
                <small class="text-muted">Last updated 3 mins ago</small>
              </p>
            </div>
          </div>
        </div>
        <div class=" col-md-3">
            <div class="card mb-3 border-0 shadow ">
            <div class="card-img-wrap">
              <img src="<c:url value='/images/best-theme/suwon.jpg'/>" class="card-img-top rounded rc-card" alt="..."/>
              </div>
              <div class="card-body">
                <h5 class="card-title mb-0">수원</h5>
                <p class="card-text text-info">&#9733; &#9733; &#9733; &#9733; &#9733;</p>
                <p class="card-text">
                  <small class="text-muted">Last updated 3 mins ago</small>
                </p>
              </div>
            </div>
          </div>
        <div class="col-md-3">
          <div class="card mb-3 border-0 shadow ">
          <div class="card-img-wrap">
            <img src="<c:url value='/images/best-theme/jeju3.jpg'/> " class="card-img-top rounded rc-card" alt="..."/>
            </div>
            <div class="card-body">
              <h5 class="card-title mb-0">제주</h5>
              <p class="card-text text-info">&#9733; &#9733; &#9733; &#9733; &#9733;</p>
              <p class="card-text">
                <small class="text-muted">Last updated 3 mins ago</small>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!----------------------------------------------------------------테마 추천 섹션------------------------------------------------------------------>
    <div class="container-fluid container py-3 mt-5 mb-5">
    <h2 class="h3">특별한 주제로 여행을 선택해보세요</h2>
    <div class="row mt-4">
      <div class="col-md-3">
          <div class="card mb-3 border-0 shadow ">
          <div class="card-img-wrap">
            <img src="<c:url value='/images/best-theme/midnightseoul.jpg'/>" class="card-img-top rounded" alt="..."/>
            </div>
            <div class="card-body">
              <h5 class="card-title mb-0">미드나잇 IN 한강</h5>
              <p class="card-text text-info">&#9733; &#9733; &#9733; &#9733; &#9733;</p>
              <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card mb-3 border-0 shadow ">
          <div class="card-img-wrap">
            <img src="<c:url value='/images/best-theme/yangyang.jpg'/>" class="card-img-top rounded" alt="..."/>
           </div>
            <div class="card-body">
              <h5 class="card-title mb-0">서핑 IN 양양</h5>
              <p class="card-text text-info"> &#9733; &#9733; &#9733; &#9733; &#9733;
              </p>
              <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card mb-3 border-0 shadow ">
          <div class="card-img-wrap">
              <img src="<c:url value='/images/best-theme/yeosu.jpg'/>" class="card-img-top rounded" alt="..."/>
             </div>
              <div class="card-body">
                <h5 class="card-title mb-0">여수 밤바다</h5>
                <p class="card-text text-info">&#9733; &#9733; &#9733; &#9733; &#9733;</p>
                <p class="card-text">
                  <small class="text-muted">Last updated 3 mins ago</small>
                </p>
              </div>
            </div>
          </div>
        <div class="col-md-3">
          <div class="card mb-3 border-0 shadow ">
          <div class="card-img-wrap">
            <img src="<c:url value='/images/best-theme/terarosa.jpg'/>" class="card-img-top rounded" alt="..."/>
            </div>
            <div class="card-body">
              <h5 class="card-title mb-0">강릉 커피 여행</h5>
              <p class="card-text text-info">&#9733; &#9733; &#9733; &#9733; &#9733;</p>
              <p class="card-text">
                <small class="text-muted">Last updated 3 mins ago</small>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!----------------------------------------------------------------SNS 섹션------------------------------------------------------------------>
    <div class="container-fluid container py-3 mt-4">
      <h2 class="h3 mb-4">Travary와 함께한 경험을 공유해보세요</h2>
	  <div class="row scroll_add"><!-------------------------- 무한 스크롤 적용버전----------------------------------- -->  
	    <div class="row"><!-------------------------- row start----------------------------------- -->
			<div class="col-md-4 ">
		    	<div class="card shadow mb-3">
		    	<div class="card-img-wrap">
		        	<img src="<c:url value='/images/sns.body/card_body1.jpg'/>" class="card-img-top rounded snsCard"/>
		            </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">영도 가볼만한 곳 여행 코스<h5>
		            	<p class="card-text posting-content">#핵심 포인트: 송도해수욕장 동쪽의 송림공원에서 서쪽 암남공원을 오가는 케이블카 입니다. 송도의 풍경 보기 위해서는 케이블카를 타는 것을 추천해요.</p>
	                    <div class="d-flex align-items-center">
	                   		<img src="<c:url value='/images/profile/yunakim.jpg'/> " class="profileImageSm ml-0 mr-2 ">
	                        <div class="userId">Yuna</div>
	                    </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-4">
		    	<div class="card shadow mb-3">
		    	<div class="card-img-wrap">
		        	<img src="<c:url value='/images/sns.body/sgp.jpg'/>" class="card-img-top rounded snsCard"/>
		              </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">인생사진 남기러 서귀포 가자!<h5>
		            	<p class="card-text posting-content">#올레길 5코스에 해당하는 산책로를 따라 걷다보면 자연이 만들어낸 한반도 모양의 포토스팟 발견! 여기서 팁하나 드리자면 사진 찍으실 때 밝기 조절을 해서 한반도 안에 서귀포 바다와 하늘이 만나는 수평선이 보이게 찍으면 인생샷 완.성.</p>
	                    <div class="d-flex align-items-center">
	                   		<img src="<c:url value='/images/profile/p1.jpg'/> " class="profileImageSm ml-0 mr-2 ">
	                        <div class="userId">Damee</div>
	                    </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-4">
		    	<div class="card shadow mb-3">
		    	<div class="card-img-wrap">
		        	<img src="<c:url value='/images/sns.body/busan.png'/> " class="card-img-top rounded snsCard"/>
		              </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">축제가 넘쳐나는 곳, 광안리 해수욕장<h5>
		            	<p class="card-text posting-content">부산의 1등 핫플을 고르라면?! 한 치의 망설임 없이 광안리라고 외치겠습니다. 365일 축제로 넘쳐나는 그 곳! 분기별로 색다른 행사들로 가득차고, 매주 토요일은 드론쇼 공연이 펼쳐진답니다! 계절별과 날씨별로 드론쇼 일정이 상이할 수 있으니, 방문전 검색은 필수!</p>
	                    <div class="d-flex align-items-center">
	                   		<img src="<c:url value='/images/profile/p2.jpg'/>" class="profileImageSm ml-0 mr-2 ">
	                        <div class="userId">Jinsoo</div>
	                    </div>
		            </div>
		        </div>
		    </div>
	    </div><!-------------------------- row end----------------------------------- -->
	       <div class="row"><!-------------------------- row start----------------------------------- -->
			<div class="col-md-4">
		    	<div class="card shadow mb-3">
		    	<div class="card-img-wrap">
		        	<img src="<c:url value='/images/sns.body/incheon.jpg'/> " class="card-img-top rounded snsCard"/>
		              </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">뷰가 너무 예쁜 인천 영종도 선녀바위 해수욕장 ⛱️<h5>
		            	<p class="card-text posting-content">개인적으로 너무나 좋아하는 영종도 선녀바위 해수욕장이에요! 선녀바위와 기암들이 매우 멋있어서 외국인들도 많이 찾는 곳이에요. 탁 트인 바다뷰라 마치 동해안에 온 것처럼 느껴지는 곳이에요~ 뷰와 노을이 너무 예뻐서 가만히 앉아만 있어도 힐링 되는 곳입니다!</p>
	                    <div class="d-flex align-items-center">
	                   		<img src=" <c:url value='/images/profile/yunakim.jpg'/>" class="profileImageSm ml-0 mr-2 ">
	                        <div class="userId">stacy</div>
	                    </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-4">
		    	<div class="card shadow mb-3">
		    	<div class="card-img-wrap">
		        	<img src="<c:url value='/images/sns.body/ganghwa.jpg'/> " class="card-img-top rounded snsCard"/>
		             </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">나홀로 떠나본 인천 강화도 여행🤍<h5>
		            	<p class="card-text posting-content">#인천여행 드리우니 한옥 카페, 마니온 돈까스, 책방 시점, 금풍양조장(막걸리), 무해한어른(소품샵), 소니아소니아(수제 소품샵) 까지 알차게 즐기고 왔어요 ✌️✌️ 이번 여행 테마는 나를 위한 여행!</p>
	                    <div class="d-flex align-items-center">
	                   		<img src="<c:url value='/images/profile/yunakim.jpg'/>" class="profileImageSm ml-0 mr-2 ">
	                        <div class="userId">Daisy</div>
	                    </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-4">
		    	<div class="card shadow mb-3">
		    	<div class="card-img-wrap">
		        	<img src=" <c:url value='/images/sns.body/songdo.png'/> " class="card-img-top rounded snsCard"/>
		              </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">외국 아니구요.. 한국 맞습니다.. 이국적인 매력이 돋보이는 ’송도 센트럴파크‘<h5>
		            	<p class="card-text posting-content">한국에서 외국 감성을 느끼고 싶으신 분들 모두 송도 센트럴파크로 달려가세요! 아무 생각 없이 산책하기에도 너무 좋고, 사진 찍기에도 너무 좋은 곳입니다 (⸝⸝･ᴗ･⸝⸝)੭˒</p>
	                    <div class="d-flex align-items-center">
	                   		<img src="<c:url value='/images/profile/yunakim.jpg'/>" class="profileImageSm ml-0 mr-2 ">
	                        <div class="userId">핑구</div>
	                    </div>
		            </div>
		        </div>
		    </div>
	    </div><!-------------------------- row end----------------------------------- -->
	    <div class="row"><!-------------------------- row start----------------------------------- -->
			<div class="col-md-4">
		    	<div class="card shadow mb-3">
		    	<div class="card-img-wrap">
		        	<img src="<c:url value='/images/sns.body/sungsan.png'/> " class="card-img-top rounded snsCard"/>
		              </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">나만 알고 싶은 제주 여행 코스 BEST<h5>
		        		<p class="card-text posting-content">1. 성산일출봉 성산일출봉은 항상 하나의 작품처럼 멀리서 보기만 했는데 이번엔 정상까지 마음 먹고 다녀왔어요 ! 일출 시간대가 아니라 별 거 있겠나 싶은 마음이 컸는데 감탄이 절로 나오는 절경을 보고 왔답니다 🥹 왜 세계자연유산으로 등록되었는지 알겠는,, !! 짧지만 경사가 있는 코스이기 때문에 (대부분이 계단) 그만큼 풍경이 너무너무 아름다워요 !!!!!!</p>
		         		<div class="d-flex align-items-center">
		          			<img src="<c:url value='/images/profile/yunakim.jpg'/>" class="profileImageSm ml-0 mr-2 ">
		           		 	<div class="userId">Yujin</div>
		          		</div>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-4">
		    	<div class="card shadow mb-3">
		    	<div class="card-img-wrap">
		        	<img src="<c:url value='/images/sns.body/suwon1.png'/>" class="card-img-top rounded snsCard"/>
		             </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">수원 당일치기 카페 풀코스!<h5>
		          			<p class="card-text posting-content">수원 여행을 하면서 수원화성 바로 근처에 있어서 우리 문화재를 배경으로 사진을 촬영할 수 있다는 점이 너무 좋았어요. sns에서 핫한 만큼, 왜 핫한지 알 수 있겠더라구요 </p>
		          			<div class="d-flex align-items-center">
		          				<img src="<c:url value='/images/profile/yunakim.jpg'/>" class="profileImageSm ml-0 mr-2 ">
		           			 <div class="userId">수요미</div>
		          			</div>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-4">
		    	<div class="card shadow mb-3">
		    		<div class="card-img-wrap">
	           			 <img src="<c:url value='/images/sns.body/seoulsup.png'/>" class="card-img-top rounded snsCard"/>
	          		 </div>
	           		 <div class="card-body pb-1">
	             		<h5 class="card-title mb-2 posting-title">계절마다 다른 느낌의 도심 속 숲, 서울숲🌳<h5>
		          		<p class="card-text posting-content">#도시여행 여기는 서울숲이에요! 사계절 내내 피어있는 꽃이 다르고 개인 스냅, 웨딩 스냅을 찍는 분들도 계셨어요💍 주변에 음식점과 디저트 카페가 많았어요 저는 '백돈'이라는 곳에 다녀왔는데 진짜 맛있더라구요ㅠ🥺 언제 다녀와도 좋은 곳이에요🌳🔥</p>
		         		<div class="d-flex align-items-center">
		          			<img src="<c:url value='/images/profile/yunakim.jpg'/>" class="profileImageSm ml-0 mr-2 ">
		            	<div class="userId">ZenZen</div>
		          		</div>
		            </div>
		        </div>
		    </div>
	    </div><!-------------------------- row end----------------------------------- -->
	    <div class="row"><!-------------------------- row start----------------------------------- -->
			<div class="col-md-4">
		    	<div class="card shadow mb-3">
		    		<div class="card-img-wrap">
	           			 <img src="<c:url value='/images/sns.body/paju.png'/>" class="card-img-top rounded snsCard"/>
	           		 </div>
	           		 <div class="card-body">
		            	 <h5 class="card-title mb-2 posting-title">파주 당일치기 여행 추천 코스<h5>
			        	 <p class="card-text posting-content">1. 마장호수 220m의 엄청나게 긴 출렁다리가 있는 마장호수! 거대한 규모와 황홀한 풍경에 많은 사람들이 찾는 곳인데요, 호수 둘레길 산책로도 잘 되어 있기 때문에 모든 계절에 가볍게 가기 좋은 여행지입니다. 2. 벽초지수목원</p>
			        	 <div class="d-flex align-items-center">
			          		<img src="<c:url value='/images/profile/yunakim.jpg'/>" class="profileImageSm ml-0 mr-2 ">
			            	<div class="userId">Jason</div>
			          	 </div>
		             </div>
		        </div>
		    </div>
		    <div class="col-md-4">
		    	<div class="card shadow mb-3">
		    		<div class="card-img-wrap">
	            		<img src="<c:url value='/images/sns.body/tongyoung.png'/>" class="card-img-top rounded snsCard" alt="..."/>
	             	</div>
	           		 <div class="card-body">
	             		 <h5 class="card-title posting-title  mb-2">통영 알찬 당일치기 여행코스 추천 🤍</h5>
	             		 <p class="card-text posting-content">1. 통영해물뚝배기 ♥️ 어딜가나 맛집은 기본리스트에 있어야하죠? 성게비빔밥 멍게비빔밥 다양한 밥종류가 많아요! 해물뚝배기도 순한맛과 얼큰한맛 선택할 수 있구요! 꼭 드세요!! 평점: ★★★★ 2. 동피랑 벽화마을 주소: 경남 통영시 동피랑1길 6-18
														핵심 포인트: 벽화마을 특유의 분위기 평점: ★★★ 3. 서피랑 떡복기집 평점: ★★★★ 4. 통영케이블카 평점: ★★★★★</p>
	           			<div class="d-flex align-items-center">
		          			<img src="<c:url value='/images/profile/yunakim.jpg'/>" class="profileImageSm ml-0 mr-2 ">
		           			 <div class="userId">Dodo</div>
		          		</div>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-4">
		    	<div class="card shadow mb-3">
		    		<div class="card-img-wrap">
           	 			<img src="<c:url value='/images/sns.body/ulsan.png'/>" class="card-img-top rounded snsCard" alt="..."/>
          			</div>
		            <div class="card-body">
		              <h5 class="card-title posting-title  mb-2">울산 영남알프스 간월재 가을 억새여행</h5>
		              <p class="card-text posting-content">✔️찾아가는 방법: 네비애 간월재 검색!! ✔️추천 음식&맛집: 간월재 정상에서 라면 한사발💓 ✔️참고사항 1️⃣정상 라면집 4시까지라 빠른 등산 추천 2️⃣가벼운 트레킹 코스로 스틱 필요없음</p>
		           		<div class="d-flex align-items-center">
			          	<img src="<c:url value='/images/profile/yunakim.jpg'/>" class="profileImageSm ml-0 mr-2 ">
			            <div class="userId">popo</div>
			          </div>
		            </div>
		        </div>
		    </div>
	    </div><!-------------------------- row end----------------------------------- -->
	  </div><!-- 무한스크롤 적용부분 -->
<!-- -------------------------------------------------------------------------------------------------------------------------------------------- -->
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"
    ></script>
    <!--date picker from Gijgo-->
    <script>
      var today = new Date(
        new Date().getFullYear(),
        new Date().getMonth(),
        new Date().getDate()
      );
      $("#startDate").datepicker({
        uiLibrary: "bootstrap4",
        iconsLibrary: "fontawesome",
        minDate: today,
        maxDate: function () {
          return $("#endDate").val();
        },
      });
      $("#endDate").datepicker({
        uiLibrary: "bootstrap4",
        iconsLibrary: "fontawesome",
        minDate: function () {
          return $("#startDate").val();
        },
      });
      
      function loadData(){
          $.ajax({
            url:'<c:url value=" 경로 넣어주세요! "/>',
            // method:'post',
            dataType:'json',
            // data:{'page':page}
          }).done(function(data){
            
          })
        }
        var page=1;
        var index=0;
        var content = $('.scroll_add').clone();
        $(window).scroll(function() {
          // console.log($(window).scrollTop(),$(document).height() - $(window).height());
          if ( 100 > $(document).height() - $(window).height() - $(window).scrollTop()) {
            console.log('간닷!');

            // loadData()//ajax 함수 호출!
            
            // var src = '../images/'+(index++)+'.jpg';
           	// for(var i=0;i<content.find('img').length;i++)
            // content.find('img:eq('+i+')').prop('src','../images/'+(index+i)+'.jpg');
            // content.find('img:eq(1)').prop('src','../images/2.jpg');
            // content.find('img:eq(2)').prop('src','../images/3.jpg');
            // content.find('img:eq(3)').prop('src','../images/4.jpg');
            $(".scroll_add").append(content.html());
            page++;
            index++;
            console.log(index);
          }
        });
    </script>
  </body>
</html>
<div class="modal fade" id="loginModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <form class="modal-body1" action="/travary/Index.msp" method="post">
                <img src="<c:url value="/images/logo/logo.png"/> " class="modal-logo">
                <input type="text" placeholder="아이디" class="inlilneToBlock">
                <input type="password" placeholder="비밀번호" class="inlilneToBlock">                    
                <button class="inlineToBlock ordinaryLogin unactivatedLoginColor" type="submit">로그인</button>
                <div class="horizonAndOrWrap">
                    <hr class="leftHr">
                    <div class="or">또는</div>
                    <hr class="rightHr">
                </div>
            </form>
            <div class="modal-body2 mb-2">
                <a href="https://kauth.kakao.com/oauth/authorize?client_id=ce24a312ecf7ce42435f8de5f549dd5b&redirect_uri=http://localhost:7070/member/kakaoLogin&response_type=code" class="noneunderline">                    
                    <img src="<c:url value="/images/login/kakaoicon.png"/>" class="kakaoIcon">                    
                </a>
                <a href="https://accounts.google.com/o/oauth2/v2/auth?client_id=971116911703-f7afs5url9crbvhm5lsc0l0fpn3toens.apps.googleusercontent.com&response_type=code&scope=openid%20email%20profile&redirect_uri=http://localhost:7070/member/GoogleMyPage.do&access_type=offline&prompt=consent" class="noneunderline">                    
                    <img src="<c:url value="/images/login/googleicon.png"/>" class="googleIcon">
                </a>
                <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=GsYVpg82aBYC9e00ww1B&redirect_uri=http://localhost:7070/member/NaverMyPage.do" class="noneunderline">                    
                    <img src="<c:url value="/images/login/navericon.png"/>" class="naverIcon"></a>
            </div>
            <div class="modal-body3">
                <p>계정이 없으신가요?
                    <a href='<c:url value="/member/Register"/>' class="noneunderline">가입하기</a>
                </p>
            </div>
        </div>
    </div>
</div>
