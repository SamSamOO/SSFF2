<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<title>내 정보 수정</title>
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
		<!--begin::Wrapper ↓여기 매칭되는 div 태그부터 안닫아도 됨(footer에 있음>3개)-->
		<div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
			<!------------------header.html Include------------------>
			<jsp:include page="/WEB-INF/commons/header.jsp"></jsp:include>
			<!------------------Header Wrapper : 메뉴 탭 시작------------------>
			<!--menu.html Include-->
			<jsp:include page="/WEB-INF/views/member/menu_mypage.jsp"></jsp:include>
			<!------------------Header Wrapper : 메뉴 탭 종료------------------>
			<!--컨테이너 시작-->
			<div class="d-flex flex-row flex-column-fluid container">
				<!--contents.html Include-->
				<!--begin::Content Wrapper 내용물 시작-->
				<div class="main d-flex flex-column flex-row-fluid">
					<!--Subheader : 서브헤더 페이지 제목란 시작-->
					<div class="subheader py-2 py-lg-6" id="kt_subheader">
						<div class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
							<!--begin::Info-->
							<div class="d-flex align-items-center flex-wrap mr-1">
								<!--begin::Page Heading-->
								<div class="d-flex align-items-baseline flex-wrap mr-5">
									<!--Page Title : 페이지 제목 시작-->
									<h5 class="text-dark font-weight-bolder my-1 mr-5">내 정보</h5>
									<!--Page Title : 페이지 제목 종료-->
									<!--Breadcrumb : 로드맵 시작-->
									<ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
										<li class="breadcrumb-item">
											<a href="/member/myPage?r_Idx=${member.member_name}" class="text-muted">회원 정보</a>
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
						<!--대시보드 시작-->

						<!--개인정보 변경-->
						<div class="card card-custom">
							<!--카드 헤더 시작-->
							<div class="card-header border-0 pt-5">
								<h3 class="card-title align-items-start flex-column">
									<span class="card-label font-weight-bolder text-dark">내 정보 수정</span>
								</h3>
								<div class="card-toolbar">

								</div>
							</div>
							<!--카드 헤더 종료-->

							<!--begin::Form-->
							<form class="form">
								<!--카드 Body 시작-->
								<div class="card-body">
									<div class="row">
										<label class="col-xl-3"></label>
										<div class="col-lg-9 col-xl-6">
											<h5 class="font-weight-bold mb-6">Customer Info</h5>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-xl-3 col-lg-3 col-form-label">Avatar</label>
										<div class="col-lg-9 col-xl-6">
											<div class="image-input image-input-outline" id="kt_profile_avatar" style="background-image: url(assets/media/users/blank.png)">
												<div class="image-input-wrapper" style="background-image: url()"></div>
												<label class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow" data-action="change" data-toggle="tooltip" title="" data-original-title="Change avatar">
													<i class="fa fa-pen icon-sm text-muted"></i>
													<input type="file" name="profile_avatar" accept=".png, .jpg, .jpeg" />
													<input type="hidden" name="profile_avatar_remove" />
												</label>
												<span class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow"
												      data-action="cancel" data-toggle="tooltip"
												      title="Cancel avatar">
													<i class="ki ki-bold-close icon-xs text-muted"></i>
												</span>
												<span class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow"
												      data-action="remove" data-toggle="tooltip"
												      title="Remove avatar">
													<i class="ki ki-bold-close icon-xs text-muted"></i>
												</span>
											</div>
											<span class="form-text text-muted">등록 가능한 확장자: png, jpg, jpeg.</span>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-xl-3 col-lg-3 col-form-label">아이디</label>
										<div class="col-lg-9 col-xl-6">
											<%--${member.member_id}--%>
											<input class="form-control form-control-lg form-control-solid" type="text" value="Bold" />
										</div>
									</div>
									<div class="form-group row">
										<label class="col-xl-3 col-lg-3 col-form-label"></label>
										<div class="col-lg-9 col-xl-6">
											<%--${member.member_Name}--%>
											<input class="form-control form-control-lg form-control-solid" type="text" value="Loop Inc." />
											<span class="form-text text-muted">If you want your invoices addressed to a company. Leave blank to use your full name.</span>
										</div>
									</div>
									<div class="row">
										<label class="col-xl-3"></label>
										<div class="col-lg-9 col-xl-6">
											<h5 class="font-weight-bold mt-10 mb-6">Contact Info</h5>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-xl-3 col-lg-3 col-form-label">Contact Phone</label>
										<div class="col-lg-9 col-xl-6">
											<div class="input-group input-group-lg input-group-solid">
												<div class="input-group-prepend">
																	<span class="input-group-text">
																		<i class="la la-phone"></i>
																	</span>
												</div>
												<input type="text" class="form-control form-control-lg form-control-solid" value="+35278953712" placeholder="Phone" />
											</div>
											<span class="form-text text-muted">We'll never share your email with anyone else.</span>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-xl-3 col-lg-3 col-form-label">Email Address</label>
										<div class="col-lg-9 col-xl-6">
											<div class="input-group input-group-lg input-group-solid">
												<div class="input-group-prepend">
																	<span class="input-group-text">
																		<i class="la la-at"></i>
																	</span>
												</div>
												<input type="text" class="form-control form-control-lg form-control-solid" value="nick.bold@loop.com" placeholder="Email" />
											</div>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-xl-3 col-lg-3 col-form-label">Company Site</label>
										<div class="col-lg-9 col-xl-6">
											<div class="input-group input-group-lg input-group-solid">
												<input type="text" class="form-control form-control-lg form-control-solid" placeholder="Username" value="loop" />
												<div class="input-group-append">
													<span class="input-group-text">.com</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--카드 Body 종료-->
							</form>
							<!--end::Form-->

						</div>
						<!--개인정보 변경-->

						<!--비밀번호 변경-->
						<div class="card card-custom">
							<!--begin::Header-->
							<div class="card-header py-3">
								<div class="card-title align-items-start flex-column">
									<h3 class="card-label font-weight-bolder text-dark">Change Password</h3>
									<span class="text-muted font-weight-bold font-size-sm mt-1">Change your account password</span>
								</div>
								<div class="card-toolbar">
									<button type="reset" class="btn btn-success mr-2">Save Changes</button>
									<button type="reset" class="btn btn-secondary">Cancel</button>
								</div>
							</div>
							<!--end::Header-->
							<!--begin::Form-->
							<form class="form">
								<div class="card-body">
									<!--begin::Alert-->
									<div class="alert alert-custom alert-light-danger fade show mb-10" role="alert">
										<div class="alert-icon">
															<span class="svg-icon svg-icon-3x svg-icon-danger">
																<!--begin::Svg Icon | path:assets/media/svg/icons/Code/Info-circle.svg-->
																<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																	<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																		<rect x="0" y="0" width="24" height="24" />
																		<circle fill="#000000" opacity="0.3" cx="12" cy="12" r="10" />
																		<rect fill="#000000" x="11" y="10" width="2" height="7" rx="1" />
																		<rect fill="#000000" x="11" y="7" width="2" height="2" rx="1" />
																	</g>
																</svg>
																<!--end::Svg Icon-->
															</span>
										</div>
										<div class="alert-text font-weight-bold">Configure user passwords to expire periodically. Users will need warning that their passwords are going to expire,
											<br />or they might inadvertently get locked out of the system!</div>
										<div class="alert-close">
											<button type="button" class="close" data-dismiss="alert" aria-label="Close">
																<span aria-hidden="true">
																	<i class="ki ki-close"></i>
																</span>
											</button>
										</div>
									</div>
									<!--end::Alert-->
									<div class="form-group row">
										<label class="col-xl-3 col-lg-3 col-form-label text-alert">Current Password</label>
										<div class="col-lg-9 col-xl-6">
											<input type="password" class="form-control form-control-lg form-control-solid mb-2" value="" placeholder="Current password" />
											<a href="#" class="text-sm font-weight-bold">Forgot password ?</a>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-xl-3 col-lg-3 col-form-label text-alert">New Password</label>
										<div class="col-lg-9 col-xl-6">
											<input type="password" class="form-control form-control-lg form-control-solid" value="" placeholder="New password" />
										</div>
									</div>
									<div class="form-group row">
										<label class="col-xl-3 col-lg-3 col-form-label text-alert">Verify Password</label>
										<div class="col-lg-9 col-xl-6">
											<input type="password" class="form-control form-control-lg form-control-solid" value="" placeholder="Verify password" />
										</div>
									</div>
								</div>
							</form>
							<!--end::Form-->
						</div>
						<!--비밀번호 변경-->

						<!--대시보드 종료-->
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