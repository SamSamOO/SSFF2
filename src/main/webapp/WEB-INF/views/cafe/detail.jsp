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
		<title>cafeDetail</title>
		
		<!-- swiper -->
		<link rel="stylesheet"
		      href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
		<script
				src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
		
		<!-- 달력 -->
		<link rel="stylesheet"
		      href="https://cdn.jsdelivr.net/npm/color-calendar/dist/css/theme-basic.css"/>
		<link rel="stylesheet"
		      href="https://cdn.jsdelivr.net/npm/color-calendar/dist/css/theme-glass.css"/>
		<script src="https://cdn.jsdelivr.net/npm/color-calendar/dist/bundle.min.js"></script>
	
	<!-- 카카오map -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3916588b4559c956ff1595fb1b117cc4&libraries=services"></script>
	
	
	<style>


    /*--------------- swiper [s] ---------------*/
    /*.swiper-slide.bo-x {*/
    /*  width: 45px !important;*/
    /*  height: 30px;*/
    /*  text-align:center;*/
    /*  !*display:flex; !* 내용을 중앙정렬 하기위해 flex 사용 *!*!*/
    /*  align-items:center; !* 위아래 기준 중앙정렬 *!*/
    /*  justify-content:left; !* 좌우 기준 중앙정렬 *!*/
    /*  border: 1px solid red;*/
    /*  !*border: 2px solid #ffc000;*!*/
    /*  !*background-color: #ffd014;*!*/

    /*  text-align: center;*/
    /*  font-size: 18px;*/
    /*  background: #ffd014;*/

    /*  !* Center slide text vertically *!*/
    /*  display: -webkit-box;*/
    /*  display: -ms-flexbox;*/
    /*  display: -webkit-flex;*/
    /*  display: flex;*/
    /*  -webkit-box-pack: center;*/
    /*  -ms-flex-pack: center;*/
    /*  -webkit-justify-content: center;*/
    /*  justify-content: center;*/
    /*  -webkit-box-align: center;*/
    /*  -ms-flex-align: center;*/
    /*  -webkit-align-items: center;*/
    /*  align-items: center;*/
    /*  */
    /*  */
    /*}*/

    /*.time_box >span.price{*/
    /*  !*width: 50px !important;*!*/
    /*  !*height: 30px;*!*/
    /*  !*border: 1px solid #4a5562;*!*/
    /*  cursor: pointer;*/
    /*  list-style: none;*/
    /*  color: #cc8c28;*/
    /*  */
    /*  width: 45px !important;*/
    /*  min-width: 45px;*/
    /*  height: 41px;*/
    /*  font-size: 10px;*/
    /*  padding-top: 3px;*/
    /*  vertical-align: middle;*/
    /*  word-break: break-all;*/
    /*  word-wrap: break-word;*/
    /*  text-align: center;*/
    /*}*/

    /*.time_box >span.time{*/
    /*  position: absolute;*/
    /*  left: -8px;*/
    /*  top: -23px;*/
    /*  width: 15px;*/
    /*  text-align: center;*/
    /*  color: #000;*/
    /*  vertical-align: top;*/
    /*  list-style: none;*/
    /*}*/

    /*.bo-x {*/
    /*  width: auto;*/
    /*  height: 30px;*/
    /*}*/

    /*.swiper-wrapper.time_list {*/
    /*  align-items:center; !* 위아래 기준 중앙정렬 *!*/
    /*  justify-content:left; !* 좌우 기준 중앙정렬 *!*/
    /*  */
    /*}*/
    /*!*.meetspace .reserve_time_wrap .time_list li {*!*/
    /*!*  position: relative;*!*/
    /*!*  float: left;*!*/
    /*!*  height: 103px;*!*/
    /*!*  width: 45px;*!*/
    /*!*  padding: 47px 0 14px;*!*/
    /*!*}*!*/

    /*.swiper-container2 {*/
    /*  margin: 0 auto;*/
    /*  position: relative;*/
    /*  overflow: hidden;*/
    /*  list-style: none;*/
    /*  padding: 0;*/
    /*  z-index: 1;*/

    /*  width:230px;*/
    /*  height:100px;*/
    /*  border:1px solid silver;*/
    /*  border-radius:7px;*/
    /*  box-shadow:0 0 20px #ccc inset;*/

    /*  align-items:center; !* 위아래 기준 중앙정렬 *!*/
    /*  justify-content:left; !* 좌우 기준 중앙정렬 *!*/

    /* */
    /*  */
    /*}*/


    .swiper-container {
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .swiper-button-prev,
    .swiper-button-next {
      background-image: none !important;
    }

    /*--------------- swiper [e] ---------------*/

    .swiper-slide {
	    width:650px;
	    height:400px;
	    overflow:hidden;
	    margin:0 auto;
    }

    .image-thumbnail {
	    width:100%;
	    height:100%;
	    object-fit:cover;
    }
    
    
    html, body {
      box-sizing: border-box;
      padding: 0;
      margin: 0;
    }

    *, *:before, *:after {
      box-sizing: inherit;
    }

    .clearfix:after {
      content: '';
      display: block;
      clear: both;
      float: none;
      background-color: #bf7e00;
    }

    /* ======== Calendar ======== */
    .my-calendar {
      width: inherit;
      margin: 0px;
      padding: 0px;
      text-align: center;
      font-weight: 800;
      border: 1px solid #ddd;
      cursor: default;
    }

    .my-calendar .clicked-date {
      text-align: right;
      width: inherit;
      width: 100%;
      background: #ddd;
    }

    .my-calendar .calendar-box {
      float: right;
      width: 58%;
      padding-left: 30px;
    }

    .clicked-date {
      display: none;
    }

    .clicked-date .cal-day {
      font-size: 20px;
      text-align: right;
      width: inherit;
    }

    .clicked-date .cal-date {
      font-size: 20px;
      text-align: right;
      width: inherit;
    }

    .ctr-box {
      padding: 0 16px;
      font-size: 20px;
    }

    .ctr-box .btn-cal {
      position: relative;
      float: left;
      width: 25px;
      height: 25px;
      margin-top: 5px;
      font-size: 16px;
      cursor: pointer;
      border: none;
      background: none;
    }

    .ctr-box .btn-cal:after {
      content: '<';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      line-height: 25px;
      font-weight: bold;
      font-size: 20px;
    }

    .ctr-box .btn-cal.next {
      float: right;
    }

    .ctr-box .btn-cal.next:after {
      content: '>';
    }

    .cal-table {
      width: 100%;
    }

    .cal-table th {
      width: 14.2857%;
      padding-bottom: 5px;
      font-size: 16px;
      font-weight: 500;
    }

    .cal-table td {
      padding: 3px 0;
      height: 15px;
      font-size: 15px;
      vertical-align: middle;
      font-weight: 100;
    }

    .cal-table td.day {
      position: relative;
      cursor: pointer;
    }

    .cal-none { /* 이전 날짜 선택 불가 */
      cursor: default !important;
      background-color: #f5f5f5;
      color: #dddddd;
      pointer-events: none;
    }

    .cal-table td.today {
      background: #ffd255;
      border-radius: 50%;
      color: #fff;
      cursor: default !important; /* 현재날짜 선택불가 */
      pointer-events: none;
    }

    .cal-table td.day-active {
      background: #ff8585;
      border-radius: 50%;
      color: #fff;
    }

    .cal-table td.has-event:after {
      content: '';
      display: block;
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      height: 4px;
      background: #FFC107;
    }

    /* ======== Calendar ======== */

    /* ========== body ========== */
    table.time-pick {
      border-collapse: collapse;
      text-align: center;
      line-height: 1.5;

    }

    table.time-pick th {
      width: 150px;
      padding: 10px;
      font-weight: bold;
      vertical-align: top;
    }

    table.time-pick td {
      width: 350px;
      padding: 10px;
      vertical-align: top;
      cursor: pointer;
    }

    .time-active {
	    background-color: #ebab317a;
	    border: 1.5px solid #ffa800 !important;
    }


    .time-pick li {
      border-collapse: collapse;
      cursor: pointer;
      height: 40px;
      width: 63px;
      text-align: center;

      padding: 0px;


      font-weight: bold;
      vertical-align: top;
	    border: 1px solid #cccccc91;
      list-style: none;

      float: left;

    }


    .time-pick ul {


      padding: 0px;


    }

    /*table.time-pick.time-active td {*/
    /*  background-color: red;*/
    /*}*/
		
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
												<div
														class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
														<!--begin::Info-->
														<div class="d-flex align-items-center flex-wrap mr-1">
																<!--begin::Page Heading-->
																<div class="d-flex align-items-baseline flex-wrap mr-5">
																		<!--Page Title : 페이지 제목 시작-->
																		<h5 class="text-dark font-weight-bolder my-1 mr-5">스터디카페
																				리스트</h5>
																		<!--Page Title : 페이지 제목 종료-->
																		<!--Breadcrumb : 로드맵 시작-->
																		<ul
																				class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bolder p-0 my-2 font-size-sm">
																				<li class="breadcrumb-item"><a href=""
																				                               class="text-muted">스터디카페</a></li>
																				<li class="breadcrumb-item"><a href=""
																				                               class="text-muted">예약내역</a></li>
																		</ul>
																		<!--Breadcrumb : 로드맵 종료-->
																</div>
																<!--end::Page Heading-->
														</div>
														<!--end::Info-->
												
												</div>
										</div>
										<!--Subheader : 서브헤더 페이지 제목란 종료-->
										
										<!------------------ 본문 시작 ------------------>
										<!--begin::Content Wrapper-->
										
										<div class="d-flex flex-row flex-column-fluid container" id="container">
						
										
										</div>
										<!--end::Page Layout-->
								</div>
								<!--end::Content-->
						</div>
						<!--begin::Content Wrapper-->
				</div>
				<!--end::Container-->
				<!------------------ 본문 종료 ------------------>
		</div>
</div>


</div>
</div>
<!--컨테이너 종료-->
<!--footer.html Include-->
<jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</body>
<!----------------Body 종료----------------------->
<script>
  // 이미지 슬라이드
  $(function () {
    //initialize swiper when document ready
    var mySwiper = new Swiper('.cafe-img.swiper-container', {
      // Optional parameters
      // 방향
      slidesPerView: 1, // 슬라이드를 한번에 3개를 보여준다
	    slidesPerGroup: 1,// 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
      spaceBetween: 0, // 슬라이드간 padding 값 30px 씩 떨어뜨려줌

      // 그룹수가 맞지 않을 경우 빈칸으로 메우기
      // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
      loopFillGroupWithBlank: true,

      loop: false, // loop 를 true 로 할경우 무한반복 슬라이드, false 로 할경우 슬라이드의 끝에서 더보여지지 않음

      // If we need pagination
      pagination: {
        el       : '.swiper-pagination',
        clickable: true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
      },
	    navigation: {
		    nextEl: '.swiper-button-next',
		    prevEl: '.swiper-button-prev',
	    },
      // 반응형
      breakpoints: {
        1280: {
          slidesPerView : 1,
          slidesPerGroup: 1,
        },
        720 : {
          slidesPerView : 1,
          slidesPerGroup: 1,
        },
      }
    })

    // var mySwiper = new Swiper('.timePick.swiper-container2', {
    //   // Optional parameters
    //   // 방향
    //   slidesPerView: 9, // 슬라이드를 한번에 3개를 보여준다
    //   // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
    //   spaceBetween     : 0, // 슬라이드간 padding 값 30px 씩 떨어뜨려줌
    //   mousewheelControl: true,
    //   freeMode         : true,//활성화하면 슬라이드에 고정된 위치가 없음 여러개 슬라이드 휙 움직임
    //   direction        : getDirection(),
    //   // 그룹수가 맞지 않을 경우 빈칸으로 메우기
    //   // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
    //   // loopFillGroupWithBlank: true,
    //   on  : {
    //     resize: function () {
    //       swiper.changeDirection(getDirection());
    //     },
    //   },
    //   loop: false, // loop 를 true 로 할경우 무한반복 슬라이드, false 로 할경우 슬라이드의 끝에서 더보여지지 않음
    //
    //   // 반응형
    //   breakpoints: {
    //     1280: {
    //       slidesPerView : 3,
    //       slidesPerGroup: 3,
    //     },
    //     720 : {
    //       slidesPerView : 1,
    //       slidesPerGroup: 1,
    //     }
    //   }
    // })
    //
    // function getDirection() {
    //   var windowWidth = window.innerWidth;
    //   var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';
    //
    //   return direction;
    // }
  });


</script>

<script>

  let cont =
          `
		         
												<c:if test="${cafeInfo == null or fn:length(cafeInfo) == 0}">비었음</c:if>
												
												
												<!--begin::Content Wrapper-->
												<div class="main d-flex flex-column flex-row-fluid">
														<div class="content flex-column-fluid" id="kt_content">
																<!--begin::Page Layout-->
																<div class="d-flex flex-row">
																		
																		<!--begin::Layout-->
																		<div class="flex-row-fluid">
																				<!--begin::Card-->
																				<div class="card card-custom gutter-b">
																						<div class="card-body p-0">
																								<!-- begin: Invoice-->
																								
																								<!-- begin: 카페 타이틀 -->
																								<div class="row justify-content-center py-8 px-md-0  mx-0">
																										<div class="col-md-10">
																												<div
																														class="justify-content-between flex-column flex-md-row ">
																														<h1 class="display-4 font-weight-boldest mb-10 pb-4"
																														    style="margin-bottom: 0 !important;">${cafeInfo[0].cafe_name}</h1>
																														
																														<h3 class="sub-title-tag pb-4">
																																
																																<c:forEach items="${fn:split(cafeInfo[0].cafe_sub_title,' ')}"
																																           var="tag">
																																		#${tag}
																																</c:forEach>
																														</h3>
																														<!-- 이미지 슬라이드 [s] -->
																														<div class="symbol-label min-w-65px min-h-100px pb-10">
																																
																																<div class="cafe-img swiper-container mySwiper">
																																		<div class="swiper-wrapper">
																																				
																																				<%--<!-- 카페 이미지와 -->--%>
																																				<%--<div class="swiper-slide">--%>
																																				<%--		<img src="${cafeInfo[0].cafe_image_1}"/>--%>
																																				<%--</div>--%>
																																				<%--<div class="swiper-slide">--%>
																																				<%--		<img src="${cafeInfo[0].cafe_image_2}"/>--%>
																																				<%--</div>--%>
																																				<%--<div class="swiper-slide">--%>
																																				<%--		<img src="${cafeInfo[0].cafe_image_3}"/>--%>
																																				<%--</div>--%>
																																				<%--<!-- 카페 룸 이미지 -->--%>
																																				<%--<c:forEach items="${fn:split(cafeInfo[0].room_list,':')}"--%>
																																				<%--           var="room_img">--%>
																																				<%--		<div class="swiper-slide">--%>
																																				<%--				<img src="${room_img}"/>--%>
																																				<%--		</div>--%>
																																				<%--</c:forEach>--%>
																																		
																																		<!-- 카페 이미지와 -->
																																				<div class="swiper-slide">
																																						<img class="image-thumbnail" src="https://source.unsplash.com/featured?office%20space"
																																						 />
																																				</div>
																																				<div class="swiper-slide">
																																						<img class="image-thumbnail" src="https://source.unsplash.com/featured?office"
																																						/>
																																				</div>
																																				<div class="swiper-slide">
																																						<img class="image-thumbnail" src="https://source.unsplash.com/featured?desk"
																																				/>
																																				</div>
																																				<!-- 카페 룸 이미지 -->
																																				<c:forEach items="${fn:split(cafeInfo[0].room_list,':')}"
																																				           var="room_img">
																																						<div class="swiper-slide">
																																								<img class="image-thumbnail" src="https://source.unsplash.com/featured?office%20room"
																																								/>
																																						</div>
																																				</c:forEach>
																																				
																																		</div>
																																		<div class="swiper-button-next"><i
																																				class="icon-2x text-dark-50 flaticon2-next"></i></div>
																																		<div class="swiper-button-prev"><i
																																				class="icon-2x text-dark-50 flaticon2-back"></i></div>
																																</div>
																														
																														</div>
																														<!-- 이미지 슬라이드 [e] -->
																														
																														<h1 class="display-4 mb-0">${cafeInfo[0].cafe_main_title}</h1>
																												</div>
																										
																										</div>
																								</div>
																								<!-- end: 카페 타이틀 -->
																								
																								<!-- begin: 카페 상세설명 -->
																								<div class="row justify-content-center py-8 px-md-0 mx-0  min-h-md-300px">
																										<div class="col-md-10">
																												<div class="table-responsive">
																														<table class="table">
																																<thead>
																																<tr>
																																		<th
																																				class="pl-0 font-weight-bolder text-muted text-uppercase">상세설명
																																		</th>
																																</tr>
																																</thead>
																																<tbody>
																																<tr class="font-weight-boldest border-bottom-0">
																																		<td class="border-top-0 text-reft py-4 align-middle">
																																				${cafeInfo[0].cafe_details}</td>
																																</tr>
																																</tbody>
																														</table>
																												</div>
																										</div>
																								</div>
																								<!-- end: 카페 상세설명  -->
																								
																								
																								<!-- begin: 운영정보 안내 -->
																								<div
																										class="row justify-content-center py-8 bg-gray-100 px-md-0 mx-0">
																										
																										<div class="col-md-10">
																												<div class="table-responsive"></div>
																												<table class="table">
																														<thead>
																														<tr>
																																<th
																																		class="pl-0 font-weight-bolder text-muted text-uppercase">운영안내
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
																																		${cafeInfo[0].cafe_open_time}시 ~ ${cafeInfo[0].cafe_close_time} 시
																																</td>
																														</tr>
																														<tr class="border-bottom-0">
																																
																																<td
																																		class="border-top-0 text-reft py-4 align-middle font-weight-boldest">
																																		가게위치
																																</td>
																																
																																
																																<td
																																		class="border-top-0 text-reft py-4 align-middle">${cafeInfo[0].cafe_location}</td>
																														</tr>
																														</tbody>
																												</table>
																										</div>
																								</div>
																								<!-- end: 운영정보 안내  -->
																								
																								
																								<!-- begin: 가게 정보(지도, 전화번호) -->
																								<div class="row justify-content-center py-8 px-md-0  mx-0">
																										<div class="col-md-10">
																												<div
																														class="justify-content-between flex-column flex-md-row">
																														<div>
																														<h1 class="display-4 font-weight-boldest mb-2"> ${cafeInfo[0].cafe_name}</h1>
																														
																														<h3 class="mb-3">${cafeInfo[0].cafe_location}</h3>
																														<button type="button" class="btn btn-outline-warning
																														  font-size-h6 py-4 mr-2 mb-4 btn-pill" style="width:48%" id="loadView">길찾기</button>
																														<button type="button" class="btn btn-outline-success
																														  font-size-h6 py-4 mr-2 mb-4 btn-pill" style="width:48%" id="callInfo">전화걸기</button>

																														</div>
																														<div class="symbol-label min-w-65px min-h-300px"
																														     id="map">
																														     
																														</div>
																												</div>
																										
																										
																										</div>
																								</div>
																								<!-- end: 가게 정보(지도, 전화번호)  -->
																								
																								
																								<!-- begin: 이용 안내 -->
																								<div
																										class="row justify-content-center py-8 bg-gray-100 px-md-0 mx-0">
																										<div class="col-md-10">
																												<div class="table-responsive">
																														<table class="table">
																																<thead>
																																<tr>
																																		<th
																																				class="pl-0 font-weight-bolder text-muted text-uppercase">이용안내
																																		</th>
																																</tr>
																																</thead>
																																<tbody>
																																<tr class="font-weight-boldest border-bottom-0">
																																		<td class="border-top-0 text-reft py-4 align-middle">
																																				1. 사전 준비 및 뒷정리 시간을 포함하여 신청해야 합니다.
																																		</td>
																																</tr>
																																<tr class="font-weight-boldest border-bottom-0">
																																		<td class="border-top-0 text-reft py-4 align-middle">
																																				2. 코로나19 방역 수칙에 준수하여 운영됩니다.
																																		</td>
																																</tr>
																																<tr class="font-weight-boldest border-bottom-0">
																																		<td class="border-top-0 text-reft py-4 align-middle">
																																				3. 당일 예약은 카페로 문의바랍니다.
																																		</td>
																																</tr>
																																<tr class="font-weight-boldest border-bottom-0">
																																		<td class="border-top-0 text-reft py-4 align-middle">
																																				4. 예약 인원보다 실제 인원이 많을 경우, 초과 인원수의 2배가 벌금으로 부과됩니다.
																																		</td>
																																</tr>
																																</tbody>
																														</table>
																												</div>
																										</div>
																								</div>
																								<!-- end: 이용 안내  -->
																						</div>
																				</div>
																				<!--end::Card-->
																		</div>
																		<!--end::Layout-->
																		
																		
																		<!--begin::Aside-->
																		<div class="flex-column offcanvas-mobile w-325px w-xl-325px"
																		     id="kt_profile_aside" style="margin-left: 2em !important;">
																				<!--begin::List Widget 17-->
																				<div class="card card-custom gutter-b">
																						<!--begin::Header-->
																						<div class="card-header border-0 pt-5">
																								<h3 class="card-title align-items-start flex-column"
																								    style="border-bottom: 3px solid #ebab31;">
																										<a href="/cafe/reservation"
																										   class="card-label font-weight-bolder text-dark font-size-h2">
																												예약하기</a>
																								</h3>
																								<br>
																						
																						</div>
																						<!--end::Header-->
																						
																						<!--begin::Body-->
																						<div class="card-body pt-4">
																								<!--begin::Container-->
																								<div>
																										<!--begin::Item-->
																										<div class="align-items-center mb-8">
																												
																												<!-- begin::룸 선택 -->
																												<div class="form-group mb-7">
																														
																														<div
																																class="font-size-h4 font-weight-bolder text-dark mb-4"
																																data-value="${room.room_idx}"
																																style="border-bottom: 3px solid #6b984f; display: none;">날짜선택
																														</div>
																														
																														<!-- .my-calendar -->
																														<div class="my-calendar clearfix calendar-box mb-10">
																																
																																<div class="clicked-date">
																																		<span class="cal-day"></span>
																																		<span class="cal-date"></span>
																																</div>
																																
																																<div class="ctr-box clearfix mb-5 mt-5">
																																		<button type="button" title="prev" class="btn-cal prev">
																																		</button>
																																		<span class="cal-year"></span>
																																		<span> / </span>
																																		<span class="cal-month"></span>
																																		<button type="button" title="next" class="btn-cal next">
																																		</button>
																																</div>
																																
																																<table class="cal-table">
																																		<thead>
																																		<tr>
																																				<th style="color:red">S</th>
																																				<th>M</th>
																																				<th>T</th>
																																				<th>W</th>
																																				<th>T</th>
																																				<th>F</th>
																																				<th style="color:blue">S</th>
																																		</tr>
																																		</thead>
																																		<tbody class="cal-body"></tbody>
																																</table>
																														
																														</div>
																														<!-- // .my-calendar -->
																												</div>
																												<form action="/cafe/reserve" method="post" id="formObj">
																												<input type="hidden" name="nickName" value="nickName9300">
																												            <input type="hidden" name="cafe_idx" value="${cafeInfo[0].cafe_idx}">
																												<div id="select-rsrv-info" style="display:none;">
																														<span id="select-year" class="date"></span>
																														<span id="select-month" class="date"></span>
																														<span id="select-date" class="date"></span>
																														<span id="select-room" class="room"></span>
																														<span id="select-start-time" class="time"></span>
																														<span id="select-end-time" class="time"></span>
																														<span id="select-time" class="time"></span>
																														<span id="select-amount" class="amount"></span>
																														<span id="select-max-people" class="info"></span>
																												</div>
																												
																												</form>
																												<label
																														class="font-size-h3 font-weight-bolder text-dark mb-7"
																														style="border-bottom: 3px solid #ebab31;">Room</label>
																												<!--begin::Radio list-->
																												<div class="radio-list">
																														
																														<c:forEach items="${cafeInfo}" var="room">
																																<div class="${room.room_idx}">
																																		
																																		<!-- radio [ s ] -->
																																		<label class="radio radio-lg mb-7"> <input
																																				type="radio" name="room" id="${room.room_idx}" value="${room.amount_hour}"
																																				onclick="viewInfo('${room.room_idx}');" > <span></span>
																																				<div
																																						class="font-size-lg text-dark-75 font-weight-bolder"
																																						id="mp-${room.room_idx}">
																																								${room.max_people}인실
																																				</div>
																																				<div class="ml-auto text-muted font-weight-bolder"
																																				     >
																																				     
																																								<fmt:formatNumber value="${room.amount_hour}"
																														                  pattern="#,###"/> 원/시간
																																				</div>
																																		</label>
																																		<!-- radio [ e ] -->
																																		
																																		<!--begin::룸별 정보 동적생성구간 active로 활성화 ㄲ -->
																																		<div class="card-body p-1 mb-7" id="info-${room.room_idx}"
																																		     style="display: none;">
																																				
																																				<!--begin::Item-->
																																				<div class="align-items-center mb-8">
																																						
																																						<!-- begin::룸 선택 -->
																																						<div class="form-group mb-7">
																																								<div class="symbol-label min-w-65px min-h-120px">
																																								     <img src="https://source.unsplash.com/featured?office"
																																								     style="height: 120px !important;width: 260px !important;"></img>
																																								</div>
																																						</div>
																																						<!-- end::룸 선택 -->
																																						
																																						<div
																																								class="font-size-h4 font-weight-bolder text-dark mb-4"
																																								
																																								style="border-bottom: 3px solid #6b984f;">예약선택
																																						</div>
																																						
																																						<label class="radio radio-lg mb-7"
																																						       value="${room.room_idx}"
																																						       onclick="viewPicker('${room.room_idx}');
																																								       ">
																																								<input
																																										type="radio" name="time" style=""> <span
																																								style=""></span>
																																								<div class="font-size-lg text-dark-75 font-weight-bolder"
																																								     style="">&nbsp;시간 단위(최소 1시간부터)
																																								</div>
																																						</label>
																																						
																																						<div id="picker-time-${room.room_idx}"
																																						
																																						     style="display: none;">
																																								<div
																																										class="font-size-h4 font-weight-bolder text-dark mb-4"
																																										data-value="${room.room_idx}"
																																										style="border-bottom: 3px solid #6b984f;">시간선택
																																								</div>
																																								<!-- 시간 select table! -->
																																										<%--																																								<table class="time-pick min-w-65px min-h-60px mt-5" id="time-picker"></table>--%>
																																								<div class="time-pick min-w-65px min-h-60px mt-5"
																																								     id="time-picker"
																																								     style="height: 200px;"
																																								>
																																								
																																								
																																								</div>
																																						
																																						</div>
																																				
																																				</div>
																																				<!--end::Item-->
																																		
																																		</div>
																																		<!--begin::룸별 정보 동적생성구간-->
																																
																																</div>
																														
																														
																														</c:forEach>
																												
																												</div>
																												<!--end::Radio list-->
																												
																												
														
																												<a onclick="goRsrv();" class="btn btn-warning
																												font-size-h6 py-4 mr-2 mb-4 mt-5" role="button"
																												   style="display: block;">예약하기</a>
																												
																												<br>
																												<br>
																												<br>
																												
																												<!-- 시간 swiper -->
																												<%--																												<div class="timePick swiper-container2">--%>
																												<%--																														<ul class="swiper-wrapper time_list">--%>
																												<%--																																--%>
																												<%--																																<!-- 카페 이미지와 -->--%>
																												<%--&lt;%&ndash;																																<li class="swiper-slide bo-x">&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																		<span class="time time_half">오전</span>&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																		<a class="time_box">&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																				<span class="time">0</span>&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																				<span class="price"></span>&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																		</a>&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																</li>&ndash;%&gt;--%>
																												<%--																																--%>
																												<%--																																<c:forEach items="${cafeInfo}" var="room" varStatus="i">--%>
																												<%--																																--%>
																												<%--																																<li class="swiper-slide bo-x mt-10 mb-10">--%>
																												<%--																																		<a class="time_box">--%>
																												<%--																																				<span class="time">1</span>--%>
																												<%--																																				<span class="price">2000</span></a>--%>
																												<%--																																</li>--%>
																												<%--																																	--%>
																												
																												<%--																																</c:forEach>--%>
																												<%--																														--%>
																												<%--&lt;%&ndash;																																<li class="swiper-slide bo-x">&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																		<span class="time time_half">오후</span>&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																		<a	class="time_box">&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																				<span class="time">12</span>&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																				<span class="price">2,000</span>&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																		</a>&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																</li>&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																<li class="swiper-slide bo-x">&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																		<span class="time time_half">익일</span>&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																		<a	class="time_box">&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																				<span class="time">0</span>&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																				<span class="price"></span>&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																		</a>&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																																</li>&ndash;%&gt;--%>
																												<%--&lt;%&ndash;																														</ul>&ndash;%&gt;--%>
																												<%--																														<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>--%>
																												<%--																													--%>
																												<%--																												</div>--%>
																										
																										
																										</div>
																								
																								</div>
																						
																						</div>
																				
																				</div>
																				<!-- end::룸 선택 -->
																		
																		</div>
																		<!--end::Item-->
																
																</div>
																<!--end::Container-->
														
														</div>
														<!--end::Body-->
												
												
												</div>
												<!--end::List Widget 17-->
										
										</div>
										<!--end::Aside-->
		         
		         `;


  $('#container').html(cont);




  // 룸 선택시 해당 룸의 상세 정보가 하단에 노출되게
  function viewInfo(roomIdx) {
    // 클릭 이벤트가 발생하면 id중 info-로 시작하는 애들 disalbe
    // $('#info-' + $id)만 able
    // able -> css display : block
    // disable -> none
    console.log("========================")

    // 기존에 담긴 정보 지우기
	  // var frm = $("#frm :input").not(":input[type=hidden]");
	
	  
	  // $(`span[id^='select']`).not(":span[class='date']").empty();
    $(`span[class='room']`).empty();
    $(`span[class='time']`).empty();
    $(`span[class='amount']`).empty();
    $(`span[class='info']`).empty();
    
    $id = roomIdx


    $('#select-room').html(roomIdx);
    $('#select-max-people').html($('#mp-' + $id).html());
    
    $(`div[id^='info-']`).css('display', 'none');
    $('#info-' + $id).css('display', 'block');
    $('#picker-time-' + $id).css('display', 'none');
    $("input:radio[name='time']").prop('checked', false);
    console.log($('#select-year').html() + '/' +
                $('#select-month').html().padStart(2, '0') + '/' +
                $('#select-date').html().padStart(2, '0'));
    console.log($('#select-room').html());

    callAjax();

  } // viewInfo

  // 예약하기 선택시 해당 룸의 예약 정보가 하단에 노출되게
  function viewPicker(roomIdx) {

    // 클릭 이벤트가 발생하면 id중 info-로 시작하는 애들 disalbe
    // $('#info-' + $id)만 able
    // able -> css display : block
    // disable -> none
		  
		  // 기존에 담긴 정보 지우기
    $(`span[class='time']`).empty();
    $(`span[class='amount']`).empty();
		  
		  
    $id = roomIdx
    console.log("$id :" + $id)
    console.log($('#info-' + $id))



      $(`div[id^='picker-']`).css('display', 'none');
      $('#picker-time-' + $id).css('display', 'block');



  }

  /*--------------- 시간 선택 ----------------*/

  // 페이지 처리를 위한 함수 / 카드 증가시 1씩 증가
  let num = 0;

  // 조회불가 팝업
  const myAlert = `
          <div class="alert alert-custom alert-light-warning fade show mb-5" role="alert">
            <div class="alert-icon">
              <i class="flaticon-warning"></i>
            </div>
            <div class="alert-text"> 정보를 불러오지 못했어요. \n 다시 시도해주세요. </div>
            <div class="alert-close">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
															<span aria-hidden="true">
																<i class="ki ki-close"></i>
															</span>
              </button>
            </div>
          </div>
 	  `;

  // 조회할 날짜와 룸번호 가지고 데이터 조회-> 시간정보 뿌립니다..
  function callAjax() {

    let yy = $('#select-year').html();  // 선택된 연도
    let mm = $('#select-month').html().padStart(2, '0'); // 선택된 월
    let dd = $('#select-date').html().padStart(2, '0'); // 선택된 일자
    let rr = $('#select-room').html();  // 선택된 룸

    // 카페 오픈시간
    const ot = ${cafeInfo[0].cafe_open_time};
    // 카페 마감시간
    const ct = ${cafeInfo[0].cafe_close_time};

    // 전송할 예약예정 일자, 예약 예정 룸
    var submitObj = new Object();
    submitObj.date = yy + '/' + mm + '/' + dd;
    submitObj.room = rr;

    console.log("JSON.stringify(submitObj): " + JSON.stringify(submitObj));

    $.ajax({
             type       : 'POST',
             url        : '/cafeRest/roomRsrvList',
             data       : JSON.stringify(submitObj), // 다음 페이지 번호와 페이지 사이즈를 가지고 출발
             dataType   : 'json', // 받을 데이터는 json
             contentType: "application/json; charset=utf-8",
             success    : successCallback,
             error      : errorCallback
           });

    // 성공시 데이터 처리
    function successCallback(data) {
      console.log("data: " + data);
      console.log("data: " + data.roomRsrvList.length);



      // 해당일자 해당룸의 총 예약건수 확인
      const roomRsrvListCnt = data.roomRsrvList.length;

      // 불러온 데이터가 없다면 (==해당일자 해당룸 예약없음 개이득~)
      if (data.roomRsrvList.length == 0) {
        loadTime();
      } else { // 예약정보가 있다면

        // 조회한 룸 보유 개수 알아내깅
        let roomTotalCnt = data.roomRsrvList[0].total_room_number;

        // 예약된 시간을 모두 담을 배열
        let arr = [];

        // 보유 개수보다 많은지 확인하기위해 '한 룸에 예약된 시간 모두 구하기
        for (let i = 0; i < roomRsrvListCnt; i++) {
          for (let j = data.roomRsrvList[i].use_start_time;
              j < data.roomRsrvList[i].use_end_time; j++) {
            arr.push(j);
          } // for
        } // for

        // 테이블 담아 동적 생성하기위한 변수
        let trtd = '';

        trtd += '<ul>';
        for (let i = ot; i < ct; i++) {
          let fullTime = i + ':00'; // 시간 표시

          let eCnt = arr.filter(e => i === e).length;

          trtd += '<li class="time';
          trtd += (eCnt >= roomTotalCnt) ? ' cal-none"' : '"';
          trtd += ` data-time="` + i + `">`;

          trtd += fullTime + '</li>';
        } // for
        trtd += '</ul>';

        // 테이블 자리에 안착
        $('.time-pick').html(trtd);

      } // if
    } // successCallback

    // 실패
    function errorCallback() {
	    Swal.fire('조회할 날짜를 먼저 선택해주세요!', '', 'warning')
    } // errorCallback

    // 테이블 생성 함수
    function loadTime() {

      let trtd = '';

      trtd += '<ul>';
      for (let i = ot; i < ct; i++) {
        let fullTime = i + ':00'; // 시간 표시

        trtd += '<li class="time" ';
        trtd += ' data-time="' + i + '">';
        trtd += fullTime + '</li>';
      } // for
      trtd += '</ul>';

      // 테이블 자리에 안착
      $('.time-pick').html(trtd);

    }


    // timeSelect table 선택 (예약 정보 조회 이후)
    $(document).on("click", "li[class='time']", function (e) {
	    
      // 시작시간 출력단
      let st = isNaN(parseInt($('#select-start-time').html())) ? 0 : parseInt(
          $('#select-start-time').html());

      // 종료시간 출력단
      let et = isNaN(parseInt($('#select-end-time').html())) ? 0 : parseInt(
          $('#select-end-time').html());

      let result = false;

      // 총 이용시간 출력단
      let rt = isNaN(parseInt($('#select-end-time').html())) ? 0 : parseInt(
          $('#select-end-time').html());
      
      let amount = $('#select-amount').html();

      console.log("st: " + st);
      console.log("et: " + et);

      let selectTime = $(this).data('time');
      console.log("클릭했어요~" + $(this));
      console.log($("li[class='time-active']"));

      // 클릭한 시간은 활성화 (시작시간 정하기)

      if ((st == 0 && et == 0)
          || (st != 0 && et != 0)
          || rt != 0
          || (selectTime < st && st != 0)) {
        console.log("1: ");
        // 시간 모두 비활성화
        $("li[class='time time-active']").removeClass('time-active');

        // 기존에 담긴 시간, 금액 선택 정보 지우기
        $(`span[class='time']`).empty();
        $(`span[class='amount']`).empty();

        // 선택한 시간 활성화
        $(this).addClass('time-active');

        // 시작 시간에 담기
        $('#select-start-time').html(selectTime);
	      e.stopImmediatePropagation();

      } else if (st != 0 && rt == 0) { // 정상적 선택이라면 끝나는 시간 활성화
	      console.log("22: " + selectTime);
        // 시간 하나만 선택!
        if (selectTime === st) { // 시간 하나만 선택
          console.log("3: " +selectTime);
          $('#select-end-time').html(selectTime);
          result = true;
        } else if (selectTime > st) { // 다중 선택(정상)
	        console.log("4: " +selectTime);
          // 비활성화 된 셀을 같이 클릭하면
          if ($(this).prevUntil(".time.time-active").is('.time.cal-none')) {
	          console.log("5: " +selectTime);
	
	          alert("누르지말라구 ㅋㅋ3");
            // 시간 모두 비활성화
            $("li[class='time time-active']").removeClass('time-active');

            // 기존에 담긴 시간, 금액 선택 정보 지우기
            $(`span[class='time']`).empty();
            $(`span[class='amount']`).empty();

          } else { // 정상 선택이라면 ㄱㄱ
	          console.log("6: " +selectTime);

            $(this).addClass('time-active');
            $('#select-end-time').html(selectTime);
            console.log("st: " + st);
            console.log("et: " + et);

            $(this).prevUntil(".time.time-active").addClass('time-active');

            result=true;
          } // if-else
	        e.stopImmediatePropagation();

        } // if-else

		      if(result){
			      console.log("6result: " +selectTime);
			
			      // 종료 시간 확인해서
          et = selectTime;
          // 단일 선택이라면 1시간 아니라면 총 이용시간 계산해서
          rt = et - st == 0 ? 1 : et - st + 1;
          // 이용시간에 담아주자~
          $('#select-time').html(rt);

          // 이용금액 (이용시간 x 룸가격)
          let pay = $("#" + $('#select-room').html() ).val(); // 가격
         
          // 이용금액 항목에 넣어주기
				      $('#select-amount').html(rt*pay);

          // console.log("ㅇㄱww::"+$(this).prevAll().css("background", "black"));
          console.log("ㅇㄱss::" + $(this).prevAll().data('time'));
										
										return;
				      
		      } // if
	
	      e.stopImmediatePropagation();
      } // if-else if
	    e.stopImmediatePropagation();
    }); // .time_fn

		  
  }// callAjax: function



  
  // 예약하기 버튼 클릭시 정보 담아서 예약하는 화면으로 가자~
  function goRsrv() {
		  // TODO 처음부터 인풋 만들지 등..어휴.. 수정예정.. data-value로 인풋안에 때려볼까

    let yy = $('#select-year').html();  // 선택된 연도
    let mm = $('#select-month').html().padStart(2, '0'); // 선택된 월
    let dd = $('#select-date').html().padStart(2, '0'); // 선택된 일자
    
		  let selectDate = yy + '/' + mm + '/' + dd; // 이용일자
    let selectStartTime = $('#select-start-time').html();  // 이용시작시간
    let selectEndTime = $('#select-end-time').html(); //이용종료시간
		  let selectRoom = $('#select-room').html();  // 선택된 룸
		  let totalAmount = $('#select-amount').html(); // 이용금액
    let maxPeople = $('#select-max-people').html(); // 방인원
	

    let $date = $('<input>', {
      type : "hidden",
      name : "use_date",
      value: selectDate
    })

    let $startTime = $('<input>', {
      type : "hidden",
      name : "use_start_time",
      value: selectStartTime
    })

    let $endTime = $('<input>', {
      type : "hidden",
      name : "use_end_time",
      value: selectEndTime
    })

    let $roomIdx = $('<input>', {
      type : "hidden",
      name : "room_idx",
      value: selectRoom
    })

    let $totalAmount = $('<input>', {
      type : "hidden",
      name : "total_amount",
      value: totalAmount
    })

    let $maxPeople = $('<input>', {
      type : "hidden",
      name : "max_people",
      value: maxPeople
    })

	  //TODO 제약조건 확인
			// if($('input[type="hidden"]').length != 8) {
			// 	// 기존에 담긴 정보 지우기 //TODO 여기..
			// 	$(`span[class='room']`).empty();
			// 	$(`span[class='time']`).empty();
			// 	$(`span[class='amount']`).empty();
			// 	$(`span[class='info']`).empty();
			// 	$("li[class='time time-active']").removeClass('time-active');
	  //
			// 	Swal.fire({
			// 		          icon : 'danger', // Alert 타입
			// 		          title: '선택오류', // Alert 제목
			// 		          text : '모든 사항은 필수 선택입니다! ', // Alert 내용
			// 	          })
			//
			// 	return;
	 	//
	  // }

	  
    $('#formObj').append( $date, $startTime, $endTime, $roomIdx, $totalAmount,$maxPeople);
    
    $('#formObj').submit();


  }
</script>


<script>
  calSet();

  function calSet() {

    // ================================
    // 달력
    // ================================
    const init = {
      monList     : ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
                     'September', 'October', 'November', 'December'],
      dayList     : ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
      today       : new Date(),
      monForChange: new Date().getMonth(),
      activeDate  : new Date(),
      getFirstDay : (yy, mm) => new Date(yy, mm, 1),
      getLastDay  : (yy, mm) => new Date(yy, mm + 1, 0),
      nextMonth   : function () {
        let d = new Date();
        d.setDate(1);
        d.setMonth(++this.monForChange);
        this.activeDate = d;
        return d;
      },
      prevMonth   : function () {
        let d = new Date();
        d.setDate(1);
        d.setMonth(--this.monForChange);
        this.activeDate = d;
        return d;
      },
      addZero     : (num) => (num < 10) ? '0' + num : num,
      activeDTag  : null,
      getIndex    : function (node) {
        let index = 0;
        while (node = node.previousElementSibling) {
          index++;
        }
        return index;
      }
    };

    const $calBody = document.querySelector('.cal-body');
    const $btnNext = document.querySelector('.btn-cal.next');
    const $btnPrev = document.querySelector('.btn-cal.prev');

    /**
     * @param {number} date
     * @param {number} dayIn
     */
    function loadDate(date, dayIn) {
      document.querySelector('.cal-date').textContent = date;
      document.querySelector('.cal-day').textContent = init.dayList[dayIn];

      console.log(date)
    }

    /**
     * @param {date} fullDate
     */
    function loadYYMM(fullDate) {
      
      let yy = fullDate.getFullYear();
      let mm = fullDate.getMonth();
      let firstDay = init.getFirstDay(yy, mm);
      let lastDay = init.getLastDay(yy, mm);
      let markToday;  // for marking today date

      if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
        markToday = init.today.getDate();
      }
// document.querySelector('.cal-month').textContent = mm;
      document.querySelector('.cal-month').textContent = mm + 1;
      document.querySelector('.cal-year').textContent = yy;

      let trtd = '';
      let startCount;
      let countDay = 0;
      for (let i = 0; i < 6; i++) {
        trtd += '<tr>';
        for (let j = 0; j < 7; j++) {
          if (i === 0 && !startCount && j === firstDay.getDay()) {
            startCount = 1;
          }
          if (!startCount) {
            trtd += '<td>'
          } else {
            let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
            trtd += '<td class="day';
            trtd += (markToday && markToday === countDay + 1) ? ' today" ' :
                    (markToday > (countDay + 1)) ? ' cal-none"' :
                    '"';
            trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
          }
          trtd += (startCount) ? ++countDay : '';
          if (countDay === lastDay.getDate()) {
            startCount = 0;
          }
          trtd += '</td>';
        }
        trtd += '</tr>';
      }

      $calBody.innerHTML = trtd;
    }

    /**
     * @param {string} val
     */
    function createNewList(val) {
      
      
      let id = new Date().getTime() + '';
      let yy = init.activeDate.getFullYear();
      let mm = init.activeDate.getMonth() + 1;
      let dd = init.activeDate.getDate();
      const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);

      let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);

      let eventData = {};
      eventData['date'] = date;
      eventData['memo'] = val;
      eventData['complete'] = false;
      eventData['id'] = id;
      init.event.push(eventData);
      $todoList.appendChild(createLi(id, val, date));
    }

    loadYYMM(init.today);
    loadDate(init.today.getDate(), init.today.getDay());

    $btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
    $btnPrev.addEventListener('click', () =>

        loadYYMM(init.prevMonth()));

    // 선택한 날짜 정보 담기
    $calBody.addEventListener('click', (e) => {
      // $(`div[id^='picker-time-']`).css('display', 'none');
      $(`div[id^='picker-']`).css('display', 'none');
      $(`div[id^='info-']`).css('display', 'none');
      $("input:radio[name='room']").prop('checked', false);
      $("input:radio[name='time']").prop('checked', false);
      $("span[id^='select-']").empty();
      
      if (e.target.classList.contains('day')) {
        if (init.activeDTag) {
          init.activeDTag.classList.remove('day-active');

        }
        let day = Number(e.target.textContent);
        let year = $('.cal-year').text();
        let month = $('.cal-month').text();

        loadDate(day, e.target.cellIndex);
        e.target.classList.add('day-active');

        // 확인위해 정보 담기
        $('#select-date').html(day);
        $('#select-month').html(month);
        $('#select-year').html(year);

        init.activeDTag = e.target;
        init.activeDate.setDate(day);
        // reloadTodo();
      }
    });

    // 달력 날짜 셋팅! 셀렉시 이전, 현재 날짜는 클릭 안되게
    $(function () {

      // 처음 진입시 이전달로 못가게
      $(".btn-cal.prev").css("color", "#dddddd");
      $(".btn-cal.prev").css("cursor", "default");
      $(".btn-cal.prev").css("pointer-events", "none");

      // 클릭 할 때마다 확인해서 현재보다 이전달로 못가게
      $(".ctr-box.clearfix").on('click', function (e) {
        let viewYear = $('.cal-year').text();
        let viewMonth = $('.cal-month').text();

        let today = new Date();
        let month = today.getMonth() + 1;
        let year = today.getFullYear();

        if (viewYear == year && viewMonth == month) {
          console.log("동일/ 못넘어감");

          $(".btn-cal.prev").css("color", "#dddddd");
          $(".btn-cal.prev").css("cursor", "default");
          $(".btn-cal.prev").css("pointer-events", "none");

        } else {
          console.log("넘어감");
          $(".btn-cal.prev").css("color", "#181C32");
          $(".btn-cal.prev").css("cursor", "pointer");
          $(".btn-cal.prev").css("pointer-events", "auto");

        }
      });

    });

  };


</script>


<script>
	// 카카오 맵
	
	
	var coords = '';
	// 지도 구현부
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	    mapOption    = {
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level : 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${cafeInfo[0].cafe_location}', function (result, status) {
		
		// 정상적으로 검색이 완료됐으면
		if (status === kakao.maps.services.Status.OK) {
			
			coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				                                   map     : map,
				                                   position: coords
			                                   });
			
			// 인포윈도우로 장소에 대한 설명을 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
				                                           content: '<div style="width:150px;text-align:center;padding:6px 0;">스터디카페의 위치입니다!</div>'
			                                           });
			infowindow.open(map, marker);
			
			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
		}
		
		let coord = String(coords);
		
		coord = coord.substring(1, (coord.length-1));
		console.log(coord.length);
		
		console.log(coord.substring(1, (coord.length-1)));


		// 길찾기 버튼 클릭하면 길찾기로 감 ㄱㄱ
		$('#loadView').on('click', (e) =>
			location.href = "https://map.kakao.com/link/to/"+ "${cafeInfo[0].cafe_name}" + "," + coord);
		
		
	});
	
	
	// 전화걸기 버튼 누르면 가게 전화번호 노출
	$('#callInfo').on('click', (e) =>
	
	Swal.fire({
		          icon : 'info', // Alert 타입
		          title: '${cafeInfo[0].cafe_telephone_number}', // Alert 제목
		          text : '삼삼오오를 통해 연락했어요~!', // Alert 내용
	          })
	
	
	);
	
	
	
	
</script>

</html>