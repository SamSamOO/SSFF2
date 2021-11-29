<%-- Created by IntelliJ IDEA. User: bitcamp Date: 2021-11-09 Time: 오후 3:45 To change this template use File | Settings
    | File Templates. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<!--
Template Name: Metronic - Bootstrap 4 HTML, React, Angular 10 & VueJS Admin Dashboard Theme
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Dribbble: www.dribbble.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: https://1.envato.market/EA4JP
Renew Support: https://1.envato.market/EA4JP
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<html lang="en">
<!----------------Head 시작----------------------->

<head>
  <title>관리자::예약 정보</title>
  <!--head.html Include-->
  <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>
  <link href="/resources/assets/css/style.list.css" rel="stylesheet" type="text/css"/>
</head>

<!----------------Head 종료----------------------->
<!----------------Body 시작----------------------->


<body id="kt_body" class="header-fixed subheader-enabled page-loading">
<!----------------메인 시작----------------------->
<div class="d-flex flex-column flex-root">
  <!----------------페이지 시작----------------------->
  <div class="d-flex flex-row flex-column-fluid page">
    <!--begin::Wrapper-->
    <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
      <!--header.html Include-->
      <jsp:include page="/WEB-INF/commons/header.jsp"></jsp:include>
      <!------------------Header Wrapper : 메뉴 탭 시작------------------>
      <!--menu.html Include-->
      <jsp:include page="/WEB-INF/commons/menu_admin.jsp"></jsp:include>
      <!------------------Header Wrapper : 메뉴 탭 종료------------------>
      <!--컨테이너 시작-->
      <div class="d-flex flex-row flex-column-fluid container">
        <!--contents.html Include-->
        
        <!--begin::Content Wrapper 내용물 시작-->
        <div class="main d-flex flex-column flex-row-fluid">
          <!--begin::Subheader 페이지 서브 헤더 시작-->
          <div class="subheader py-2 py-lg-4" id="kt_subheader">
            <div class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
              <!--begin::Details-->
              <div class="d-flex align-items-center flex-wrap mr-2">
                <!--begin::Title-->
                <i class="far fa-list-alt"></i>&nbsp;&nbsp;
                <h5 class="text-dark font-weight-bolder mt-2 mb-2 mr-5">카페 예약 목록</h5>
                <!--end::Title-->
                <!--Breadcrumb : 로드맵 시작-->
                <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                  <li class="breadcrumb-item">
                    <a href="" class="text-muted">관리자 페이지</a>
                  </li>
                  <li class="breadcrumb-item">
                    <a href="" class="text-muted">스터디 카페 관리</a>
                  </li>
                </ul>
                <!--Breadcrumb : 로드맵 종료-->
              </div>
              <!--end::Details-->
            </div>
          </div>
          <!--end::Subheader  페이지 서브 헤더 종료-->
          <div class="content flex-column-fluid" id="kt_content">
            <!--begin::Card-->
            <div class="card card-custom">
              <!--begin::Header-->
              <div class="card-header flex-wrap border-0 pt-6 pb-0">
                <div class="card-title">
                  <h3 class="card-label"></h3>
                </div>
                <!--begin::Search Form 검색-->
                <div class="d-flex align-items-center" id="kt_subheader_search">
                                                <span class="text-dark-50 font-weight-bold" id="kt_subheader_total">???
                                                    Total</span>
                  <form class="ml-5">
                    <div class="input-group input-group-sm input-group-solid">
                      <input type="text" class="form-control"
                             id="kt_subheader_search_form" placeholder="Search..."/>
                      <div class="input-group-append">
                                                            <span class="input-group-text">
                                                                <i class="flaticon2-search-1 icon-sm"></i>
                                                            </span>
                      </div>
                    </div>
                  </form>
                </div>
                <!--end::Search Form-->
              </div>
              <!--end::Header-->
              <!--begin::Body 북마크-->
              <div class="card-body">
                <!--begin::Card 카테고리 항목 접기 시작-->
                <%------ 검색필터 -------%>
                <%--                                <div class="accordion accordion-light accordion-light-borderless accordion-svg-toggle mb-8"--%>
                <%--                                     id="accordionExample7">--%>
                
                <%--                                    <div class="card">--%>
                <%--                                        <div class="card-header" id="headingTwo7">--%>
                <%--                                            <div class="card-title collapsed" data-toggle="collapse"--%>
                <%--                                                 data-target="#collapseTwo7">--%>
                <%--                                                        <span class="svg-icon svg-icon-primary">--%>
                <%--                                                            <svg xmlns="http://www.w3.org/2000/svg"--%>
                <%--                                                                 width="24px" height="24px"--%>
                <%--                                                                 viewBox="0 0 24 24" version="1.1">--%>
                <%--                                                            <g stroke="none" stroke-width="1" fill="none"--%>
                <%--                                                               fill-rule="evenodd">--%>
                <%--                                                            <polygon points="0 0 24 0 24 24 0 24"></polygon>--%>
                <%--                                                            <path d="M12.2928955,6.70710318 C11.9023712,6.31657888 11.9023712,5.68341391--%>
                <%--                                                            12.2928955,5.29288961 C12.6834198,4.90236532 13.3165848,4.90236532 13.7071091,5.29288961--%>
                <%--                                                            L19.7071091,11.2928896 C20.085688,11.6714686 20.0989336,12.281055 19.7371564,12.675721 L14.2371564,18.675721--%>
                <%--                                                            C13.863964,19.08284 13.2313966,19.1103429 12.8242777,18.7371505 C12.4171587,18.3639581 12.3896557,17.7313908--%>
                <%--                                                            12.7628481,17.3242718 L17.6158645,12.0300721 L12.2928955,6.70710318 Z"--%>
                <%--                                                                  fill="#000000" fill-rule="nonzero">--%>
                <%--                                                            </path>--%>
                <%--                                                            <path d="M3.70710678,15.7071068 C3.31658249,16.0976311 2.68341751,16.0976311 2.29289322,15.7071068 C1.90236893,15.3165825--%>
                <%--                                                            1.90236893,14.6834175 2.29289322,14.2928932 L8.29289322,8.29289322 C8.67147216,7.91431428 9.28105859,7.90106866--%>
                <%--                                                            9.67572463,8.26284586 L15.6757246,13.7628459 C16.0828436,14.1360383 16.1103465,14.7686056 15.7371541,15.1757246--%>
                <%--                                                            C15.3639617,15.5828436 14.7313944,15.6103465 14.3242754,15.2371541 L9.03007575,10.3841378 L3.70710678,15.7071068 Z"--%>
                <%--                                                                  fill="#000000" fill-rule="nonzero" opacity="0.3"--%>
                <%--                                                                  transform="translate(9.000003, 11.999999) rotate(-270.000000) translate(-9.000003, -11.999999) ">--%>
                <%--                                                            </path>--%>
                <%--                                                            </g> </svg>--%>
                <%--                                                        </span>--%>
                <%--                                                <div class="card-label pl-4 font-weight-bolder text-hover-primary">검색 필터--%>
                <%--                                                </div>--%>
                <%--                                            </div>--%>
                <%--                                        </div>--%>
                <%--                                        <div id="collapseTwo7" class="collapse"--%>
                <%--                                             data-parent="#accordionExample7">--%>
                <%--                                            <div class="card-body pl-12 font-weight-light">--%>
                <%--                                                <div id="filter_1">--%>
                <%--                                                    <h6 class="font-weight-bolder text-ssff2 mb-2">스터디 타입</h6>--%>
                <%--                                                    <ul class="list-inline checklist">--%>
                <%--                                                        <li class="d-inline-flex">--%>
                <%--                                                            <span class="mr-2 w-20px">--%>
                <%--                                                                <label class="checkbox checkbox-single checkbox-all mr-4">--%>
                <%--                                                                    <input type="checkbox">&nbsp;<span></span>--%>
                <%--                                                                </label>--%>
                <%--                                                            </span>--%>
                <%--                                                            전체--%>
                <%--                                                        </li>--%>
                
                <%--                                                        <li class="d-inline-flex">--%>
                <%--															<span class="mr-2 w-20px">--%>
                <%--																<label class="checkbox checkbox-single">--%>
                <%--																	<input type="checkbox" value="1">&nbsp;<span></span>--%>
                <%--																</label>--%>
                <%--															</span>--%>
                <%--                                                            프로젝트--%>
                <%--                                                        </li>--%>
                
                <%--                                                        <li class="d-inline-flex">--%>
                <%--															<span class="mr-2 w-20px">--%>
                <%--																<label class="checkbox checkbox-single">--%>
                <%--																	<input type="checkbox" value="2">&nbsp;<span></span>--%>
                <%--																</label>--%>
                <%--															</span>--%>
                <%--                                                            챌린지--%>
                <%--                                                        </li>--%>
                <%--                                                    </ul>--%>
                <%--                                                </div>--%>
                
                <%--                                                &lt;%&ndash;  구분선&ndash;%&gt;--%>
                <%--                                                <div class="separator separator-solid mb-4"></div>--%>
                
                
                <%--                                                <div id="filter_2">--%>
                <%--                                                    <h6 class="font-weight-bolder text-ssff2 mb-2">진행</h6>--%>
                <%--                                                    <ul class="list-inline checklist">--%>
                <%--                                                        <li class="d-inline-flex">--%>
                <%--															<span class="mr-2 w-20px">--%>
                <%--																<label class="checkbox checkbox-single checkbox-all">--%>
                <%--																	<input type="checkbox">&nbsp;<span></span>--%>
                <%--																</label>--%>
                <%--															</span>--%>
                <%--                                                            전체--%>
                <%--                                                        </li>--%>
                
                <%--                                                        <li class="d-inline-flex">--%>
                <%--															<span class="mr-2 w-20px">--%>
                <%--																<label class="checkbox checkbox-single">--%>
                <%--																	<input type="checkbox" value="1">&nbsp;<span></span>--%>
                <%--																</label>--%>
                <%--															</span>--%>
                <%--                                                            진행 대기중--%>
                <%--                                                        </li>--%>
                
                <%--                                                        <li class="d-inline-flex">--%>
                <%--															<span class="mr-2 w-20px">--%>
                <%--																<label class="checkbox checkbox-single">--%>
                <%--																	<input type="checkbox" value="2">&nbsp;<span></span>--%>
                <%--																</label>--%>
                <%--															</span>--%>
                <%--                                                            진행중--%>
                <%--                                                        </li>--%>
                
                <%--                                                        <li class="d-inline-flex ml-n8">--%>
                <%--															<span class="mr-2 w-20px">--%>
                <%--																<label class="checkbox checkbox-single">--%>
                <%--																	<input type="checkbox" value="3">&nbsp;<span></span>--%>
                <%--																</label>--%>
                <%--															</span>--%>
                <%--                                                            종료--%>
                <%--                                                        </li>--%>
                
                <%--                                                    </ul>--%>
                <%--                                                </div>--%>
                <%--                                            </div>--%>
                <%--                                        </div>--%>
                <%--                                    </div>--%>
                <%--                                </div>--%>
                
                <%--                                <!--end::Card 카테고리 항목 접기 종료-->--%>
                <!--begin: Datatable-->
                <div class=" datatable-default datatable-primary"
                     id="kt_datatable">
                  <%------ 테이블 시작-------%>
                  <%------ 테이블 헤드-------%>
                  <table class="mng_cafe_list table table-hover">
                    <thead class="text-center">
                    <tr>
                      <th data-field="cafeNum"
                          class="studyIns_num">
                        <i class=""/>
                        카페 번호
                      </th>
                      <th data-field="StudyBoss"
                          class="studyIns_nick">
                        카페명
                      </th>
                      
                      <th data-field="StudyType"
                          class="studyIns_name">
                      
                      </th>
                      
                      <th data-field="StudyName"
                          class="study_name">
                        룸 번호
                      </th>
                      
                      <th data-field="StudyDate"
                          class="study_date">
                        방문 예정일
                      </th>
                      
                      <th data-field="StudyIng"
                          class="list_ing">
                        이용 시작 시간
                      </th>
                      
                      <th data-field="StudyIng"
                          class="list_ing">
                        이용 종료 시간
                      </th>
                      
                      
                      <th data-field="StudyIng"
                          class="list_ing">
                        예약자
                      </th>
                      
                      <th data-field="StudyIng"
                          class="list_ing">
                        상태
                      </th>
                      
                      <th class="list_action">
                        옵션
                      </th>
                    </thead>
                    
                    <%------ 테이블 바디-------%>
                    <tbody>
                    <tr data-row="0"
                        aria-label="1">
                      
                      <%--스터디번호--%>
                      <td class="study_num"
                          aria-label="스터디 번호"
                          data-field="StudyNum">
                        <div class="text-center">1</div>
                      </td>
                      
                      
                      <%--개설자--%>
                      <td data-field="StudyBoss"
                          aria-label="개설자"
                          class="study_nick">
                        <div class="d-flex align-items-center justify-content-center">
                          <a href="">
                                                        <span class="text-dark-75 font-weight-bolder font-size-lg mb-0 text-hover-primary">
                                                         523
                                                    </span>
                          </a>
                        </div>
                      </td>
                      
                      
                      <%--스터디 타입--%>
                      <td data-field="StudyType"
                          aria-label="스터디 타입"
                          class="study_type">
                        <div class="d-flex align-items-center justify-content-center">
                                                    <span class="text-dark-75 font-weight-bolder font-size-lg mb-0 text-hover-primary">
                                                        카페1
                                                    </span>
                        </div>
                      </td>
                      
                      <%--개설일자--%>
                      <td data-field="StudyDate"
                          aria-label="개설일자"
                          class="study_date">
                        <div class="d-flex align-items-center justify-content-center">
                                                    <span class="mb-0">
                                                       2
                                                    </span>
                        </div>
                      </td>
                      
                      
                      <%--개설일자--%>
                      <td data-field="StudyDate"
                          aria-label="개설일자"
                          class="study_date">
                        <div class="d-flex align-items-center justify-content-center">
                                                    <span class="mb-0">
                                                       2021/12/06
                                                    </span>
                        </div>
                      </td>
                      
                      
                      
                      <%--스터디명--%>
                      <td data-field="StudyName"
                          aria-label="스터디명"
                          class="study_name">
                        <div class="d-flex align-items-center justify-content-center">
                                                   <span class="mb-0">
                                                    16:00
                                                   </span>
                        </div>
                      </td>
                      
                      
                      <%--스터디명--%>
                      <td data-field="StudyName"
                          aria-label="스터디명"
                          class="study_name">
                        <div class="d-flex align-items-center justify-content-center">
                                                   <span class="mb-0">
                                                    20:00
                                                   </span>
                        </div>
                      </td>
                      
                      
                      
                      
                      <%--개설일자--%>
                      <td data-field="StudyDate"
                          aria-label="개설일자"
                          class="study_date">
                        <div class="d-flex align-items-center justify-content-center">
                                                    <span class="text-dark-75 font-weight-bolder font-size-lg mb-0 text-hover-primary">
                                                       홍길동
                                                    </span>
                        </div>
                      </td>
                      
                      <%--진행--%>
                      <td data-field="StudyIng"
                          aria-label="진행"
                          class="list_ing">
                        <div class="d-flex align-items-center justify-content-center">
                                                    <span class="mb-0 label label-inline">
                                                        완료
                                                    </span>
                        </div>
                      </td>
                      
                      <%--액션--%>
                      <td data-field="Actions"
                          aria-label="액션 버튼"
                          class="list_action text-center">
                        <%-- 스터디 모집글--%>
                        <a href="javascript:;"
                           class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2">
                          <i class="far fa-newspaper"></i>
                        </a>
                        <%-- 가입회원 목록 --%>
                        <a href="javascript:;"
                           class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2">
                          <i class="far fa-user-circle"></i>
                        </a>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                  <%------ 테이블 종료-------%>
                  
                  <%--------------아랫단 시작-----------%>
                  <div class="mt-10 d-flex justify-content-between align-items-center flex-wrap">
                    <%--------------페이지 리스트 버튼 시작-----------%>
                    <div class="d-flex flex-wrap py-2 mr-3">
                      <a href="#" class="btn btn-icon btn-light-primary mr-2 my-1"><i
                        class="ki ki-bold-double-arrow-back icon-xs"></i></a>
                      <a href="#" class="btn btn-icon btn-light-primary mr-2 my-1"><i
                        class="ki ki-bold-arrow-back icon-xs"></i></a>
                      
                      <a href="#"
                         class="btn btn-icon border-0 btn-hover-primary active mr-2 my-1">1</a>
                      <a href="#" class="btn btn-icon border-0 btn-hover-primary mr-2 my-1">2</a>
                      <a href="#" class="btn btn-icon border-0 btn-hover-primary mr-2 my-1">3</a>
                      <a href="#" class="btn btn-icon border-0 btn-hover-primary mr-2 my-1">4</a>
                      <a href="#" class="btn btn-icon border-0 btn-hover-primary mr-2 my-1">5</a>
                      <a href="#" class="btn btn-icon border-0 btn-hover-primary mr-2 my-1">6</a>
                      <a href="#" class="btn btn-icon border-0 btn-hover-primary mr-2 my-1">7</a>
                      <a href="#"
                         class="btn btn-icon border-0 btn-hover-primary mr-2 my-1">...</a>
                      
                      <a href="#" class="btn btn-icon btn-light-primary mr-2 my-1"><i
                        class="ki ki-bold-arrow-next icon-xs"></i></a>
                      <a href="#" class="btn btn-icon btn-light-primary mr-2 my-1"><i
                        class="ki ki-bold-double-arrow-next icon-xs"></i></a>
                    </div>
                    <%--------------페이지 리스트 버튼 종료-----------%>
                    <%--------------페이지 뷰수 설정 시작-----------%>
                    <div class="d-flex align-items-center py-3">
                      <select class="form-control text-primary font-weight-bold mr-4 border-0 bg-light-primary"
                              style="width: 75px;">
                        <option value="10">10</option>
                        <option value="20">20</option>
                        <option value="30">30</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                      </select>
                      <span class="text-muted">제바알 10 of 230 records</span>
                    </div>
                    <%--------------페이지 뷰수 설정 종료-----------%>
                  </div>
                  <%--------------아랫단 종료-----------%>
                  <!--end: Datatable-->
                </div>
                <!--end::Body-->
              </div>
              <!--end::Card-->
            </div>
            <!--end::Content-->
          </div>
          <!--end::Content Wrapper 내용물 종료-->
        </div>
      </div>
      <!--컨테이너 종료-->
      <!--footer.html Include-->
      <jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</body>
<!----------------Body 종료----------------------->

</html>