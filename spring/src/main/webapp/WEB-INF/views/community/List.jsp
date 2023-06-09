<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--Font & Icon-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;800&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Caprasimo&family=Lexend+Peta:wght@700&family=Montserrat:wght@700&family=Noto+Sans+KR:wght@700&family=Noto+Serif+Makasar&family=Signika+Negative:wght@600&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/79655749c6.js" crossorigin="anonymous"></script> 
 
<!-- Bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="<c:url value="css/index/navigationbar.css"/>"/>
<link rel="stylesheet" href="<c:url value="css/community/community.css"/>"/>
<link rel="stylesheet" href="<c:url value="css/community/write.css"/>"/>

<!--Interactive-->
<script src="<c:url value="js/index/scrolling.js"/>" defer></script>
<script src="<c:url value="js/community/viewArticle.js"/>" defer></script>
<script src="<c:url value="js/community/write.js"/>" defer></script>

</head>
<body>
<!---------------------------------------------네비게이션바 시작------------------------------------------- -->
    <div class="container-fluid " style="height: 100vh">
     <nav class="main-menu position-fixed shadow ">
        <div class="outerDiv ">
            <div class="innerDiv">
                <div id="nav-header">
                    <div class="logo">
                        <a href="#" class="logo-font">TRAVARY</a>
                    </div>         
                    <div class="settings"></div>       
                </div>
                <div id="nav-body">
                    <div class="menu-style">
                        <ul class="navfont">                                
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
                                <a href="#" class="posting">
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
                            <li>
                                <a href="<c:url value="/Route.do"/>">
                                    <i class="fa fa-solid fa-circle-user"><img class="rounded-circle" src=""></i>
                                    <span class="nav-text">경로</span>
                                </a>
                            </li>
                            <li>
                                <a href="<c:url value="community.do"/>">
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
                            <i class="fa fa-solid fa-bars" ></i>더 보기
                        </a> 
                        <div class="dropdown-menu">
                            <a class="dropdown-item" data-toggle="modal" data-target="#loginModal" href="#">로그인</a>
                            <a class="dropdown-item" href="<c:url value="../member/regist/regi.html"/>">회원가입</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>  
     <!---------------------------------------------네비게이션바 끝------------------------------------------- --> 
   <!-------------------------------------------- 포스팅 버튼----------------------------------------------------->
	<div class="d-flex">
	  <button type="button" class="btn btn-primary PublishButton justify-content-right">포스팅</button>
	</div>
	
	   <!-------------------------------------------- 여행 선택----------------------------------------------------->
	
	<div class="bgOverlay pickCourse ">
	  <div class="snsWrite ">
	    <div class="snsWriteContent">
	      <div class="top-section justify-content-center font-weight-bold">
	      	<span>세 게시글 만들기</span>
	      </div>
	      <div class="row justify-content-center align-items-center flex-column mx-0"> 
	        <div class="my-3 h5">
		        <span>공유할 여행을 선택해주세요</span>	        
	        </div>      
	        <div class="col-6 m-3 courses" >
			  <div class="card card-list text-white shadow " >
			    <img class="card-img coursImg" src="<c:url value="/images/best-theme/busan.jpg"/>" >
			    <div class="card-img-overlay">
			      <h5 class="card-title text-white text-bold">부산</h5>
			      <p class="card-text">2023-07-10 ~ 07-11 (1박2일)</p>
			    </div>
			  </div>
			</div>
			<div class="col-6 m-3 courses" > 
			  <div class="card card-list text-white shadow" >
			    <img class="card-img coursImg" src="<c:url value="/images/best-theme/seoul.jpg"/>" >
			    <div class="card-img-overlay">
			      <h5 class="card-title text-white text-bold">서울</h5>
			      <p class="card-text">2023-06-10 ~ 06-11 (1박2일)</p>
			    </div>
			  </div>
			</div>
			<div class="col-6 m-3 courses" >
			  <div class="card card-list text-white shadow" >
			    <img class="card-img coursImg" src="<c:url value="/images/best-theme/jeju.jpg"/>" >
			    <div class="card-img-overlay">
			      <h5 class="card-title text-white text-bold">제주</h5>
			      <p class="card-text">2023-05-10 ~ 05-11 (1박2일)</p>
			    </div>
			  </div>
			</div>
			<div class="col-6 m-3 courses" >
			  <div class="card card-list text-white shadow" >
			    <img class="card-img coursImg" src="<c:url value="/images/best-theme/terarosa.jpg"/>" >
			    <div class="card-img-overlay">
			      <h5 class="card-title text-white text-bold">강릉</h5>
			      <p class="card-text">2023-04-10 ~ 04-11 (1박2일)</p>
			    </div>
			  </div>
			</div>
	      </div>
	    </div>
	  </div>
	</div>
<!---------------------------글쓰기 취소-------------------- -->
	<div class="alert-modal shadow text-center" style="display: none;">
	  <div class="alert-modal-title">
	    <h5>글쓰기를 취소하시겠습니까?</h5>
	    <h6 class="pt-1 text-secondary">지금 나가면 수정내용이 저장되지 않습니다.</h6>
	  </div>
	  <div class="alert-modal-choose">
	    <div class="btn-yes">
	      <button class="btn btn-block text-danger" onclick="cancelPost(); closeWriteModal();">삭제</button>
	    </div>
	    <div class="btn-no">
	      <button class="btn" onclick="closeAlertModal()">취소</button>
	    </div>
	  </div>
	</div>

<!------------------글쓰기 상세 작성 모달----------------------------->
	
	  <div class="snsWrite writeForms" style="display: none;">
		  <div class="snsWriteContent">
		    <div class="row justify-content-center align-items-center flex-column">
		      <div class="write-form snsWrite" onclick="stopPropagation(event)">
		        <div class="snsWriteContent">
		          <div class="top-section justify-content-between px-4">
		            <i class="fas fa-arrow-left fa-lg text-secondary" ></i>
		            <span class="text-black font-weight-bold">세 게시글 만들기</span>
		            <span class="text-info font-weight-bold">공유</span>
		          </div>
		          <div class="d-flex row mx-0">
		            <div class="col-md-2 p-0 days">
		              <button type="button" class="collapsible" onclick="collapse(this);">
		                <span>1일차</span>
		              </button>
		              <div class="content">
		                <ul>
		                  <li>해운대</li>
		                  <li>서면</li>
		                  <li>남포동</li>
		                  <li>개선문</li>
		                  <li>에펠탑</li>
		                </ul>
		              </div>
		              <button type="button" class="collapsible" onclick="collapse(this);">
		                <span>2일차</span>
		              </button>
		              <div class="content">
		                <ul>
		                  <li>해운대</li>
		                  <li>서면</li>
		                  <li>남포동</li>
		                  <li>개선문</li>
		                  <li>에펠탑</li>
		                </ul>
		              </div>
		              <button type="button" class="collapsible" onclick="collapse(this);">
		                <span>3일차</span>
		              </button>
		              <div class="content">
		                <ul>
		                  <li>해운대</li>
		                  <li>서면</li>
		                  <li>남포동</li>
		                  <li>개선문</li>
		                  <li>에펠탑</li>
		                </ul>
		              </div>
		            </div>
		            <div class="col-md-6 uploadPic left-section d-flex align-items-center justify-content-center">
		              <div class="imageUpload flex-column justify-content-center">
		                <input type="file" id="imageUpload" accept="image/*" onchange="previewImages(event)" style="display: none;" multiple>
		                <div class="imagePreviews">
		                </div>
		                <div class="text-center">
		                  <img src="<c:url value='/images/community/imggallery.png'/>" alt="이미지 선택" onclick="openFileUpload();" style="cursor: pointer;">
		                  <div>사진을 선택해주세요!</div>
		                </div>
		              </div>
		            </div>
		            <div class="col-md-4 right-section shadow">
		              <div class="align-items-center flex-column">
		                <div class="d-flex align-items-center mb-4">
		                  <img src="<c:url value='/images/profile/yunakim.jpg'/>" class="profileImageSm ml-0 mr-2 ">
		                  <div class="userId">Yujin</div>
		                </div>
		                <div>
		                  <input type="text" id="postingtitle" name="title" class="inputbox mb-4" placeholder="제목 입력...">
		                </div>
		                <div>
		                  <textarea id="textbox" name="content" class="inputbox textbox" placeholder="내용 입력..."></textarea>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
	

 <!----------------------------------게시글 상세보기 모달---------------------------------->
	<div id="myModal" style="display: none;">
	  <div class="view_sns">
	    <div class="view_content row ">
	      <div class="col-md-7 sns_photos">
	        <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
			    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
			    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
			    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
			  </ol>
			  
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="<c:url value="/images/sns.body/card_body1.jpg"/>" class="d-block w-100 " alt="...">
			      <div class="carousel-caption d-none d-md-block">
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value="/images/sns.body/sgp.jpg"/>" class="d-block w-100 " alt="...">
			      <div class="carousel-caption d-none d-md-block">
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img src="<c:url value="/images/sns.body/busan.png"/>" class="d-block w-100 " alt="...">
			      <div class="carousel-caption d-none d-md-block">
			      </div>
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only"></span>
			  </button>
			  <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only"></span>
			  </button>
			</div>
	      </div>
	      <div class="col-md-5 sns_details d-flex flex-column pl-0 pr-4">
        	<div class="sns_id d-flex align-items-center my-3">
               	 <img src="<c:url value="/images/profile/yunakim.jpg"/> " class="profileImageMd ml-0 mr-2 ">
                    <div class="viewUserId">Yuna</div>
            </div>
	        <div class="sns_title flex-fill mb-5">
	          <h3>영도 가볼만한 곳 여행 코스</h3>
	        </div>
	        <div class="sns_content flex-fill mb-5">
	          <p>#핵심 포인트: 송도해수욕장 동쪽의 송림공원에서 서쪽 암남공원을 오가는 케이블카 입니다. 송도의 풍경 보기 위해서는 케이블카를 타는 것을 추천해요.</p>
	        </div>
	        <div class="sns_comments flex-fill mb-auto ">
	          <input type="text" name=comment class="form-control" placeholder="comment">
	        </div>
	        <div class="sns_location">
	        	<div class="card mb-3 shadow" style="">
				  <div class="row no-gutters">
				    <div class="col-md-4 ">
				      <img src="<c:url value="/images/best-theme/busan.jpg"/>" class="courseImg" alt="...">
				    </div>
				    <div class="col-md-8">
				      <div class="card-body p-2">
				        <h6 class="card-title h5 text-black">여행 코스</h5>
				        <div class="card-text h6"><i class="fa-solid fa-location-dot text-danger"><span class="ml-2">부산</span></i></div>
				        <div class="card-text"><i class="fa-regular fa-calendar"><span class="ml-2">1박 2일</span></i></div>
					      <div class="sns-location-btn d-flex pr-1 ">
					        <a href="#" class="btn btn-primary ml-auto">더 보기</a>
					      </div>
				      </div>
				    </div>
				  </div>
				</div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>

	
    <!----------------------------------------------------------------SNS 섹션------------------------------------------------------------------>

   <div class="container-fluid container  mt-4">
   	<div class="pl-0 py-5">
      <h2>Travary와 함께한 경험을 공유해보세요</h2>
   	</div>
	  <div class="row scroll_add"><!-------------------------- 무한 스크롤 적용버전----------------------------------- -->  
	    <div class="row mb-2"><!-------------------------- row start----------------------------------- -->
			<div class="col-md-3 viewbox ">
		    	<div class="card shadow mb-3 ">
		    	<div class="card-img-wrap">
		        	<img src="<c:url value="/images/sns.body/card_body1.jpg"/>" class="card-img-top rounded snsCard"/>
		            </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">영도 가볼만한 곳 여행 코스<h5>
		            	<p class="card-text posting-content">#핵심 포인트: 송도해수욕장 동쪽의 송림공원에서 서쪽 암남공원을 오가는 케이블카 입니다. 송도의 풍경 보기 위해서는 케이블카를 타는 것을 추천해요.</p>
	                    <div class="d-flex align-items-center">
	                   		<img src="<c:url value="/images/profile/yunakim.jpg"/>" class="profileImageSm ml-0 mr-2 ">
	                        <div class="userId">Yuna</div>
	                    </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-3">
		    	<div class="card shadow mb-3">
		    	<div class="card-img-wrap">
		        	<img src="<c:url value="/images/sns.body/sgp.jpg"/>" class="card-img-top rounded snsCard"/>
		              </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">인생사진 남기러 서귀포 가자!<h5>
		            	<p class="card-text posting-content">#올레길 5코스에 해당하는 산책로를 따라 걷다보면 자연이 만들어낸 한반도 모양의 포토스팟 발견! 여기서 팁하나 드리자면 사진 찍으실 때 밝기 조절을 해서 한반도 안에 서귀포 바다와 하늘이 만나는 수평선이 보이게 찍으면 인생샷 완.성.</p>
	                    <div class="d-flex align-items-center">
	                   		<img src="<c:url value="/images/profile/p1.jpg"/>" class="profileImageSm ml-0 mr-2 ">
	                        <div class="userId">Damee</div>
	                    </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-3">
		    	<div class="card shadow mb-3">
		    	<div class="card-img-wrap">
		        	<img src="<c:url value="/images/sns.body/busan.png"/> " class="card-img-top rounded snsCard"/>
		              </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">축제가 넘쳐나는 곳, 광안리 해수욕장<h5>
		            	<p class="card-text posting-content">부산의 1등 핫플을 고르라면?! 한 치의 망설임 없이 광안리라고 외치겠습니다. 365일 축제로 넘쳐나는 그 곳! 분기별로 색다른 행사들로 가득차고, 매주 토요일은 드론쇼 공연이 펼쳐진답니다! 계절별과 날씨별로 드론쇼 일정이 상이할 수 있으니, 방문전 검색은 필수!</p>
	                    <div class="d-flex align-items-center">
	                   		<img src="<c:url value="/images/profile/p2.jpg"/>" class="profileImageSm ml-0 mr-2 ">
	                        <div class="userId">Jinsoo</div>
	                    </div>
		            </div>
		        </div>
		    </div>
			<div class="col-md-3">
		    	<div class="card shadow mb-3">
		    	<div class="card-img-wrap">
		        	<img src="<c:url value="/images/sns.body/incheon.jpg"/> " class="card-img-top rounded snsCard"/>
		              </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">뷰가 너무 예쁜 인천 영종도 선녀바위 해수욕장 ⛱️<h5>
		            	<p class="card-text posting-content">개인적으로 너무나 좋아하는 영종도 선녀바위 해수욕장이에요! 선녀바위와 기암들이 매우 멋있어서 외국인들도 많이 찾는 곳이에요. 탁 트인 바다뷰라 마치 동해안에 온 것처럼 느껴지는 곳이에요~ 뷰와 노을이 너무 예뻐서 가만히 앉아만 있어도 힐링 되는 곳입니다!</p>
	                    <div class="d-flex align-items-center">
	                   		<img src="<c:url value="/images/profile/yunakim.jpg"/>" class="profileImageSm ml-0 mr-2 ">
	                        <div class="userId">stacy</div>
	                    </div>
		            </div>
		        </div>
		    </div>
	    </div><!-------------------------- row end----------------------------------- -->
	       <div class="row mb-2"><!-------------------------- row start----------------------------------- -->
		    <div class="col-md-3">
		    	<div class="card shadow mb-3">
		    	<div class="card-img-wrap">
		        	<img src="<c:url value="/images/sns.body/ganghwa.jpg"/> " class="card-img-top rounded snsCard"/>
		             </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">나홀로 떠나본 인천 강화도 여행🤍<h5>
		            	<p class="card-text posting-content">#인천여행 드리우니 한옥 카페, 마니온 돈까스, 책방 시점, 금풍양조장(막걸리), 무해한어른(소품샵), 소니아소니아(수제 소품샵) 까지 알차게 즐기고 왔어요 ✌️✌️ 이번 여행 테마는 나를 위한 여행!</p>
	                    <div class="d-flex align-items-center">
	                   		<img src="<c:url value="/images/profile/yunakim.jpg"/>" class="profileImageSm ml-0 mr-2 ">
	                        <div class="userId">Daisy</div>
	                    </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-3">
		    	<div class="card shadow mb-3">
		    	<div class="card-img-wrap">
		        	<img src="<c:url value="/images/sns.body/songdo.png"/>" class="card-img-top rounded snsCard"/>
		              </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">외국 아니구요.. 한국 맞습니다.. 이국적인 매력이 돋보이는 ’송도 센트럴파크‘<h5>
		            	<p class="card-text posting-content">한국에서 외국 감성을 느끼고 싶으신 분들 모두 송도 센트럴파크로 달려가세요! 아무 생각 없이 산책하기에도 너무 좋고, 사진 찍기에도 너무 좋은 곳입니다 (⸝⸝･ᴗ･⸝⸝)੭˒</p>
	                    <div class="d-flex align-items-center">
	                   		<img src="<c:url value="/images/profile/yunakim.jpg"/>" class="profileImageSm ml-0 mr-2 ">
	                        <div class="userId">핑구</div>
	                    </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-3">
		    	<div class="card shadow mb-3">
		    	<div class="card-img-wrap">
		        	<img src="<c:url value="/images/sns.body/sungsan.png"/> " class="card-img-top rounded snsCard"/>
		              </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">나만 알고 싶은 제주 여행 코스 BEST<h5>
		        		<p class="card-text posting-content">1. 성산일출봉 성산일출봉은 항상 하나의 작품처럼 멀리서 보기만 했는데 이번엔 정상까지 마음 먹고 다녀왔어요 ! 일출 시간대가 아니라 별 거 있겠나 싶은 마음이 컸는데 감탄이 절로 나오는 절경을 보고 왔답니다 🥹 왜 세계자연유산으로 등록되었는지 알겠는,, !! 짧지만 경사가 있는 코스이기 때문에 (대부분이 계단) 그만큼 풍경이 너무너무 아름다워요 !!!!!!</p>
		         		<div class="d-flex align-items-center">
		          			<img src="<c:url value="/images/profile/yunakim.jpg"/>" class="profileImageSm ml-0 mr-2 ">
		           		 	<div class="userId">Yujin</div>
		          		</div>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-3">
		    	<div class="card shadow mb-3">
		    	<div class="card-img-wrap">
		        	<img src="<c:url value="/images/sns.body/suwon1.png"/>" class="card-img-top rounded snsCard"/>
		             </div>
		            <div class="card-body pb-1">
		            	<h5 class="card-title mb-2 posting-title">수원 당일치기 카페 풀코스!<h5>
		          			<p class="card-text posting-content">수원 여행을 하면서 수원화성 바로 근처에 있어서 우리 문화재를 배경으로 사진을 촬영할 수 있다는 점이 너무 좋았어요. sns에서 핫한 만큼, 왜 핫한지 알 수 있겠더라구요 </p>
		          			<div class="d-flex align-items-center">
		          				<img src="<c:url value="/images/profile/yunakim.jpg"/>" class="profileImageSm ml-0 mr-2 ">
		           			 <div class="userId">수요미</div>
		          			</div>
		            </div>
		        </div>
		    </div>
	    </div><!-------------------------- row end----------------------------------- -->
	    <div class="row"><!-------------------------- row start----------------------------------- -->
		    <div class="col-md-3">
		    	<div class="card shadow mb-3">
		    		<div class="card-img-wrap">
	           			 <img src="<c:url value="/images/sns.body/seoulsup.png"/>" class="card-img-top rounded snsCard"/>
	          		 </div>
	           		 <div class="card-body">
	             		<h5 class="card-title mb-2 posting-title">계절마다 다른 느낌의 도심 속 숲, 서울숲🌳<h5>
		          		<p class="card-text posting-content">#도시여행 여기는 서울숲이에요! 사계절 내내 피어있는 꽃이 다르고 개인 스냅, 웨딩 스냅을 찍는 분들도 계셨어요💍 주변에 음식점과 디저트 카페가 많았어요 저는 '백돈'이라는 곳에 다녀왔는데 진짜 맛있더라구요ㅠ🥺 언제 다녀와도 좋은 곳이에요🌳🔥</p>
		         		<div class="d-flex align-items-center">
		          			<img src="<c:url value="/images/profile/yunakim.jpg"/>" class="profileImageSm ml-0 mr-2 ">
		            	<div class="userId">ZenZen</div>
		          		</div>
		            </div>
		        </div>
		    </div>
			<div class="col-md-3">
		    	<div class="card shadow mb-3">
		    		<div class="card-img-wrap">
	           			 <img src="<c:url value="/images/sns.body/paju.png"/> " class="card-img-top rounded snsCard"/>
	           		 </div>
	           		 <div class="card-body">
		            	 <h5 class="card-title mb-2 posting-title">파주 당일치기 여행 추천 코스<h5>
			        	 <p class="card-text posting-content">1. 마장호수 220m의 엄청나게 긴 출렁다리가 있는 마장호수! 거대한 규모와 황홀한 풍경에 많은 사람들이 찾는 곳인데요, 호수 둘레길 산책로도 잘 되어 있기 때문에 모든 계절에 가볍게 가기 좋은 여행지입니다. 2. 벽초지수목원</p>
			        	 <div class="d-flex align-items-center">
			          		<img src="<c:url value="/images/profile/yunakim.jpg"/>" class="profileImageSm ml-0 mr-2 ">
			            	<div class="userId">Jason</div>
			          	 </div>
		             </div>
		        </div>
		    </div>
		    <div class="col-md-3">
		    	<div class="card shadow mb-3">
		    		<div class="card-img-wrap">
	            		<img src="<c:url value="/images/sns.body/tongyoung.png"/> " class="card-img-top rounded snsCard" alt="..."/>
	             	</div>
	           		 <div class="card-body">
	             		 <h5 class="card-title posting-title  mb-2">통영 알찬 당일치기 여행코스 추천 🤍</h5>
	             		 <p class="card-text posting-content">1. 통영해물뚝배기 ♥️ 어딜가나 맛집은 기본리스트에 있어야하죠? 성게비빔밥 멍게비빔밥 다양한 밥종류가 많아요! 해물뚝배기도 순한맛과 얼큰한맛 선택할 수 있구요! 꼭 드세요!! 평점: ★★★★ 2. 동피랑 벽화마을 주소: 경남 통영시 동피랑1길 6-18
														핵심 포인트: 벽화마을 특유의 분위기 평점: ★★★ 3. 서피랑 떡복기집 평점: ★★★★ 4. 통영케이블카 평점: ★★★★★</p>
	           			<div class="d-flex align-items-center">
		          			<img src="<c:url value="/images/profile/yunakim.jpg"/>" class="profileImageSm ml-0 mr-2 ">
		           			 <div class="userId">Dodo</div>
		          		</div>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-3">
		    	<div class="card shadow mb-3">
		    		<div class="card-img-wrap">
           	 			<img src="<c:url value="/images/sns.body/ulsan.png"/> " class="card-img-top rounded snsCard" alt="..."/>
          			</div>
		            <div class="card-body">
		              <h5 class="card-title posting-title  mb-2">울산 영남알프스 간월재 가을 억새여행</h5>
		              <p class="card-text posting-content">✔️찾아가는 방법: 네비애 간월재 검색!! ✔️추천 음식&맛집: 간월재 정상에서 라면 한사발💓 ✔️참고사항 1️⃣정상 라면집 4시까지라 빠른 등산 추천 2️⃣가벼운 트레킹 코스로 스틱 필요없음</p>
		           		<div class="d-flex align-items-center">
			          	<img src="<c:url value="/images/profile/yunakim.jpg"/>" class="profileImageSm ml-0 mr-2 ">
			            <div class="userId">popo</div>
			          </div>
		            </div>
		        </div>
		    </div>
	    </div><!-------------------------- row end----------------------------------- -->
	  </div><!-- 무한스크롤 적용부분 -->


	 
<script>

</script>
</body>
</html>