<%-- Created by IntelliJ IDEA. User: bitcamp Date: 2021-11-09 Time: 오후 3:45 To change this template use File | Settings
	| File Templates. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                                                <span class="text-dark-50 font-weight-bold" id="kt_subheader_total">???
													Total</span>
                                    <form class="ml-5">
                                        <div class="input-group input-group-sm input-group-solid">
                                            <input type="text" class="form-control" id="kt_subheader_search_form" placeholder="Search..." />
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
                                <div class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded" id="kt_datatable">
                                    <table class="datatable-table">
                                        <thead class="datatable-head">
                                        <tr class="datatable-row">
                                            <th class="datatable-cell datatable-toggle-detail">
                                                <span></span>
                                            </th>
                                            <th data-field="RecordID" class="datatable-cell-left datatable-cell datatable-cell-sort datatable-cell-sorted" data-sort="asc">#<i class="flaticon2-arrow-up"></i></th>
                                            <th data-field="OrderID" class="datatable-cell datatable-cell-sort">
                                                Customer
                                            </th>
                                            <th data-field="Country" class="datatable-cell datatable-cell-sort">
                                                Country
                                            </th>
                                            <th data-field="ShipDate" class="datatable-cell datatable-cell-sort">Ship Date
                                            </th>
                                            <th data-field="CompanyName" class="datatable-cell datatable-cell-sort">Company Name
                                            </th>
                                            <th data-field="Status" class="datatable-cell datatable-cell-sort">Status
                                            </th>
                                            <th data-field="Actions" data-autohide-disabled="false" class="datatable-cell datatable-cell-sort">
                                                Actions</span>
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody class="datatable-body">
                                        <tr data-row="0" class="datatable-row">
                                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                    class="fa fa-caret-right"></i></a></td>
                                            <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="1"><span class="font-weight-bolder">1</span>
                                            </td>
                                            <td data-field="OrderID" aria-label="64616-103" class="datatable-cell">
                                                <div class="d-flex align-items-center">
                                                    <div class="symbol symbol-40 symbol-sm flex-shrink-0">
                                                        <img class="" src="assets/media/users/100_11.jpg" alt="photo">
                                                    </div>
                                                    <div class="ml-4">
                                                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">
                                                            Hayes Boule
                                                        </div>
                                                        <a href="#" class="text-muted font-weight-bold text-hover-primary">hboule0@hp.com</a>
                                                    </div>
                                                </div>
                                                </span>
                                            </td>
                                            <td data-field="Country" aria-label="Brazil" class="datatable-cell">
                                                <div class="font-weight-bolder font-size-lg mb-0">
                                                    Brazil
                                                </div>
                                                <div class="font-weight-bold text-muted">Code: BR
                                                </div>
                                            </td>
                                            <td data-field="ShipDate" aria-label="10/15/2017" class="datatable-cell">
                                                <div class="font-weight-bolder text-primary mb-0">
                                                    10/15/2017
                                                </div>
                                                <div class="text-muted">Approved</div>
                                            </td>
                                            <td data-field="CompanyName" aria-label="Casper-Kerluke" class="datatable-cell">
                                                <div class="font-weight-bold text-muted">
                                                    Casper-Kerluke
                                                </div>

                                            </td>
                                            <td data-field="Status" aria-label="5" class="datatable-cell"><span class="label label-lg font-weight-bold  label-light-info label-inline">Info</span></span>
                                            </td>
                                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell">
                                                <div class="dropdown dropdown-inline">
                                                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" data-toggle="dropdown"> <span class="svg-icon svg-icon-md"> <svg
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            width="24px" height="24px"
                                                            viewBox="0 0 24 24" version="1.1"
                                                            class="svg-icon">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                            fill="#000000"></path>
																					<path
                                                                                            d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                                        <ul class="navi flex-column navi-hover py-2">
                                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                                                Choose an action:
                                                            </li>
                                                            <li class="navi-item">
                                                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                        class="la la-print"></i></span>
                                                                    <span class="navi-text">Print</span>
                                                                </a>
                                                            </li>
                                                            <li class="navi-item">
                                                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                        class="la la-copy"></i></span>
                                                                    <span class="navi-text">Copy</span>
                                                                </a>
                                                            </li>
                                                            <li class="navi-item">
                                                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                        class="la la-file-excel-o"></i></span>
                                                                    <span class="navi-text">Excel</span>
                                                                </a>
                                                            </li>
                                                            <li class="navi-item">
                                                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                        class="la la-file-text-o"></i></span>
                                                                    <span class="navi-text">CSV</span>
                                                                </a>
                                                            </li>
                                                            <li class="navi-item">
                                                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                        class="la la-file-pdf-o"></i></span>
                                                                    <span class="navi-text">PDF</span>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                                                        xmlns="http://www.w3.org/2000/svg"
                                                        width="24px" height="24px"
                                                        viewBox="0 0 24 24" version="1.1">
																			<g stroke="none" stroke-width="1"
                                                                               fill="none" fill-rule="evenodd">
																				<rect x="0" y="0" width="24"
                                                                                      height="24"></rect>
																				<path
                                                                                        d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                        fill="#000000" fill-rule="nonzero"
                                                                                        transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																				</path>
																				<path
                                                                                        d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                        fill="#000000" fill-rule="nonzero"
                                                                                        opacity="0.3"></path>
																			</g>
																		</svg> </span> </a>
                                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md">
																		<svg xmlns="http://www.w3.org/2000/svg"
                                                                             width="24px" height="24px"
                                                                             viewBox="0 0 24 24" version="1.1">
																			<g stroke="none" stroke-width="1"
                                                                               fill="none" fill-rule="evenodd">
																				<rect x="0" y="0" width="24"
                                                                                      height="24"></rect>
																				<path
                                                                                        d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                        fill="#000000" fill-rule="nonzero">
																				</path>
																				<path
                                                                                        d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                        fill="#000000" opacity="0.3">
																				</path>
																			</g>
																		</svg> </span> </a>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr data-row="1" class="datatable-row datatable-row-even">
                                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                    class="fa fa-caret-right"></i></a></td>
                                            <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="2"><span class="font-weight-bolder">2</span></span>
                                            </td>
                                            <td data-field="OrderID" aria-label="54868-3377" class="datatable-cell">

                                                <div class="d-flex align-items-center">
                                                    <div class="symbol symbol-40 symbol-light-success flex-shrink-0">
                                                        <span class="symbol-label font-size-h4 font-weight-bold">H</span>
                                                    </div>
                                                    <div class="ml-4">
                                                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">
                                                            Humbert Bresnen</div> <a href="#" class="text-muted font-weight-bold text-hover-primary">hbresnen1@theguardian.com</a>
                                                    </div>
                                                </div>

                                            </td>
                                            <td data-field="Country" aria-label="Vietnam" class="datatable-cell"><span style="width: 110px;">
																	<div class="font-weight-bolder font-size-lg mb-0">
																		Vietnam</div>
																	<div class="font-weight-bold text-muted">Code: VN
																	</div>
																</span></td>
                                            <td data-field="ShipDate" aria-label="4/24/2016" class="datatable-cell" style="display: none;">
                                                <div class="font-weight-bolder text-primary mb-0">
                                                    4/24/2016
                                                </div>
                                                <div class="text-muted">Paid</div>
                                                </span>
                                            </td>
                                            <td data-field="CompanyName" aria-label="Hodkiewicz and Sons" class="datatable-cell" style="display: none;"><span style="width: 110px;">
																	<div class="font-weight-bold text-muted">Hodkiewicz
																		and Sons</div>
																</span>
                                            </td>
                                            <td data-field="Status" aria-label="2" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-danger label-inline">Delivered</span></span>
                                            </td>
                                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                                                                <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                                                    <ul class="navi flex-column navi-hover py-2">
                                                                        <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                                                            Choose an action: </li>
                                                                        <li class="navi-item">
                                                                            <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                                    class="la la-print"></i></span>
                                                                                <span class="navi-text">Print</span>
                                                                            </a>
                                                                        </li>
                                                                        <li class="navi-item">
                                                                            <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                                    class="la la-copy"></i></span>
                                                                                <span class="navi-text">Copy</span>
                                                                            </a>
                                                                        </li>
                                                                        <li class="navi-item">
                                                                            <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                                    class="la la-file-excel-o"></i></span>
                                                                                <span class="navi-text">Excel</span>
                                                                            </a>
                                                                        </li>
                                                                        <li class="navi-item">
                                                                            <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                                    class="la la-file-text-o"></i></span>
                                                                                <span class="navi-text">CSV</span>
                                                                            </a>
                                                                        </li>
                                                                        <li class="navi-item">
                                                                            <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                                    class="la la-file-pdf-o"></i></span>
                                                                                <span class="navi-text">PDF</span>
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                            </div>
                                            <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="24px" height="24px"
                                                    viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                                            <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="24px" height="24px"
                                                    viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                                            </span>
                                            </td>
                                        </tr>
                                        <tr data-row="2" class="datatable-row" style="left: 0px;">
                                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                    class="fa fa-caret-right"></i></a></td>
                                            <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="3"><span class="font-weight-bolder">3</span></span>
                                            </td>
                                            <td data-field="OrderID" aria-label="0998-0355" class="datatable-cell"><span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-light-success flex-shrink-0">
																			<span
                                                                                    class="symbol-label font-size-h4 font-weight-bold">J</span>
                                        </div>
                                        <div class="ml-4">
                                            <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">
                                                Jareb Labro</div> <a href="#" class="text-muted font-weight-bold text-hover-primary">jlabro2@kickstarter.com</a>
                                        </div>
                                    </div>
                                    </span>
                                            </td>
                                            <td data-field="Country" aria-label="Philippines" class="datatable-cell">

                                                <div class="font-weight-bolder font-size-lg mb-0">
                                                    Philippines
                                                </div>
                                                <div class="font-weight-bold text-muted">Code: PH
                                                </div>
                                                </span>
                                            </td>
                                            <td data-field="ShipDate" aria-label="7/11/2017" class="datatable-cell" style="display: none;">
                                                <div class="font-weight-bolder text-primary mb-0">
                                                    7/11/2017
                                                </div>
                                                <div class="text-muted">Pending</div>
                                                </span>
                                            </td>
                                            <td data-field="CompanyName" aria-label="Kuhlman Inc" class="datatable-cell" style="display: none;">
                                                <div class="font-weight-bold text-muted">Kuhlman Inc
                                                </div>
                                                </span>
                                            </td>
                                            <td data-field="Status" aria-label="6" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-danger label-inline">Danger</span></span>
                                            </td>
                                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                                        <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                            <ul class="navi flex-column navi-hover py-2">
                                                <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                                    Choose an action: </li>
                                                <li class="navi-item">
                                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                            class="la la-print"></i></span>
                                                        <span class="navi-text">Print</span>
                                                    </a>
                                                </li>
                                                <li class="navi-item">
                                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                            class="la la-copy"></i></span>
                                                        <span class="navi-text">Copy</span>
                                                    </a>
                                                </li>
                                                <li class="navi-item">
                                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                            class="la la-file-excel-o"></i></span>
                                                        <span class="navi-text">Excel</span>
                                                    </a>
                                                </li>
                                                <li class="navi-item">
                                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                            class="la la-file-text-o"></i></span>
                                                        <span class="navi-text">CSV</span>
                                                    </a>
                                                </li>
                                                <li class="navi-item">
                                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                            class="la la-file-pdf-o"></i></span>
                                                        <span class="navi-text">PDF</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24px" height="24px"
                                        viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24px" height="24px"
                                        viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                                </span>
                                            </td>
                                        </tr>
                                        <tr data-row="3" class="datatable-row datatable-row-even" style="left: 0px;">
                                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                    class="fa fa-caret-right"></i></a></td>
                                            <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="4"><span class="font-weight-bolder">4</span></span>
                                            </td>
                                            <td data-field="OrderID" aria-label="55154-6876" class="datatable-cell">
                                        <span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-light-info flex-shrink-0">
																			<span
                                                                                    class="symbol-label font-size-h4 font-weight-bold">K</span>
                            </div>
                            <div class="ml-4">
                                <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">
                                    Krishnah Tosspell</div> <a href="#" class="text-muted font-weight-bold text-hover-primary">ktosspell3@flickr.com</a>
                            </div>
                        </div>
                        </span>
                                            </td>
                                            <td data-field="Country" aria-label="China" class="datatable-cell"><span style="width: 110px;">
																	<div class="font-weight-bolder font-size-lg mb-0">
																		China</div>
																	<div class="font-weight-bold text-muted">Code: CN
																	</div>
																</span></td>
                                            <td data-field="ShipDate" aria-label="2/5/2016" class="datatable-cell" style="display: none;">
                                                <div class="font-weight-bolder text-primary mb-0">
                                                    2/5/2016
                                                </div>
                                                <div class="text-muted">Approved</div>
                                                </span>
                                            </td>
                                            <td data-field="CompanyName" aria-label="Prosacco-Kessler" class="datatable-cell" style="display: none;"><span style="width: 110px;">
																	<div class="font-weight-bold text-muted">
																		Prosacco-Kessler</div>
																</span>
                                            </td>
                                            <td data-field="Status" aria-label="1" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-primary label-inline">Pending</span></span>
                                            </td>
                                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                            <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                <ul class="navi flex-column navi-hover py-2">
                                    <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                        Choose an action: </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-print"></i></span>
                                            <span class="navi-text">Print</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-copy"></i></span>
                                            <span class="navi-text">Copy</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-file-excel-o"></i></span>
                                            <span class="navi-text">Excel</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-file-text-o"></i></span>
                                            <span class="navi-text">CSV</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-file-pdf-o"></i></span>
                                            <span class="navi-text">PDF</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                    </div>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                    </span>
                                            </td>
                                        </tr>
                                        <tr data-row="4" class="datatable-row" style="left: 0px;">
                                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                    class="fa fa-caret-right"></i></a></td>
                                            <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="5"><span class="font-weight-bolder">5</span></span>
                                            </td>
                                            <td data-field="OrderID" aria-label="49349-069" class="datatable-cell"><span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-sm flex-shrink-0">
																			<img class=""
                                                                                 src="assets/media/users/100_11.jpg"
                                                                                 alt="photo">
																		</div>
																		<div class="ml-4">
																			<div
                                                                                    class="text-dark-75 font-weight-bolder font-size-lg mb-0">
																				Dale Kernan</div> <a href="#"
                                                                                                     class="text-muted font-weight-bold text-hover-primary">dkernan4@mapquest.com</a>
																		</div>
																	</div>
																</span>
                                            </td>
                                            <td data-field="Country" aria-label="United States" class="datatable-cell">

                                                <div class="font-weight-bolder font-size-lg mb-0">
                                                    United States
                                                </div>
                                                <div class="font-weight-bold text-muted">Code: US
                                                </div>
                                                </span>
                                            </td>
                                            <td data-field="ShipDate" aria-label="7/23/2017" class="datatable-cell" style="display: none;">
                                                <div class="font-weight-bolder text-primary mb-0">
                                                    7/23/2017
                                                </div>
                                                <div class="text-muted">Pending</div>
                                                </span>
                                            </td>
                                            <td data-field="CompanyName" aria-label="Bernier and Sons" class="datatable-cell" style="display: none;"><span style="width: 110px;">
																	<div class="font-weight-bold text-muted">Bernier and
																		Sons</div>
																</span>
                                            </td>
                                            <td data-field="Status" aria-label="5" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-info label-inline">Info</span></span>
                                            </td>
                                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                            <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                <ul class="navi flex-column navi-hover py-2">
                                    <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                        Choose an action: </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-print"></i></span>
                                            <span class="navi-text">Print</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-copy"></i></span>
                                            <span class="navi-text">Copy</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-file-excel-o"></i></span>
                                            <span class="navi-text">Excel</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-file-text-o"></i></span>
                                            <span class="navi-text">CSV</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-file-pdf-o"></i></span>
                                            <span class="navi-text">PDF</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                </div>
                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24px" height="24px"
                        viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24px" height="24px"
                        viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                </span>
                                            </td>
                                        </tr>
                                        <tr data-row="5" class="datatable-row datatable-row-even" style="left: 0px;">
                                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                    class="fa fa-caret-right"></i></a></td>
                                            <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="6"><span class="font-weight-bolder">6</span></span>
                                            </td>
                                            <td data-field="OrderID" aria-label="53499-0393" class="datatable-cell">
                        <span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-sm flex-shrink-0">
																			<img class=""
                                                                                 src="assets/media/users/100_12.jpg"
                                                                                 alt="photo">
																		</div>
																		<div class="ml-4">
																			<div
                                                                                    class="text-dark-75 font-weight-bolder font-size-lg mb-0">
																				Halley Bentham</div> <a href="#"
                                                                                                        class="text-muted font-weight-bold text-hover-primary">hbentham5@nih.gov</a>
																		</div>
																	</div>
																</span>
                                            </td>
                                            <td data-field="Country" aria-label="Ukraine" class="datatable-cell"><span style="width: 110px;">
																	<div class="font-weight-bolder font-size-lg mb-0">
																		Ukraine</div>
																	<div class="font-weight-bold text-muted">Code: UA
																	</div>
																</span></td>
                                            <td data-field="ShipDate" aria-label="2/21/2016" class="datatable-cell" style="display: none;">
                                                <div class="font-weight-bolder text-primary mb-0">
                                                    2/21/2016
                                                </div>
                                                <div class="text-muted">Pending</div>
                                                </span>
                                            </td>
                                            <td data-field="CompanyName" aria-label="Schoen-Metz" class="datatable-cell" style="display: none;">
                                                <div class="font-weight-bold text-muted">Schoen-Metz
                                                </div>
                                                </span>
                                            </td>
                                            <td data-field="Status" aria-label="1" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-primary label-inline">Pending</span></span>
                                            </td>
                                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                        <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                            <ul class="navi flex-column navi-hover py-2">
                                <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                    Choose an action: </li>
                                <li class="navi-item">
                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                            class="la la-print"></i></span>
                                        <span class="navi-text">Print</span>
                                    </a>
                                </li>
                                <li class="navi-item">
                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                            class="la la-copy"></i></span>
                                        <span class="navi-text">Copy</span>
                                    </a>
                                </li>
                                <li class="navi-item">
                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                            class="la la-file-excel-o"></i></span>
                                        <span class="navi-text">Excel</span>
                                    </a>
                                </li>
                                <li class="navi-item">
                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                            class="la la-file-text-o"></i></span>
                                        <span class="navi-text">CSV</span>
                                    </a>
                                </li>
                                <li class="navi-item">
                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                            class="la la-file-pdf-o"></i></span>
                                        <span class="navi-text">PDF</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
            </div>
            <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24px" height="24px"
                    viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
            <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24px" height="24px"
                    viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
            </span>
                                            </td>
                                        </tr>
                                        <tr data-row="6" class="datatable-row" style="left: 0px;">
                                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                    class="fa fa-caret-right"></i></a></td>
                                            <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="7"><span class="font-weight-bolder">7</span></span>
                                            </td>
                                            <td data-field="OrderID" aria-label="43074-105" class="datatable-cell"><span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-light-info flex-shrink-0">
																			<span
                                                                                    class="symbol-label font-size-h4 font-weight-bold">B</span>
                    </div>
                    <div class="ml-4">
                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">
                            Burgess Penddreth</div> <a href="#" class="text-muted font-weight-bold text-hover-primary">bpenddreth6@example.com</a>
                    </div>
                    </div>
                    </span>
                                            </td>
                                            <td data-field="Country" aria-label="Philippines" class="datatable-cell">

                                                <div class="font-weight-bolder font-size-lg mb-0">
                                                    Philippines
                                                </div>
                                                <div class="font-weight-bold text-muted">Code: PH
                                                </div>
                                                </span>
                                            </td>
                                            <td data-field="ShipDate" aria-label="10/25/2016" class="datatable-cell" style="display: none;">
                                                <div class="font-weight-bolder text-primary mb-0">
                                                    10/25/2016
                                                </div>
                                                <div class="text-muted">Pending</div>
                                                </span>
                                            </td>
                                            <td data-field="CompanyName" aria-label="DuBuque, Stanton and Stanton" class="datatable-cell" style="display: none;"><span style="width: 110px;">
																	<div class="font-weight-bold text-muted">DuBuque,
																		Stanton and Stanton</div>
																</span>
                                            </td>
                                            <td data-field="Status" aria-label="5" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-info label-inline">Info</span></span>
                                            </td>
                                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                        <ul class="navi flex-column navi-hover py-2">
                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                Choose an action: </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-print"></i></span>
                                    <span class="navi-text">Print</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-copy"></i></span>
                                    <span class="navi-text">Copy</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-excel-o"></i></span>
                                    <span class="navi-text">Excel</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-text-o"></i></span>
                                    <span class="navi-text">CSV</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-pdf-o"></i></span>
                                    <span class="navi-text">PDF</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    </div>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                    </span>
                                            </td>
                                        </tr>
                                        <tr data-row="7" class="datatable-row datatable-row-even" style="left: 0px;">
                                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                    class="fa fa-caret-right"></i></a></td>
                                            <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="8"><span class="font-weight-bolder">8</span></span>
                                            </td>
                                            <td data-field="OrderID" aria-label="76328-333" class="datatable-cell"><span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-light-success flex-shrink-0">
																			<span
                                                                                    class="symbol-label font-size-h4 font-weight-bold">C</span>
                    </div>
                    <div class="ml-4">
                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">
                            Cob Sedwick</div> <a href="#" class="text-muted font-weight-bold text-hover-primary">csedwick7@wikispaces.com</a>
                    </div>
                    </div>
                    </span>
                                            </td>
                                            <td data-field="Country" aria-label="Portugal" class="datatable-cell"><span style="width: 110px;">
																	<div class="font-weight-bolder font-size-lg mb-0">
																		Portugal</div>
																	<div class="font-weight-bold text-muted">Code: PT
																	</div>
																</span></td>
                                            <td data-field="ShipDate" aria-label="2/18/2016" class="datatable-cell" style="display: none;">
                                                <div class="font-weight-bolder text-primary mb-0">
                                                    2/18/2016
                                                </div>
                                                <div class="text-muted">Rejected</div>
                                                </span>
                                            </td>
                                            <td data-field="CompanyName" aria-label="Homenick-Nolan" class="datatable-cell" style="display: none;"><span style="width: 110px;">
																	<div class="font-weight-bold text-muted">
																		Homenick-Nolan</div>
																</span>
                                            </td>
                                            <td data-field="Status" aria-label="3" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-primary label-inline">Canceled</span></span>
                                            </td>
                                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                        <ul class="navi flex-column navi-hover py-2">
                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                Choose an action: </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-print"></i></span>
                                    <span class="navi-text">Print</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-copy"></i></span>
                                    <span class="navi-text">Copy</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-excel-o"></i></span>
                                    <span class="navi-text">Excel</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-text-o"></i></span>
                                    <span class="navi-text">CSV</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-pdf-o"></i></span>
                                    <span class="navi-text">PDF</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    </div>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                    </span>
                                            </td>
                                        </tr>
                                        <tr data-row="8" class="datatable-row" style="left: 0px;">
                                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                    class="fa fa-caret-right"></i></a></td>
                                            <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="9"><span class="font-weight-bolder">9</span></span>
                                            </td>
                                            <td data-field="OrderID" aria-label="21130-054" class="datatable-cell"><span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-sm flex-shrink-0">
																			<img class=""
                                                                                 src="assets/media/users/100_13.jpg"
                                                                                 alt="photo">
																		</div>
																		<div class="ml-4">
																			<div
                                                                                    class="text-dark-75 font-weight-bolder font-size-lg mb-0">
																				Tabby Callaghan</div> <a href="#"
                                                                                                         class="text-muted font-weight-bold text-hover-primary">tcallaghan8@squidoo.com</a>
																		</div>
																	</div>
																</span>
                                            </td>
                                            <td data-field="Country" aria-label="France" class="datatable-cell"><span style="width: 110px;">
																	<div class="font-weight-bolder font-size-lg mb-0">
																		France</div>
																	<div class="font-weight-bold text-muted">Code: FR
																	</div>
																</span></td>
                                            <td data-field="ShipDate" aria-label="3/26/2016" class="datatable-cell" style="display: none;">
                                                <div class="font-weight-bolder text-primary mb-0">
                                                    3/26/2016
                                                </div>
                                                <div class="text-muted">Paid</div>
                                                </span>
                                            </td>
                                            <td data-field="CompanyName" aria-label="Daugherty-Considine" class="datatable-cell" style="display: none;"><span style="width: 110px;">
																	<div class="font-weight-bold text-muted">
																		Daugherty-Considine</div>
																</span>
                                            </td>
                                            <td data-field="Status" aria-label="2" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-danger label-inline">Delivered</span></span>
                                            </td>
                                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                        <ul class="navi flex-column navi-hover py-2">
                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                Choose an action: </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-print"></i></span>
                                    <span class="navi-text">Print</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-copy"></i></span>
                                    <span class="navi-text">Copy</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-excel-o"></i></span>
                                    <span class="navi-text">Excel</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-text-o"></i></span>
                                    <span class="navi-text">CSV</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-pdf-o"></i></span>
                                    <span class="navi-text">PDF</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    </div>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                    </span>
                                            </td>
                                        </tr>
                                        <tr data-row="9" class="datatable-row datatable-row-even" style="left: 0px;">
                                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                    class="fa fa-caret-right"></i></a></td>
                                            <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="10"><span class="font-weight-bolder">10</span></span>
                                            </td>
                                            <td data-field="OrderID" aria-label="68788-9890" class="datatable-cell">
                    <span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-sm flex-shrink-0">
																			<img class=""
                                                                                 src="assets/media/users/100_13.jpg"
                                                                                 alt="photo">
																		</div>
																		<div class="ml-4">
																			<div
                                                                                    class="text-dark-75 font-weight-bolder font-size-lg mb-0">
																				Broddy Jarry</div> <a href="#"
                                                                                                      class="text-muted font-weight-bold text-hover-primary">bjarry9@craigslist.org</a>
																		</div>
																	</div>
																</span>
                                            </td>
                                            <td data-field="Country" aria-label="Dominican Republic" class="datatable-cell">
                                                <div class="font-weight-bolder font-size-lg mb-0">
                                                    Dominican Republic
                                                </div>
                                                <div class="font-weight-bold text-muted">Code: DO
                                                </div>
                                                </span>
                                            </td>
                                            <td data-field="ShipDate" aria-label="8/10/2016" class="datatable-cell" style="display: none;">
                                                <div class="font-weight-bolder text-primary mb-0">
                                                    8/10/2016
                                                </div>
                                                <div class="text-muted">Rejected</div>
                                                </span>
                                            </td>
                                            <td data-field="CompanyName" aria-label="Walter Group" class="datatable-cell" style="display: none;"><span style="width: 110px;">
																	<div class="font-weight-bold text-muted">Walter
																		Group</div>
																</span>
                                            </td>
                                            <td data-field="Status" aria-label="1" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-primary label-inline">Pending</span></span>
                                            </td>
                                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                        <ul class="navi flex-column navi-hover py-2">
                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                Choose an action: </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-print"></i></span>
                                    <span class="navi-text">Print</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-copy"></i></span>
                                    <span class="navi-text">Copy</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-excel-o"></i></span>
                                    <span class="navi-text">Excel</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-text-o"></i></span>
                                    <span class="navi-text">CSV</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-pdf-o"></i></span>
                                    <span class="navi-text">PDF</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    </div>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                    </span>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="datatable-pager datatable-paging-loaded">
                                        <ul class="datatable-pager-nav my-2 mb-sm-0">
                                            <li><a title="First" class="datatable-pager-link datatable-pager-link-first datatable-pager-link-disabled" data-page="1" disabled="disabled"><i
                                                    class="flaticon2-fast-back"></i></a>
                                            </li>
                                            <li><a title="Previous" class="datatable-pager-link datatable-pager-link-prev datatable-pager-link-disabled" data-page="1" disabled="disabled"><i
                                                    class="flaticon2-back"></i></a>
                                            </li>
                                            <li style="display: none;"><input type="text" class="datatable-pager-input form-control" title="Page number"></li>
                                            <li>
                                                <a class="datatable-pager-link datatable-pager-link-number datatable-pager-link-active" data-page="1" title="1">1</a>
                                            </li>
                                            <li><a class="datatable-pager-link datatable-pager-link-number" data-page="2" title="2">2</a></li>
                                            <li><a class="datatable-pager-link datatable-pager-link-number" data-page="3" title="3">3</a></li>
                                            <li><a class="datatable-pager-link datatable-pager-link-number" data-page="4" title="4">4</a></li>
                                            <li><a class="datatable-pager-link datatable-pager-link-number" data-page="5" title="5">5</a></li>
                                            <li><a title="Next" class="datatable-pager-link datatable-pager-link-next" data-page="2"><i class="flaticon2-next"></i></a></li>
                                            <li><a title="Last" class="datatable-pager-link datatable-pager-link-last" data-page="35"><i class="flaticon2-fast-next"></i></a>
                                            </li>
                                        </ul>
                                        <div class="datatable-pager-info my-2 mb-sm-0">
                                            <div class="dropdown bootstrap-select datatable-pager-size" style="width: 60px;"><select class="selectpicker datatable-pager-size" title="Select page size" data-width="60px" data-container="body" data-selected="10">
                                                <option class="bs-title-option" value=""></option>
                                                <option value="5">5</option>
                                                <option value="10">10</option>
                                                <option value="20">20</option>
                                                <option value="30">30</option>
                                                <option value="50">50</option>
                                                <option value="100">100</option>
                                            </select>
                                                <button type="button" tabindex="-1" class="btn dropdown-toggle btn-light" data-toggle="dropdown" role="combobox" aria-owns="bs-select-1" aria-haspopup="listbox" aria-expanded="false" title="Select page size">
                                                    <div class="filter-option">
                                                        <div class="filter-option-inner">
                                                            <div class="filter-option-inner-inner">10</div>
                                                        </div>
                                                    </div>
                                                    <%-- Created by IntelliJ IDEA. User: bitcamp Date: 2021-11-09 Time: 오후 3:45 To change this template use File | Settings
                                | File Templates. --%>
                                                    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                                                <span class="text-dark-50 font-weight-bold" id="kt_subheader_total">???
													Total</span>
                                                                                        <form class="ml-5">
                                                                                            <div class="input-group input-group-sm input-group-solid">
                                                                                                <input type="text" class="form-control" id="kt_subheader_search_form" placeholder="Search..." />
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
                                                                                    <div class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded" id="kt_datatable">
                                                                                        <table class="datatable-table">
                                                                                            <thead class="datatable-head">
                                                                                            <tr class="datatable-row">
                                                                                                <th class="datatable-cell datatable-toggle-detail">
                                                                                                    <span></span>
                                                                                                </th>
                                                                                                <th data-field="RecordID" class="datatable-cell-left datatable-cell datatable-cell-sort datatable-cell-sorted" data-sort="asc">#<i class="flaticon2-arrow-up"></i></th>
                                                                                                <th data-field="OrderID" class="datatable-cell datatable-cell-sort">
                                                                                                    Customer
                                                                                                </th>
                                                                                                <th data-field="Country" class="datatable-cell datatable-cell-sort">
                                                                                                    Country
                                                                                                </th>
                                                                                                <th data-field="ShipDate" class="datatable-cell datatable-cell-sort">Ship Date
                                                                                                </th>
                                                                                                <th data-field="CompanyName" class="datatable-cell datatable-cell-sort">Company Name
                                                                                                </th>
                                                                                                <th data-field="Status" class="datatable-cell datatable-cell-sort">Status
                                                                                                </th>
                                                                                                <th data-field="Actions" data-autohide-disabled="false" class="datatable-cell datatable-cell-sort">
                                                                                                    Actions</span>
                                                                                                </th>
                                                                                            </tr>
                                                                                            </thead>
                                                                                            <tbody class="datatable-body">
                                                                                            <tr data-row="0" class="datatable-row">
                                                                                                <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                                                                        class="fa fa-caret-right"></i></a></td>
                                                                                                <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="1"><span class="font-weight-bolder">1</span>
                                                                                                </td>
                                                                                                <td data-field="OrderID" aria-label="64616-103" class="datatable-cell">
                                                                                                    <div class="d-flex align-items-center">
                                                                                                        <div class="symbol symbol-40 symbol-sm flex-shrink-0">
                                                                                                            <img class="" src="assets/media/users/100_11.jpg" alt="photo">
                                                                                                        </div>
                                                                                                        <div class="ml-4">
                                                                                                            <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">
                                                                                                                Hayes Boule
                                                                                                            </div>
                                                                                                            <a href="#" class="text-muted font-weight-bold text-hover-primary">hboule0@hp.com</a>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="Country" aria-label="Brazil" class="datatable-cell">
                                                                                                    <div class="font-weight-bolder font-size-lg mb-0">
                                                                                                        Brazil
                                                                                                    </div>
                                                                                                    <div class="font-weight-bold text-muted">Code: BR
                                                                                                    </div>
                                                                                                </td>
                                                                                                <td data-field="ShipDate" aria-label="10/15/2017" class="datatable-cell">
                                                                                                    <div class="font-weight-bolder text-primary mb-0">
                                                                                                        10/15/2017
                                                                                                    </div>
                                                                                                    <div class="text-muted">Approved</div>
                                                                                                </td>
                                                                                                <td data-field="CompanyName" aria-label="Casper-Kerluke" class="datatable-cell">
                                                                                                    <div class="font-weight-bold text-muted">
                                                                                                        Casper-Kerluke
                                                                                                    </div>

                                                                                                </td>
                                                                                                <td data-field="Status" aria-label="5" class="datatable-cell"><span class="label label-lg font-weight-bold  label-light-info label-inline">Info</span></span>
                                                                                                </td>
                                                                                                <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell">
                                                                                                    <div class="dropdown dropdown-inline">
                                                                                                        <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" data-toggle="dropdown"> <span class="svg-icon svg-icon-md"> <svg
                                                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                                                width="24px" height="24px"
                                                                                                                viewBox="0 0 24 24" version="1.1"
                                                                                                                class="svg-icon">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                            fill="#000000"></path>
																					<path
                                                                                            d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                                                                                                        <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                                                                                            <ul class="navi flex-column navi-hover py-2">
                                                                                                                <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                                                                                                    Choose an action:
                                                                                                                </li>
                                                                                                                <li class="navi-item">
                                                                                                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                                                                            class="la la-print"></i></span>
                                                                                                                        <span class="navi-text">Print</span>
                                                                                                                    </a>
                                                                                                                </li>
                                                                                                                <li class="navi-item">
                                                                                                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                                                                            class="la la-copy"></i></span>
                                                                                                                        <span class="navi-text">Copy</span>
                                                                                                                    </a>
                                                                                                                </li>
                                                                                                                <li class="navi-item">
                                                                                                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                                                                            class="la la-file-excel-o"></i></span>
                                                                                                                        <span class="navi-text">Excel</span>
                                                                                                                    </a>
                                                                                                                </li>
                                                                                                                <li class="navi-item">
                                                                                                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                                                                            class="la la-file-text-o"></i></span>
                                                                                                                        <span class="navi-text">CSV</span>
                                                                                                                    </a>
                                                                                                                </li>
                                                                                                                <li class="navi-item">
                                                                                                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                                                                            class="la la-file-pdf-o"></i></span>
                                                                                                                        <span class="navi-text">PDF</span>
                                                                                                                    </a>
                                                                                                                </li>
                                                                                                            </ul>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                                                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                                                            width="24px" height="24px"
                                                                                                            viewBox="0 0 24 24" version="1.1">
																			<g stroke="none" stroke-width="1"
                                                                               fill="none" fill-rule="evenodd">
																				<rect x="0" y="0" width="24"
                                                                                      height="24"></rect>
																				<path
                                                                                        d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                        fill="#000000" fill-rule="nonzero"
                                                                                        transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																				</path>
																				<path
                                                                                        d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                        fill="#000000" fill-rule="nonzero"
                                                                                        opacity="0.3"></path>
																			</g>
																		</svg> </span> </a>
                                                                                                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md">
																		<svg xmlns="http://www.w3.org/2000/svg"
                                                                             width="24px" height="24px"
                                                                             viewBox="0 0 24 24" version="1.1">
																			<g stroke="none" stroke-width="1"
                                                                               fill="none" fill-rule="evenodd">
																				<rect x="0" y="0" width="24"
                                                                                      height="24"></rect>
																				<path
                                                                                        d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                        fill="#000000" fill-rule="nonzero">
																				</path>
																				<path
                                                                                        d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                        fill="#000000" opacity="0.3">
																				</path>
																			</g>
																		</svg> </span> </a>
                                                                                                    </span>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr data-row="1" class="datatable-row datatable-row-even">
                                                                                                <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                                                                        class="fa fa-caret-right"></i></a></td>
                                                                                                <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="2"><span class="font-weight-bolder">2</span></span>
                                                                                                </td>
                                                                                                <td data-field="OrderID" aria-label="54868-3377" class="datatable-cell">

                                                                                                    <div class="d-flex align-items-center">
                                                                                                        <div class="symbol symbol-40 symbol-light-success flex-shrink-0">
                                                                                                            <span class="symbol-label font-size-h4 font-weight-bold">H</span>
                                                                                                        </div>
                                                                                                        <div class="ml-4">
                                                                                                            <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">
                                                                                                                Humbert Bresnen</div> <a href="#" class="text-muted font-weight-bold text-hover-primary">hbresnen1@theguardian.com</a>
                                                                                                        </div>
                                                                                                    </div>

                                                                                                </td>
                                                                                                <td data-field="Country" aria-label="Vietnam" class="datatable-cell"><span style="width: 110px;">
																	<div class="font-weight-bolder font-size-lg mb-0">
																		Vietnam</div>
																	<div class="font-weight-bold text-muted">Code: VN
																	</div>
																</span></td>
                                                                                                <td data-field="ShipDate" aria-label="4/24/2016" class="datatable-cell" style="display: none;">
                                                                                                    <div class="font-weight-bolder text-primary mb-0">
                                                                                                        4/24/2016
                                                                                                    </div>
                                                                                                    <div class="text-muted">Paid</div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="CompanyName" aria-label="Hodkiewicz and Sons" class="datatable-cell" style="display: none;"><span style="width: 110px;">
																	<div class="font-weight-bold text-muted">Hodkiewicz
																		and Sons</div>
																</span>
                                                                                                </td>
                                                                                                <td data-field="Status" aria-label="2" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-danger label-inline">Delivered</span></span>
                                                                                                </td>
                                                                                                <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                                                                <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                                                    <ul class="navi flex-column navi-hover py-2">
                                                                        <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                                                            Choose an action: </li>
                                                                        <li class="navi-item">
                                                                            <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                                    class="la la-print"></i></span>
                                                                                <span class="navi-text">Print</span>
                                                                            </a>
                                                                        </li>
                                                                        <li class="navi-item">
                                                                            <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                                    class="la la-copy"></i></span>
                                                                                <span class="navi-text">Copy</span>
                                                                            </a>
                                                                        </li>
                                                                        <li class="navi-item">
                                                                            <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                                    class="la la-file-excel-o"></i></span>
                                                                                <span class="navi-text">Excel</span>
                                                                            </a>
                                                                        </li>
                                                                        <li class="navi-item">
                                                                            <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                                    class="la la-file-text-o"></i></span>
                                                                                <span class="navi-text">CSV</span>
                                                                            </a>
                                                                        </li>
                                                                        <li class="navi-item">
                                                                            <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                                                    class="la la-file-pdf-o"></i></span>
                                                                                <span class="navi-text">PDF</span>
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                            </div>
                                            <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="24px" height="24px"
                                                    viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                                            <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="24px" height="24px"
                                                    viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                                            </span>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr data-row="2" class="datatable-row" style="left: 0px;">
                                                                                                <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                                                                        class="fa fa-caret-right"></i></a></td>
                                                                                                <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="3"><span class="font-weight-bolder">3</span></span>
                                                                                                </td>
                                                                                                <td data-field="OrderID" aria-label="0998-0355" class="datatable-cell"><span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-light-success flex-shrink-0">
																			<span
                                                                                    class="symbol-label font-size-h4 font-weight-bold">J</span>
                                        </div>
                                        <div class="ml-4">
                                            <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">
                                                Jareb Labro</div> <a href="#" class="text-muted font-weight-bold text-hover-primary">jlabro2@kickstarter.com</a>
                                        </div>
                                    </div>
                                    </span>
                                                                                                </td>
                                                                                                <td data-field="Country" aria-label="Philippines" class="datatable-cell">

                                                                                                    <div class="font-weight-bolder font-size-lg mb-0">
                                                                                                        Philippines
                                                                                                    </div>
                                                                                                    <div class="font-weight-bold text-muted">Code: PH
                                                                                                    </div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="ShipDate" aria-label="7/11/2017" class="datatable-cell" style="display: none;">
                                                                                                    <div class="font-weight-bolder text-primary mb-0">
                                                                                                        7/11/2017
                                                                                                    </div>
                                                                                                    <div class="text-muted">Pending</div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="CompanyName" aria-label="Kuhlman Inc" class="datatable-cell" style="display: none;">
                                                                                                    <div class="font-weight-bold text-muted">Kuhlman Inc
                                                                                                    </div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="Status" aria-label="6" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-danger label-inline">Danger</span></span>
                                                                                                </td>
                                                                                                <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                                        <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                            <ul class="navi flex-column navi-hover py-2">
                                                <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                                    Choose an action: </li>
                                                <li class="navi-item">
                                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                            class="la la-print"></i></span>
                                                        <span class="navi-text">Print</span>
                                                    </a>
                                                </li>
                                                <li class="navi-item">
                                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                            class="la la-copy"></i></span>
                                                        <span class="navi-text">Copy</span>
                                                    </a>
                                                </li>
                                                <li class="navi-item">
                                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                            class="la la-file-excel-o"></i></span>
                                                        <span class="navi-text">Excel</span>
                                                    </a>
                                                </li>
                                                <li class="navi-item">
                                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                            class="la la-file-text-o"></i></span>
                                                        <span class="navi-text">CSV</span>
                                                    </a>
                                                </li>
                                                <li class="navi-item">
                                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                            class="la la-file-pdf-o"></i></span>
                                                        <span class="navi-text">PDF</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24px" height="24px"
                                        viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24px" height="24px"
                                        viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                                </span>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr data-row="3" class="datatable-row datatable-row-even" style="left: 0px;">
                                                                                                <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                                                                        class="fa fa-caret-right"></i></a></td>
                                                                                                <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="4"><span class="font-weight-bolder">4</span></span>
                                                                                                </td>
                                                                                                <td data-field="OrderID" aria-label="55154-6876" class="datatable-cell">
                                        <span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-light-info flex-shrink-0">
																			<span
                                                                                    class="symbol-label font-size-h4 font-weight-bold">K</span>
                            </div>
                            <div class="ml-4">
                                <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">
                                    Krishnah Tosspell</div> <a href="#" class="text-muted font-weight-bold text-hover-primary">ktosspell3@flickr.com</a>
                            </div>
                        </div>
                        </span>
                                                                                                </td>
                                                                                                <td data-field="Country" aria-label="China" class="datatable-cell"><span style="width: 110px;">
																	<div class="font-weight-bolder font-size-lg mb-0">
																		China</div>
																	<div class="font-weight-bold text-muted">Code: CN
																	</div>
																</span></td>
                                                                                                <td data-field="ShipDate" aria-label="2/5/2016" class="datatable-cell" style="display: none;">
                                                                                                    <div class="font-weight-bolder text-primary mb-0">
                                                                                                        2/5/2016
                                                                                                    </div>
                                                                                                    <div class="text-muted">Approved</div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="CompanyName" aria-label="Prosacco-Kessler" class="datatable-cell" style="display: none;"><span style="width: 110px;">
																	<div class="font-weight-bold text-muted">
																		Prosacco-Kessler</div>
																</span>
                                                                                                </td>
                                                                                                <td data-field="Status" aria-label="1" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-primary label-inline">Pending</span></span>
                                                                                                </td>
                                                                                                <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                            <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                <ul class="navi flex-column navi-hover py-2">
                                    <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                        Choose an action: </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-print"></i></span>
                                            <span class="navi-text">Print</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-copy"></i></span>
                                            <span class="navi-text">Copy</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-file-excel-o"></i></span>
                                            <span class="navi-text">Excel</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-file-text-o"></i></span>
                                            <span class="navi-text">CSV</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-file-pdf-o"></i></span>
                                            <span class="navi-text">PDF</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                    </div>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                    </span>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr data-row="4" class="datatable-row" style="left: 0px;">
                                                                                                <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                                                                        class="fa fa-caret-right"></i></a></td>
                                                                                                <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="5"><span class="font-weight-bolder">5</span></span>
                                                                                                </td>
                                                                                                <td data-field="OrderID" aria-label="49349-069" class="datatable-cell"><span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-sm flex-shrink-0">
																			<img class=""
                                                                                 src="assets/media/users/100_11.jpg"
                                                                                 alt="photo">
																		</div>
																		<div class="ml-4">
																			<div
                                                                                    class="text-dark-75 font-weight-bolder font-size-lg mb-0">
																				Dale Kernan</div> <a href="#"
                                                                                                     class="text-muted font-weight-bold text-hover-primary">dkernan4@mapquest.com</a>
																		</div>
																	</div>
																</span>
                                                                                                </td>
                                                                                                <td data-field="Country" aria-label="United States" class="datatable-cell">

                                                                                                    <div class="font-weight-bolder font-size-lg mb-0">
                                                                                                        United States
                                                                                                    </div>
                                                                                                    <div class="font-weight-bold text-muted">Code: US
                                                                                                    </div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="ShipDate" aria-label="7/23/2017" class="datatable-cell" style="display: none;">
                                                                                                    <div class="font-weight-bolder text-primary mb-0">
                                                                                                        7/23/2017
                                                                                                    </div>
                                                                                                    <div class="text-muted">Pending</div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="CompanyName" aria-label="Bernier and Sons" class="datatable-cell" style="display: none;"><span style="width: 110px;">
																	<div class="font-weight-bold text-muted">Bernier and
																		Sons</div>
																</span>
                                                                                                </td>
                                                                                                <td data-field="Status" aria-label="5" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-info label-inline">Info</span></span>
                                                                                                </td>
                                                                                                <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                            <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                <ul class="navi flex-column navi-hover py-2">
                                    <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                        Choose an action: </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-print"></i></span>
                                            <span class="navi-text">Print</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-copy"></i></span>
                                            <span class="navi-text">Copy</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-file-excel-o"></i></span>
                                            <span class="navi-text">Excel</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-file-text-o"></i></span>
                                            <span class="navi-text">CSV</span>
                                        </a>
                                    </li>
                                    <li class="navi-item">
                                        <a href="#" class="navi-link"> <span class="navi-icon"><i
                                                class="la la-file-pdf-o"></i></span>
                                            <span class="navi-text">PDF</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                </div>
                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24px" height="24px"
                        viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24px" height="24px"
                        viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                </span>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr data-row="5" class="datatable-row datatable-row-even" style="left: 0px;">
                                                                                                <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                                                                        class="fa fa-caret-right"></i></a></td>
                                                                                                <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="6"><span class="font-weight-bolder">6</span></span>
                                                                                                </td>
                                                                                                <td data-field="OrderID" aria-label="53499-0393" class="datatable-cell">
                        <span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-sm flex-shrink-0">
																			<img class=""
                                                                                 src="assets/media/users/100_12.jpg"
                                                                                 alt="photo">
																		</div>
																		<div class="ml-4">
																			<div
                                                                                    class="text-dark-75 font-weight-bolder font-size-lg mb-0">
																				Halley Bentham</div> <a href="#"
                                                                                                        class="text-muted font-weight-bold text-hover-primary">hbentham5@nih.gov</a>
																		</div>
																	</div>
																</span>
                                                                                                </td>
                                                                                                <td data-field="Country" aria-label="Ukraine" class="datatable-cell"><span style="width: 110px;">
																	<div class="font-weight-bolder font-size-lg mb-0">
																		Ukraine</div>
																	<div class="font-weight-bold text-muted">Code: UA
																	</div>
																</span></td>
                                                                                                <td data-field="ShipDate" aria-label="2/21/2016" class="datatable-cell" style="display: none;">
                                                                                                    <div class="font-weight-bolder text-primary mb-0">
                                                                                                        2/21/2016
                                                                                                    </div>
                                                                                                    <div class="text-muted">Pending</div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="CompanyName" aria-label="Schoen-Metz" class="datatable-cell" style="display: none;">
                                                                                                    <div class="font-weight-bold text-muted">Schoen-Metz
                                                                                                    </div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="Status" aria-label="1" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-primary label-inline">Pending</span></span>
                                                                                                </td>
                                                                                                <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                        <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                            <ul class="navi flex-column navi-hover py-2">
                                <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                    Choose an action: </li>
                                <li class="navi-item">
                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                            class="la la-print"></i></span>
                                        <span class="navi-text">Print</span>
                                    </a>
                                </li>
                                <li class="navi-item">
                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                            class="la la-copy"></i></span>
                                        <span class="navi-text">Copy</span>
                                    </a>
                                </li>
                                <li class="navi-item">
                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                            class="la la-file-excel-o"></i></span>
                                        <span class="navi-text">Excel</span>
                                    </a>
                                </li>
                                <li class="navi-item">
                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                            class="la la-file-text-o"></i></span>
                                        <span class="navi-text">CSV</span>
                                    </a>
                                </li>
                                <li class="navi-item">
                                    <a href="#" class="navi-link"> <span class="navi-icon"><i
                                            class="la la-file-pdf-o"></i></span>
                                        <span class="navi-text">PDF</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
            </div>
            <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24px" height="24px"
                    viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
            <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24px" height="24px"
                    viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
            </span>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr data-row="6" class="datatable-row" style="left: 0px;">
                                                                                                <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                                                                        class="fa fa-caret-right"></i></a></td>
                                                                                                <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="7"><span class="font-weight-bolder">7</span></span>
                                                                                                </td>
                                                                                                <td data-field="OrderID" aria-label="43074-105" class="datatable-cell"><span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-light-info flex-shrink-0">
																			<span
                                                                                    class="symbol-label font-size-h4 font-weight-bold">B</span>
                    </div>
                    <div class="ml-4">
                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">
                            Burgess Penddreth</div> <a href="#" class="text-muted font-weight-bold text-hover-primary">bpenddreth6@example.com</a>
                    </div>
                    </div>
                    </span>
                                                                                                </td>
                                                                                                <td data-field="Country" aria-label="Philippines" class="datatable-cell">

                                                                                                    <div class="font-weight-bolder font-size-lg mb-0">
                                                                                                        Philippines
                                                                                                    </div>
                                                                                                    <div class="font-weight-bold text-muted">Code: PH
                                                                                                    </div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="ShipDate" aria-label="10/25/2016" class="datatable-cell" style="display: none;">
                                                                                                    <div class="font-weight-bolder text-primary mb-0">
                                                                                                        10/25/2016
                                                                                                    </div>
                                                                                                    <div class="text-muted">Pending</div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="CompanyName" aria-label="DuBuque, Stanton and Stanton" class="datatable-cell" style="display: none;"><span style="width: 110px;">
																	<div class="font-weight-bold text-muted">DuBuque,
																		Stanton and Stanton</div>
																</span>
                                                                                                </td>
                                                                                                <td data-field="Status" aria-label="5" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-info label-inline">Info</span></span>
                                                                                                </td>
                                                                                                <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                        <ul class="navi flex-column navi-hover py-2">
                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                Choose an action: </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-print"></i></span>
                                    <span class="navi-text">Print</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-copy"></i></span>
                                    <span class="navi-text">Copy</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-excel-o"></i></span>
                                    <span class="navi-text">Excel</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-text-o"></i></span>
                                    <span class="navi-text">CSV</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-pdf-o"></i></span>
                                    <span class="navi-text">PDF</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    </div>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                    </span>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr data-row="7" class="datatable-row datatable-row-even" style="left: 0px;">
                                                                                                <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                                                                        class="fa fa-caret-right"></i></a></td>
                                                                                                <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="8"><span class="font-weight-bolder">8</span></span>
                                                                                                </td>
                                                                                                <td data-field="OrderID" aria-label="76328-333" class="datatable-cell"><span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-light-success flex-shrink-0">
																			<span
                                                                                    class="symbol-label font-size-h4 font-weight-bold">C</span>
                    </div>
                    <div class="ml-4">
                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">
                            Cob Sedwick</div> <a href="#" class="text-muted font-weight-bold text-hover-primary">csedwick7@wikispaces.com</a>
                    </div>
                    </div>
                    </span>
                                                                                                </td>
                                                                                                <td data-field="Country" aria-label="Portugal" class="datatable-cell"><span style="width: 110px;">
																	<div class="font-weight-bolder font-size-lg mb-0">
																		Portugal</div>
																	<div class="font-weight-bold text-muted">Code: PT
																	</div>
																</span></td>
                                                                                                <td data-field="ShipDate" aria-label="2/18/2016" class="datatable-cell" style="display: none;">
                                                                                                    <div class="font-weight-bolder text-primary mb-0">
                                                                                                        2/18/2016
                                                                                                    </div>
                                                                                                    <div class="text-muted">Rejected</div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="CompanyName" aria-label="Homenick-Nolan" class="datatable-cell" style="display: none;"><span style="width: 110px;">
																	<div class="font-weight-bold text-muted">
																		Homenick-Nolan</div>
																</span>
                                                                                                </td>
                                                                                                <td data-field="Status" aria-label="3" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-primary label-inline">Canceled</span></span>
                                                                                                </td>
                                                                                                <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                        <ul class="navi flex-column navi-hover py-2">
                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                Choose an action: </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-print"></i></span>
                                    <span class="navi-text">Print</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-copy"></i></span>
                                    <span class="navi-text">Copy</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-excel-o"></i></span>
                                    <span class="navi-text">Excel</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-text-o"></i></span>
                                    <span class="navi-text">CSV</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-pdf-o"></i></span>
                                    <span class="navi-text">PDF</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    </div>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                    </span>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr data-row="8" class="datatable-row" style="left: 0px;">
                                                                                                <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                                                                        class="fa fa-caret-right"></i></a></td>
                                                                                                <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="9"><span class="font-weight-bolder">9</span></span>
                                                                                                </td>
                                                                                                <td data-field="OrderID" aria-label="21130-054" class="datatable-cell"><span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-sm flex-shrink-0">
																			<img class=""
                                                                                 src="assets/media/users/100_13.jpg"
                                                                                 alt="photo">
																		</div>
																		<div class="ml-4">
																			<div
                                                                                    class="text-dark-75 font-weight-bolder font-size-lg mb-0">
																				Tabby Callaghan</div> <a href="#"
                                                                                                         class="text-muted font-weight-bold text-hover-primary">tcallaghan8@squidoo.com</a>
																		</div>
																	</div>
																</span>
                                                                                                </td>
                                                                                                <td data-field="Country" aria-label="France" class="datatable-cell"><span style="width: 110px;">
																	<div class="font-weight-bolder font-size-lg mb-0">
																		France</div>
																	<div class="font-weight-bold text-muted">Code: FR
																	</div>
																</span></td>
                                                                                                <td data-field="ShipDate" aria-label="3/26/2016" class="datatable-cell" style="display: none;">
                                                                                                    <div class="font-weight-bolder text-primary mb-0">
                                                                                                        3/26/2016
                                                                                                    </div>
                                                                                                    <div class="text-muted">Paid</div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="CompanyName" aria-label="Daugherty-Considine" class="datatable-cell" style="display: none;"><span style="width: 110px;">
																	<div class="font-weight-bold text-muted">
																		Daugherty-Considine</div>
																</span>
                                                                                                </td>
                                                                                                <td data-field="Status" aria-label="2" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-danger label-inline">Delivered</span></span>
                                                                                                </td>
                                                                                                <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                        <ul class="navi flex-column navi-hover py-2">
                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                Choose an action: </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-print"></i></span>
                                    <span class="navi-text">Print</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-copy"></i></span>
                                    <span class="navi-text">Copy</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-excel-o"></i></span>
                                    <span class="navi-text">Excel</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-text-o"></i></span>
                                    <span class="navi-text">CSV</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-pdf-o"></i></span>
                                    <span class="navi-text">PDF</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    </div>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                    </span>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr data-row="9" class="datatable-row datatable-row-even" style="left: 0px;">
                                                                                                <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i
                                                                                                        class="fa fa-caret-right"></i></a></td>
                                                                                                <td class="datatable-cell-sorted datatable-cell-left datatable-cell" data-field="RecordID" aria-label="10"><span class="font-weight-bolder">10</span></span>
                                                                                                </td>
                                                                                                <td data-field="OrderID" aria-label="68788-9890" class="datatable-cell">
                    <span style="width: 250px;">
																	<div class="d-flex align-items-center">
																		<div
                                                                                class="symbol symbol-40 symbol-sm flex-shrink-0">
																			<img class=""
                                                                                 src="assets/media/users/100_13.jpg"
                                                                                 alt="photo">
																		</div>
																		<div class="ml-4">
																			<div
                                                                                    class="text-dark-75 font-weight-bolder font-size-lg mb-0">
																				Broddy Jarry</div> <a href="#"
                                                                                                      class="text-muted font-weight-bold text-hover-primary">bjarry9@craigslist.org</a>
																		</div>
																	</div>
																</span>
                                                                                                </td>
                                                                                                <td data-field="Country" aria-label="Dominican Republic" class="datatable-cell">
                                                                                                    <div class="font-weight-bolder font-size-lg mb-0">
                                                                                                        Dominican Republic
                                                                                                    </div>
                                                                                                    <div class="font-weight-bold text-muted">Code: DO
                                                                                                    </div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="ShipDate" aria-label="8/10/2016" class="datatable-cell" style="display: none;">
                                                                                                    <div class="font-weight-bolder text-primary mb-0">
                                                                                                        8/10/2016
                                                                                                    </div>
                                                                                                    <div class="text-muted">Rejected</div>
                                                                                                    </span>
                                                                                                </td>
                                                                                                <td data-field="CompanyName" aria-label="Walter Group" class="datatable-cell" style="display: none;"><span style="width: 110px;">
																	<div class="font-weight-bold text-muted">Walter
																		Group</div>
																</span>
                                                                                                </td>
                                                                                                <td data-field="Status" aria-label="1" class="datatable-cell" style="display: none;"><span class="label label-lg font-weight-bold  label-light-primary label-inline">Pending</span></span>
                                                                                                </td>
                                                                                                <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
																	<div class="dropdown dropdown-inline"> <a
                                                                            href="javascript:;"
                                                                            class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2"
                                                                            data-toggle="dropdown"> <span
                                                                            class="svg-icon svg-icon-md"> <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="24px" height="24px"
                                                                            viewBox="0 0 24 24" version="1.1"
                                                                            class="svg-icon">
																					<g stroke="none" stroke-width="1"
                                                                                       fill="none" fill-rule="evenodd">
																						<rect x="0" y="0" width="24"
                                                                                              height="24"></rect>
																						<path
                                                                                                d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z"
                                                                                                fill="#000000"></path>
																						<path
                                                                                                d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z"
                                                                                                fill="#000000"
                                                                                                opacity="0.3"></path>
																					</g>
																				</svg> </span> </a>
                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                        <ul class="navi flex-column navi-hover py-2">
                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                Choose an action: </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-print"></i></span>
                                    <span class="navi-text">Print</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-copy"></i></span>
                                    <span class="navi-text">Copy</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-excel-o"></i></span>
                                    <span class="navi-text">Excel</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-text-o"></i></span>
                                    <span class="navi-text">CSV</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link"> <span class="navi-icon"><i
                                        class="la la-file-pdf-o"></i></span>
                                    <span class="navi-text">PDF</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    </div>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) ">
																					</path>
																					<path
                                                                                            d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"
                                                                                            opacity="0.3"></path>
																				</g>
																			</svg> </span> </a>
                    <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"> <span class="svg-icon svg-icon-md"> <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24px" height="24px"
                            viewBox="0 0 24 24" version="1.1">
																				<g stroke="none" stroke-width="1"
                                                                                   fill="none" fill-rule="evenodd">
																					<rect x="0" y="0" width="24"
                                                                                          height="24"></rect>
																					<path
                                                                                            d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
                                                                                            fill="#000000"
                                                                                            fill-rule="nonzero"></path>
																					<path
                                                                                            d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
                                                                                            fill="#000000" opacity="0.3">
																					</path>
																				</g>
																			</svg> </span> </a>
                    </span>
                                                                                                </td>
                                                                                            </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                        <div class="datatable-pager datatable-paging-loaded">
                                                                                            <ul class="datatable-pager-nav my-2 mb-sm-0">
                                                                                                <li><a title="First" class="datatable-pager-link datatable-pager-link-first datatable-pager-link-disabled" data-page="1" disabled="disabled"><i
                                                                                                        class="flaticon2-fast-back"></i></a>
                                                                                                </li>
                                                                                                <li><a title="Previous" class="datatable-pager-link datatable-pager-link-prev datatable-pager-link-disabled" data-page="1" disabled="disabled"><i
                                                                                                        class="flaticon2-back"></i></a>
                                                                                                </li>
                                                                                                <li style="display: none;"><input type="text" class="datatable-pager-input form-control" title="Page number"></li>
                                                                                                <li>
                                                                                                    <a class="datatable-pager-link datatable-pager-link-number datatable-pager-link-active" data-page="1" title="1">1</a>
                                                                                                </li>
                                                                                                <li><a class="datatable-pager-link datatable-pager-link-number" data-page="2" title="2">2</a></li>
                                                                                                <li><a class="datatable-pager-link datatable-pager-link-number" data-page="3" title="3">3</a></li>
                                                                                                <li><a class="datatable-pager-link datatable-pager-link-number" data-page="4" title="4">4</a></li>
                                                                                                <li><a class="datatable-pager-link datatable-pager-link-number" data-page="5" title="5">5</a></li>
                                                                                                <li><a title="Next" class="datatable-pager-link datatable-pager-link-next" data-page="2"><i class="flaticon2-next"></i></a></li>
                                                                                                <li><a title="Last" class="datatable-pager-link datatable-pager-link-last" data-page="35"><i class="flaticon2-fast-next"></i></a>
                                                                                                </li>
                                                                                            </ul>
                                                                                            <div class="datatable-pager-info my-2 mb-sm-0">
                                                                                                <div class="dropdown bootstrap-select datatable-pager-size" style="width: 60px;"><select class="selectpicker datatable-pager-size" title="Select page size" data-width="60px" data-container="body" data-selected="10">
                                                                                                    <option class="bs-title-option" value=""></option>
                                                                                                    <option value="5">5</option>
                                                                                                    <option value="10">10</option>
                                                                                                    <option value="20">20</option>
                                                                                                    <option value="30">30</option>
                                                                                                    <option value="50">50</option>
                                                                                                    <option value="100">100</option>
                                                                                                </select>
                                                                                                    <button type="button" tabindex="-1" class="btn dropdown-toggle btn-light" data-toggle="dropdown" role="combobox" aria-owns="bs-select-1" aria-haspopup="listbox" aria-expanded="false" title="Select page size">
                                                                                                        <div class="filter-option">
                                                                                                            <div class="filter-option-inner">
                                                                                                                <div class="filter-option-inner-inner">10</div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </button>
                                                                                                    <div class="dropdown-menu ">
                                                                                                        <div class="inner show" role="listbox" id="bs-select-1" tabindex="-1">
                                                                                                            <ul class="dropdown-menu inner show" role="presentation"></ul>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <span class="datatable-pager-detail">Showing 1 - 10 of
															350</span>
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
                                                                <!--컨테이너 종료-->
                                                                <!--footer.html Include-->
                                                                <jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
                                                    </body>
                                                    <!----------------Body 종료----------------------->

                                                    </html>
                                                </button>
                                                <div class="dropdown-menu ">
                                                    <div class="inner show" role="listbox" id="bs-select-1" tabindex="-1">
                                                        <ul class="dropdown-menu inner show" role="presentation"></ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <span class="datatable-pager-detail">Showing 1 - 10 of
															350</span>
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
            <!--컨테이너 종료-->
            <!--footer.html Include-->
            <jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</body>
<!----------------Body 종료----------------------->

</html>