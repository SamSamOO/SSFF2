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
    <title>관리자::회원</title>
    <!--head.html Include-->
    <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js" integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link href="/resources/assets/css/style.list.css" rel="stylesheet" type="text/css"/>
    <script>

    </script>
</head>

<!----------------Head 종료----------------------->
<!----------------Body 시작----------------------->


<body id="kt_body" class="header-fixed subheader-enabled page-loading ">
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
                                <!--begin: Datatable-->
                                <div class=" datatable-default datatable-primary "
                                     id="">
                                    <%------ 테이블 시작-------%>
                                    <%------ 테이블 헤드-------%>
                                    <table class="user_list table table-hover">
                                        <thead class="text-center">
                                        <tr>
                                            <th scope="col">
                                                유저 번호
                                            </th>
                                            <th scope="col">
                                                유저 프로필
                                            </th>
                                            <th scope="col">
                                                유저 아이디
                                            </th>
                                            <th scope="col">
                                                유저 이름
                                            </th>
                                        <tr>
                                        </thead>

                                        <%------ 테이블 바디-------%>
                                        <tbody>
                                        <c:forEach items="${memberList}" var="list">

                                            <tr data-row="0"
                                                aria-label="1">

                                                    <%--회원번호--%>
                                                <td class="user_num"
                                                    aria-label="회원 번호"
                                                    data-field="UserNum">
                                                    <div class="text-center">
                                                            ${list.member_no}
                                                    </div>
                                                </td>


                                                    <%--닉네임--%>
                                                <td data-field="Nickname"
                                                    aria-label="유저 닉네임"
                                                    class="user_nick">
                                                    <div class="ml-10 d-flex align-items-center">
                                                            <%--  프로필 이미지--%>
                                                        <div class="symbol symbol-40 symbol-sm flex-shrink-0 ">
                                                            <img src="${list.member_profile}" alt="photo">
                                                        </div>
                                                        <div class="ml-10 text-dark-75 font-weight-bolder font-size-lg mb-0 text-hover-primary">
                                                            <a href=""/>
                                                                ${list.member_name}
                                                            닉네임
                                                            </a>
                                                        </div>

                                                    </div>
                                                </td>


                                                    <%--아이디--%>
                                                <td data-field="ID"
                                                    aria-label="아이디"
                                                    class="user_id ">
                                                    <div class="d-flex align-items-center justify-content-center">
                                                    <span class="mb-0">
                                                            ${list.member_id}
                                                        아이디(이메일)
                                                    </span>

                                                    </div>
                                                </td>

                                                    <%--액션--%>
                                                <td data-field="Actions"
                                                    aria-label="액션 버튼"
                                                    class="list_action text-center">
                                                    <a href="/manager/member/info?cont_No=<c:out value="${list.member_name}"/>"
                                                       class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2">
                                                        <i class="far fa-user-circle"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
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