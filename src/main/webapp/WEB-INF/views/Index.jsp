<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:forward page="/member/Login.do"></jsp:forward> --%>
<!DOCTYPE html>
<html lang='ko'>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!--Font-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;800&display=swap"
      rel="stylesheet"
    />

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />  
    
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"
    ></script>

    <!--date picker-->
    <link
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
      rel="stylesheet"
      integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
      crossorigin="anonymous"
    />
    <script
      src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
      type="text/javascript"
    ></script>
    <link
      href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <!-- Optional JavaScript -->
    <style>
      @media (min-width: 768px) {
        section {
          padding-top: 13.3125rem;
        }

        section {
          padding-bottom: 7.5rem;
        }
      }

      .br0,
      .gj-datepicker-bootstrap [role="right-icon"] button,
      .form-control {
        border-radius: 0 !important;
      }
      .card-img-top {
          max-height:500px;
          min-height:160px;
          object-fit: cover;
      }
     .profileImageSm{
    	border-radius: 100%;
   		max-width: 3vw;
   		object-fit: cover;
	}
     .snsCard {
   		 width: 100%;
  		height: 30vh;
    	object-fit: cover;
		}
    </style>
    <title>Travary</title>
  </head>
  <body>  
    <div class="container-fluid" style="height: 100vh">
      <nav
        class="bg-light navbar navbar-expand-xl navbar-dark navbar-togglable "
      >
        <div class="container">
          <!-- Brand -->
          <a class="navbar-brand" href="index.html"> Travary </a>

          <!-- Toggler -->
          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarCollapse"
            aria-controls="navbarCollapse"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>

          <!-- Collapse -->
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <!-- Links -->
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active mx-4">
                <a class="nav-link" href="#">Make a plan</a>
              </li>
              <li class="nav-item mx-4">
                <a class="nav-link" href="#">Community</a>
              </li>
              <li class="nav-item mx-4">
                <a class="nav-link" href="#">Sign up</a>
              </li>
              <li class="nav-item mx-4">
                <a class="nav-link" href="#">Login</a>
              </li>
            </ul>
          </div>
          <!-- / .navbar-collapse -->
        </div>
        <!-- / .container -->
      </nav>

      <section class="section section-top section-full">
        <!-- Cover -->
        <div
          class="bg-cover"
          style="
            background-image: url('resources/images/landing/landing4.jpg');
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background-repeat: no-repeat;
            background-position: 100%;
            background-size: cover;
          "
        ></div>

        <!-- Overlay -->
        <div class="bg-overlay"></div>

        <!-- Triangles -->
        <div
          class="bg-triangle bg-triangle-light bg-triangle-bottom bg-triangle-left"
        ></div>
        <div
          class="bg-triangle bg-triangle-light bg-triangle-bottom bg-triangle-right"
        ></div>

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
          <div class="col-sm-5 ">
            <div class="card ">
              <div class="card-body">
                <h1 class="h3 mb-3">
                  Travary와 함께 </br>특별한 여행을 만들어보세요
                </h1>
                <form>
                  <div class="form-group">
                    <div class="row px-3">
                      <label class="mb-0" for="locationInput mb-0 mt-5"
                        >목적지</label
                      >
                      <input
                        type="email"
                        class="form-control w-100 br0"
                        id="locationInput"
                        aria-describedby="locationInputHelp"
                        placeholder="Anywhere"
                      />
                      <small
                        id="locationInputHelp"
                        class="form-text text-muted sr-only"
                        >떠나고 싶은 여행지를 검색해주세요!</small
                      >
                    </div>
                  </div>
                  <div class="row px-3">
                    <div class="col-sm-6 px-0">
                      여행 가는날 <input class="br0" id="startDate" />
                    </div>
                    <div class="col-sm-6 px-0 br0">
                      돌아오는 날 <input class="br0" id="endDate" />
                    </div>
                  </div>
                  <div class="row px-3">
                    <div class="col-sm px-0 br0">
                      <div class="form-group">
                        <label class="mb-0 mt-3" for="exampleFormControlSelect1"
                          >몇 명이서 함께하나요?</label
                        >
                        <select
                          class="form-control"
                          id="exampleFormControlSelect1"
                        >
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
                  <a href="#" class="btn btn-danger btn-block">AI 여행 계획 생성</a>
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
            <img
              src="resources/images/best-theme/busan.jpg"
              class="card-img-top rounded"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title mb-0">부산</h5>
              <p class="card-text text-info">
                &#9733; &#9733; &#9733; &#9733; &#9733;
              </p>
              <p class="card-text">
                <small class="text-muted">Last updated 3 mins ago</small>
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card mb-3 border-0 shadow ">
            <img
              src="resources/images/best-theme/seoul.jpg"
              class="card-img-top rounded"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title mb-0">서울</h5>
              <p class="card-text text-info">
                &#9733; &#9733; &#9733; &#9733; &#9733;
              </p>
              <p class="card-text">
                <small class="text-muted">Last updated 3 mins ago</small>
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
            <div class="card mb-3 border-0 shadow ">
              <img
                src="resources/images/best-theme/suwon.jpg"
                class="card-img-top rounded"
                alt="..."
              />
              <div class="card-body">
                <h5 class="card-title mb-0">수원</h5>
                <p class="card-text text-info">
                  &#9733; &#9733; &#9733; &#9733; &#9733;
                </p>
                <p class="card-text">
                  <small class="text-muted">Last updated 3 mins ago</small>
                </p>
              </div>
            </div>
          </div>
        <div class="col-md-3">
          <div class="card mb-3 border-0 shadow ">
            <img
              src="resources/images/best-theme/jeju3.jpg"
              class="card-img-top rounded"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title mb-0">제주</h5>
              <p class="card-text text-info">
                &#9733; &#9733; &#9733; &#9733; &#9733;
              </p>
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
            <img
            src="resources/images/best-theme/midnightseoul.jpg"
            class="card-img-top rounded"
            alt="..."
            />
            <div class="card-body">
              <h5 class="card-title mb-0">미드나잇 IN 한강</h5>
              <p class="card-text text-info">
                &#9733; &#9733; &#9733; &#9733; &#9733;
              </p>
              <p class="card-text">
                <small class="text-muted">Last updated 3 mins ago</small>
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card mb-3 border-0 shadow ">
            <img
            src="resources/images/best-theme/yangyang.jpg"
            class="card-img-top rounded"
            alt="..."
            
            />
            <div class="card-body">
              <h5 class="card-title mb-0">서핑 IN 양양</h5>
              <p class="card-text text-info">
                &#9733; &#9733; &#9733; &#9733; &#9733;
              </p>
              <p class="card-text">
                <small class="text-muted">Last updated 3 mins ago</small>
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card mb-3 border-0 shadow ">
              <img
              src="resources/images/best-theme/yeosu.jpg"
              class="card-img-top rounded"
              alt="..."
              />
              <div class="card-body">
                <h5 class="card-title mb-0">여수 밤바다</h5>
                <p class="card-text text-info">
                  &#9733; &#9733; &#9733; &#9733; &#9733;
                </p>
                <p class="card-text">
                  <small class="text-muted">Last updated 3 mins ago</small>
                </p>
              </div>
            </div>
          </div>
        <div class="col-md-3">
          <div class="card mb-3 border-0 shadow ">
            <img
            src="resources/images/best-theme/terarosa.jpg"
            class="card-img-top rounded"
            alt="..."
            />
            <div class="card-body">
              <h5 class="card-title mb-0">강릉 커피 여행</h5>
              <p class="card-text text-info">
                &#9733; &#9733; &#9733; &#9733; &#9733;
              </p>
              <p class="card-text">
                <small class="text-muted">Last updated 3 mins ago</small>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid container py-3 mt-4">
    <!----------------------------------------------------------------SNS 섹션------------------------------------------------------------------>
      <h2 class="h3 mb-4">Travary와 함께한 경험을 공유해보세요</h2>
      <div class="row d-flex justify-content-center mt-5">
          <div class="card mb-3">
            <img
              src="resources/images/best-theme/jeju3.jpg"
              class="card-img-top rounded"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title mb-0">제주</h5>
              <p class="card-text text-info">
                &#9733; &#9733; &#9733; &#9733; &#9733;
              </p>
              <p class="card-text">
                <small class="text-muted">Last updated 3 mins ago</small>
              </p>
            </div>
          </div>
        </div>
        <div class="row d-flex justify-content-center">
          <div class="card mb-3">
            <img
              src="resources/images/best-theme/jeju3.jpg"
              class="card-img-top rounded"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title mb-0">제주</h5>
              <p class="card-text text-info">
                &#9733; &#9733; &#9733; &#9733; &#9733;
              </p>
              <p class="card-text">
                <small class="text-muted">Last updated 3 mins ago</small>
              </p>
            </div>
          </div>
        </div>
      <div class="row mt-4">
        <div class="col-md-6">
          <div class="card mb-3">
            <img
              src="resources/images/sns.body/card_body1.jpg"
              class="card-img-top rounded snsCard"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title mb-0">영도 가볼만한 곳 여행 코스</h5>
              <p class="card-text"></p>
                <div class="">
                    <div class="d-flex">
                   		<img src="resources/images/profile/yunakim.jpg" class="profileImageSm ml-0 mr-2 mb-3" alt="...">
                        <div class="mt-0 mb-0">배고파팡</div>
                    </div>
                </div>
               
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card mb-3">
            <img
              src="resources/images/sns.body/card_body1.jpg"
              class="card-img-top rounded snsCard"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title mb-0">영도 가볼만한 곳 여행 코스</h5>
              <p class="card-text"></p>
                <div class="">
                    <div class="d-flex">
                   		<img src="resources/images/profile/yunakim.jpg" class="profileImageSm ml-0 mr-2 mb-3" alt="...">
                        <div class="mt-0 mb-0">배고파팡</div>
                    </div>
                </div>
            </div>
          </div>
        </div>
         <div class="col-md-6">
          <div class="card mb-3">
            <img
              src="resources/images/sns.body/card_body1.jpg"
              class="card-img-top rounded snsCard"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title mb-0">영도 가볼만한 곳 여행 코스</h5>
              <p class="card-text"></p>
                <div class="">
                    <div class="d-flex">
                   		<img src="resources/images/profile/yunakim.jpg" class="profileImageSm ml-0 mr-2 mb-3" alt="...">
                        <div class="mt-0 mb-0">배고파팡</div>
                    </div>
                </div>
               
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card mb-3">
            <img
              src="resources/images/sns.body/card_body1.jpg"
              class="card-img-top rounded snsCard"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title mb-0">영도 가볼만한 곳 여행 코스</h5>
              <p class="card-text"></p>
                <div class="">
                    <div class="d-flex">
                   		<img src="resources/images/profile/yunakim.jpg" class="profileImageSm ml-0 mr-2 mb-3" alt="...">
                        <div class="mt-0 mb-0">배고파팡</div>
                    </div>
                </div>
            </div>
          </div>
        </div>
    </div>
    <div class="row">
	  	<div class="col-md-4">
	          <div class="card mb-3">
	            <img
	              src="resources/images/sns.body/card_body1.jpg"
	              class="card-img-top rounded snsCard"
	              alt="..."
	            />
	            <div class="card-body">
	              <h5 class="card-title mb-0">영도 가볼만한 곳 여행 코스</h5>
	              <p class="card-text"></p>
	                <div class="">
	                    <div class="d-flex">
	                   		<img src="resources/images/profile/yunakim.jpg" class="profileImageSm ml-0 mr-2 mb-3" alt="...">
	                        <div class="mt-0 mb-0">배고파팡</div>
	                    </div>
	                </div>
	            </div>
	          </div>
	        </div>
	        <div class="col-md-4">
	          <div class="card mb-3">
	            <img
	              src="resources/images/sns.body/card_body1.jpg"
	              class="card-img-top rounded snsCard"
	              alt="..."
	            />
	            <div class="card-body">
	              <h5 class="card-title mb-0">영도 가볼만한 곳 여행 코스</h5>
	              <p class="card-text"></p>
	                <div class="">
	                    <div class="d-flex">
	                   		<img src="resources/images/profile/yunakim.jpg" class="profileImageSm ml-0 mr-2 mb-3" alt="...">
	                        <div class="mt-0 mb-0">배고파팡</div>
	                    </div>
	                </div>
	            </div>
	          </div>
	        </div>
	        <div class="col-md-4">
	          <div class="card mb-3">
	            <img
	              src="resources/images/sns.body/card_body1.jpg"
	              class="card-img-top rounded snsCard"
	              alt="..."
	            />
	            <div class="card-body">
	              <h5 class="card-title mb-0">영도 가볼만한 곳 여행 코스</h5>
	              <p class="card-text"></p>
	                <div class="">
	                    <div class="d-flex">
	                   		<img src="resources/images/profile/yunakim.jpg" class="profileImageSm ml-0 mr-2 mb-3" alt="...">
	                        <div class="mt-0 mb-0">배고파팡</div>
	                    </div>
	                </div>
	            </div>
	          </div>
	        </div>
        </div>

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
    </script>
  </body>
</html>
