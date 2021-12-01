<%--
  스터디 카페 예약 단
  User: 신지혜
  Date: 2021-11-18
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
	
	<style>
		
		
		/*---------- 모달 ----------*/
		
		.modal-dialog.modal-80size {
			width: 80%;
			height: 80%;
			margin: 0;
			padding: 0;
		}
		
		.modal-content.modal-80size {
			height: auto;
			min-height: 80%;
		}
		
		.modal.modal-center {
			text-align: center;
		}
		
		@media screen and (min-width: 768px) {
			.modal.modal-center:before {
				display: inline-block;
				vertical-align: middle;
				content: " ";
				height: 100%;
			}
		}
		
		.modal-dialog.modal-center {
			display: inline-block;
			text-align: left;
			vertical-align: middle;
		}
		
		/*---------- 모달 end ----------*/
		
		
		#rsrvSubmit {
			justify-content: space-around;
			padding: 1.2rem 6rem;
			font-size: 1.28rem;
			
		}
		
		.datatable-cell.datatable-cell-sort.datatable-cell-sorted span {
			font-size: 5.0rem;
		}
	
	
	</style>
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
									<span class="text-dark-50 font-weight-bold" id="kt_subheader_total">${cafeVO.cafe_name}</span>
								</div>
								<!--end::Search Form-->
							</div>
							<!--end::Details-->
							<!--begin::Toolbar-->
							<div class="d-flex align-items-center">
								<!--begin::Button-->
								<a onclick="history.back();" class="btn btn-default font-weight-bold">Back</a>
								<!--end::Button-->
							
							</div>
							<!--end::Toolbar-->
						</div>
						<!--end::Subheader-->
					</div>
					<!--Subheader : 서브헤더 페이지 제목란 종료-->
					
					<!------------------ 본문 시작 ------------------>
					<!--begin::Content-->
					<div class="content flex-column-fluid" id="kt_content">
						<form action="/cafe/reserve/insert" method="post" id="formObj">
							<input type="hidden" name="member_name" value="${member.member_name}">
							<input type="hidden" name="use_date" value="${roomRsrvInfoDTO.use_date}">
							<input type="hidden" name="use_start_time" value="${roomRsrvInfoDTO.use_start_time}">
							<input type="hidden" name="use_end_time" value="${roomRsrvInfoDTO.use_end_time}">
							<input type="hidden" name="room_idx" value="${roomRsrvInfoDTO.room_idx}">
							<input type="hidden" name="rsrv_amount" value="${roomRsrvInfoDTO.total_amount}">
							
							<!--begin::Card-->
							<div class="card card-custom gutter-b">
								<div class="card-body">
									<div class="d-flex">
										

										
										<!--begin: Pic-->
										<div class="flex-shrink-0 w-xl-150px mr-7 mt-lg-0 mt-3">
											<div class="symbol symbol-50 symbol-lg-120">
												<img alt="${cafeVO.cafe_image_1}" src="https://source.unsplash.com/featured?desk">
											</div>
										</div>
										<!--end: Pic-->
										
										
										<!--begin: Info-->
										<div class="flex-grow-1">
											
											
											<!--begin: Title-->
											<div class="d-flex align-items-center flex-wrap">
												<div class="flex-grow-1 font-weight-bold text-dark-50 py-5 py-lg-2 mr-5">
													
													<!--begin::Name-->
													<a href="/cafe/detail?cafe_idx=${cafeVO.cafe_idx}"
													   class="d-flex align-items-center text-dark text-hover-primary font-size-h1 font-weight-bold mr-3">
														${cafeVO.cafe_main_title}
														<i class="flaticon2-correct text-success icon-lg ml-2"></i></a>
													<!--end::Name-->
													<div style="height: 200px;">
																										<span
																											class="d-flex align-items-center text-dark text-hover-primary font-size-h5 font-weight-bold mr-3">
																										<c:forEach items="${fn:split(cafeVO.cafe_details,'.')}"
																										           var="content">
																											&nbsp;*&nbsp; ${content}
																										</c:forEach>
																										</span>
													</div>
												</div>
												
												
												<div class="flex-grow-2 font-weight-bold text-dark-50 py-5 py-lg-2 mr-5">
													<ul class="list-group">
														<li class="list-group-item d-flex align-items-center">
																												<span
																													class="vg-icon-gray-500 mr-10">
																												
																													<i class="icon-2 flaticon-exclamation-2"></i>
																														카페명
																											</span>
															<span
																class="vg-icon-gray-500 mr-4">
																
																${cafeVO.cafe_name}
															</span>
														
														
														</li>
														
														<li class="list-group-item d-flex align-items-center">
																												<span
																													class="vg-icon-gray-500 mr-6">
																											
																													<i class="icon-2 flaticon-avatar"></i>
																														대표자명
																											</span>
															
															${cafeVO.boss_name}
														
														</li>
														<li class="list-group-item d-flex align-items-center">
																												<span
																													class="vg-icon-gray-500 mr-10">
																											
																													<i class="icon-2 flaticon-placeholder"></i>
																														소재지
																											</span>
															
															<span
																class="vg-icon-gray-500 mr-4">
																
																${cafeVO.cafe_location}
															</span>
														
														</li>
														<li class="list-group-item d-flex align-items-center">
																												<span
																													class="vg-icon-gray-500 mr-2">
																											
																													<i class="icon-2 flaticon-add-label-button"></i>
																														사업자번호
																											</span>
															${cafeVO.business_number}
														
														</li>
														<li class="list-group-item d-flex align-items-center">
																												<span
																													class="vg-icon-gray-500 mr-8">
																											
																													<i class="icon-2 flaticon-alarm"></i>
																														대표번호
																											</span>
															${cafeVO.cafe_telephone_number}
														
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
											
											<div class="form-group row">
												<label class="col-xl-3 col-lg-3 col-form-label text-right">Name</label>
												<div class="col-lg-9 col-xl-6">
													<input class="form-control form-control-lg form-control-solid"
													       name="rsrv_name" title="성함" id="rname" placeholder="필수입력"
													       type="text" value="" required/>
												
												</div>
											</div>
											
											<div class="form-group row">
												<label class="col-xl-3 col-lg-3 col-form-label text-right">Phone</label>
												<div class="col-lg-9 col-xl-6">
													<div class="input-group input-group-lg input-group-solid">
														
														<div class="input-group-prepend">
																																	<span class="input-group-text">
																																		<i class="la la-phone"></i>
																																	</span>
														</div>
														<input type="text" name="rsrv_phone_number" title="연락처" id="rnum"
														       class="form-control form-control-lg form-control-solid"
														       value="" placeholder="필수입력" required/>
													</div>
													<span class="form-text text-muted">예약 알림톡이 발송됩니다.</span>
												</div>
											</div>
											
											
											
											<div class="form-group row">
												<label class="col-xl-3 col-lg-3 col-form-label text-right">Email
												</label>
												<div class="col-lg-9 col-xl-6">
													<div class="input-group input-group-lg input-group-solid">
														<div class="input-group-prepend">
																																			<span class="input-group-text">
																																				<i class="la la-at"></i>
																																			</span>
														</div>
														<input type="text" name="rsrv_email" title="이메일주소" id="remail"
														       class="form-control form-control-lg form-control-solid"
														       value="" placeholder="필수입력" required/>
													</div>
													<span class="form-text text-muted">알림 메일이 발송됩니다.</span>
												</div>
											</div>
											
											
											<div class="form-group row">
												<label class="col-xl-3 col-lg-3 col-form-label text-right">Memo</label>
												<div class="col-lg-9 col-xl-6">
																														<textarea class="form-control form-control-lg form-control-solid"
																														          id="rsrv_message" rows="3" name="rsrv_message"
																														          placeholder="요청사항을 입력해주세요.">
																														</textarea>
												</div>
											</div>
											
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
													<span class="nav-text font-weight-bold">카페 예약&결제</span>
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
												    class="datatable-cell datatable-cell-sorted"
												    data-sort="asc"><span style="width: 250px;font-size: 1.3rem;">결제정보</span></th>
											</tr>
											</thead>
											<tbody style="" class="datatable-body">
											<tr data-row="0" class="datatable-row" style="left: 0px;">
												<td class="col-4 datatable-cell-center datatable-cell" data-field="RecordID"
												    aria-label="400"><span><span
													class="font-weight-bolder">예약날짜</span></span></td>
												<td class="datatable-cell-sorted datatable-cell" data-field="OrderID"
												    aria-label="0004-0800">
																								<span style="">
																								<div class="d-flex align-items-center">
																										<div class="ml-4">
																												<div class="text-dark-75 font-size-lg mb-0">
																													${roomRsrvInfoDTO.use_date}</div>
																												
																										</div>
																								</div></span>
												</td>
											</tr>
											
											<tr data-row="0" class="datatable-row" style="left: 0px;">
												<td class="col-4 datatable-cell-center datatable-cell" data-field="RecordID"
												    aria-label="400"><span><span
													class="font-weight-bolder">예약시간</span></span></td>
												<td class="datatable-cell-sorted datatable-cell" data-field="OrderID"
												    aria-label="0004-0800">
																								<span style="">
																								<div class="d-flex align-items-center">
																										<div class="ml-4">
																												<div class="text-dark-75 font-size-lg mb-0">
																														${roomRsrvInfoDTO.use_start_time}~
																														${roomRsrvInfoDTO.use_end_time}시,
																																
																																${roomRsrvInfoDTO.use_end_time -
																																	roomRsrvInfoDTO.use_start_time + 1} 시간</div>
																												
																										</div>
																								</div></span>
												</td>
											</tr>
											
											<tr data-row="0" class="datatable-row" style="left: 0px;">
												<td class="col-4 datatable-cell-center datatable-cell" data-field="RecordID"
												    aria-label="400"><span><span
													class="font-weight-bolder">공간유형</span></span></td>
												<td class="datatable-cell-sorted datatable-cell" data-field="OrderID"
												    aria-label="0004-0800">
																								<span style="">
																								<div class="d-flex align-items-center">
																										<div class="ml-4">
																												<div class="text-dark-75 font-size-lg mb-0">
																															${roomRsrvInfoDTO.max_people}(	${roomRsrvInfoDTO.room_idx})</div>
																										</div>
																								</div></span>
												</td>
											</tr>
											
											<tr data-row="0" class="datatable-row" style="left: 0px;">
												<td class="col-4 datatable-cell-center datatable-cell" data-field="RecordID"
												    aria-label="400"><span><span
													class="font-weight-bolder">결제금액</span></span></td>
												<td class="datatable-cell-sorted datatable-cell" data-field="OrderID"
												    aria-label="0004-0800">
																								<span style="">
																								<div class="d-flex align-items-center">
																										<div class="ml-4">
																												<div class="font-weight-bolder mb-0 datatable-cell-sorted h3">
																														
																														<fmt:formatNumber value="${roomRsrvInfoDTO.total_amount}"
																														                  pattern="#,###"/> 원</div>
																												
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
												    class="datatable-cell datatable-cell-sorted"
												    data-sort="asc"><span style="width: 250px;font-size: 1.3rem;">환불규정</span></th>
											</tr>
											</thead>
											<tbody style="" class="datatable-body">
											
											
											<tr data-row="0" class="datatable-row" style="left: 0px;">
												<td class="col-4 datatable-cell-center datatable-cell" data-field=""
												    aria-label="400"><span><span
													class="font-weight-bolder">이용 4일 전</span></span></td>
												<td class="datatable-cell-sorted datatable-cell" data-field=""
												    aria-label="0004-0800">
																								<span style="">
																								<div class="d-flex align-items-center">
																										<div class="ml-4">
																												<div class="text-dark-75 font-size-lg mb-0">
																															총 금액의 100% 환불</div>
																										</div>
																								</div></span>
												</td>
											</tr>
											
											<tr data-row="0" class="datatable-row" style="left: 0px;">
												<td class="col-4 datatable-cell-center datatable-cell" data-field=""
												    aria-label="400"><span><span
													class="font-weight-bolder">이용 3일 전</span></span></td>
												<td class="datatable-cell-sorted datatable-cell" data-field=""
												    aria-label="0004-0800">
																								<span style="">
																								<div class="d-flex align-items-center">
																										<div class="ml-4">
																												<div class="text-dark-75 font-size-lg mb-0">
																															총 금액의 50% 환불</div>
																										</div>
																								</div></span>
												</td>
											</tr>
											
											<tr data-row="0" class="datatable-row" style="left: 0px;">
												<td class="col-4 datatable-cell-center datatable-cell" data-field=""
												    aria-label="400"><span><span
													class="font-weight-bolder">이용 2일 전</span></span></td>
												<td class="datatable-cell-sorted datatable-cell" data-field=""
												    aria-label="0004-0800">
																								<span style="">
																								<div class="d-flex align-items-center">
																										<div class="ml-4">
																												<div class="text-dark-75 font-size-lg mb-0">
																															총 금액의 50% 환불 </div>
																										</div>
																								</div></span>
												</td>
											</tr>
											
											<tr data-row="0" class="datatable-row" style="left: 0px;">
												<td class="col-4 datatable-cell-center datatable-cell" data-field=""
												    aria-label="400"><span><span
													class="font-weight-bolder">이용 전날</span></span></td>
												<td class="datatable-cell-sorted datatable-cell" data-field=""
												    aria-label="0004-0800">
																								<span style="">
																								<div class="d-flex align-items-center">
																										<div class="ml-4">
																												<div class="text-dark-75 font-size-lg mb-0">
																															총 금액의 50% 환불</div>
																										</div>
																								</div></span>
												</td>
											</tr>
											
											<tr data-row="0" class="datatable-row" style="left: 0px;">
												<td class="col-4 datatable-cell-center datatable-cell" data-field=""
												    aria-label="400"><span><span
													class="font-weight-bolder">이용 당일</span></span></td>
												<td class="datatable-cell-sorted datatable-cell" data-field=""
												    aria-label="0004-0800">
																								<span style="">
																								<div class="d-flex align-items-center">
																										<div class="ml-4">
																												<div class="text-dark-75 font-size-lg mb-0">
																														환불 불가</div>
																										</div>
																								</div></span>
												</td>
											</tr>
											
											
											
											
											</tbody>
										</table>
									</div>
									
									
									<div class="separator separator-dashed my-10"></div>
									
									<div class="datatable datatable-bordered datatable-head-custom
																		datatable-default datatable-primary datatable-loaded" style="">
										<table class="datatable-table"
										       style="display: block;margin-left: auto;margin-right: auto;width: 65%;">
											<thead class="datatable-head">
											<tr class="datatable-row" style="left: 0px;">
												<th data-field="PayID" style="border-bottom: 1px solid #ebedf3;"
												    class="datatable-cell datatable-cell-sorted"
												    data-sort="asc"><span style="width: 250px;font-size: 1.3rem;">결제방법</span></th>
											</tr>
											</thead>
											<tbody style="" class="datatable-body">
											
											<tr data-row="0" class="datatable-row ml-15" style="left: 0px;">
												<td class="datatable-cell-left datatable-cell ml-15" data-field="RecordID"
												    aria-label="400">
													
													<label class="radio font-weight-bolder" for="cash">
														<input type="radio" id="cash" name="pay" value="" class="ck" title="결제방법">
														<span class="mr-2"></span>실시간 출금</label>
												
												</td>
											</tr>
											
											</tbody>
										</table>
									</div>
									
									
									
									<%--																<div class="form-group row align-items-center mb-0">--%>
									<%--																		<label class="col-xl-3 col-lg-3 col-form-label text-right"></label>--%>
									<%--																		--%>
									<%--																		<div class="d-flex col-lg-9 col-xl-6">--%>
									<%--																				<div class="checkbox-inline">--%>
									<%--																						<label class="checkbox">--%>
									<%--																								<input type="checkbox">--%>
									<%--																								<span></span>신용카드</label>--%>
									<%--																						<label class="checkbox">--%>
									<%--																								<input type="checkbox">--%>
									<%--																								<span></span>실시간출금</label>--%>
									<%--																						<label class="checkbox">--%>
									<%--																								<input type="checkbox">--%>
									<%--																								<span></span>또 머가있지;</label>--%>
									<%--																				</div>--%>
									<%--																		</div>--%>
									<%--																--%>
									<%--																</div>--%>
									
									
									<div class="separator separator-dashed my-10"></div>
									
									<div class="datatable datatable-head-custom
																		datatable-default datatable-primary datatable-loaded" style="">
										<table class="datatable-table mb-10"
										       style="display: block;margin-left: auto;margin-right: auto;width: 65%;">
											<thead class="datatable-head">
											<tr class="datatable-row" style="left: 0px;">
												<th data-field="OrderID"
												    class="datatable-cell datatable-cell-sorted"
												    data-sort="asc"><span style="width: 250px;font-size: 1.3rem;">서비스 동의</span>
												
												
												
												</th>
											</tr>
											</thead>
											<tbody style="" class="datatable-body checkbox_group">
											<tr data-row="0" class="datatable-row ml-15" style="left: 0px;">
												<td class="datatable-cell-left datatable-cell ml-15"
												    aria-label="400"><span>
																					
																					<span	class="font-weight-bolder">	<label class="text-right checkbox" for="check_all">
																						<input type="checkbox" id="check_all" name="check_all" class="ck" title="서비스동의">
																						<span class="mr-2"></span>전체 동의</label></span></span></td>
											</tr>
											<tr data-row="0" class="datatable-row ml-15" style="left: 0px;">
												<td class="datatable-cell-left datatable-cell ml-15"
												    aria-label="400"><span>
																					
																					<span	class="font-weight-bolder">	<label class="checkbox mr-2" for="check_1">
																										<input type="checkbox" id="check_1" class="normal" >
																										<span class="mr-2"></span>위 공간의 예약조건 확인 및 결제진행 동의 <h8 class="text-danger ml-1">(필수)</h8></label> </span>
																				
																				</span></td>
											</tr>
											<tr data-row="0" class="datatable-row ml-15" style="left: 0px;">
												<td class="datatable-cell-left datatable-cell ml-15"
												    aria-label="400"><span>
																					<span	class="font-weight-bolder">	<label class="checkbox" for="check_2">
																										<input type="checkbox" id="check_2" class="normal">
																										<span class="mr-2"></span>개인정보 제3자 제공 동의<h8 class="text-danger ml-1">(필수)</h8></label></span></span></td>
											</tr>
											<tr data-row="0" class="datatable-row ml-15" style="left: 0px;">
												<td class="datatable-cell-left datatable-cell ml-15"
												    aria-label="400"><span>
																					<span	class="font-weight-bolder"><label class="checkbox" for="check_3">
																										<input type="checkbox" id="check_3" class="normal">
																										<span class="mr-2"></span>개인정보 수집 및 이용 동의<h8 class="text-danger ml-1">(필수)</h8></label></span></span></td>
											</tr>
											
											</tbody>
										</table>
									</div>
									
									
									
									<!--end::Body-->
									<div class="d-flex mb-10" style="justify-content: flex-end;">
										<button type="button" class="btn btn-primary font-weight-bold font-size-h6 px-10 py-4 mr-40"
										        data-toggle="modal" id="payBtn" onclick="checkFields();"
										        data-target="#my80sizeCenterModal">
											결제
										</button>
									</div>
									
									
									<!--모달시작::-->
									<div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="-1"
									     role="dialog" aria-labelledby="my80sizeCenterModalLabel">
										<div class="modal-dialog modal-80size modal-center" role="document">
											<div class="modal-content modal-80size">
												<div class="modal-header " style="background-color:#ffa800;">
													
													<h4 class="modal-title" id="myModalLabel">결제</h4>
													<button type="button" class="btn btn-default" data-dismiss="modal">X
													</button>
												</div>
												<div class="modal-body">
													<div class="row justify-content-center py-8 px-8 py-md-10 px-md-0">
														<div class="col-md-10">
															<div class="table-responsive">
																<table class="table">
																	<thead class="font-weight-boldest">
																	<tr>
																		<th class="pl-0 mb-20 font-weight-bold h2 text-uppercase">
																			결제하시겠습니까? </th> 	</tr>
																	</thead>
																	<tbody> <tr class="">
																		<td class="pl-0 pt-7 d-flex align-items-center text-muted">
																			<p><strong>예약공간</strong></p>
																		</td> 	<td
																		class="text-primary pr-0 pt-7 text-right align-middle">${cafeVO.cafe_name}(${roomRsrvInfoDTO.room_idx})
																	</td>
																	</tr>
																	
																	<tr class="">
																		<td class="pl-0 pt-7 d-flex align-items-center text-muted">
																			<p><strong>예약날짜</strong></p>
																		</td>
																		
																		<td
																			class="text-primary pr-0 pt-7 text-right align-middle"> ${roomRsrvInfoDTO.use_date}</td>
																	</tr>
																	
																	<tr class="">
																		<td class="pl-0 pt-7 d-flex align-items-center text-muted">
																			<p><strong>예약시간</strong></p>
																		</td>
																		
																		<td class="text-primary pr-0 pt-7 text-right align-middle">
																			${roomRsrvInfoDTO.use_start_time}~
																			${roomRsrvInfoDTO.use_end_time}시,
																			
																			${roomRsrvInfoDTO.use_end_time -
																				roomRsrvInfoDTO.use_start_time + 1}시간
																		
																		</td>
																	</tr>
																	
																	
																	<tr class="font-weight-boldest">
																		<td class="pl-0 pt-7 d-flex align-items-center text-muted">
																			결제예정금액
																		</td>
																		
																		
																		<td class="text-primary pr-0 pt-7 text-right align-middle h3">
																			<fmt:formatNumber value="${roomRsrvInfoDTO.total_amount}"
																			                  pattern="#,###"/> 원
																		</td>
																	</tr>
																	
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
												
												<div class="modal-footer">
													<button type="button" class="btn btn-default btn-lg "
													        id="rsrvSubmit" style="" onclick="authorize();">예약하기</button>
												
												</div>
											</div>
										</div>
									</div>
								
								
								</div>
							</div>
							<!--end::Card-->
						</form>
					
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

<script>
	
	
	const clientID = '8492614f-7af7-472e-9c00-f0b61b38ed33';
	const clientPWD = 'e9366e92-5b66-450e-8299-f1ebbf9473db';
	
	// 결제를 위해 인증창 팝업
	function authorize() {
		
		console.log("rsrvSubmit");
		$('#formObj').submit();
		
		console.log("t33tt");
		
		let location = "https://testapi.openbanking.or.kr/oauth/2.0/authorize?" +
		               "response_type=code&" +
		               "client_id=" + clientID + "&" +
		               "redirect_uri=http://localhost:8070/payment/rest/withdraw&" +
		               "scope=login inquiry transfer&" +
		               "client_info=test&" +
		               "state=b80BLsfigm9OokPTjy03elbJqRHOfGSY&" +
		               "auth_type=0&" +
		               "cellphone_cert_yn=Y&" +
		               "authorized_cert_yn=Y&" +
		               "account_hold_auth_yn=N&" +
		               "register_info=A";
		
		var popup = window.open(location, '오픈뱅킹 본인인증', 'width=700px,height=800px,scrollbars=yes');
		
	}


</script>


<script>
	
	
	// input값을 체크해서 결제 모달 안뜨게~
	function checkFields() {
		$('#payBtn').attr('data-target', '#my80sizeCenterModal');
		
		// 히든값 제외하고, 입력하는 사항 중에
		var frm = $('input[type=text]');
		
		// 밸류값이 없다면 (입력되지 않았다면 )
		frm.each(function (idx, ele) {
			
			if ("" == $(ele).val()) {
				
				// 모달창 실행 안되게 타겟 값을 임시로 바꿈
				$('#payBtn').attr('data-target', 'ttt');
				
				// 경고창
				Swal.fire('예약자의 ' + $(ele).attr("title") + '을(를) 입력해주세요!', '', 'warning')
				
				// 해당 입력 칸으로 포커스
				$(ele).focus();
				
				// if문 그만 타세요
				return;
			}
		});
		
		// 체크박스 중에
		var ckfrm = $('input[class="ck"]');
		ckfrm.each(function (idx, ele) {
			
			if (!$(ele).is(":checked")) {
				$('#payBtn').attr('data-target', 'ttt');
				
				Swal.fire($(ele).attr("title") + '을(를) 확인해주세요!', '', 'warning')
				
				return;
			}
			
		});
		
	}


</script>

<script>
	
	
	// 체크박스 전체 선택, 전체 해제
	$(".checkbox_group").on("click", "#check_all", function () {
		
		// 전체선택이 체크가 되어있는지 확인 한 후,
		var checked = $(this).is(":checked");
		
		if(checked){ // 체크가 되어 있으면 div.checkbox_group 의 input들에 모두 checked, true
			$(this).parents(".checkbox_group").find('input').prop("checked", true);
		} else { // 체크가 해제 되면 모두 checked, false
			$(this).parents(".checkbox_group").find('input').prop("checked", false);
		}
	});
	
	
	// 전체선택 후 하나만 해제했을 때, 전체선택도 해체
	$(".checkbox_group").on("click", ".normal", function() {
		console.log("TLqkf" +  $(this).is(":checked"))
		//  checked 속성을 판단
		
		if ($(this).is(":checked")==false) { // 체크 해제가 되어 있다면 전체선택의 체크박스도 해제
			$("#check_all").prop("checked", false);
		}
	});
	
	
	// 개별 선택으로 전체 다 선택되었을 때, 전체선택에도 체크
	// 체크박스 개별 선택
	$(".checkbox_group").on("click", ".normal", function() {
		var is_checked = true;
		
		$(".normal").each(function(){
			is_checked = is_checked && $(this).is(":checked");
		});
		
		$("#check_all").prop("checked", is_checked);
	});

</script>

</html>