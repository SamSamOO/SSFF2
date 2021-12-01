<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2021-11-05
  Time: 오후 3:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
	<title>모두의 스터디 :: 삼삼오오</title>
	<!--head.html Include-->
	<jsp:include page="WEB-INF/commons/head.jsp"></jsp:include>
</head>

<!----------------Head 종료----------------------->
<!----------------Body 시작----------------------->
<body id="kt_body" class="header-fixed subheader-enabled page-loading main_page">
<!----------------메인 시작----------------------->
<div class="d-flex flex-column flex-root">
	<!----------------페이지 시작----------------------->
	<div class="d-flex flex-row flex-column-fluid page">
		<!--begin::Wrapper-->
		<div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
			<!------------------header.html Include------------------>
			<%--로딩 에니메이션 js html--%>
			<div id="loading"><img src="/resources/assets/images/logos/ssff/logo-c1.png" alt="로딩"/></div>
			<!------------------모바일 헤더 시작------------------>
			<div id="kt_header_mobile" class="header-mobile justify-content-end">
				<!--툴바 시작-->
				<div class="d-flex align-items-center">
					<!--begin::User 헤더 메뉴 시작-->
					<div class="dropdown dropdown-inline">
						<!--begin::Toggle-->
						<div class="topbar-item" data-toggle="dropdown" data-offset="0px,0px">
							<div class="btn btn-dropdown top-memu text-hover-primary">
								<!--유저 프로필 사진(비로그인시 숨김)-->
								<c:if test="${member == null && kemail == null}">
									<div class="symbol symbol-30 symbol-lg-40 symbol-circle mr-3">
										<img alt="Profile Pic" src="/resources/assets/images/icon/profile_default_g_w.png" class="object-cover" />
									</div>
								</c:if>
								<c:if test="${ member != null && kemial == null}">
									<div class="symbol symbol-30 symbol-lg-40 symbol-circle mr-3">
										<img alt="Profile Pic" src="${sessionScope.member.member_profile}" class="object-cover" />
									</div>
								</c:if>
								<c:if test="${ member == null && kemail != null}">
									<div class="symbol symbol-30 symbol-lg-40 symbol-circle mr-3">
										<img alt="Profile Pic" src="${sessionScope.kimage}" class="object-cover" />
									</div>
								</c:if>

								<i class="text-dark fas fa-angle-down"></i>
							</div>

						</div>
						<!--end::Toggle-->
						<!--begin::Dropdown 헤더 메뉴 드롭다운 시작-->
						<div class="dropdown-menu p-0 m-0 dropdown-menu-right dropdown-menu-anim-up p-0">
							<!--begin::Nav 헤더 메뉴 네비 시작-->
							<div class="navi align-items-center p-3 rounded-top">
								<c:if test="${member == null && kemail == null }">
									<!--begin::Item-->
									<a href="/member/loginGo" class="navi-item dropdown-item">
										<div class="navi-link">
											<div class="navi-text login">
												<div class="font-weight-bolder">로그인 </div>
											</div>
										</div>
									</a>
									<!--end::Item-->
								</c:if>
								<!--begin::Item-->
								<a href="/study/project/list" class="navi-item dropdown-item">
									<div class="navi-link">
										<div class="navi-text">
											<div class="font-weight-bolder">프로젝트</div>
										</div>
									</div>
								</a>
								<!--end::Item-->
								<!--begin::Item-->
								<a href="/study/challenge/list" class="navi-item dropdown-item">
									<div class="navi-link">
										<div class="navi-text">
											<div class="font-weight-bolder">챌린지</div>
										</div>
									</div>
								</a>
								<!--end::Item-->
								<!--begin::Item-->
								<a href="/cafe/list" class="navi-item dropdown-item">
									<div class="navi-link">

										<div class="navi-text">
											<div class="font-weight-bolder">스터디 카페</div>
										</div>
									</div>
								</a>
								<!--end::Item-->

								<c:if test="${member != null || kemail != null }">
									<!--begin::Item-->
									<a href="/member/myPage" class="navi-item dropdown-item">
										<div class="navi-link">
											<div class="navi-text">
												<div class="font-weight-bolder">마이 페이지</div>
											</div>
										</div>
									</a>
									<!--end::Item-->
									<!--begin::Item-->
									<a href="/member/logout" class="navi-item dropdown-item">
										<div class="navi-link">
											<div class="navi-text logout">
												<div class="font-weight-bolder">로그아웃</div>
											</div>
										</div>
									</a>
									<!--end::Item-->
								</c:if>

							</div>
							<!--end::Nav 헤더 메뉴 네비 종료-->
						</div>
						<!--end::Dropdown 헤더 메뉴 드롭다운 종료-->
					</div>
					<!--end::User 헤더 메뉴 종료-->

				</div>
				<!--툴바 종료-->
			</div>
			<!------------------모바일 헤더 종료------------------>
			<!------------------헤더 시작------------------>
			<div id="kt_header" class="header header-fixed">
				<!--컨테이너 시작-->
				<div class="container justify-content-end">
					<!--begin::Topbar 우측 메뉴 파트 시작-->
					<div class="topbar topbar-minimize">
						<!--begin::User 헤더 메뉴 시작-->
						<div class="dropdown">
							<!--begin::Toggle-->
							<div class="topbar-item" data-toggle="dropdown" data-offset="0px,0px">
								<div class="btn btn-dropdown top-memu text-hover-ssff-green">
									<!--유저 프로필 사진(비로그인시 숨김)-->
									<c:if test="${member == null && kemail == null}">
										<div class="symbol symbol-30 symbol-lg-40 symbol-circle mr-3">
											<img alt="Profile Pic" src="/resources/assets/images/icon/profile_default_g_w.png" class="object-cover" />
										</div>
									</c:if>
									<c:if test="${ member != null && kemial == null}">
										<div class="symbol symbol-30 symbol-lg-40 symbol-circle mr-3">
											<img alt="Profile Pic" src="${sessionScope.member.member_profile}" class="object-cover" />
										</div>
									</c:if>
									<c:if test="${ member == null && kemail != null}">
										<div class="symbol symbol-30 symbol-lg-40 symbol-circle mr-3">
											<img alt="Profile Pic" src="${sessionScope.kimage}" class="object-cover" />
										</div>
									</c:if>

									<!--유저 닉네임(비로그인시 숨김)-->
									<c:if test="${member == null && kemail == null}">
										<div class="text-dark m-0 flex-grow-1 mr-3 font-weight-bolder font-size-h5">로그인</div>
									</c:if>
									<c:if test="${ member != null && kemial == null}">
										<div class="text-dark m-0 flex-grow-1 mr-3 font-weight-bolder font-size-h5"> ${member.member_name}</div>
									</c:if>
									<c:if test="${ member == null && kemail != null}">
										<div class="text-dark m-0 flex-grow-1 mr-3 font-weight-bolder font-size-h5"> ${kname}</div>
									</c:if>
									<i class="text-dark fas fa-angle-down"></i>
								</div>

							</div>
							<!--end::Toggle-->
							<!--begin::Dropdown 헤더 메뉴 드롭다운 시작-->
							<div class="dropdown-menu p-0 m-0 dropdown-menu-right dropdown-menu-anim-up">
								<!--begin::Nav 헤더 메뉴 네비 시작-->
								<div class="navi align-items-center p-3 rounded-top">
									<c:if test="${member == null && kemail == null }">
										<!--begin::Item-->
										<a href="/member/loginGo" class="navi-item dropdown-item">
											<div class="navi-link">
												<div class="navi-text login">
													<div class="font-weight-bolder">로그인</div>
												</div>
											</div>
										</a>
										<!--end::Item-->
									</c:if>

									<!--begin::Item-->
									<a href="/study/project/list" class="navi-item dropdown-item">
										<div class="navi-link">

											<div class="navi-text">
												<div class="font-weight-bolder">프로젝트</div>
											</div>
										</div>
									</a>
									<!--end::Item-->
									<!--begin::Item-->
									<a href="/study/challenge/list" class="navi-item dropdown-item">
										<div class="navi-link">
											<div class="navi-text">
												<div class="font-weight-bolder">챌린지</div>
											</div>
										</div>
									</a>
									<!--end::Item-->
									<!--begin::Item-->
									<a href="/cafe/list" class="navi-item dropdown-item">
										<div class="navi-link">

											<div class="navi-text">
												<div class="font-weight-bolder">스터디 카페</div>
											</div>
										</div>
									</a>
									<!--end::Item-->

									<c:if test="${member != null || kemail != null }">
										<!--begin::Item-->
										<a href="/member/myPage" class="navi-item dropdown-item">
											<div class="navi-link">
												<div class="navi-text">
													<div class="font-weight-bolder">마이 페이지</div>
												</div>
											</div>
										</a>
										<!--end::Item-->
										<!--begin::Item-->
										<a href="/member/logout" class="navi-item dropdown-item">
											<div class="navi-link">
												<div class="navi-text logout">
													<div class="font-weight-bolder">로그아웃</div>
												</div>
											</div>
										</a>
										<!--end::Item-->
									</c:if>

								</div>
								<!--end::Nav 헤더 메뉴 네비 종료-->
							</div>
							<!--end::Dropdown 헤더 메뉴 드롭다운 종료-->
						</div>
						<!--end::User 헤더 메뉴 종료-->
					</div>
					<!--end::Topbar 우측 메뉴 파트 종료-->
				</div>
				<!--컨테이너 종료-->
			</div>
			<!------------------헤더 종료------------------>
			<!---------body 시작---------->
			<div class="d-flex flex-row  justify-center align-items-center mx-auto my-auto">
				<div id="main_LOGO" class="object-contain" alt="메인로고">
					<img src="/resources/assets/images/logos/ssff/logo-c2.png">
				</div>

				<div class="main_menu d-flex flex-column">
					<a href="/study/project/list" alt="프로젝트">
						<div class="main_proj my-1 object-contain">
							<img src="/resources/assets/images/icon/main/main_proj.png"></div>
					</a>

					<a href="/study/challenge/list" alt="챌린지">
						<div class="main_chal my-1 object-contain">
							<img src="/resources/assets/images/icon/main/main_chal.png">
						</div>
					</a>

					<a href="/cafe/list" alt="카페">
						<div class="main_cafe my-1 object-contain">
							<img src="/resources/assets/images/icon/main/main_cafe.png">
						</div>
					</a>
				</div>
			</div>
			<!---------body 종료---------->

			<!------------------푸터 시작------------------>
			<div class="footer py-4 d-flex flex-lg-column" id="kt_footer">
				<!--begin::Container-->
				<div class="container d-flex flex-column flex-md-row align-items-center justify-content-between">
					<!--begin::Copyright-->
					<div class="text-dark order-2 order-md-1">
						<span class="text-muted font-weight-bolder mr-2">2020©</span>
						<a href="http://keenthemes.com/metronic" target="_blank" class="text-light-warning text-hover-ssff-orange">Keenthemes</a>
					</div>
					<!--end::Copyright-->
					<!--begin::Nav-->
					<div class="nav nav-dark order-1 order-md-2">
						<a href="http://keenthemes.com/metronic" target="_blank" class="nav-link pr-3 pl-0 text-muted text-hover-primary">About</a>
						<a href="http://keenthemes.com/metronic" target="_blank" class="nav-link px-3 text-muted text-hover-primary">Team</a>
						<a href="http://keenthemes.com/metronic" target="_blank" class="nav-link pl-3 pr-0 text-muted text-hover-primary">Contact</a>
					</div>
					<!--end::Nav-->
				</div>
				<!--end::Container-->
			</div>
			<!------------------푸터 종료------------------>
			<script src="/resources/assets/plugins/global/plugins.bundle.js"></script>
			<script src="/resources/assets/plugins/custom/prismjs/prismjs.bundle.js"></script>
			<script src="/resources/assets/js/scripts.bundle.js"></script>
</body>
<!----------------Body 종료----------------------->

</html>