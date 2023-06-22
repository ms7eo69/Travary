<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="css/material.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@NaN,100,0,0" />
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
      .w-25{
        object-fit: cover;
        border-radius: 100%;
      }
     
    </style>
    <title>Document</title>
    <style>
        .logo{
            height: 40px;
        }
        
      
    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
        <a href="#" class="nav-bar-brand col-1"><img class="logo" src="img/logo.png" alt=""></a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="#" class="nav-link" >LOGIN</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link" >JOIN</a>
                </li>
            </ul>
        </div>
    </nav>
<header>


    <div class="row vh-100">

            <nav class="side-nav-bar navbar navbar-dark  bg-dark col-xl-1  align-items-start  " style="height: 100%">
          
            <ul class="navbar-nav mt-4  ">
                <li class="nav-item ">
                    <a href="#" class="nav-link d-flex align-items-center" > 
                        <span class="material-symbols-rounded mr-3">home</span>
                        <span>HOME</span>
                    </a>
                </li>
                <li class="nav-item ">
                    <a href="#" class="nav-link d-flex align-items-center" > 
                        <span class="material-symbols-rounded mr-3">search</span>
                        <span>SEARCH</span>
                    </a>
                </li>
                <li class="nav-item ">
                    <a href="#" class="nav-link d-flex align-items-center" > 
                        <span class="material-symbols-rounded mr-3">local_fire_department</span>
                        <span>TREND</span>
                    </a>
                </li>
                <li class="nav-item ">
                    <a href="#" class="nav-link d-flex align-items-center" > 
                        <span class="material-symbols-rounded mr-3">bookmark</span>
                        <span>SAVED</span>
                    </a>
                </li>
            </ul>
        </nav>

        <section class="main bg-secondary col-xl-11 col-sm-12 ">
            <section class="section section-top section-full">
                <!-- Cover -->
                <div
                  class="bg-cover"
                  style="
                    background-image: url('img/landing/landing4.jpg');
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
            
        </sectionv>
    </div>

</body>
</html>