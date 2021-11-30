<%-- Created by IntelliJ IDEA. User: bitcamp Date: 2021-11-09 Time: 오후 3:45 To change this template use File | Settings
    | File Templates. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<html lang="ko">
<!----------------Head 시작----------------------->

<head>
    <title>관리자::회원</title>
    <!--head.html Include-->
    <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js" integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script type="text/javascript">
        $(function () {
            $(`#searchBtn`).on('click', function (e) {

                e.preventDefault(); //기본 동작 제한
                actionForm.attr('action', '/manager/member/search');
                actionForm.submit();
            });

            $("input[name='keyword']").on("keyup", function (key) {
                if (key.keyCode == 13) {
                    key.preventDefault(); //기본 동작 제한
                    actionForm.attr('action', '/manager/member/search');
                    actionForm.submit();
                }
            });


        });
        function submitConfirm() {
            $('#actionForm').submit();
        }
    </script>

</head>
<!----------------Head 종료----------------------->

<!----------------Body 시작----------------------->
<body id="kt_body" class="header-fixed subheader-enabled page-loading ">
<!----------------메인 시작----------------------->
<div class="d-flex flex-column flex-root">
    <form id="actionForm" method="get" action="/manager/member/list">
        <input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum}"/>
        <input type="hidden" name="amount" value="${pageMaker.criteria.amount}"/>
        <!----------------페이지 시작----------------------->
        <div class="d-flex flex-row flex-column-fluid page">
            <!--begin::Wrapper-->
            <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
                <!--header.html Include-->
                <jsp:include page="/WEB-INF/commons/header.jsp"/>
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
                        <div class="subheader py-2 py-lg-4">
                            <div class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                                <!--begin::Details-->
                                <div class="d-flex align-items-center flex-wrap mr-2">
                                    <!--begin::Title-->
                                    <i class="fas fa-users"></i>&nbsp;&nbsp;
                                    <h5 class="text-dark font-weight-bolder mt-2 mb-2 mr-5">회원 목록</h5>
                                    <!--end::Title-->
                                    <!--Breadcrumb : 로드맵 시작-->
                                    <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                                        <li class="breadcrumb-item">
                                            <a href="/manager/member/list" class="text-muted">관리자 페이지</a>
                                        </li>
                                        <li class="breadcrumb-item">
                                            <a href="/manager/member/list" class="text-muted">회원 관리</a>
                                        </li>
                                    </ul>
                                    <!--Breadcrumb : 로드맵 종료-->
                                </div>
                                <!--end::Details-->
                            </div>
                        </div>
                        <!--end::Subheader  페이지 서브 헤더 종료-->
                        <div class="content flex-column-fluid">
                            <!--begin::Card-->
                            <div class="card card-custom">
                                <!--begin::Header-->
                                <div class="card-header flex-wrap pt-6 pb-0">
                                    <div class="card-title">
                                        <h3 class="card-label">회원 목록</h3>
                                    </div>
                                </div>
                                <!--end::Header-->
                                <!--begin::Body 북마크-->
                                <div class="card-body">
                                    <!--begin: Datatable-->
                                    <div class="mng_user_list datatable-default datatable-primary overflow-auto">
                                        <!--begin::Search Form 검색-->
                                        <div class="d-flex align-items-start w-50">
                                            <div class="text-dark-50"> 전체 ${pageMaker.total}</div>

                                            <form class="ml-5">
                                                <div class="input-group input-group-sm input-group-solid align-self-center">
                                                    <input type="text" class="form-control"
                                                          name="keyword" placeholder="Search..."/>
                                                    <div id="searchBtn" class="input-group-append">
                                                            <span class="input-group-text">
                                                                <i class="flaticon2-search-1 icon-sm"></i>
                                                            </span>
                                                    </div>
                                                </div>
                                            </form>
                                            <div class="align-self-center">
                                                <a href="" onclick="submitConfirm()">
                                                    <i class="fas fa-sync-alt icon-lg text-hover-ssff-orange mx-2"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <!--end::Search Form-->
                                        <%------ 테이블 시작-------%>
                                        <%------ 테이블 헤드-------%>
                                        <table class="table table-hover">
                                            <thead class="text-center">
                                            <tr>
                                                <th scope="col">  </th>
                                                <th scope="col">
                                                    닉네임
                                                </th>
                                                <th scope="col">
                                                    아이디
                                                </th>
                                                <th scope="col">
                                                    마이 페이지
                                                </th>
                                            <tr>
                                            </thead>

                                            <%------ 테이블 바디-------%>
                                            <tbody>
                                            <c:forEach items="${memberList}" var="list">
                                                <tr>
                                                        <%--회원번호--%>
                                                    <td class="user_num">
                                                            ${list.member_No}
                                                    </td>

                                                        <%--회원 사진 / 닉네임--%>
                                                    <td class="user_pic_nick">
                                                        <div class= "d-flex">
                                                            <a href="/member/myPage?r_Inx=${list.member_Name}" class="d-flex align-items-center">
                                                                <div class="symbol symbol-45 justify-content-start align-items-center">
                                                                    <c:choose>
                                                                    <c:when test="${list.member_Profile == '/resources/assets/images/icon/profile_default_g_w.png'}">
                                                                        <span class="symbol-label font-size-h5 font-weight-bolder"> ${fn:substring(list.member_Name,0,1)} </span>
                                                                    </c:when>
                                                                    <c:when test="${list.member_Profile == 'defualt.jpg'}">
                                                                        <span class="symbol-label font-size-h5 font-weight-bolder"> ${fn:substring(list.member_Name,0,1)} </span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img src="${list.member_Profile}" alt="photo" class="object-cover">
                                                                    </c:otherwise>
                                                                    </c:choose>
                                                                </div>

                                                                <div class="pl-6 font-weight-bolder font-size-lg text-left">
                                                                    ${list.member_Name}
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </td>
                                                        <%--아이디--%>
                                                    <td class="user_id">
                                                        <div class="d-flex align-items-center justify-content-center">
                                                    <span class="mb-0">
                                                            ${list.member_Id}
                                                    </span>
                                                        </div>
                                                    </td>
                                                    <%--액션--%>
                                                    <td class="list_action text-center">
                                                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0 text-hover-primary">
                                                            <a href="/member/myPage?r_Inx=${list.member_Name}"
                                                               class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2">
                                                                <i class="far fa-user-circle"></i>
                                                            </a>
                                                                </div>
                                                            </td>
                                                </tr>
                                            </c:forEach>
                                            <%------ 테이블 종료-------%>
                                            </tbody>
                                        </table>
                                        <%--------------페이지네이션 시작-----------%>
                                        <div class="d-flex flex-column align-items-center">
                                            <ul class="pagination">
                                                <c:if test="${pageMaker.prev}">
                                                    <li id="prev" class="paginate_button btn btn-sm btn-icon bg-hover-ssff1 mx-1 my-1">
                                                        <a class="ki ki-bold-double-arrow-back icon-xs p-4"
                                                           id="prev_aa" href="1"></a>
                                                    </li>
                                                    <li id="prev" class="paginate_button btn btn-sm btn-icon bg-hover-ssff1 mx-1 my-1">
                                                        <a class="ki ki-bold-arrow-back icon-xs p-4"
                                                           id="prev_a" href="${pageMaker.startPage -1}"></a>
                                                    </li>
                                                </c:if>

                                                <c:forEach var="num" begin="${pageMaker.startPage}"
                                                           end="${pageMaker.endPage}">
                                                    <li id="num"
                                                        class="paginate_button btn btn-sm btn-icon bg-hover-ssff1 mx-1 my-1 ${pageMaker.criteria.pageNum == num ? "active":""}">
                                                        <a class="w-100 h-100 d-flex justify-content-center align-items-center" id="num_a" href="${num}">${num}</a>
                                                    </li>

                                                </c:forEach>

                                                <c:if test="${pageMaker.next}">
                                                    <c:set var="pages" value="${pageMaker.total div pageMaker.criteria.amount}"/>
                                                    <c:set var="pages2" value="${pages+((pages%1>0.5)?(1-(pages%1))%1:-(pages%1))}"/>
                                                    <fmt:formatNumber value="${pages2}" type="number" var="numberType"/>
                                                    <li id="next" class="paginate_button btn btn-sm btn-icon bg-hover-ssff1 mx-1 my-1">
                                                        <a id="next_a" class="ki ki-bold-arrow-next icon-xs p-4" href="${pageMaker.endPage +1 }"></a>
                                                    </li>
                                                    <li id="next" class="paginate_button btn btn-sm btn-icon bg-hover-ssff1 mx-1 my-1">
                                                        <a class="ki ki-bold-double-arrow-next icon-xs p-4"
                                                           id="next_aa" href="${numberType}"></a>
                                                    </li>
                                                </c:if>
                                            </ul>
                                            <%--------------페이지네이션 종료-----------%>
<%--                                            <h6>${pageMaker}</h6>--%>
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
                <jsp:include page="/WEB-INF/commons/footer.jsp"/>
    </form>
</div>

</body>
<!----------------Body 종료----------------------->
<script>
    let actionForm = $("#actionForm");
    $(".paginate_button a").on("click", function (e) {

        e.preventDefault(); //기본 동작 제한

        actionForm.find("input[name='pageNum']").val($(this).attr("href"));

        actionForm.submit();

    });
</script>
</html>