<%--
  스터디 카페 디테일 단
  User: 신지혜
  Date: 2021-11-15
  Time: 오후 3:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html lang="en">
<!----------------Head 시작----------------------->

<head>
		<title>예약하기</title>
		
		
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
				<div class="d-flex flex-column flex-row-fluid wrapper"
				     id="kt_wrapper">
						<!------------------header.html Include------------------>
						<jsp:include page="../../commons/header.jsp"/>
						<!------------------Header Wrapper : 메뉴 탭 시작------------------>
						<!--menu.html Include-->
						<jsp:include page="../../commons/menu_main.jsp"/>
						<!------------------Header Wrapper : 메뉴 탭 종료------------------>
						<!--컨테이너 시작-->
						<div class="d-flex flex-row flex-column-fluid container">
								<!--contents.html Include-->
								<!--begin::Content Wrapper 내용물 시작-->
								<div class="main d-flex flex-column flex-row-fluid">
										<!--Subheader : 서브헤더 페이지 제목란 시작-->
										<div class="subheader py-2 py-lg-6" id="kt_subheader">
												<!--begin::Subheader-->
												<div
														class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
														<!--begin::Details-->
														<div class="d-flex align-items-center flex-wrap mr-1">
																<!--begin::Title-->
																<h5 class="text-dark font-weight-bold mt-2 mb-2 mr-5">예약하기</h5>
																<!--end::Title-->
																<!--begin::Separator-->
																<div
																		class="subheader-separator subheader-separator-ver mt-2 mb-2 mr-5 bg-gray-200"></div>
																<!--end::Separator-->
																<!--begin::Search Form-->
																<div class="d-flex align-items-center" id="kt_subheader_search">
																		<span class="text-dark-50 font-weight-bold" id="kt_subheader_total">카페이름</span>
																</div>
																<!--end::Search Form-->
														</div>
														<!--end::Details-->
														<!--begin::Toolbar-->
														<div class="d-flex align-items-center">
																<!--begin::Button-->
																<a href="#" class="btn btn-default font-weight-bold">Back</a>
																<!--end::Button-->
																<!--begin::Dropdown-->
																<div class="btn-group ml-2">
																		<button type="button" class="btn btn-primary font-weight-bold">Save Changes
																		</button>
																</div>
																<!--end::Dropdown-->
														</div>
														<!--end::Toolbar-->
												</div>
												<!--end::Subheader-->
										</div>
										<!--Subheader : 서브헤더 페이지 제목란 종료-->
										
										<!------------------ 본문 시작 ------------------>
										<!--begin::Content-->
										
										<div class="content flex-column-fluid" id="kt_content">
												<!--begin::Card-->
												<div class="card card-custom gutter-b">
														<div class="card-body">
																<div class="d-flex">
																		
																		
																		<!--begin: Pic-->
																		<div class="flex-shrink-0 mr-7 mt-lg-0 mt-3">
																				<div class="symbol symbol-50 symbol-lg-120">
																						<img alt="룸사진" src="assets/media/project-logos/3.png"/>
																				</div>
																				<div class="symbol symbol-50 symbol-lg-120 symbol-primary d-none">
																						<span class="font-size-h3 symbol-label font-weight-boldest">JM</span>
																				</div>
																		</div>
																		<!--end: Pic-->
																		
																		
																		<!--begin: Info-->
																		<div class="flex-grow-1">
																				<!--begin: Title-->
																				<div class="d-flex align-items-center flex-wrap">
																						<div class="flex-grow-1 font-weight-bold text-dark-50 py-5 py-lg-2 mr-5">
																								
																								<!--begin::Name-->
																								<a href="#"
																								   class="d-flex align-items-center text-dark text-hover-primary font-size-h5 font-weight-bold mr-3">Nexa
																										- 카페이름
																										<i class="flaticon2-correct text-success icon-md ml-2"></i></a>
																								<!--end::Name-->
																								<a href="#"
																								   class="d-flex align-items-center text-dark text-hover-primary font-size-h5 font-weight-bold mr-3">Nexa
																										- 카페 홍보글 내용
																										<i class="flaticon2-correct text-success icon-md ml-2"></i></a>
																						
																						</div>
																						<div class="my-lg-0 my-1">
																								여기에 아이콘 - 내용 배치로
																								사업자 정보 담기
																								카페명,
																								대표자명, - 컬럼추가
																								소재지,
																								사업자번호, - 컬럼추가
																								전화번호,
																								버튼은 그냥 공간 차지용~
																								<!--begin::Contacts-->
																								<div class="d-flex flex-wrap my-2">
																										<a href="#"
																										   class="text-muted text-hover-primary font-weight-bold mr-lg-8 mr-5 mb-lg-0 mb-2">
															<span class="svg-icon svg-icon-md svg-icon-gray-500 mr-1">
																<!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Mail-notification.svg-->
																<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
																     width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																	<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																		<rect x="0" y="0" width="24" height="24"/>
																		<path
																				d="M21,12.0829584 C20.6747915,12.0283988 20.3407122,12 20,12 C16.6862915,12 14,14.6862915 14,18 C14,18.3407122 14.0283988,18.6747915 14.0829584,19 L5,19 C3.8954305,19 3,18.1045695 3,17 L3,8 C3,6.8954305 3.8954305,6 5,6 L19,6 C20.1045695,6 21,6.8954305 21,8 L21,12.0829584 Z M18.1444251,7.83964668 L12,11.1481833 L5.85557487,7.83964668 C5.4908718,7.6432681 5.03602525,7.77972206 4.83964668,8.14442513 C4.6432681,8.5091282 4.77972206,8.96397475 5.14442513,9.16035332 L11.6444251,12.6603533 C11.8664074,12.7798822 12.1335926,12.7798822 12.3555749,12.6603533 L18.8555749,9.16035332 C19.2202779,8.96397475 19.3567319,8.5091282 19.1603533,8.14442513 C18.9639747,7.77972206 18.5091282,7.6432681 18.1444251,7.83964668 Z"
																				fill="#000000"/>
																		<circle fill="#000000" opacity="0.3" cx="19.5" cy="17.5" r="2.5"/>
																	</g>
																</svg>
																	<!--end::Svg Icon-->
																	
															</span>jason@siastudio.com</a>
																										<a href="#"
																										   class="text-muted text-hover-primary font-weight-bold mr-lg-8 mr-5 mb-lg-0 mb-2">
															<span class="svg-icon svg-icon-md svg-icon-gray-500 mr-1">
																<!--begin::Svg Icon | path:assets/media/svg/icons/General/Lock.svg-->
																<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
																     width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																	<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																		<mask fill="white">
																			<use xlink:href="#path-1"/>
																		</mask>
																		<g/>
																		<path
																				d="M7,10 L7,8 C7,5.23857625 9.23857625,3 12,3 C14.7614237,3 17,5.23857625 17,8 L17,10 L18,10 C19.1045695,10 20,10.8954305 20,12 L20,18 C20,19.1045695 19.1045695,20 18,20 L6,20 C4.8954305,20 4,19.1045695 4,18 L4,12 C4,10.8954305 4.8954305,10 6,10 L7,10 Z M12,5 C10.3431458,5 9,6.34314575 9,8 L9,10 L15,10 L15,8 C15,6.34314575 13.6568542,5 12,5 Z"
																				fill="#000000"/>
																	</g>
																</svg>
																	<!--end::Svg Icon-->
															</span>PR Manager</a>
																										<a href="#" class="text-muted text-hover-primary font-weight-bold">
															<span class="svg-icon svg-icon-md svg-icon-gray-500 mr-1">
																<!--begin::Svg Icon | path:assets/media/svg/icons/Map/Marker2.svg-->
																<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
																     width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																	<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																		<rect x="0" y="0" width="24" height="24"/>
																		<path
																				d="M9.82829464,16.6565893 C7.02541569,15.7427556 5,13.1079084 5,10 C5,6.13400675 8.13400675,3 12,3 C15.8659932,3 19,6.13400675 19,10 C19,13.1079084 16.9745843,15.7427556 14.1717054,16.6565893 L12,21 L9.82829464,16.6565893 Z M12,12 C13.1045695,12 14,11.1045695 14,10 C14,8.8954305 13.1045695,8 12,8 C10.8954305,8 10,8.8954305 10,10 C10,11.1045695 10.8954305,12 12,12 Z"
																				fill="#000000"/>
																	</g>
																</svg>
																	<!--end::Svg Icon-->
															</span>Melbourne</a>
																								</div>
																								<!--end::Contacts-->
																						</div>
																				</div>
																				<!--end: Title-->
																				<!--begin: Content-->
																				<%--																				<div class="d-flex align-items-center flex-wrap justify-content-between">--%>
																				<%--																						<div class="flex-grow-1 font-weight-bold text-dark-50 py-5 py-lg-2 mr-5">I--%>
																				<%--																								distinguish three main text objectives--%>
																				<%--																								<br/>could be merely to inform people--%>
																				<%--																						</div>--%>
																				<%--																						<div class="d-flex flex-wrap align-items-center py-2">--%>
																				<%--																								<div class="d-flex align-items-center mr-10">--%>
																				<%--																										<div class="mr-6">--%>
																				<%--																												<div class="font-weight-bold mb-2">Start Date</div>--%>
																				<%--																												<span--%>
																				<%--																														class="btn btn-sm btn-text btn-light-primary text-uppercase font-weight-bold">07 May, 2020</span>--%>
																				<%--																										</div>--%>
																				<%--																										<div class="">--%>
																				<%--																												<div class="font-weight-bold mb-2">Due Date</div>--%>
																				<%--																												<span--%>
																				<%--																														class="btn btn-sm btn-text btn-light-danger text-uppercase font-weight-bold">10 June, 2021</span>--%>
																				<%--																										</div>--%>
																				<%--																								</div>--%>
																				<%--																								<div class="flex-grow-1 flex-shrink-0 w-150px w-xl-300px mt-4 mt-sm-0">--%>
																				<%--																										<span class="font-weight-bold">Progress</span>--%>
																				<%--																										<div class="progress progress-xs mt-2 mb-2">--%>
																				<%--																												<div class="progress-bar bg-success" role="progressbar"--%>
																				<%--																												     style="width: 63%;" aria-valuenow="50" aria-valuemin="0"--%>
																				<%--																												     aria-valuemax="100"></div>--%>
																				<%--																										</div>--%>
																				<%--																										<span class="font-weight-bolder text-dark">78%</span>--%>
																				<%--																								</div>--%>
																				<%--																						</div>--%>
																				<%--																				</div>--%>
																				<!--end: Content-->
																		</div>
																		<!--end: Info-->
																</div>
																
														</div>
												</div>
												<!--end::Card-->
												
												
												<!--begin::Card-->
												<div class="card card-custom gutter-b">
														
														<!--begin::Header 예약자정보 로고 시작-->
														<div class="card-header card-header-tabs-line">
																<div class="card-toolbar">
																		<ul
																				class="nav nav-tabs nav-tabs-space-lg nav-tabs-line nav-tabs-bold nav-tabs-line-3x"
																				role="tablist">
																				<li class="nav-item mr-3">
																						<a class="nav-link active" data-toggle="tab"
																						   href="#kt_apps_projects_view_tab_2">
													
																										<span class="nav-icon mr-2">
																											<span class="svg-icon mr-3">
																												<!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Chat-check.svg-->
																												<svg xmlns="http://www.w3.org/2000/svg"
																												     xmlns:xlink="http://www.w3.org/1999/xlink"
																												     width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																													<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																														<rect x="0" y="0" width="24" height="24"/>
																														<path
																																d="M4.875,20.75 C4.63541667,20.75 4.39583333,20.6541667 4.20416667,20.4625 L2.2875,18.5458333 C1.90416667,18.1625 1.90416667,17.5875 2.2875,17.2041667 C2.67083333,16.8208333 3.29375,16.8208333 3.62916667,17.2041667 L4.875,18.45 L8.0375,15.2875 C8.42083333,14.9041667 8.99583333,14.9041667 9.37916667,15.2875 C9.7625,15.6708333 9.7625,16.2458333 9.37916667,16.6291667 L5.54583333,20.4625 C5.35416667,20.6541667 5.11458333,20.75 4.875,20.75 Z"
																																fill="#000000" fill-rule="nonzero" opacity="0.3"/>
																														<path
																																d="M2,11.8650466 L2,6 C2,4.34314575 3.34314575,3 5,3 L19,3 C20.6568542,3 22,4.34314575 22,6 L22,15 C22,15.0032706 21.9999948,15.0065399 21.9999843,15.009808 L22.0249378,15 L22.0249378,19.5857864 C22.0249378,20.1380712 21.5772226,20.5857864 21.0249378,20.5857864 C20.7597213,20.5857864 20.5053674,20.4804296 20.317831,20.2928932 L18.0249378,18 L12.9835977,18 C12.7263047,14.0909841 9.47412135,11 5.5,11 C4.23590829,11 3.04485894,11.3127315 2,11.8650466 Z M6,7 C5.44771525,7 5,7.44771525 5,8 C5,8.55228475 5.44771525,9 6,9 L15,9 C15.5522847,9 16,8.55228475 16,8 C16,7.44771525 15.5522847,7 15,7 L6,7 Z"
																																fill="#000000"/>
																													</g>
																												</svg>
																													<!--end::Svg Icon-->
																											</span>
																										</span>
																								<span class="nav-text font-weight-bold">예약자정보</span>
																						
																						</a>
																				</li>
																		</ul>
																</div>
														</div>
														<!--end::Header 예약자정보 로고 끝 -->
														
														
														<!--begin::Body-->
														<div class="card-body">
																<div class="tab-content pt-5">
																		
																		
																		<!--begin::Tab Content-->
																		<div class="tab-pane active" id="kt_apps_projects_view_tab_3">
																				<form class="form">
																						<div class="row">
																								<div class="col-lg-9 col-xl-6 offset-xl-3">
																										
																										<!--begin::Notice alert-->
																										<div class="alert alert-custom alert-light-danger fade show mb-9"
																										     role="alert">
																												<div class="alert-icon">
																														<i class="flaticon-warning"></i>
																												</div>
																												<div class="alert-text"> 모두 입력해야 예약 가능하다는 안내 함 째리고요
																												</div>
																												<div class="alert-close">
																														<button type="button" class="close" data-dismiss="alert"
																														        aria-label="Close">
																																<span aria-hidden="true">
																																	<i class="ki ki-close"></i>
																																</span>
																														</button>
																												</div>
																										</div>
																										<!--end::Notice alert -->
																								
																								</div>
																						</div>
																						<!--begin::Heading-->
																						
																						<div class="row">
																								<div class="col-lg-9 col-xl-6 offset-xl-3">
																										<h3 class="font-size-h6 mb-5">예약자 정보:</h3>
																								</div>
																						</div>
																						<!--end::Heading-->
																						
																						<div class="form-group row">
																								<label class="col-xl-3 col-lg-3 col-form-label text-right">성함</label>
																								<div class="col-lg-9 col-xl-6">
																										<div class="spinner spinner-sm spinner-success spinner-right">
																												<input class="form-control form-control-lg form-control-solid"
																												       type="text" value="nick84"/>
																										</div>
																								</div>
																						</div>
																						
																						<div class="form-group row">
																								<label class="col-xl-3 col-lg-3 col-form-label text-right">연락처</label>
																								<div class="col-lg-9 col-xl-6">
																										<div class="input-group input-group-lg input-group-solid">
																												<div class="input-group-prepend">
																	<span class="input-group-text">
																		<i class="la la-phone"></i>
																	</span>
																												</div>
																												<input type="text"
																												       class="form-control form-control-lg form-control-solid"
																												       value="01012341234" placeholder="Phone"/>
																										</div>
																										<span class="form-text text-muted">예약 알림톡이 발송됩니다.</span>
																								</div>
																						</div>
																						
																						<div class="form-group row">
																								<label class="col-xl-3 col-lg-3 col-form-label text-right">Email
																										Address</label>
																								<div class="col-lg-9 col-xl-6">
																										<div class="input-group input-group-lg input-group-solid">
																												<div class="input-group-prepend">
																	<span class="input-group-text">
																		<i class="la la-at"></i>
																	</span>
																												</div>
																												<input type="text"
																												       class="form-control form-control-lg form-control-solid"
																												       value="알림톡 못하면 메일해야함" placeholder="Email"/>
																										</div>
																										<span class="form-text text-muted">메일발송째림.
															<a href="#">Learn more</a>.</span>
																								</div>
																						</div>
																						
																						
																						<div class="form-group row">
																								<label class="col-xl-3 col-lg-3 col-form-label text-right">요청사항</label>
																								<div class="col-lg-9 col-xl-6">
																										<textarea class="form-control form-control-lg form-control-solid"
																										          id="exampleTextarea" rows="3"
																										          placeholder="Type notes"></textarea>
																								</div>
																						
																						</div>
																				
																				
																				</form>
																				
																				<div class="separator separator-solid my-7"></div>
																				<!--begin: Items-->
																				
																				
																				<div class="row">
																						<div class="col-lg-9 col-xl-6 offset-xl-3">
																								<h3 class="font-size-h6 mb-5">예약정보</h3>
																						</div>
																				</div>
																				
																				<div class="row">
																						<label class="col-xl-3 col-lg-3 col-form-label text-right">예약번호</label>
																						<div class="col-xl-3 col-lg-3 col-form-label text-right">
																								예약 정보 담기
																						</div>
																				</div>
																				<div class="row">
																						<label class="col-xl-3 col-lg-3 col-form-label text-right">공간유형</label>
																						<div class="col-xl-3 col-lg-3 col-form-label text-right">
																								4인실
																						</div>
																				</div>
																				<div class="row">
																						<label class="col-xl-3 col-lg-3 col-form-label text-right">예약날짜</label>
																						<div class="col-xl-3 col-lg-3 col-form-label text-right">
																								2021.12.03 (금)
																						</div>
																				</div>
																				<div class="row">
																						<label class="col-xl-3 col-lg-3 col-form-label text-right">예약시간</label>
																						<div class="col-xl-3 col-lg-3 col-form-label text-right">
																								12~15시, 3시간
																						</div>
																				</div>
																				
																				<div class="separator separator-solid my-7"></div>
																				<!--begin: Items-->
																				
																				
																				<div class="row">
																						<div class="col-lg-9 col-xl-6 offset-xl-3">
																								<h3 class="font-size-h6 mb-5">안내사항</h3>
																						</div>
																				</div>
																				<div class="row">
																						<label class="col-xl-3 col-lg-3 col-form-label text-right">예약번호</label>
																						<div class="col-xl-3 col-lg-3 col-form-label text-right">
																								아푸지마
																						</div>
																				</div>
																				<div class="row">
																						<label class="col-xl-3 col-lg-3 col-form-label text-right">공간유형</label>
																						<div class="col-xl-3 col-lg-3 col-form-label text-right">
																								도토잠보...
																						</div>
																				</div>
																				<div class="row">
																						<label class="col-xl-3 col-lg-3 col-form-label text-right">예약날짜</label>
																						<div class="col-xl-3 col-lg-3 col-form-label text-right">
																								2021.도토잠보.03 (금)
																						</div>
																				</div>
																				<div class="row">
																						<label class="col-xl-3 col-lg-3 col-form-label text-right">예약시간</label>
																						<div class="col-xl-3 col-lg-3 col-form-label text-right">
																								12~아푸지마, 아푸지마
																						</div>
																				</div>
																				
																				
																		</div>
																		
																		<!--end::Tab Content-->
																</div>
														</div>
														<!--end::Body-->
												</div>
												<!--end::Card-->
												
												
												<div class="card card-custom">
														
														<!--begin::Header 주문자정보 로고 -->
														<div class="card-header card-header-tabs-line">
																<div class="card-toolbar">
																		<ul
																				class="nav nav-tabs nav-tabs-space-lg nav-tabs-line nav-tabs-bold nav-tabs-line-3x"
																				role="tablist">
																				<a class="nav-link active" data-toggle="tab"
																				   href="#kt_apps_projects_view_tab_2">
																						<li class="nav-item mr-3">
																								<span class="nav-icon mr-2">
																									<span class="svg-icon mr-3">
																										<!--begin::Svg Icon | path:assets/media/svg/icons/Devices/Display1.svg-->
																										<svg xmlns="http://www.w3.org/2000/svg"
																										     xmlns:xlink="http://www.w3.org/1999/xlink"
																										     width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																											<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																												<rect x="0" y="0" width="24" height="24"/>
																												<path
																														d="M11,20 L11,17 C11,16.4477153 11.4477153,16 12,16 C12.5522847,16 13,16.4477153 13,17 L13,20 L15.5,20 C15.7761424,20 16,20.2238576 16,20.5 C16,20.7761424 15.7761424,21 15.5,21 L8.5,21 C8.22385763,21 8,20.7761424 8,20.5 C8,20.2238576 8.22385763,20 8.5,20 L11,20 Z"
																														fill="#000000" opacity="0.3"/>
																												<path
																														d="M3,5 L21,5 C21.5522847,5 22,5.44771525 22,6 L22,16 C22,16.5522847 21.5522847,17 21,17 L3,17 C2.44771525,17 2,16.5522847 2,16 L2,6 C2,5.44771525 2.44771525,5 3,5 Z M4.5,8 C4.22385763,8 4,8.22385763 4,8.5 C4,8.77614237 4.22385763,9 4.5,9 L13.5,9 C13.7761424,9 14,8.77614237 14,8.5 C14,8.22385763 13.7761424,8 13.5,8 L4.5,8 Z M4.5,10 C4.22385763,10 4,10.2238576 4,10.5 C4,10.7761424 4.22385763,11 4.5,11 L7.5,11 C7.77614237,11 8,10.7761424 8,10.5 C8,10.2238576 7.77614237,10 7.5,10 L4.5,10 Z"
																														fill="#000000"/>
																											</g>
																										</svg>
																											<!--end::Svg Icon-->
																									</span>
																								</span>
																								<span class="nav-text font-weight-bold">주문자정보</span>
																						</li>
																				</a>
																		</ul>
																</div>
														</div>
														<!--end::Header-->
														
														
														<!--begin::Body-->
														<div class="card-body">
																<div class="tab-content pt-5">
																		<!--begin::Tab Content-->
																		<div class="tab-pane active" id="kt_apps_projects_view_tab_2">
																				<form class="form">
																						
																						
																						<div class="row justify-content-center py-8 px-md-0 mx-0">
																								
																								<div class="row justify-content-center py-8 px-md-0 mx-0">
																								
																								
																								</div>
																								
																								<div class="col-md-10">
																										<div class="table-responsive"></div>
																										<table class="table">
																												<thead>
																												<tr>
																														<th class="pl-0 font-weight-bold text-muted text-uppercase">결제정보
																														</th>
																														<th></th>
																												</tr>
																												</thead>
																												<tbody>
																												
																												<tr class="border-bottom-0">
																														<td
																																class="border-top-0 text-reft py-4 align-middle font-weight-boldest">
																																운영시간
																														</td>
																														
																														<td class="border-top-0 text-reft py-4 align-middle">
																																9 ~ 24 시
																														</td>
																												</tr>
																												<tr class="border-bottom-0">
																														<td
																																class="border-top-0 text-reft py-4 align-middle font-weight-boldest">
																																가게위치
																														</td>
																														
																														<td class="border-top-0 text-reft py-4 align-middle">1번카페의 위치정보입니다.
																														</td>
																												</tr>
																												</tbody>
																										</table>
																								</div>
																						</div>
																						
																						
																						<div class="separator separator-dashed my-10"></div>
																						
																						
																						<!--begin::Heading-->
																						<div class="row justify-content-center py-8 px-md-0 mx-0">
																								
																								<div class="col-md-10">
																										<div class="table-responsive"></div>
																										<table class="table">
																												<thead>
																												<tr>
																														<th class="pl-0 font-weight-bold text-muted text-uppercase">환불규정
																														</th>
																														
																														<th></th>
																												</tr>
																												</thead>
																												<tbody>
																												
																												
																												<tr class="border-bottom-0">
																														
																														<td
																																class="border-top-0 text-reft py-4 align-middle font-weight-boldest">
																																운영시간
																														</td>
																														
																														
																														<td class="border-top-0 text-reft py-4 align-middle">
																																9 ~ 24 시
																														</td>
																												</tr>
																												<tr class="border-bottom-0">
																														
																														<td
																																class="border-top-0 text-reft py-4 align-middle font-weight-boldest">
																																가게위치
																														</td>
																														
																														
																														<td class="border-top-0 text-reft py-4 align-middle">1번카페의 위치정보입니다.
																														</td>
																												</tr>
																												</tbody>
																										</table>
																								</div>
																						</div>
																						
																						
																						<div class="separator separator-dashed my-10"></div>
																						<!--END::Heading-->
																						
																						
																						<div class="form-group row align-items-center mb-0">
																								<label
																										class="col-xl-3 col-lg-3 col-form-label text-right">결제방법 라디오요!</label>
																								<div class="col-lg-9 col-xl-6">
																										<div class="checkbox-inline">
																												<label class="checkbox">
																														<input type="checkbox"/>
																														<span></span>신용카드</label>
																												<label class="checkbox">
																														<input type="checkbox"/>
																														<span></span>실시간출금</label>
																												<label class="checkbox">
																														<input type="checkbox"/>
																														<span></span>또 머가있지;</label>
																										</div>
																								</div>
																						</div>
																						
																						
																						<div class="separator separator-dashed my-10"></div>
																						
																						
																						<!-- 약관 시작 -->
																						<div class="form-group row">
																								<label class="col-xl-3 col-lg-3 col-form-label text-right">약관</label>
																								<div class="col-lg-9 col-xl-6">
																										<div class="checkbox-list">
																												<label class="checkbox">
																														<input type="checkbox"/>
																														<span></span>약관 전체선택</label>
																												<label class="checkbox">
																														<input type="checkbox"/>
																														<span></span>약관 1: ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</label>
																												<label class="checkbox">
																														<input type="checkbox" checked="checked"/>
																														<span></span>약관 2: ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</label>
																												<label class="checkbox">
																														<input type="checkbox" checked="checked"/>
																														<span></span>약관 3: ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</label>
																												<label class="checkbox">
																														<input type="checkbox" checked="checked"/>
																														<span></span>약관 4</label>
																										</div>
																								</div>
																						</div>
																						<!-- 약관 끝  -->
																				
																				</form>
																		</div>
																		
																		<!--end::Tab Content-->
																</div>
														</div>
														<!--end::Body-->
												</div>
												<!--end::Card-->
										
										
										</div>
										<!--end::Content-->
										
										
										<!--end::Content -->
								</div>
								<!--end::Content Wrapper 내용물 end-->
						</div>
						<!--컨테이너 종료-->
				</div>
				<!--end::Wrapper-->
		</div>
		<!----------------페이지 종료----------------------->
</div>
<!----------------메인 종료----------------------->

<!--컨테이너 종료-->
<!--footer.html Include-->
<jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</body>
<!----------------Body 종료----------------------->


</html>