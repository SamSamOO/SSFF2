<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<c:choose>
		<c:when test="${member.member_name == sessionScope.member.member_name}">
			<title>내 정보</title>
		</c:when>
		<c:otherwise>
			<title>${member.member_name}님의 마이 페이지</title>
		</c:otherwise>
	</c:choose>

	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/commons/head.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/resources/assets/js/member/myPage.js"></script>
</head>
<!----------------Head 종료----------------------->

<!----------------Body 시작----------------------->
<body id="kt_body" class="header-fixed subheader-enabled page-loading">
<form class="form">
	<!----------------메인 시작----------------------->
	<div class="d-flex flex-column flex-root">
		<!----------------페이지 시작----------------------->
		<div class="d-flex flex-row flex-column-fluid page">
			<!--begin::Wrapper ↓여기 매칭되는 div 태그부터 안닫아도 됨(footer에 있음)-->
			<div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
				<!------------------header.html Include------------------>
				<jsp:include page="/WEB-INF/commons/header.jsp"></jsp:include>
				<!------------------Header Wrapper : 메뉴 탭 시작------------------>
				<!--menu.html Include-->
				<jsp:include page="/WEB-INF/views/member/menu_mypage.jsp"></jsp:include>
				<!------------------Header Wrapper : 메뉴 탭 종료------------------>
				<!--컨테이너 시작-->
				<div class="d-flex flex-row flex-column-fluid container">
					<!--☆contents.html Include☆-->
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
										<i class="fas fa-user"></i>&nbsp;&nbsp;
										<h5 class="text-dark font-weight-bolder mt-2 mb-2 mr-5">
													내 정보
										</h5>
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
						<div class="content flex-column-fluid" id="kt_content">
							<!--대시보드 시작-->

							<!--풀 사이즈 카드 시작 / 카드 필요 없으면 여기서부터 밀기☆-->
							<div class="card card-custom">
								<!--begin::Body 북마크-->
								<div class="card-body">
									<!--begin::Details-->
									<div class="d-flex mb-9">
										<!--begin: Pic-->
										<div class="flex-shrink-0 mr-7 mt-lg-0 mt-3">
											<div class="symbol symbol-50 symbol-lg-120">
												<img src="${member.member_profile}" alt="image" class="object-cover"/>
											</div>
											<div class="symbol symbol-50 symbol-lg-120 symbol-primary d-none">
												<span class="symbol-label font-size-h5 font-weight-bolder"> ${fn:substring(member_Name,0,1)} </span>
											</div>
										</div>
										<!--수정기능 있는 버전-->
										<%--<div class="flex-shrink-0 mr-7 mt-lg-0 mt-3">
											<div class="symbol symbol-50 symbol-lg-120">
												<div class="image-input image-input-empty image-input-outline" id="kt_image_5" style="background-image: url(${pageContext.request.contextPath}/resources/assets/media/users/blank.png)">
													<div class="image-input-wrapper"></div>
													<label class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow" data-action="change" data-toggle="tooltip" title="" data-original-title="Change avatar">
														<i class="fa fa-pen icon-sm text-muted"></i>
														<input type="file" name="profile_avatar"
															   accept=".png, .jpg, .jpeg"/>
														<input type="hidden" name="profile_avatar_remove"/>
													</label>
													<span class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow" data-action="cancel" data-toggle="tooltip" title="Cancel avatar">
														  <i class="ki ki-bold-close icon-xs text-muted"></i>
														 </span>
													<span class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow" data-action="remove" data-toggle="tooltip" title="Remove avatar">
													  <i class="ki ki-bold-close icon-xs text-muted"></i>
													 </span>
												</div>
											</div>
											<div class="symbol symbol-50 symbol-lg-120 symbol-primary d-none">
												<span class="font-size-h3 symbol-label font-weight-boldest">JM</span>
											</div>
										</div>--%>
										<!--end::Pic-->

										<!--begin::Info-->
										<div class="flex-grow-1">
											<!--begin::Title-->
											<div class="d-flex justify-content-between flex-wrap mt-1">
												<div class="d-flex mr-3 align-items-center">

														<span class="text-dark-75 text-hover-primary font-size-h5 font-weight-bold mr-3">${member.member_name}님</span>

													<c:if test="${(sessionScope.member.member_name == member.member_name) || (sessionScope.kname == member.member_name)}">
														<i class="flaticon2-correct text-success font-size-h5 align-self-center"></i>
														<a href="/member/modifyGo" class="mx-4">
															<i class="fa fa-edit"></i>
														</a>
													</c:if>
												</div>
												<div class="my-lg-0 my-3">
													<a href="#" class="btn btn-sm bg-ssff1 bg-hover-danger-o-1 font-weight-bolder text-uppercase mr-3">프로젝트 찾기</a>
													<a href="#" class="btn btn-sm bg-ssff2 bg-hover-danger-o-1 font-weight-bolder text-uppercase mr-3">스터디 찾기</a>
												</div>
												<%--<div class="d-flex1 align-items-center w-70 flex-fill float-right mt-lg-12 mt-8">
													<button type="button" id="modifyMember" onclick="fn_modify();" class="btn btn-primary font-weight-bolder font-size-h5 pl-9 pr-9 py-4 my-5 ">
														정보수정
													</button>
													<button type="button" id="findPJ" onclick="fn_findPJ();" class="btn btn-primary font-weight-bolder font-size-h5 pl-8 pr-7 py-4 my-5 ">
														프로젝트찾기
													</button>
												</div>--%>
											</div>
											<!--end::Title-->
											<!--begin::Content-->
											<div class="d-flex flex-wrap justify-content-between mt-1">
												<div class="d-flex flex-column flex-grow-1 pr-8">
													<div class="d-flex flex-wrap mb-4">
														<a href="#" class="text-dark-50 text-hover-primary font-weight-bold mr-lg-8 mr-5 mb-lg-0 mb-2">
															<i class="flaticon2-new-email mr-2 font-size-lg"></i>
															${member.member_id}
														</a>
													</div>
													<span class="font-weight-bold text-dark-50">${member.member_introduce}</span>
												</div>
											</div>
											<!--end::Content-->
										</div>
										<!--end::Info-->
									</div>
									<!--end::Details-->

									<div class="separator separator-solid"></div>
									<!--begin::사용언어-->
									<div class="d-flex align-items-center flex-wrap mt-8 member_lang">
										<c:forEach items="" var="list">
										<!--begin::아이콘-->
										<div class="d-flex align-items-center flex-lg-fill mr-5 mb-2">
											<span class="mr-4">
												<i class=" display-4 text-muted font-weight-bolder"></i>
											</span>
										</div>
										<!--end::아이콘-->
										</c:forEach>
										<!--begin::자바-->
										<div class="d-flex align-items-center flex-lg-fill mr-5 mb-2">
											<img src="/resources/assets/images/logos/language/java.png">
										</div>
										<!--end::아이콘-->
										<!--begin::아이콘-->
										<div class="d-flex align-items-center flex-lg-fill mr-5 mb-2">
											<span class="mr-4">
												<i class=" display-4 text-muted font-weight-bolder"></i>
											</span>
										</div>
										<!--end::아이콘-->
										<!--begin::아이콘-->
										<div class="d-flex align-items-center flex-lg-fill mr-5 mb-2">
											<span class="mr-4">
												<i class=" display-4 text-muted font-weight-bolder"></i>
											</span>
										</div>
										<!--end::아이콘-->
									</div>
								</div>
								<!--카드 Body 종료-->
							</div>
							<!--풀 사이즈 카드 시작 / 카드 필요 없으면 여기서부터 밀기☆-->
							<div class="card card-custom my-5">
								<!--카드 헤더 시작-->
								<div class="card-header border-0 pt-5">
									<h3 class="card-title align-items-start flex-column">
										<span class="card-label font-weight-bolder text-dark">일정</span>
									</h3>
									<div class="card-toolbar">

									</div>
								</div>
								<!--카드 헤더 종료-->
								<!--카드 Body 시작-->
								<div class="card-body">
									예솔이가 꿈을 펼칠곳....
								</div>
								<!--카드 Body 종료-->
							</div>
							<!--풀 사이즈 카드 종료 / 카드 필요 없으면 여기서까지 밀기☆-->
						</div>
					</div>
				</div>
				<!--컨테이너 종료-->
				<!--footer.html Include-->
				<jsp:include page="${pageContext.request.contextPath}/WEB-INF/commons/footer.jsp"></jsp:include>


</form>
</body>

</html>
<script type="text/javascript">
	function fn_modify() {
		$.ajax({
			url: "/member/modify",  // 켈린더로 가는 링크
		})
	}


	function fn_findPJ() {
		$.ajax({
			url: "/member/",  // 켈린더로 가는 링크
		})
	}
</script>