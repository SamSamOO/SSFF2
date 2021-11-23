<%--
  스터디 카페 생성 화면단
  User: 신지혜
  Date: 2021-11-20
  Time: 오전 6:13
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
  <title>예약내역 조회</title>
  
  <style>
    .row {
      justify-content: space-evenly;
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
                <h5 class="text-dark font-weight-bold mt-2 mb-2 mr-5">예약내역 조회</h5>
                <!--end::Title-->
                <!--begin::Separator-->
                <div
                  class="subheader-separator subheader-separator-ver mt-2 mb-2 mr-5 bg-gray-200"></div>
                <!--end::Separator-->
                <!--begin::Search Form-->
                <div class="d-flex align-items-center" id="kt_subheader_search">
                </div>
                <!--end::Search Form-->
              </div>
              <!--end::Details-->
              <!--begin::Toolbar-->
              <div class="d-flex align-items-center">
                <!--begin::Button-->
                <a href="#" class="btn btn-default font-weight-bold">Back</a> <!-- //TODO 링크 걸어죠-->
                <!--end::Button-->
                <!--begin::Dropdown-->
                
                <button type="button" class="btn btn-primary font-weight-bold"
                        onclick="goRegister();"> 수정하기
                </button>
                
                
                <a href="/cafe/remove?cafe_idx=${cafeVO.cafe_idx}"
                   class="btn btn-warning font-weight-bold"> 삭제하기
                </a>
                <!--end::Dropdown-->
              </div>
              <!--end::Toolbar-->
            </div>
            <!--end::Subheader-->
          </div>
          <!--Subheader : 서브헤더 페이지 제목란 종료-->
          
          <!------------------ 본문 시작 ------------------>
          <!--begin::Content-->
          <div class="content flex-column-fluid">
            
            <!--begin::cardcustom-->
            <div class="card card-custom card-sticky">
              <div class="card-header flex-wrap border-0 pt-6 pb-0">
                <div class="card-title">
                  <h3 class="card-label">예약내역 확인하기
                    <span
                      class="d-block text-muted pt-2 font-size-sm">예약 내역과 해당하는 거래내역 조회가 가능합니다.</span>
                  </h3>
                </div>
                
                <!--begin::card -->
                <div class="card-body">
                  <!--begin: Search Form-->
                  <!--begin::Search Form-->
                  <div class="mb-7">
                    <div class="row align-items-center">
                      <div class="col-lg-9 col-xl-8">
                        <div class="row align-items-center">
                          <div class="col-md-4 my-2 my-md-0">
                            <div class="input-icon">
                              <input type="text" class="form-control" placeholder="Search..."
                                     id="kt_datatable_search_query">
                              <span>
																	<i class="flaticon2-search-1 text-muted"></i>
																</span>
                            </div>
                          </div>
                          <div class="col-md-4 my-2 my-md-0">
                            <div class="d-flex align-items-center">
                              <label class="mr-3 mb-0 d-none d-md-block">Status:</label>
                              <div class="dropdown bootstrap-select form-control"><select
                                class="form-control" id="kt_datatable_search_status"
                                tabindex="null">
                                <option value="">All</option>
                                <option value="1">Pending</option>
                                <option value="2">Delivered</option>
                                <option value="3">Canceled</option>
                                <option value="4">Success</option>
                                <option value="5">Info</option>
                                <option value="6">Danger</option>
                              </select>
                                <button type="button" tabindex="-1"
                                        class="btn dropdown-toggle btn-light bs-placeholder"
                                        data-toggle="dropdown" role="combobox"
                                        aria-owns="bs-select-1" aria-haspopup="listbox"
                                        aria-expanded="false" data-id="kt_datatable_search_status"
                                        title="All">
                                  <div class="filter-option">
                                    <div class="filter-option-inner">
                                      <div class="filter-option-inner-inner">All</div>
                                    </div>
                                  </div>
                                </button>
                                <div class="dropdown-menu"
                                     style="max-height: 342.281px; overflow: hidden; min-height: 127px;">
                                  <div class="inner show" role="listbox" id="bs-select-1"
                                       tabindex="-1" aria-activedescendant="bs-select-1-0"
                                       style="max-height: 330.281px; overflow-y: auto; min-height: 115px;">
                                    <ul class="dropdown-menu inner show" role="presentation"
                                        style="margin-top: 0px; margin-bottom: 0px;">
                                      <li class="selected active"><a role="option"
                                                                     class="dropdown-item active selected"
                                                                     id="bs-select-1-0" tabindex="0"
                                                                     aria-setsize="7"
                                                                     aria-posinset="1"
                                                                     aria-selected="true"><span
                                        class="text">All</span></a></li>
                                      <li><a role="option" class="dropdown-item" id="bs-select-1-1"
                                             tabindex="0" aria-setsize="7" aria-posinset="2"><span
                                        class="text">Pending</span></a></li>
                                      <li><a role="option" class="dropdown-item" id="bs-select-1-2"
                                             tabindex="0" aria-setsize="7" aria-posinset="3"><span
                                        class="text">Delivered</span></a></li>
                                    </ul>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="col-md-4 my-2 my-md-0">
                            <div class="d-flex align-items-center">
                            
                            
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-3 col-xl-4 mt-5 mt-lg-0">
                        <a href="#" class="btn btn-light-primary px-6 font-weight-bold">Search</a>
                      </div>
                    </div>
                  </div>
                  <!--end::Search Form-->
                  <!--end: Search Form-->
                  
                  
                  <!--begin: Datatable-->
                  <div
                    class="datatable datatable-bordered datatable-head-custom datatable-default 
                    datatable-primary datatable-subtable datatable-loaded"
                    id="rsrvTable">
                    
                    <table class="datatable-table" style="display: block;">
                      <!-- 테이블 공통 헤드 s -->
                      <thead class="datatable-head">
                        <tr class="datatable-row">
                          <th data-field="RecordID" class="datatable-cell-center datatable-cell "><span style="width: 30px;"></span></th>
                          <th data-field="ReservationID" class="datatable-cell "><span style="width: 110px;">ReservationID</span></th>
                          <th data-field="CafeInfo" class="datatable-cell "><span style="width: 110px;">CafeInfo</span></th>
                          <th data-field="ReservationAmount" class="datatable-cell "><span style="width: 110px;">ReservationAmount</span></th>
                          <th data-field="UseDateInfo" class="datatable-cell "><span style="width: 110px;">UseDateInfo</span></th>
                          <th data-field="Status" data-autohide-disabled="false" class="datatable-cell "><span style="width: 110px;">Status</span></th>
                          <!--TODO 세션 값에 따라 none처리 할 수 있게 admin-> 닉네임만on -->
                          <th data-field="Cancle" class="datatable-cell "><span style="width: 110px;">Cancle</span></th>
                          <th data-field="NickName" class="datatable-cell "><span style="width: 110px;">NickName</span></th>
      
                        </tr>
                      </thead>
                      <!-- 테이블 공통 헤드 e -->
                      
                      <tbody class="datatable-body">
                      
                      <!-- 일반 예약정보 s -->
                      <tr data-row="0" class="datatable-row datatable-row-subtable-expanded"> <!-- datatable-row-subtable-expanded ==active -->
  
                        <td class="datatable-cell-center datatable-cell" data-field="RecordID" aria-label="1">
                          <a class="datatable-toggle-subtable" href="#" data-value="1" title="Load sub table" style="width: 30px;">
                            <i style="width: 30px;" class="fa fa-caret-down"></i></a> <!--TODO 아이콘 토글 -->
                        </td>
  
                        <td data-field="ReservationID" aria-label="Tommie" class="datatable-cell"><span style="width: 110px;">Tommie</span></td>
                        <td data-field="CafeInfo" aria-label="Pee" class="datatable-cell"><span style="width: 110px;">Pee</span></td>
                        <td data-field="ReservationAmount" aria-label="Tommie" class="datatable-cell"><span style="width: 110px;">Tommie</span></td>
                        <td data-field="UseDateInfo" aria-label="Pee" class="datatable-cell"><span style="width: 110px;">Pee</span></td>
                        <td data-field="Status" data-autohide-disabled="false" aria-label="1"
                            class="datatable-cell"><span style="width: 110px;"><span
                          class="label label-warning label-dot"></span>&nbsp;<span
                          class="font-weight-bold text-danger">Online</span></span></td>
  
                        <td data-field="Cancle" aria-label="4" class="datatable-cell"><span
                          style="width: 110px;"><span
                          class="label  label-success label-inline label-pill">Success</span></span>
                        <td data-field="NickName" aria-label="tpee0@slashdot.org" class="datatable-cell"><span style="width: 110px;">tdorg</span></td>
  
                        </td>
                      </tr>
                      <!-- 일반 예약정보 e -->


                      <!-- 서브 정보 s -->
                      <tr class="datatable-row-subtable datatable-row-subtable-even"> <!-- display none-block  -->
                        <td class="datatable-subtable" colspan="8">
                          <div id="child_data_local_0" class="datatable datatable-default datatable-primary datatable-loaded">
                            <table class="datatable-table" style="display: block; max-height: 400px;">
        
                              <thead class="datatable-head">
        
                                <tr class="datatable-row">
                                  <th data-field="OrderID" class="datatable-cell  ed" data-sort="desc"><span>예약정보 ID</span>
                                  </th>
                                </tr>
        
                              </thead>
        
                              <tbody class="datatable-body ps" style="max-height: 359px;">
        
                                <tr data-row="0" class="datatable-row">
                                  <td class="col-4" data-field="OrderID" aria-label="68084-814">
                                    <span><span>68084-814 - ID</span></span></td>
                                  <td data-field="ShipCountry" aria-label="ID" class="datatable-cell">
                                    <span>ID</span></td>
          
          
                                </tr>
        
        
                              </tbody>
                            </table>
                          </div>
                        </td>
                        <td class="datatable-subtable" colspan="8">
                          
                          <div id="child_data_local_1" class="datatable datatable-default datatable-primary datatable-loaded">
                            <table class="datatable-table" style="display: block; max-height: 400px;">
        
                              <thead class="datatable-head">
        
                                <tr class="datatable-row">
                                  <th data-field="OrderID" class="datatable-cell  ed" data-sort="desc"><span>거래정보 ID</span>
                                  </th>
                                </tr>
        
                              </thead>
        
                              <tbody class="datatable-body ps" style="max-height: 359px;">
        
                                <tr data-row="0" class="datatable-row">
                                  <td class="col-4" data-field="OrderID" aria-label="68084-814">
                                    <span><span>68084-814 - ID</span></span></td>
                                  <td data-field="ShipCountry" aria-label="ID" class="datatable-cell">
                                    <span>ID</span></td>
                                </tr>
                
                              </tbody>
                            </table>
                          </div>
                        </td></tr>
                      <!-- 서브정보 e -->
                      
                      
                      
                      </tbody>
                    </table>
                    <!--end: table-->
                    
                    <!--begin: pager-->
                    <div class="datatable-pager datatable-paging-loaded">
                      <ul class="datatable-pager-nav my-2 mb-sm-0">
                        <li><a title="First"
                               class="datatable-pager-link datatable-pager-link-first datatable-pager-link-disabled"
                               data-page="1" disabled="disabled"><i class="flaticon2-fast-back"></i></a>
                        </li>
                        <li><a title="Previous"
                               class="datatable-pager-link datatable-pager-link-prev datatable-pager-link-disabled"
                               data-page="1" disabled="disabled"><i class="flaticon2-back"></i></a>
                        </li>
                        <li style="display: none;"><input type="text"
                                                          class="datatable-pager-input form-control"
                                                          title="Page number"></li>
                        <li><a
                          class="datatable-pager-link datatable-pager-link-number datatable-pager-link-active"
                          data-page="1" title="1">1</a></li>
                        <li><a class="datatable-pager-link datatable-pager-link-number"
                               data-page="2" title="2">2</a></li>
                        <li><a class="datatable-pager-link datatable-pager-link-number"
                               data-page="3" title="3">3</a></li>
                        <li><a class="datatable-pager-link datatable-pager-link-number"
                               data-page="4" title="4">4</a></li>
                        <li><a class="datatable-pager-link datatable-pager-link-number"
                               data-page="5" title="5">5</a></li>
                        <li><a title="Next" class="datatable-pager-link datatable-pager-link-next"
                               data-page="2"><i class="flaticon2-next"></i></a></li>
                        <li><a title="Last" class="datatable-pager-link datatable-pager-link-last"
                               data-page="35"><i class="flaticon2-fast-next"></i></a></li>
                      </ul>
                      
                      <div class="datatable-pager-info my-2 mb-sm-0">
                        <div class="dropdown bootstrap-select datatable-pager-size dropup"
                             style="width: 60px;">
                          <select class="selectpicker datatable-pager-size"
                                  title="Select page size" data-width="60px"
                                  data-container="body" data-selected="10"
                                  tabindex="null">
                          <option class="bs-title-option" value=""></option>
                          <option value="5">5</option>
                          <option value="10">10</option>
                          <option value="20">20</option>
                          <option value="30">30</option>
                          <option value="50">50</option>
                          <option value="100">100</option>
                        </select>
                        
                        </div>
                        <span class="datatable-pager-detail">Showing 1 - 10 of 350</span></div>
                    </div>
                    <!--end: pager-->
                  
                  
                  </div>
                  <!--end: Datatable-->
                </div>
              
              
              </div>
            </div>
            <!--end::cardcustom-->
          
          
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
  
  // 페이지 진입시 리스트 세팅 
  $(document).ready(function () {
    start.init();
    console.log("start.init();")

  }); // ready

  // 카드 리스트를 ajax 페이지 처리하여 뿌립니다. 
  let start = {
    myAlert: { //TODO alert( 문구
      warningAlert :`
          <div class="alert alert-custom alert-light-warning fade show mb-5" role="alert">
            <div class="alert-icon">
              <i class="flaticon-warning"></i>
            </div>
            <div class="alert-text">표시할 항목이 없습니다.</div>
            <div class="alert-close">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
															<span aria-hidden="true">
																<i class="ki ki-close"></i>
															</span>
              </button>
            </div>
          </div>
 	  `
    },
    param: {
      member_name : "admin", //TODO 세션 아이디로 (관리자, 멤버 구분해서 조회)
      pageListSize: "웅", //TODO 추후  검색 정보 담아서 출발
    },

    // 진입시 데이터 셋팅, 스크롤 감지 시작 
    init     : function () {
      this.data();
     // this.scrollEvent();
    },

    // 데이터 셋팅을 위해 ajax 요청 보냄 
    data : function () {
      start.callAjax();
    },
    
    // 백단으로 db 달라 요청
    callAjax: function () {
      $.ajax({
               type       : 'POST',
               url        : '/cafeRest/reservationList',
               data       : JSON.stringify(start.param), // 로그인 정보와 검색값 담아서 출발
               dataType   : 'json', // 받을 데이터는 json
               contentType: "application/json; charset=utf-8",
               success    : successCallback,
               error      : errorCallback
             });

      // 성공시 데이터 처리
      function successCallback(data) {
        console.log("data: " + data);

        // 불러온 데이터가 없다면
        if (data.length == 0) {
          Swal.fire({
                      icon : 'warning', // Alert 타입
                      title: '조회할 정보가 없어요!', // Alert 제목
                      text : '확인 후 다시 이용바랍니다.', // Alert 내용
                    });
        } // if

        // 데이터가 있다면 뿌리기
        if (data.length != 0) {
          // testLoading.show(); //로딩바 on
          start.setListItems(data);  //테스트 데이터 리스트 입니다.
          // testLoading.hide(); //로딩 off
        } // if
        
      } // successCallback

      // 실패
      function errorCallback() {
        Swal.fire({
                    icon : 'warning', // Alert 타입
                    title: 'Error!', // Alert 제목
                    text : '확인 후 다시 이용바랍니다.', // Alert 내용
                  });
      } // errorCallback
    }, // callAjax: function

    // 데이터 setting
    setListItems: function (data) {
      
      alert("셋팅창 떴어유~")

      const dataFieldSet = [RecordID, ReservationID, CafeInfo, ReservationAmount,
                            UseDateInfo, Status, Cancle, NickName];
      
      
      // 기본 템플릿 셋팅
      let templet =
              `<!--begin::Col-->
              <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                <!--begin::Card-->
                <div class="card card-custom gutter-b card-stretch">
                  <section class="awSlider">
                    <div  class="carousel slide" data-ride="carousel">
                      <!-- Indicators -->
                      <ol class="carousel-indicators">
                      </ol>              
                      <!-- Wrapper for slides -->
                      <div class="carousel-inner" role="listbox">
                      </div>              
                      <!-- Controls $aPrev $aNext -->
                    </div>
                  </section>
                </div>
								<!--end::Card-->
              </div>
							<!--end::Col-->`

      // 테이블 동적생성을 위해 불러온 data를 각 변수에 담아 활용
      let mainTitle = '';
      let subTitle = '';
      let amountHour = '';
      let maxPeople = '';
      let splitLocation = '';
      let location = '';
      let cafeId = '';

      // 불러온 데이터 수만큼 돌며 카드 생성
    //   for (let i = 0; i < data.length; i++) {
    //
    //     // 기본 구조 셋팅!
    //     $('#cafeListCardLow').append(templet);
    //
    //
    //
    //     // ---- cafe, room의 이미지 개수만큼 이미지 슬라이드 버튼을 동적 생성 end
    //
    //
    //     // 불러온 db를 순서대로 초기화
    //     mainTitle = String(data.cafeList[i].cafe_main_title);
    //     subTitle = String(data.cafeList[i].cafe_sub_title);
    //     amountHour = String(data.cafeList[i].amount_hour);
    //     maxPeople = String(data.cafeList[i].max_people);
    //     splitLocation = (data.cafeList[i].cafe_location).split(' ', 2);
    //     location = splitLocation[1];
    //     cafeId = String(data.cafeList[i].cafe_idx);
    //
    //     console.log(splitLocation + location + cafeId)
    //
    //     let cardHtml;
    //     cardHtml = `
    // <!--begin::Body-->
    //      <div class="card-body pt-4" style="flex: 1 1 auto; padding: 1px 2rem 2rem 2rem!important; cursor:pointer;"
    //            onclick="location.href='/cafe/detail?cafe_idx=`+cafeId+`'">
    //        <span class="text-dark-75 font-weight-bolder" style="font-size: 20px !important;">
    //               ` + mainTitle + `</span>
    //        <!--begin::Info-->
    //        <div class="justify-content-between align-items-center my-1">
    //          <span class="text-dark-75">
    //            <span class="text-dark-75 mr-2">
    //               ` + subTitle + `</span>
    //             <span class="text-dark-75" style="float: right;"><i
    //              class="fa fa-map-marker" ></i> `+ location +`</span>
    //          </div>
    //          <div class="d-flex justify-content-between align-items-center my-1">
    //
    //            <span class="text-dark-75 font-weight-bolder"
    //                    style="color: #bf7e00; font-size: 18px !important;">
    //                ` + amountHour + `
    //              <em class="text-dark-75"  style="font-size: 10px !important;">원/시간</em>
    //            </span>
    //            <span class="text-dark-75" style="float: right; margin-top: 5px"><i
    //              class="fa fa-users" ></i> 최대
    //         ` + maxPeople + `인</span>
    //         </div>
    //        `
    //
    //     console.log($('.btn.btn-block.btn-sm.btn-light-success.font-weight-bolder.text-uppercase.py-4').attr("href"));
    //     $('.card.card-custom.gutter-b.card-stretch').eq(num).append(cardHtml);
    //
    //     num += 1;
    //   }

    }
  }


</script>
</html>