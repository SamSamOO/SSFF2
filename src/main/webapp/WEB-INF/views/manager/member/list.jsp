<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2021-11-09
  Time: 오후 3:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <title>title</title>
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
                                <i class="fas fa-users"></i>&nbsp;&nbsp;
                                <h5 class="text-dark font-weight-bold mt-2 mb-2 mr-5">회원 목록</h5>
                                <!--end::Title-->
                                <!--Breadcrumb : 로드맵 시작-->
                                <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                                    <li class="breadcrumb-item">
                                        <a href="" class="text-muted">관리자 페이지</a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="" class="text-muted">회원 관리</a>
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
                                    <span class="text-dark-50 font-weight-bold" id="kt_subheader_total">??? Total</span>
                                    <form class="ml-5">
                                        <div class="input-group input-group-sm input-group-solid"
                                             style="max-width: 175px">
                                            <input type="text" class="form-control" id="kt_subheader_search_form"
                                                   placeholder="Search..."/>
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
                            <!--begin::Body-->
                            <div class="card-body">
                                <!--begin: Datatable-->
                                <%--                                <div class="datatable datatable-bordered datatable-head-custom" id="kt_datatable"></div>--%>


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
            <!--컨테이너 종료-->
            <!--footer.html Include-->
            <jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</body>
<!----------------Body 종료----------------------->

</html>