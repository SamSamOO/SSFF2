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
										<div class="subheader py-2 py-lg-4" id="kt_subheader">
												<!--begin::Subheader-->
												<div class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
														<!--begin::Details-->
														<div class="d-flex align-items-center flex-wrap mr-2">
																<!--begin::Title-->
																<h5 class="text-dark font-weight-bolder mt-2 mb-2 mr-5">예약하기</h5>
																<!--end::Title-->
																<!--begin::Separator-->
																<div class="subheader-separator subheader-separator-ver mt-2 mb-2 mr-5 bg-gray-200"></div>
																<!--end::Separator-->
																<!--begin::Search Form-->
																<div class="d-flex align-items-center" id="kt_subheader_search">
																		<span class="text-dark-50 font-weight-bolder" id="kt_subheader_total">카페이름</span>
																</div>
																<!--end::Search Form-->
														</div>
														<!--end::Details-->
														<!--begin::Toolbar-->
														<div class="d-flex align-items-center">
																<!--begin::Button-->
															<a onclick="history.back();" class="btn btn-default font-weight-bolder">Back</a>
															
															<!--end::Button-->
																<!--begin::Dropdown-->
																<div class="btn-group ml-2">
																		<button type="button" class="btn btn-primary font-weight-bolder">Save Changes</button>
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