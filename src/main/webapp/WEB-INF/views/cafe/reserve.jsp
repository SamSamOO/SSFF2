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
																		<div class="flex-shrink-0 w-xl-150px mr-7 mt-lg-0 mt-3">
																				<div class="symbol symbol-50 symbol-lg-120">
																						<img alt="룸사진" src="assets/media/project-logos/3.png">
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
																						
																						
																						
																						
																						<div class="flex-grow-2 font-weight-bold text-dark-50 py-5 py-lg-2 mr-5">
																								<ul class="list-group">
																										<li class="list-group-item d-flex align-items-center">
																												<span
																												class="vg-icon-gray-500 mr-4">
																											
																													<i class="icon-2 flaticon-exclamation-2"></i>
																											</span>
																												
																												카페명
																										
																										</li>
																										
																										<li class="list-group-item d-flex align-items-center">
																												<span
																														class="vg-icon-gray-500 mr-4">
																											
																													<i class="icon-2 flaticon-avatar"></i>
																											</span>
																												
																												대표자명
																										
																										</li>
																										<li class="list-group-item d-flex align-items-center">
																												<span
																														class="vg-icon-gray-500 mr-4">
																											
																													<i class="icon-2 flaticon-placeholder"></i>
																											</span>
																												
																												소재지
																										
																										</li>
																										<li class="list-group-item d-flex align-items-center">
																												<span
																														class="vg-icon-gray-500 mr-4">
																											
																													<i class="icon-2 flaticon-add-label-button"></i>
																											</span>
																												
																												사업자번호
																										
																										</li>
																										<li class="list-group-item d-flex align-items-center">
																												<span
																														class="vg-icon-gray-500 mr-4">
																											
																													<i class="icon-2 flaticon-alarm"></i>
																											</span>
																												
																												전화번호
																										
																										</li>
																								</ul>
																								
																						</div>
																				</div>
																				<!--end: Title-->
																				
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
																											<i class="icon-2x flaticon2-user"></i>
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
													
																						
																						<div class="form-group row">
																								<label class="col-xl-3 col-lg-3 col-form-label text-right">성함</label>
																								<div class="col-lg-9 col-xl-6">
																										<div class="spinner spinner-sm spinner-success spinner-right">
																												<input class="form-control form-control-lg form-control-solid"
																												       type="text" value="nick84">
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
																												       value="01012341234" placeholder="Phone">
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
																												       value="알림톡 못하면 메일해야함" placeholder="Email">
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
																				
																				
																				<!--begin: Items-->
																		
																		
																		</div>
																		
																		<!--end::Tab Content-->

																</div>

														</div>
														<!--end::Body-->
												</div>
												<!--end::Card-->
												
												
												
												
												
												
												
												<!--  결제정보 시작 -->
												
												<div class="card card-custom">
														
														<!--begin::Header 결제정보 로고 -->
														<div class="card-header card-header-tabs-line">
																<div class="card-toolbar">
																		<ul
																				class="nav nav-tabs nav-tabs-space-lg nav-tabs-line nav-tabs-bold nav-tabs-line-3x"
																				role="tablist">
																				<a class="nav-link active" data-toggle="tab"
																				   href="#kt_apps_projects_view_tab_2">
																						<li class="nav-item mr-3">
																								<span class="nav-icon mr-2">
																									<i class="icon-2x flaticon-notepad"></i>
																								</span>
																								<span class="nav-text font-weight-bold">결제정보</span>
																						</li>
																				</a>
																		</ul>
																</div>
														</div>
														<!--end::Header-->
														
														
														<!--begin::Body-->
														
														<!--end::Body-->
														<div class="card-body">
																<!--begin: Datatable-->
																<div class="datatable datatable-bordered datatable-head-custom
																		datatable-default datatable-primary datatable-loaded" id="결제정보" style="">
																		<table class="datatable-table"
																		       style="display: block;margin-left: auto;margin-right: auto;width: 65%;">
																				<thead class="datatable-head">
																				<tr class="datatable-row" style="left: 0px;">
																						<th data-field="OrderID"
																						    class="datatable-cell datatable-cell-sort datatable-cell-sorted"
																						    data-sort="asc"><span style="width: 250px;">결제금액</span></th>
																				</tr>
																				</thead>
																				<tbody style="" class="datatable-body">
																				<tr data-row="0" class="datatable-row" style="left: 0px;">
																						<td class="datatable-cell-left datatable-cell" data-field="RecordID"
																						    aria-label="400"><span><span
																								class="font-weight-bolder">예약날짜</span></span></td>
																						<td class="datatable-cell-sorted datatable-cell" data-field="OrderID"
																						    aria-label="0004-0800">
																								<span style="">
																								<div class="d-flex align-items-center">
																										<div class="ml-4">
																												<div class="text-dark-75 font-size-lg mb-0">
																														2021.12.12</div>
																												
																										</div>
																								</div></span>
																						</td>
																				</tr>
																				
																				<tr data-row="0" class="datatable-row" style="left: 0px;">
																						<td class="datatable-cell-left datatable-cell" data-field="RecordID"
																						    aria-label="400"><span><span
																								class="font-weight-bolder">예약시간</span></span></td>
																						<td class="datatable-cell-sorted datatable-cell" data-field="OrderID"
																						    aria-label="0004-0800">
																								<span style="">
																								<div class="d-flex align-items-center">
																										<div class="ml-4">
																												<div class="text-dark-75 font-size-lg mb-0">
																														17~20시, 3시간</div>
																												
																										</div>
																								</div></span>
																						</td>
																				</tr>
																				
																				<tr data-row="0" class="datatable-row" style="left: 0px;">
																						<td class="datatable-cell-left datatable-cell" data-field="RecordID"
																						    aria-label="400"><span><span
																								class="font-weight-bolder">공간유형</span></span></td>
																						<td class="datatable-cell-sorted datatable-cell" data-field="OrderID"
																						    aria-label="0004-0800">
																								<span style="">
																								<div class="d-flex align-items-center">
																										<div class="ml-4">
																												<div class="text-dark-75 font-size-lg mb-0">
																														4인실(룸번호)</div>
																												
																										</div>
																								</div></span>
																						</td>
																				</tr>
																				
																				<tr data-row="0" class="datatable-row" style="left: 0px;">
																						<td class="datatable-cell-left datatable-cell" data-field="RecordID"
																						    aria-label="400"><span><span
																								class="font-weight-bolder">결제금액</span></span></td>
																						<td class="datatable-cell-sorted datatable-cell" data-field="OrderID"
																						    aria-label="0004-0800">
																								<span style="">
																								<div class="d-flex align-items-center">
																										<div class="ml-4">
																												<div class="text-dark-75 font-size-lg mb-0">
																														18,000 원</div>
																												
																										</div>
																								</div></span>
																						</td>
																				</tr>
																				
																				</tbody>
																		</table>
																
																
																</div>
																<!--end: Datatable-->
																
																
																
																
																
																
																
																
																<div class="separator separator-dashed my-10"></div>
																
																<div class="datatable datatable-bordered datatable-head-custom
																		datatable-default datatable-primary datatable-loaded" id="환불규정" style="">
																		<table class="datatable-table"
																		       style="display: block;margin-left: auto;margin-right: auto;width: 65%;">
																				<thead class="datatable-head">
																				<tr class="datatable-row" style="left: 0px;">
																						<th data-field="OrderID"
																						    class="datatable-cell datatable-cell-sort datatable-cell-sorted"
																						    data-sort="asc"><span style="width: 250px;">환불규정</span></th>
																				</tr>
																				</thead>
																				<tbody style="" class="datatable-body">
																				
																				<tr data-row="0" class="datatable-row" style="left: 0px;">
																						<td class="datatable-cell-left datatable-cell" data-field="RecordID"
																						    aria-label="400"><span><span
																								class="font-weight-bolder">1</span></span></td>
																						<td class="datatable-cell-sorted datatable-cell" data-field="OrderID"
																						    aria-label="0004-0800">
																								<span style="">
																								<div class="d-flex align-items-center">
																										<div class="ml-4">
																												<div class="text-dark-75 font-size-lg mb-0">
																														블라블라</div>
																												
																										</div>
																								</div></span>
																						</td>
																				</tr>
																				
																				</tbody>
																		</table>
																</div>
																
<%--																<!-- 테이블 하나 남네 -->--%>
<%--																<div class="datatable datatable-bordered datatable-head-custom--%>
<%--																		datatable-default datatable-primary datatable-loaded" id="kt_datatable2" style="">--%>
<%--																		<table class="datatable-table"--%>
<%--																		       style="display: block;margin-left: auto;margin-right: auto;width: 65%;">--%>
<%--																				<thead class="datatable-head">--%>
<%--																				<tr class="datatable-row" style="left: 0px;">--%>
<%--																						<th data-field="OrderID"--%>
<%--																						    class="datatable-cell datatable-cell-sort datatable-cell-sorted"--%>
<%--																						    data-sort="asc"><span style="width: 250px;">Customer</span></th>--%>
<%--																				</tr>--%>
<%--																				</thead>--%>
<%--																				<tbody style="" class="datatable-body">--%>
<%--																				<tr data-row="0" class="datatable-row" style="left: 0px;">--%>
<%--																						<td class="datatable-cell-left datatable-cell" data-field="RecordID"--%>
<%--																						    aria-label="400"><span><span--%>
<%--																								class="font-weight-bolder">200</span></span></td>--%>
<%--																						<td class="datatable-cell-sorted datatable-cell" data-field="OrderID"--%>
<%--																						    aria-label="0004-0800">--%>
<%--																								<span style="">--%>
<%--																								<div class="d-flex align-items-center">--%>
<%--																										<div class="ml-4">--%>
<%--																												<div class="text-dark-75 font-size-lg mb-0">--%>
<%--																														Eduard Stoeck</div>--%>
<%--																												--%>
<%--																										</div>--%>
<%--																								</div></span>--%>
<%--																						</td>--%>
<%--																				</tr>--%>
<%--																				--%>
<%--																				</tbody>--%>
<%--																		</table>			--%>
<%--																</div>--%>
																
																
																<div class="separator separator-dashed my-10"></div>
																
																
																<div class="form-group row">
																		<label class="col-xl-3 col-lg-3 col-form-label text-right">Radios</label>
																		<div class="col-9 col-form-label">
																				<div class="radio-list">
																						<label class="radio">
																								<input type="radio" name="radios4">
																								<span></span>신카</label>
																						<label class="radio">
																								<input type="radio" checked="checked" name="radios4">
																								<span></span>출금</label>
																						<label class="radio radio-disabled">
																								<input type="radio" disabled="disabled" name="radios4">
																								<span></span>Disabled</label>
																				</div>
																		</div>
																</div>
																
																
																<div class="form-group row align-items-center mb-0">
																		<label class="col-xl-3 col-lg-3 col-form-label text-right"></label>
																		
																		<div class="d-flex col-lg-9 col-xl-6">
																				<div class="checkbox-inline">
																						<label class="checkbox">
																								<input type="checkbox">
																								<span></span>신용카드</label>
																						<label class="checkbox">
																								<input type="checkbox">
																								<span></span>실시간출금</label>
																						<label class="checkbox">
																								<input type="checkbox">
																								<span></span>또 머가있지;</label>
																				</div>
																		</div>
																
																</div>
																
																
																<div class="separator separator-dashed my-10"></div>
																
																
																<div class="form-group row">
																		<label class="col-xl-3 col-lg-3 col-form-label text-right">약관</label>
																		<div class="col-lg-9 col-xl-6">
																				<div class="checkbox-list">
																						<label class="text-right checkbox">
																								<input type="checkbox">
																								<span></span>약관 전체선택</label>
																						<label class="checkbox">
																								<input type="checkbox">
																								<span></span>약관 1: ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</label>
																						<label class="checkbox">
																								<input type="checkbox" checked="checked">
																								<span></span>약관 2: ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</label>
																						<label class="checkbox">
																								<input type="checkbox" checked="checked">
																								<span></span>약관 3: ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</label>
																						<label class="checkbox">
																								<input type="checkbox" checked="checked">
																								<span></span>약관 4</label>
																				</div>
																		</div>
																</div>
																
																<!--end::Body-->
														</div>
												</div>
												<!--end::Card-->
										
										
										</div>
										
										<!--end::Content-->
								
								
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