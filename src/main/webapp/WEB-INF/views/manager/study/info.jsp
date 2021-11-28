<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib	uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<%@taglib	uri="http://java.sun.com/jsp/jstl/fmt"	prefix="fmt" %>
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
    <title>관리자::스터디 상세정보</title>
    <!--head.html Include-->
    <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>
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
                                <i class="far fa-list-alt"></i>
                                <h5 class="text-dark font-weight-bolder mt-2 mb-2 mr-5">스터디 상세정보</h5>
                                <!--end::Title-->
                                <!--Breadcrumb : 로드맵 시작-->
                                <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                                    <li class="breadcrumb-item">
                                        <a href="" class="text-muted">관리자 페이지</a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="" class="text-muted">스터디 관리</a>
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
                                    <a href="javascript:history.back();">
                                        <i class="fas fa-arrow-left icon-xl"></i>
                                    </a>
                                <h3 class="ml-8 card-label">
                                    어쩌구의 상세정보
                                </h3>
                                </div>
                                <div class="card-toolbar">
                                    <span>현재 상태 : </span>
                                      <span class="label label-inline mb-0">
                                          모집중
                                      </span>
                                </div>
                            </div>
                            <!--end::Header-->
                            <!--begin::Body 북마크-->
                            <div class="card-body">
                                <!--begin: Datatable 내용-->
                                <div class="mng_info w-75 flex-column align-items-center">
                                    <%------ 테이블 시작-------%>
                                    <table class=" table">
                                        <%--스터디 번호 / 유형--%>
                                        <tr>
                                            <td> 번호</td>
                                            <td>
                                               25554
                                            </td>

                                            <td> 유형 </td>
                                            <td>
                                                <span class="label label-inline mb-0">
                                                    챌린지
                                                </span>
                                            </td>
                                        </tr>

                                        <%--스터디 제목--%>
                                        <tr>
                                            <td> 제목 </td>
                                            <td colspan="3">
                                                <a href="">
                                                    십자수 어쩌구
                                                </a>

                                            </td>
                                        </tr>

                                        <%--스터디 개설자 / 개설일자--%>
                                        <tr>
                                            <td> 개설자 </td>
                                            <td>
                                                <a href="">
                                                    닉네임 어쩌구
                                                </a>

                                            </td>

                                            <td> 개설일 </td>
                                            <td>
                                                2021/12/06
                                            </td>
                                        </tr>

                                        <%--스터디 시작일자 / 종료일자--%>
                                        <tr>
                                            <td> 시작일 </td>
                                            <td>
                                                2021/12/11
                                            </td>

                                            <td> 종료일 </td>
                                            <td>
                                                2021/12/30
                                            </td>
                                        </tr>

                                        <%--챌린지 유형 / 챌린지 지역 --%>
                                        <tr>
                                            <td> 챌린지 유형 </td>
                                            <td>
                                                  <span class="label label-inline mb-0">
                                                꾸준히 어쩌구
                                                  </span>
                                            </td>

                                            <td> 챌린지 지역 </td>
                                            <td>
                                                서울
                                            </td>
                                        </tr>
                                    </table>
                                    <%------ 테이블 종료-------%>
                                        <%------ 모집글 -------%>
                                        <div class="accordion accordion-light accordion-light-borderless accordion-svg-toggle mb-8"
                                             id="accordionExample7">

                                            <div class="card">
                                                <%------ 모집글 제목 -------%>
                                                <div class="card-header" id="headingTwo7">
                                                    <div class="card-title collapsed" data-toggle="collapse"
                                                         data-target="#collapseTwo7">
                                                        <span class="svg-icon svg-icon-primary">
                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                 width="24px" height="24px"
                                                                 viewBox="0 0 24 24" version="1.1">
                                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                            <polygon points="0 0 24 0 24 24 0 24"></polygon>
                                                            <path d="M12.2928955,6.70710318 C11.9023712,6.31657888 11.9023712,5.68341391
                                                            12.2928955,5.29288961 C12.6834198,4.90236532 13.3165848,4.90236532 13.7071091,5.29288961
                                                            L19.7071091,11.2928896 C20.085688,11.6714686 20.0989336,12.281055 19.7371564,12.675721 L14.2371564,18.675721
                                                            C13.863964,19.08284 13.2313966,19.1103429 12.8242777,18.7371505 C12.4171587,18.3639581 12.3896557,17.7313908
                                                            12.7628481,17.3242718 L17.6158645,12.0300721 L12.2928955,6.70710318 Z"
                                                                  fill="#000000" fill-rule="nonzero">
                                                            </path>
                                                            <path d="M3.70710678,15.7071068 C3.31658249,16.0976311 2.68341751,16.0976311 2.29289322,15.7071068 C1.90236893,15.3165825
                                                            1.90236893,14.6834175 2.29289322,14.2928932 L8.29289322,8.29289322 C8.67147216,7.91431428 9.28105859,7.90106866
                                                            9.67572463,8.26284586 L15.6757246,13.7628459 C16.0828436,14.1360383 16.1103465,14.7686056 15.7371541,15.1757246
                                                            C15.3639617,15.5828436 14.7313944,15.6103465 14.3242754,15.2371541 L9.03007575,10.3841378 L3.70710678,15.7071068 Z"
                                                                  fill="#000000" fill-rule="nonzero" opacity="0.3"
                                                                  transform="translate(9.000003, 11.999999) rotate(-270.000000) translate(-9.000003, -11.999999) ">
                                                            </path>
                                                            </g> </svg>
                                                        </span>
                                                        <div class="card-label pl-4 font-weight-bolder text-hover-primary">모집글 제목</div>
                                                    </div>
                                                </div>
                                                    <%------ 모집글 내용 -------%>
                                                <div id="collapseTwo7" class="collapse"
                                                     data-parent="#accordionExample7">
                                                    <div class="card-body pl-12 font-weight-light">
                                                       모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용
                                                        모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용
                                                        모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용
                                                        모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용 모집글 내용
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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