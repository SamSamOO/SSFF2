<%--
  스터디 카페 리스트 단
  User: 신지혜
  Date: 2021-11-05
  Time: 오후 3:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib	uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<%@taglib	uri="http://java.sun.com/jsp/jstl/fmt"	prefix="fmt" %>
<!DOCTYPE html>

<html lang="en">
<!----------------Head 시작----------------------->

<head>
  <title>cafeList</title>
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
  />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  
  <style>
    /* ---------- carousel ---------- */
    body{
      background:#000;
    }

    #cafeListCardLow li{ /* bundle이랑 겹쳐서 안들어감 화가남 TODO 고쳐야해 */
      -webkit-box-sizing: content-box;
      box-sizing: content-box;
      -webkit-box-flex: 0;
      -ms-flex: 0 1 auto;
      flex: 0 1 auto;
      /*width: 30px;*/
      height: 3px;
      margin-right: 5px;
      margin-left: 5px;
      text-indent: -999px;
      cursor: pointer;
      background-color: #ffffff;
      /*background-clip: padding-box;*/
      /*border-top: 10px solid transparent;*/
      /*border-bottom: 10px solid transparent;*/
      opacity: .5;
      -webkit-transition: opacity 0.6s ease;
      transition: opacity 0.6s ease;
    }

    section.awSlider{
      margin:0px auto;
      padding:20px;
      position:relative;
      display:table;
      -webkit-touch-callout: none;
      -webkit-user-select: none;
      -khtml-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
    }

    section.awSlider:hover > img{
      -ms-transform: scale(1.2);
      -webkit-transform: scale(1.2);
      transform: scale(1.2);
      opacity:1;
    }

    section.awSlider img{
      pointer-events: none;
    }

    section.awSlider > img{
      position:absolute;
      top:30px;
      z-index:1;
      transition:all .3s;
      filter: blur(1.8vw);
      -webkit-filter: blur(2vw);
      -moz-filter: blur(2vw);
      -o-filter: blur(2vw);
      -ms-filter: blur(2vw);
      -ms-transform: scale(1.1);
      -webkit-transform: scale(1.1);
      transform: scale(1.1);
      opacity:.5;
    }
    /* ---------- carousel ---------- */

    /* ---------- card-body ---------- */
  
  </style>
  
  <!--head.html Include-->
  <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>
</head>

<!----------------Head 종료----------------------->
<!----------------Body 시작----------------------->

<body id="kt_body" class="header-fixed subheader-enabled page-loading">
<!----------------메인 시작----------------------->
<div class="d-flex flex-column flex-root"> <div class="tttt"></div>
  <!----------------페이지 시작----------------------->
  <div class="d-flex flex-row flex-column-fluid page">
    <!--begin::Wrapper-->
    <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
      <!------------------header.html Include------------------>
      <jsp:include page="/WEB-INF/commons/header.jsp"></jsp:include>
      <!------------------Header Wrapper : 메뉴 탭 시작------------------>
      <!--menu.html Include-->
      <jsp:include page="/WEB-INF/commons/menu_main.jsp"></jsp:include>
      <!------------------Header Wrapper : 메뉴 탭 종료------------------>
      <!--컨테이너 시작-->
      <div class="d-flex flex-row flex-column-fluid container">
        <!--contents.html Include-->
        <div class="main d-flex flex-column flex-row-fluid">
          
          <!--Subheader : 서브헤더 페이지 제목란 시작-->
          <div class="subheader py-2 py-lg-6" id="kt_subheader">
            <div
              class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
              <!--begin::Info-->
              <div class="d-flex align-items-center flex-wrap mr-1">
                <!--begin::Page Heading-->
                <div class="d-flex align-items-baseline flex-wrap mr-5">
                  <!--Page Title : 페이지 제목 시작-->
                  <h5 class="text-dark font-weight-bold my-1 mr-5">스터디 카페 리스트</h5>
                  <!--Page Title : 페이지 제목 종료-->
                  <!--Breadcrumb : 로드맵 시작-->
                  <ul
                    class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                    <li class="breadcrumb-item">
                      <a href="" class="text-muted">서브메뉴1</a>
                    </li>
                    <li class="breadcrumb-item">
                      <a href="/cafe/reservationList?세션아이디" class="text-muted">예약내역확인</a>
                    </li>
                  </ul>
                  <!--Breadcrumb : 로드맵 종료-->
                </div>
                <!--end::Page Heading-->
              </div>
              <!--end::Info-->
      
            </div>
          </div>
          <!--Subheader : 서브헤더 페이지 제목란 종료-->
          
          
          <div class="content flex-column-fluid" id="kt_content">
            <!------------------ 본문 시작 ------------------>
            <div class="자이제시작이야">
              <!--begin::Row-->
              <div class="row" id="cafeListCardLow">
                <!--begin::Col-->
                <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                  <!--begin::Card-->
                  <div class="card card-custom gutter-b card-stretch">
      
                    <section class="awSlider">
                      <div  class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                          <li data-target=".carousel" data-slide-to="0" class="active"></li>
                          <li data-target=".carousel" data-slide-to="1"></li>
                          <li data-target=".carousel" data-slide-to="2"></li>
                          <li data-target=".carousel" data-slide-to="3"></li>
                          <li data-target=".carousel" data-slide-to="4"></li>
                          <li data-target=".carousel" data-slide-to="5"></li>
          
                        </ol>
          
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                          <div class="item active">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-941.jpg">
                            <div class="carousel-caption"> #1</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-101.jpg">
                            <div class="carousel-caption"> #2</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-1051.jpg">
                            <div class="carousel-caption"> #3</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #4</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #5</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #6</div>
                          </div>
                        </div>
          
                        <!-- Controls -->
                        <a class="left carousel-control" href=".carousel" role="button" data-slide="prev">
                          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                          <span class="sr-only">Geri</span>
                        </a>
                        <a class="right carousel-control" href=".carousel" role="button" data-slide="next">
                          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                          <span class="sr-only">İleri</span>
                        </a>
                      </div>
                    </section>
      
      
                    <!--begin::Body-->
                    <div class="card-body pt-4" style="flex: 1 1 auto; padding: 1px 2rem 2rem 2rem!important;">
                      <span class="text-dark-75 font-weight-bolder" style="font-size: 20px !important;">제목이 올자리</span>
                      <!--begin::Info-->
                      <div class="mb-7">
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">#부제목 #올자리</span>
                        </div>
                        <div class="justify-content-between align-items-center my-1">
                          <span class="text-dark-75 font-weight-bolder mr-2">최소 이용금액:</span>
                          <a href="#" class="text-muted text-hover-primary">$76,810</a>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">Due Date:</span>
                          <span class="text-muted font-weight-bold" style="">21.05.2016</span>
                        </div>
                      </div>
                      <!--end::Info-->
                      <a href="#" class="btn btn-block btn-sm btn-light-success font-weight-bolder text-uppercase py-4">예약하기</a>
                    </div>
                    <!--end::Body-->
                  </div>
                  <!--end:: Card-->
                </div>
                <!--end::Col-->
  
  
                <!--begin::Col-->
                <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                  <!--begin::Card-->
                  <div class="card card-custom gutter-b card-stretch">
      
                    <section class="awSlider">
                      <div  class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                          <li data-target=".carousel" data-slide-to="0" class="active"></li>
                          <li data-target=".carousel" data-slide-to="1"></li>
                          <li data-target=".carousel" data-slide-to="2"></li>
                          <li data-target=".carousel" data-slide-to="3"></li>
                          <li data-target=".carousel" data-slide-to="4"></li>
                          <li data-target=".carousel" data-slide-to="5"></li>
          
                        </ol>
          
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                          <div class="item active">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-941.jpg">
                            <div class="carousel-caption"> #1</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-101.jpg">
                            <div class="carousel-caption"> #2</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-1051.jpg">
                            <div class="carousel-caption"> #3</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #4</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #5</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #6</div>
                          </div>
                        </div>
          
                        <!-- Controls -->
                        <a class="left carousel-control" href=".carousel" role="button" data-slide="prev">
                          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                          <span class="sr-only">Geri</span>
                        </a>
                        <a class="right carousel-control" href=".carousel" role="button" data-slide="next">
                          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                          <span class="sr-only">İleri</span>
                        </a>
                      </div>
                    </section>
      
      
                    <!--begin::Body-->
                    <div class="card-body pt-4" style="flex: 1 1 auto; padding: 1px 2rem 2rem 2rem!important;">
                      <span class="text-dark-75 font-weight-bolder" style="font-size: 20px !important;">제목이 올자리</span>
                      <!--begin::Info-->
                      <div class="mb-7">
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">#부제목 #올자리</span>
                        </div>
                        <div class="justify-content-between align-items-center my-1">
                          <span class="text-dark-75 font-weight-bolder mr-2">최소 이용금액:</span>
                          <a href="#" class="text-muted text-hover-primary">$76,810</a>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">Due Date:</span>
                          <span class="text-muted font-weight-bold" style="">21.05.2016</span>
                        </div>
                      </div>
                      <!--end::Info-->
                      <a href="#" class="btn btn-block btn-sm btn-light-success font-weight-bolder text-uppercase py-4">예약하기</a>
                    </div>
                    <!--end::Body-->
                  </div>
                  <!--end:: Card-->
                </div>
                <!--end::Col-->
  
  
                <!--begin::Col-->
                <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                  <!--begin::Card-->
                  <div class="card card-custom gutter-b card-stretch">
      
                    <section class="awSlider">
                      <div  class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                          <li data-target=".carousel" data-slide-to="0" class="active"></li>
                          <li data-target=".carousel" data-slide-to="1"></li>
                          <li data-target=".carousel" data-slide-to="2"></li>
                          <li data-target=".carousel" data-slide-to="3"></li>
                          <li data-target=".carousel" data-slide-to="4"></li>
                          <li data-target=".carousel" data-slide-to="5"></li>
          
                        </ol>
          
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                          <div class="item active">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-941.jpg">
                            <div class="carousel-caption"> #1</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-101.jpg">
                            <div class="carousel-caption"> #2</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-1051.jpg">
                            <div class="carousel-caption"> #3</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #4</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #5</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #6</div>
                          </div>
                        </div>
          
                        <!-- Controls -->
                        <a class="left carousel-control" href=".carousel" role="button" data-slide="prev">
                          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                          <span class="sr-only">Geri</span>
                        </a>
                        <a class="right carousel-control" href=".carousel" role="button" data-slide="next">
                          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                          <span class="sr-only">İleri</span>
                        </a>
                      </div>
                    </section>
      
      
                    <!--begin::Body-->
                    <div class="card-body pt-4" style="flex: 1 1 auto; padding: 1px 2rem 2rem 2rem!important;">
                      <span class="text-dark-75 font-weight-bolder" style="font-size: 20px !important;">제목이 올자리</span>
                      <!--begin::Info-->
                      <div class="mb-7">
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">#부제목 #올자리</span>
                        </div>
                        <div class="justify-content-between align-items-center my-1">
                          <span class="text-dark-75 font-weight-bolder mr-2">최소 이용금액:</span>
                          <a href="#" class="text-muted text-hover-primary">$76,810</a>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">Due Date:</span>
                          <span class="text-muted font-weight-bold" style="">21.05.2016</span>
                        </div>
                      </div>
                      <!--end::Info-->
                      <a href="#" class="btn btn-block btn-sm btn-light-success font-weight-bolder text-uppercase py-4">예약하기</a>
                    </div>
                    <!--end::Body-->
                  </div>
                  <!--end:: Card-->
                </div>
                <!--end::Col-->
  
                <!--begin::Col-->
                <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                  <!--begin::Card-->
                  <div class="card card-custom gutter-b card-stretch">
      
                    <section class="awSlider">
                      <div  class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                          <li data-target=".carousel" data-slide-to="0" class="active"></li>
                          <li data-target=".carousel" data-slide-to="1"></li>
                          <li data-target=".carousel" data-slide-to="2"></li>
                          <li data-target=".carousel" data-slide-to="3"></li>
                          <li data-target=".carousel" data-slide-to="4"></li>
                          <li data-target=".carousel" data-slide-to="5"></li>
          
                        </ol>
          
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                          <div class="item active">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-941.jpg">
                            <div class="carousel-caption"> #1</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-101.jpg">
                            <div class="carousel-caption"> #2</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-1051.jpg">
                            <div class="carousel-caption"> #3</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #4</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #5</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #6</div>
                          </div>
                        </div>
          
                        <!-- Controls -->
                        <a class="left carousel-control" href=".carousel" role="button" data-slide="prev">
                          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                          <span class="sr-only">Geri</span>
                        </a>
                        <a class="right carousel-control" href=".carousel" role="button" data-slide="next">
                          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                          <span class="sr-only">İleri</span>
                        </a>
                      </div>
                    </section>
      
      
                    <!--begin::Body-->
                    <div class="card-body pt-4" style="flex: 1 1 auto; padding: 1px 2rem 2rem 2rem!important;">
                      <span class="text-dark-75 font-weight-bolder" style="font-size: 20px !important;">제목이 올자리</span>
                      <!--begin::Info-->
                      <div class="mb-7">
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">#부제목 #올자리</span>
                        </div>
                        <div class="justify-content-between align-items-center my-1">
                          <span class="text-dark-75 font-weight-bolder mr-2">최소 이용금액:</span>
                          <a href="#" class="text-muted text-hover-primary">$76,810</a>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">Due Date:</span>
                          <span class="text-muted font-weight-bold" style="">21.05.2016</span>
                        </div>
                      </div>
                      <!--end::Info-->
                      <a href="#" class="btn btn-block btn-sm btn-light-success font-weight-bolder text-uppercase py-4">예약하기</a>
                    </div>
                    <!--end::Body-->
                  </div>
                  <!--end:: Card-->
                </div>
                <!--end::Col-->
  
  
                <!--begin::Col-->
                <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                  <!--begin::Card-->
                  <div class="card card-custom gutter-b card-stretch">
      
                    <section class="awSlider">
                      <div  class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                          <li data-target=".carousel" data-slide-to="0" class="active"></li>
                          <li data-target=".carousel" data-slide-to="1"></li>
                          <li data-target=".carousel" data-slide-to="2"></li>
                          <li data-target=".carousel" data-slide-to="3"></li>
                          <li data-target=".carousel" data-slide-to="4"></li>
                          <li data-target=".carousel" data-slide-to="5"></li>
          
                        </ol>
          
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                          <div class="item active">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-941.jpg">
                            <div class="carousel-caption"> #1</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-101.jpg">
                            <div class="carousel-caption"> #2</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-1051.jpg">
                            <div class="carousel-caption"> #3</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #4</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #5</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #6</div>
                          </div>
                        </div>
          
                        <!-- Controls -->
                        <a class="left carousel-control" href=".carousel" role="button" data-slide="prev">
                          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                          <span class="sr-only">Geri</span>
                        </a>
                        <a class="right carousel-control" href=".carousel" role="button" data-slide="next">
                          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                          <span class="sr-only">İleri</span>
                        </a>
                      </div>
                    </section>
      
      
                    <!--begin::Body-->
                    <div class="card-body pt-4" style="flex: 1 1 auto; padding: 1px 2rem 2rem 2rem!important;">
                      <span class="text-dark-75 font-weight-bolder" style="font-size: 20px !important;">제목이 올자리</span>
                      <!--begin::Info-->
                      <div class="mb-7">
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">#부제목 #올자리</span>
                        </div>
                        <div class="justify-content-between align-items-center my-1">
                          <span class="text-dark-75 font-weight-bolder mr-2">최소 이용금액:</span>
                          <a href="#" class="text-muted text-hover-primary">$76,810</a>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">Due Date:</span>
                          <span class="text-muted font-weight-bold" style="">21.05.2016</span>
                        </div>
                      </div>
                      <!--end::Info-->
                      <a href="#" class="btn btn-block btn-sm btn-light-success font-weight-bolder text-uppercase py-4">예약하기</a>
                    </div>
                    <!--end::Body-->
                  </div>
                  <!--end:: Card-->
                </div>
                <!--end::Col-->
  
  
                <!--begin::Col-->
                <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                  <!--begin::Card-->
                  <div class="card card-custom gutter-b card-stretch">
      
                    <section class="awSlider">
                      <div  class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                          <li data-target=".carousel" data-slide-to="0" class="active"></li>
                          <li data-target=".carousel" data-slide-to="1"></li>
                          <li data-target=".carousel" data-slide-to="2"></li>
                          <li data-target=".carousel" data-slide-to="3"></li>
                          <li data-target=".carousel" data-slide-to="4"></li>
                          <li data-target=".carousel" data-slide-to="5"></li>
          
                        </ol>
          
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                          <div class="item active">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-941.jpg">
                            <div class="carousel-caption"> #1</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-101.jpg">
                            <div class="carousel-caption"> #2</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-1051.jpg">
                            <div class="carousel-caption"> #3</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #4</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #5</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #6</div>
                          </div>
                        </div>
          
                        <!-- Controls -->
                        <a class="left carousel-control" href=".carousel" role="button" data-slide="prev">
                          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                          <span class="sr-only">Geri</span>
                        </a>
                        <a class="right carousel-control" href=".carousel" role="button" data-slide="next">
                          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                          <span class="sr-only">İleri</span>
                        </a>
                      </div>
                    </section>
      
      
                    <!--begin::Body-->
                    <div class="card-body pt-4" style="flex: 1 1 auto; padding: 1px 2rem 2rem 2rem!important;">
                      <span class="text-dark-75 font-weight-bolder" style="font-size: 20px !important;">제목이 올자리</span>
                      <!--begin::Info-->
                      <div class="mb-7">
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">#부제목 #올자리</span>
                        </div>
                        <div class="justify-content-between align-items-center my-1">
                          <span class="text-dark-75 font-weight-bolder mr-2">최소 이용금액:</span>
                          <a href="#" class="text-muted text-hover-primary">$76,810</a>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">Due Date:</span>
                          <span class="text-muted font-weight-bold" style="">21.05.2016</span>
                        </div>
                      </div>
                      <!--end::Info-->
                      <a href="#" class="btn btn-block btn-sm btn-light-success font-weight-bolder text-uppercase py-4">예약하기</a>
                    </div>
                    <!--end::Body-->
                  </div>
                  <!--end:: Card-->
                </div>
                <!--end::Col-->
  
  
                <!--begin::Col-->
                <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                  <!--begin::Card-->
                  <div class="card card-custom gutter-b card-stretch">
      
                    <section class="awSlider">
                      <div  class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                          <li data-target=".carousel" data-slide-to="0" class="active"></li>
                          <li data-target=".carousel" data-slide-to="1"></li>
                          <li data-target=".carousel" data-slide-to="2"></li>
                          <li data-target=".carousel" data-slide-to="3"></li>
                          <li data-target=".carousel" data-slide-to="4"></li>
                          <li data-target=".carousel" data-slide-to="5"></li>
          
                        </ol>
          
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                          <div class="item active">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-941.jpg">
                            <div class="carousel-caption"> #1</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-101.jpg">
                            <div class="carousel-caption"> #2</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-1051.jpg">
                            <div class="carousel-caption"> #3</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #4</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #5</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #6</div>
                          </div>
                        </div>
          
                        <!-- Controls -->
                        <a class="left carousel-control" href=".carousel" role="button" data-slide="prev">
                          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                          <span class="sr-only">Geri</span>
                        </a>
                        <a class="right carousel-control" href=".carousel" role="button" data-slide="next">
                          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                          <span class="sr-only">İleri</span>
                        </a>
                      </div>
                    </section>
      
      
                    <!--begin::Body-->
                    <div class="card-body pt-4" style="flex: 1 1 auto; padding: 1px 2rem 2rem 2rem!important;">
                      <span class="text-dark-75 font-weight-bolder" style="font-size: 20px !important;">제목이 올자리</span>
                      <!--begin::Info-->
                      <div class="mb-7">
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">#부제목 #올자리</span>
                        </div>
                        <div class="justify-content-between align-items-center my-1">
                          <span class="text-dark-75 font-weight-bolder mr-2">최소 이용금액:</span>
                          <a href="#" class="text-muted text-hover-primary">$76,810</a>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">Due Date:</span>
                          <span class="text-muted font-weight-bold" style="">21.05.2016</span>
                        </div>
                      </div>
                      <!--end::Info-->
                      <a href="#" class="btn btn-block btn-sm btn-light-success font-weight-bolder text-uppercase py-4">예약하기</a>
                    </div>
                    <!--end::Body-->
                  </div>
                  <!--end:: Card-->
                </div>
                <!--end::Col-->
  
  
                <!--begin::Col-->
                <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                  <!--begin::Card-->
                  <div class="card card-custom gutter-b card-stretch">
      
                    <section class="awSlider">
                      <div  class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                          <li data-target=".carousel" data-slide-to="0" class="active"></li>
                          <li data-target=".carousel" data-slide-to="1"></li>
                          <li data-target=".carousel" data-slide-to="2"></li>
                          <li data-target=".carousel" data-slide-to="3"></li>
                          <li data-target=".carousel" data-slide-to="4"></li>
                          <li data-target=".carousel" data-slide-to="5"></li>
          
                        </ol>
          
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                          <div class="item active">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-941.jpg">
                            <div class="carousel-caption"> #1</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-101.jpg">
                            <div class="carousel-caption"> #2</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-1051.jpg">
                            <div class="carousel-caption"> #3</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #4</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #5</div>
                          </div>
                          <div class="item">
                            <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
                            <div class="carousel-caption"> #6</div>
                          </div>
                        </div>
          
                        <!-- Controls -->
                        <a class="left carousel-control" href=".carousel" role="button" data-slide="prev">
                          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                          <span class="sr-only">Geri</span>
                        </a>
                        <a class="right carousel-control" href=".carousel" role="button" data-slide="next">
                          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                          <span class="sr-only">İleri</span>
                        </a>
                      </div>
                    </section>
      
      
                    <!--begin::Body-->
                    <div class="card-body pt-4" style="flex: 1 1 auto; padding: 1px 2rem 2rem 2rem!important;">
                      <span class="text-dark-75 font-weight-bolder" style="font-size: 20px !important;">제목이 올자리</span>
                      <!--begin::Info-->
                      <div class="mb-7">
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">#부제목 #올자리</span>
                        </div>
                        <div class="justify-content-between align-items-center my-1">
                          <span class="text-dark-75 font-weight-bolder mr-2">최소 이용금액:</span>
                          <a href="#" class="text-muted text-hover-primary">$76,810</a>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">Due Date:</span>
                          <span class="text-muted font-weight-bold" style="">21.05.2016</span>
                        </div>
                      </div>
                      <!--end::Info-->
                      <a href="#" class="btn btn-block btn-sm btn-light-success font-weight-bolder text-uppercase py-4">예약하기</a>
                    </div>
                    <!--end::Body-->
                  </div>
                  <!--end:: Card-->
                </div>
                <!--end::Col-->
                
                
              </div>
              <!--begin::Row-->
            </div>
            <!------------------ 본문 종료 ------------------>
          
          </div>
        
        
        
        
        </div>
      
      </div>
      <!--컨테이너 종료-->
      <!--footer.html Include-->
      <jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</body>
<!----------------Body 종료----------------------->
<script>
  
  /*
    <ol class="carousel-indicators">
      <li data-target=".carousel" data-slide-to="0" class="active"></li>
      <li data-target=".carousel" data-slide-to="1"></li>
      <li data-target=".carousel" data-slide-to="2"></li>
      <li data-target=".carousel" data-slide-to="3"></li>
      <li data-target=".carousel" data-slide-to="4"></li>
      <li data-target=".carousel" data-slide-to="5"></li>
    </ol>
  * */



  // cafe, room의 이미지 개수만큼 이미지 슬라이드 버튼을 동적 생성
 /* for (let i = 0; i < 6; i++) {
    $li = $('<li>', {
      "data-target"  : ".carousel",
      "data-slide-to": i,
    });
    $('.carousel-indicators').append($li); // ol에 넣고
    // 첫번째 버튼은 active

    let $div = $('<div>').addClass("item")
                         .append($('<img>').attr("img", "사진1"));

    $('.carousel-inner').append($div);
    // 첫번째 버튼은 active
  }

  let $aPrev = $('<a>', {
    class       : "left carousel-control",
    href        : ".carousel",
    role        : "button",
    "data-slide": "prev"
  }).append(
      $('<span>', {
        class        : "glyphicon glyphicon-chevron-left",
        "aria-hidden": ".true"
      }))

  let $aNext = $('<a>', {
    class       : "left carousel-control",
    href        : ".carousel",
    role        : "button",
    "data-slide": "next"
  }).append(
      $('<span>', {
        class        : "glyphicon glyphicon-chevron-right",
        "aria-hidden": ".true"
      }))

  let templet =
          `     <!--begin::Col-->
                <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                  <!--begin::Card-->
                  <div class="card card-custom gutter-b card-stretch">
                    
                    <section class="awSlider">
                      <div  class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                        </ol>
      
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                        </div>
      
                        <!-- Controls $aPrev $aNext -->
                        
                      </div>
                    </section>
                    
                   
                      <!--begin::Body-->
                    <div class="card-body pt-4" style="flex: 1 1 auto; padding: 1px 2rem 2rem 2rem!important;">
                      <span class="text-dark-75 font-weight-bolder" style="font-size: 20px !important;">`
  data.cafe_main_title`</span>
                      <!--begin::Info-->
                      <div class="mb-7">
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 mr-2">`
  data.cafe_sub_title`</span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center my-1">
                      
                          <span class="text-dark-75 font-weight-bolder" style="color: #bf7e00; font-size: 18px !important;">2,800
                            <em class="text-dark-75"  style="font-size: 10px !important;">원/시간</em>
                          </span>
                          
                          
                          <span class="text-dark-75 " style="float: right; margin-top: 10px"><i
                            class="fa fa-users" ></i> 최대 10인</span>
                      
                        </div>
                   
                      </div>
                      <!--end::Info-->
                      <a href="detail링크" class="btn btn-block btn-sm btn-light-success font-weight-bolder text-uppercase py-4">예약하기</a>
                    </div>
                    <!--end::Body-->
                  </div>
                  <!--end:: Card-->
                </div>
                <!--end::Col-->`
              
              */
              
  console.log("g힘들어잉")
  
  
  
  
  
  
  
  
  
  
  $(document).ready(function(){
    start.init();
    console.log("start.init();")

  });
  
  var start = {
    param : {
      curPage : 1,
      pageListSize : 18,
    },

    init : function() {
      this.testData();
      this.testEvent();
    },
    testData : function() {
      this.setListItems("${firstData}"); // 첫 진입시 데이터 셋팅
    },
    testEvent : function() {
      // 무한 스크롤
      $(window).scroll(function() {
        console.log("scroll;")

        // 맨 밑으로 스크롤이 갔을경우 if문을 탑니다.
        if($(window).scrollTop() == $(document).height() - $(window).height()) {
          console.log("scrollTop;")
          start.param.curPage++; // 현재 페이지에서 +1 처리.

          start.testAjax(); //ajax 호출
        }
      });
    },
    // 무한 스크롤 ajax 요청
    testAjax : function() {
      $.ajax({
               type     : 'POST',
               url      : '/cafe/listData',
               data     : JSON.stringify(start.param), // 다음 페이지 번호와 페이지 사이즈를 가지고 갑니다.
               dataType : 'json',
               contentType: "application/json",
               success : successCallback,
               error : errorCallback
             });
      // 성공
      function successCallback(data) {
        console.log("data: " + data);
        // if(data.testList.totListSize == 0 ){
        //   $(".gridList").append('<div class="noList"><span>표시할 항목이 없습니다.</span></div>');
        // }
        // if(JSON.parse(data.testList).length != 0){
        //   // testLoading.show(); //로딩 on(로딩바가 있을경우만 넣습니다. 없을경우 빼셔도 상관 없습니다.)
        //   start.setListItems(JSON.parse(data.testList));  //테스트 데이터 리스트 입니다.
        //   // testLoading.hide(); //로딩 off(로딩바가 있을경우만 넣습니다. 없을경우 빼셔도 상관 없습니다.)
        // }
      }

      // 실패
      function errorCallback() {
        alert("실패");
      }
    },

    // 테스트 데이터 setting
    setListItems : function (list) {
      $.each(list, function(i, testData) {

        console.log("?이건가")
        // // 부모 엘리먼트에 append 할 데이터를 셋팅한다.
        // var $li = $('<li>')
        // .append($('<div>').text(testData.name))
        // .append($('<div>').text(testData.phoneNm))
        // .append($('<div>')
        //         .append($('<span>').text(testData.birth)));
        //
        //
        // // 부모 엘리먼트에 append
        // $('#test_list').append($li);
      })
    }
  }


</script>
</html>