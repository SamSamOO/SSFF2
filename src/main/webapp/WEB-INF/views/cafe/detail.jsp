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
	

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
	
	<style>
		
		/*--------------- swiper [s] ---------------*/
		
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
		
		/*.swiper-button-next {*/
		/*	background: url(/godiva/img/common/next.png) no-repeat;*/
		/*	background-size: 50% auto;*/
		/*	background-position: center;*/
		/*}*/
		
	.swiper-button-prev,
	.swiper-button-next{
	background-image: none !important;
	}
		
		/*.swiper-button-next::after,*/
		/*.swiper-button-prev::after {*/
		/*	display: none;*/
		/*}*/
		
		
		/*--------------- swiper [e] ---------------*/
		
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
                  <h5 class="text-dark font-weight-bold my-1 mr-5">스터디카페
                    리스트</h5>
                  <!--Page Title : 페이지 제목 종료-->
                  <!--Breadcrumb : 로드맵 시작-->
                  <ul
                    class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
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
          <div class="d-flex flex-row flex-column-fluid container">
            
            
            ${fn:length(cafeInfo)}
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
	
																															<div class="swiper-container mySwiper">
																																<div class="swiper-wrapper">
																																
																																	<!-- 카페 이미지와 -->
																																	<div class="swiper-slide">
																																		<img src="${cafeInfo[0].cafe_image_first}" />
																																	</div>
																																	<div class="swiper-slide">
																																		<img src="${cafeInfo[0].cafe_image_second}" />
																																	</div>
																																	<div class="swiper-slide">
																																		<img src="${cafeInfo[0].cafe_image_third}" />
																																	</div>
																																	<!-- 카페 룸 이미지 -->
																																	<c:forEach items="${fn:split(cafeInfo[0].room_list,':')}"
																																												var="room_img">
																																	<div class="swiper-slide">
																																		<img src="${room_img}" />
																																	</div>
																																	</c:forEach>
																																
																																</div>
																																<div class="swiper-button-next"><i class="icon-2x text-dark-50 flaticon2-next"></i></div>
																																<div class="swiper-button-prev"><i class="icon-2x text-dark-50 flaticon2-back"></i></div>
																															</div>
																															
																														</div>
																													<!-- 이미지 슬라이드 [e] -->
																													
                              <h1 class="display-4 mb-10"
                                  style="margin-bottom: 0 !important;">${cafeInfo[0].cafe_main_title}</h1>
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
                                    class="pl-0 font-weight-bold text-muted text-uppercase">상세설명
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
                                  class="pl-0 font-weight-bold text-muted text-uppercase">운영안내
                                </th>
                                
                                
                                <th
                                  class="pl-0 font-weight-bold text-muted text-uppercase"></th>
                              </tr>
                              </thead>
                              <tbody>
                              
                              
                              <tr class=" border-bottom-0">
                                
                                <td class="border-top-0 text-reft py-4 align-middle font-weight-boldest">
                                  운영시간
                                </td>
                                
                                
                                <td class="border-top-0 text-reft py-4 align-middle">
                                  ${cafeInfo[0].cafe_open_time} ~ ${cafeInfo[0].cafe_close_time} 시
                                </td>
                              </tr>
                              <tr class="border-bottom-0">
                                
                                <td class="border-top-0 text-reft py-4 align-middle font-weight-boldest">
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
                              <h1 class="display-4 font-weight-boldest mb-10"
                                  style="margin-bottom: 0 !important;">이쯤에는 지도가
                                들어가고</h1>
                              
                              <h3 class="">전화걸기 버튼이랑, 길찾기 api가 있으면 좋겟다.</h3>
                              <div class="symbol-label min-w-65px min-h-300px"
                                   style="background-image: 지도넣어보자"></div>
                            </div>
                          
                          
                          </div>
                        </div>
                        <!-- end: 가게 정보(지도, 전화번호)  -->
                        
                        
                        <!-- begin: 환불 안내 -->
                        <div
                          class="row justify-content-center py-8 bg-gray-100 px-md-0 mx-0">
                          <div class="col-md-10">
                            <div class="table-responsive">
                              <table class="table">
                                <thead>
                                <tr>
                                  <th
                                    class="pl-0 font-weight-bold text-muted text-uppercase">환불안내
                                  </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="font-weight-boldest border-bottom-0">
                                  <td class="border-top-0 text-reft py-4 align-middle">
                                    1. 결제를 구현할 수 있다면 말이지
                                  </td>
                                </tr>
                                <tr class="font-weight-boldest border-bottom-0">
                                  <td class="border-top-0 text-reft py-4 align-middle">
                                    2. 결제를 구현할 수 있다면 말이지
                                  </td>
                                </tr>
                                <tr class="font-weight-boldest border-bottom-0">
                                  <td class="border-top-0 text-reft py-4 align-middle">
                                    3. 결제를 구현할 수 있다면 말이지
                                  </td>
                                </tr>
                                <tr class="font-weight-boldest border-bottom-0">
                                  <td class="border-top-0 text-reft py-4 align-middle">
                                    4. 결제를 구현할 수 있다면 말이지
                                  </td>
                                </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                        <!-- end: 환불 안내  -->
                      </div>
                    </div>
                    <!--end::Card-->
                  </div>
                  <!--end::Layout-->
                  
                  
                  <!--begin::Aside-->
                  <div class="flex-column offcanvas-mobile w-300px w-xl-325px"
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
                              <label
                                class="font-size-h3 font-weight-bolder text-dark mb-7">Room</label>
                              <!--begin::Radio list-->
                              <div class="radio-list">
                                
                                <c:forEach items="${cafeInfo}" var="room">
                                  <div class="${room.room_idx}">
                                    
                                    <!-- radio [ s ] -->
                                    <label class="radio radio-lg mb-7"> <input
                                      type="radio" name="price" value="${room.room_idx}"
                                      onclick="viewInfo('${room.room_idx}')"> <span></span>
                                      <div
                                        class="font-size-lg text-dark-75 font-weight-bold"
                                        data-value="${room.max_people}">
                                          ${room.max_people}인실
                                      </div>
                                      <div class="ml-auto text-muted font-weight-bold"
                                           data-value="${room.amount_hour}">
                                          ${room.amount_hour} 원/시간
                                      </div>
                                    </label>
                                    <!-- radio [ e ] -->
                                    
                                    <!--begin::룸별 정보 동적생성구간 active로 활성화 ㄲ -->
                                    <div class="card-body p-1 mb-7" id="info-${room.room_idx}"
                                         style="border: 1px solid #6b984f; display: none">
                                      
                                      <!--begin::Item-->
                                      <div class="align-items-center mb-8">
                                        
                                        <!-- begin::룸 선택 -->
                                        <div class="form-group mb-7">
                                          <div class="symbol-label min-w-65px min-h-120px"
                                               style="background-image: ${room.room_image}">룸이미지만 있다면..!
                                          </div>
                                        </div>
                                        <!-- end::룸 선택 -->
                                        
                                        <div
                                          class="font-size-h4 font-weight-bolder text-dark mb-4"
                                          
                                          style="border-bottom: 3px solid #6b984f;">예약선택
                                        </div>
                                        
                                        <label class="radio radio-lg mb-7" value="${room.room_idx}"
                                               onclick="viewPicker('${room.room_idx}')">
                                          <input
                                            type="radio" name="time" style=""> <span
                                          style=""></span>
                                          <div class="font-size-lg text-dark-75 font-weight-bold"
                                               style="">&nbsp;시간 단위(최소 1시간부터)
                                          </div>
                                        </label>
                                        
                                        <div id="picker-date-${room.room_idx}" style="display: none;">
                                        <div
                                          class="font-size-h4 font-weight-bolder text-dark mb-4"
                                          data-value="${room.room_idx}"
                                          style="border-bottom: 3px solid #6b984f;">날짜선택
                                        </div>
                                        <div class="min-w-65px min-h-300px"
                                             style="border: 1px solid #6b984f;">캘린더
                                        </div>
                                        </div>
                                        <div id="picker-time-${room.room_idx}" style="display: none;">
                                        <div
                                          class="font-size-h4 font-weight-bolder text-dark mb-4"
                                          data-value="${room.room_idx}"
                                          style="border-bottom: 3px solid #6b984f;">시간선택
                                        </div>
                                        <div class="min-w-65px min-h-60px"
                                             style="border: 1px solid #6b984f;">시간선택할 공간
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
                              <a href="#" class="btn btn-warning" role="button"
                                 style="display: block;">예약하기</a>
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
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
	var swiper = new Swiper(".mySwiper", {
		spaceBetween: 30,
		centeredSlides: true,
		// autoplay: {
		// 	delay: 2500,
		// 	disableOnInteraction: false,
		// },
		pagination: {
			el: ".swiper-pagination",
			clickable: true,
		},
		navigation: {
			nextEl: ".swiper-button-next",
			prevEl: ".swiper-button-prev",
		},
	});

</script>
<script>
  $(function () {
    //initialize swiper when document ready
    var mySwiper = new Swiper('.swiper-container', {
      // Optional parameters
      // 방향
      slidesPerView: 9, // 슬라이드를 한번에 3개를 보여준다
      // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
      spaceBetween: 30, // 슬라이드간 padding 값 30px 씩 떨어뜨려줌

      // 그룹수가 맞지 않을 경우 빈칸으로 메우기
      // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
      loopFillGroupWithBlank: true,

      loop: false, // loop 를 true 로 할경우 무한반복 슬라이드, false 로 할경우 슬라이드의 끝에서 더보여지지 않음

      // If we need pagination
      pagination: {
        el       : '.swiper-pagination',
        clickable: true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
      },

      // 반응형
      breakpoints: {
        1280: {
          slidesPerView : 3,
          slidesPerGroup: 3,
        },
        720 : {
          slidesPerView : 1,
          slidesPerGroup: 1,
        },
      }
    })
  });

  // 룸 선택시 해당 룸의 상세 정보가 하단에 노출되게
  function viewInfo(roomIdx) {
			// 클릭 이벤트가 발생하면 id중 info-로 시작하는 애들 disalbe
			// $('#info-' + $id)만 able
			// able -> css display : block
			// disable -> none
			
    $id = roomIdx
    console.log("$id :" + $id)
    
    console.log($('#info-' + $id))
			
			$(`div[id^='info-']`).css('display', 'none');
			$('#info-' + $id).css('display', 'block');
  } // viewInfo

  // 예약하기 선택시 해당 룸의 예약 정보가 하단에 노출되게
  function viewPicker(roomIdx) {
    // 클릭 이벤트가 발생하면 id중 info-로 시작하는 애들 disalbe
    // $('#info-' + $id)만 able
    // able -> css display : block
    // disable -> none
  
    $id = roomIdx
    console.log("$id :" + $id)
  
    console.log($('#info-' + $id))
    $select = 'picger-' + $id;
  
    $(`div[id^='picker-']`).css('display', 'none');
    $('#picker-date-' + $id).css('display', 'block');
    $('#picker-time-' + $id).css('display', 'block');
    
  
  }

		
	
		
</script>
</html>