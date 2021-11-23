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
                        <th data-field="RecordID" class="datatable-cell-center datatable-cell ">
                          <span style="width: 30px;"></span></th>
                        <th data-field="ReservationID" class="datatable-cell "><span
                          style="width: 110px;">ReservationID</span></th>
                        <th data-field="CafeInfo" class="datatable-cell "><span
                          style="width: 110px;">CafeInfo</span></th>
                        <th data-field="ReservationAmount" class="datatable-cell "><span
                          style="width: 110px;">ReservationAmount</span></th>
                        <th data-field="UseDateInfo" class="datatable-cell "><span
                          style="width: 110px;">UseDateInfo</span></th>
                        <th data-field="Status" data-autohide-disabled="false"
                            class="datatable-cell "><span style="width: 110px;">Status</span></th>
                        <!--TODO 세션 값에 따라 none처리 할 수 있게 admin-> 닉네임만on -->
                        <th data-field="Cancle" class="datatable-cell "><span style="width: 110px;">Cancle</span>
                        </th>
                        <th data-field="NickName" class="datatable-cell "><span
                          style="width: 110px;">NickName</span></th>
                      
                      </tr>
                      </thead>
                      <!-- 테이블 공통 헤드 e -->
                      
                      <tbody class="datatable-body putData">
                      
                      
                      </tbody>
                    </table>
                    <!--end: table-->
                    
                    <!--begin: pager-->
                    <div class="datatable-pager datatable-paging-loaded">
                      
                      
                      <div class="datatable-pager-info my-2 mb-sm-0">
                        <div class="dropdown bootstrap-select datatable-pager-size dropup"
                             style="width: 60px;">
                          <select class="selectpicker datatable-pager-size"
                                  title="Select page size" data-width="60px"
                                  data-container="body" data-selected="10"
                                  tabindex="null" id="select-pager">
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
//atatable-row mainTable
 //  datatable-row-subtable-expanded
 //    <!-- datatable-row-subtable-expanded ==active // fa fa-caret-lefe -> fa fa-caret-down  -->

// 버튼 클릭을 통해 세부 룸정보 add, delete
  $(document).on('click', "a[title='Load sub table']", function () {
    $(this).closest("tr").toggleClass("datatable-row-subtable-expanded").next().fadeToggle();
    
 
  })

 // 페이지 진입시 리스트 세팅
  $(document).ready(function () {
    start.init();
    console.log("start.init();")

  }); // ready

  // 카드 리스트를 ajax 페이지 처리하여 뿌립니다. 
  let start = {
    param  : {
      member_name : "admin", //TODO 세션 아이디로 (관리자, 멤버 구분해서 조회)
      pageListSize: "웅", //TODO 추후  검색 정보 담아서 출발
    },

    // 진입시 데이터 셋팅, 스크롤 감지 시작 
    init: function () {
      this.data();
      // this.scrollEvent();
    },

    // 데이터 셋팅을 위해 ajax 요청 보냄 
    data: function () {
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
        console.log("data.reservationList: " + data.reservationList); // obj arr 와르르
        console.log("data[0]: " + JSON.stringify(data)); // 와르르
        console.log("data[0]: " + data.length); // undefined
        console.log("data[0]: " + data.reservationList.length); // 82
        console.log("data[0]: " + data.reservationList[0].use_date); //2023-11-15 00:00:00

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

      console.log("셋팅창 떴어유~");

      // 테이블 동적생성을 위해 불러온 data를 각 변수에 담아 활용
      let amount = '';
      let cafe_name = '';
      let client_account_number = '';
      let client_bank_code = '';
      let client_name = '';
      let max_people = '';
      let member_name = '';
      let payment_completed_yn = '';
      let room_idx = '';
      let rsrv_amount = '';
      let rsrv_email = '';
      let rsrv_idx = '';
      let rsrv_message = '';
      let rsrv_name = '';
      let rsrv_phone_number = '';
      let rsrv_status_ynz = '';
      let transaction_amount = '';
      let transaction_categorie = '';
      let transaction_categories = '';
      let transaction_date = '';
      let trnsc_idx = '';
      let use_date = '';
      let use_end_time = '';
      let use_start_time = '';
      let cafeInfo = '';
      let useInfo = '';
      let trnsc_cate = '';
      const dataFieldSet = ["RecordID", "ReservationID", "CafeInfo", "ReservationAmount",
                            "UseDateInfo", "Status", "Cancle", "NickName"];
      //TODO set, 거래, 예약, maintitle td 등 배열화 해서 하기 html문 정리
      console.log(dataFieldSet[0]); // RecordID


      // 기본 템플릿 셋팅
      $rsrvHtml = '';
      let subHtml = '';

      let checkNum = 0;
      for (let i = 0; i < data.reservationList.length; i++) {
        console.log(data.reservationList[i].transaction_categories + '결제');

        cafe_name = data.reservationList[i].cafe_name;
        max_people = data.reservationList[i].max_people;
        room_idx = data.reservationList[i].room_idx;
        use_date = String(data.reservationList[i].use_date).split(' ', 0);
        use_end_time = data.reservationList[i].use_end_time;
        use_start_time = data.reservationList[i].use_start_time;
        transaction_categorie = data.reservationList[i].transaction_categorie;
        transaction_categories = data.reservationList[i].transaction_categories;

        member_name = data.reservationList[i].member_name;

        amount = data.reservationList[i].amount_to_be_paid;
        cafeInfo = cafe_name + '::' + max_people + '인실 (' + room_idx + ')';

        rsrv_email = data.reservationList[i].rsrv_email;
        rsrv_idx = data.reservationList[i].rsrv_idx;
        rsrv_message = data.reservationList[i].rsrv_message;
        rsrv_name = data.reservationList[i].rsrv_name;
        rsrv_phone_number = data.reservationList[i].rsrv_phone_number;

        rsrv_status_ynz = data.reservationList[i].rsrv_status_ynz;

        transaction_amount = data.reservationList[i].transaction_amount;
        trnsc_cate = transaction_categorie + '  |  ' + transaction_categories
        transaction_date = String(data.reservationList[i].transaction_date).split(' ', 0);
        trnsc_idx = data.reservationList[i].trnsc_idx;
        client_account_number = data.reservationList[i].client_account_number;
        client_bank_code = data.reservationList[i].client_bank_code;
        client_name = data.reservationList[i].client_name;

        useInfo = use_date + ' ' + use_start_time + '시부터 ' + use_end_time + '시까지 (' + (use_end_time
                  - use_start_time + 1)
                  + '시간)';

        if (data.reservationList[i].transaction_categories == "결제") {

          checkNum += 1; // 총데이터 몇건인지 확인하려궁~

          $rsrvHtml += `
        <!-- 일반 예약정보 s -->
        <tr data-row="` + checkNum + `" class="datatable-row mainTable">

          <td class="datatable-cell-center datatable-cell" data-field="RecordID" aria-label="1">
            <a class="datatable-toggle-subtable" data-value="1" title="Load sub table" style="width: 30px;">
              &nbsp;<i style="width: 30px;" class="fa fa-caret-right"></i></a> <!--TODO 아이콘 토글 -->
          </td>

          <td data-field="ReservationID" aria-label="` + rsrv_idx
                       + `" class="datatable-cell"><span style="width: 110px;">` + rsrv_idx + `</span></td>
          <td data-field="CafeInfo" aria-label="` + cafeInfo
                       + `" class="datatable-cell"><span style="width: 110px;">` + cafeInfo + `</span></td>
          <td data-field="ReservationAmount" aria-label="` + amount
                       + `원" class="datatable-cell"><span style="width: 110px;">` + amount + `원</span></td>
          <td data-field="UseDateInfo" aria-label="` + useInfo
                       + `" class="datatable-cell"><span style="width: 110px;">` + useInfo + `</span></td>
          <td data-field="Status" data-autohide-disabled="false" aria-label="` + rsrv_status_ynz + `"
              class="datatable-cell"><span style="width: 110px;"><span
              class="label label-warning label-dot"></span>&nbsp;<span
              class="font-weight-bold text-danger">` + rsrv_status_ynz + `</span></span></td>

          <td data-field="Cancle" aria-label="4" class="datatable-cell"><span
              style="width: 110px;">`;

          if (rsrv_status_ynz == 'n') {
            $rsrvHtml += `<span class="label label-success label-inline label-pill">cansle</span>`;
          }

          $rsrvHtml +=
              `</span><td data-field="NickName" aria-label="` + member_name + `"
                class="datatable-cell"><span style="width: 110px;">` + member_name + `</span></td> </td>
        </tr>
           <tr class="datatable-row-subtable" style="display: none;"> <!-- display none-block  -->
          <td class="datatable-subtable"style="width: 50% !important;    height: 400px!important;" >
            <div id="child_data_local_` + member_name + `" class="datatable datatable-default datatable-primary datatable-loaded">
              <table class="datatable-table" style="display: block; max-height: 400px;">

                <thead class="datatable-head mt-7 text-warning">

                  <tr class="datatable-row">
                    <th data-field="reservationID" class="datatable-cell  ed"><span class="h6 text-warning">예약정보</span>
                    </th>
                  </tr>

                </thead>

                <tbody class="datatable-body ps" style="min-height: 400px;">
                
              <!--여기도 좀 정리해야해 -->
                  <tr data-row="0" class="datatable-row">
                    <td class="col-4" data-field="rsrv_idx" aria-label="` + member_name + `">
                      <span><span>예약번호</span></span></td>
                    <td data-field="ShipCountry" aria-label="ID" class="datatable-cell">
                      <span>` + member_name + `</span></td>

                  </tr>
                  <tr data-row="0" class="datatable-row">
                    <td class="col-4" data-field="member_name" aria-label="` + rsrv_name + `">
                      <span><span>예약자명</span></span></td>
                    <td data-field="` + rsrv_name + `" aria-label="ID" class="datatable-cell">
                      <span>` + rsrv_name + `</span></td>

                  </tr>
                  <tr data-row="0" class="datatable-row">
                    <td class="col-4" data-field="rsrv_phone_number" aria-label="`
              + rsrv_phone_number + `">
                      <span><span>연락처</span></span></td>
                    <td data-field="` + rsrv_phone_number + `" aria-label="ID" class="datatable-cell">
                      <span>` + rsrv_phone_number + `</span></td>

                  </tr>
                  <tr data-row="0" class="datatable-row">
                    <td class="col-4" data-field="rsrv_email" aria-label="` + rsrv_email + `">
                      <span><span>이메일</span></span></td>
                    <td data-field="` + rsrv_email + `" aria-label="ID" class="datatable-cell">
                      <span>` + rsrv_email + `</span></td>

                  </tr>
                  <tr data-row="0" class="datatable-row">
                    <td class="col-4" data-field="rsrv_message" aria-label="">
                      <span><span>요청사항</span></span></td>
                    <td data-field="` + rsrv_message + `" aria-label="ID" class="datatable-cell">
                      <span>` + rsrv_message + `</span></td>

                  </tr>

                </tbody>
              </table>
            </div>
          </td>
          <td class="datatable-subtable"style="width: 50% !important;    height: 400px!important;">
            
            <div id="child_data_local_1" class="datatable datatable-default datatable-primary datatable-loaded">
              <table class="datatable-table" style="display: block; max-height: 400px;">

                <thead class="datatable-head mt-7 text-warning">

                  <tr class="datatable-row">
                    <th data-field="OrderID" class="datatable-cell  ed"><span class="h6 text-warning">거래정보 ID</span>
                    </th>
                  </tr>

                </thead>

                <tbody class="datatable-body ps" style="min-height: 400px;">

                  <tr data-row="0" class="datatable-row">
                    <td class="col-4" data-field="trnsc_idx" aria-label="` + trnsc_idx + `">
                      <span><span>결제번호</span></span></td>
                    <td data-field="` + trnsc_idx + `" aria-label="trnsc_idx" class="datatable-cell">
                      <span>` + trnsc_idx + `</span></td>
                  </tr>
                  <tr data-row="0" class="datatable-row">
                    <td class="col-4" data-field="transaction_amount" aria-label="`
              + transaction_amount + `">
                      <span><span>결제금액</span></span></td>
                    <td data-field="` + transaction_amount + `" aria-label="transaction_amount" class="datatable-cell">
                      <span>` + transaction_amount + `</span></td>
                  </tr>
                  <tr data-row="0" class="datatable-row">
                    <td class="col-4" data-field="trnsc_cate" aria-label="` + trnsc_cate + `">
                      <span><span>결제분류</span></span></td>
                    <td data-field="` + trnsc_cate + `" aria-label="trnsc_cate" class="datatable-cell">
                      <span>` + trnsc_cate + `</span></td>
                  </tr>
                  <tr data-row="0" class="datatable-row">
                    <td class="col-4" data-field="client_name" aria-label="` + client_name + `">
                      <span><span>예금주명</span></span></td>
                    <td data-field="` + client_name + `" aria-label="client_name" class="datatable-cell">
                      <span>` + client_name + `</span></td>
                  </tr>
                  <tr data-row="0" class="datatable-row">
                    <td class="col-4" data-field="client_bank_code" aria-label="` + client_bank_code
              + `">
                      <span><span>은행코드</span></span></td>
                    <td data-field="` + client_bank_code + `" aria-label="client_bank_code" class="datatable-cell">
                      <span>` + client_bank_code + `</span></td>
                  </tr>
                  <tr data-row="0" class="datatable-row">
                    <td class="col-4" data-field="client_account_number" aria-label="`
              + client_account_number + `">
                      <span><span>결제계좌</span></span></td>
                    <td data-field="` + client_account_number + `" aria-label="client_account_number" class="datatable-cell">
                      <span>` + client_account_number + `</span></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </td></tr>
        <!-- 서브정보 e -->
        
        `;

        } // if

      } // for

      console.log("왜 안된느지요?")
      $('.datatable-body.putData').append($rsrvHtml);

      //-------------- pager --------------//
      let totalData = checkNum; //총 데이터 수
      let dataPerPage; //한 페이지에 나타낼 글 수
      let pageCount = 5; //페이징에 나타낼 페이지 수
      let globalCurrentPage; //현재 페이지
      let currentPage = 1;

      // 드롭다운 value pix
      
      $("#select-pager").val(10); // 그래서 강제로 줬엉..
      dataPerPage = $("#select-pager option:selected").val(); //TODO 안댐
      console.log(dataPerPage);

      //총 road된 게시글 수
      // totalData = $('.datatable-body').children().length;
      console.log(totalData);
      if (totalData === 0) {
        alert("해당 조건에 조회되는 데이터가 존재하지 않습니다.");
        $('.datatable-pager').hide(); // 숨김처리
      } // if

      displayData(1, dataPerPage); //1번째페이지, 한페이지에 나타낼 글 수=체크박스 val(기본-5)
      paging(totalData, dataPerPage, pageCount, 1);

      function paging(totalData, dataPerPage, pageCount, currentPage) {//총데이타, 체크박스 val, 페이징수(10), 현재페이지(1)
        currentPage = Number(currentPage);
        console.log("currentPage : " + currentPage);

        let curPageId = currentPage > 1 ? Math.round((currentPage / dataPerPage)) + 1 : currentPage; // 현재 페이지 A tag ID

        totalPage = Math.floor((totalData / dataPerPage) + ((totalData % dataPerPage) > 0 ? 1 : 0)); //총 페이지 수
        // totalPage = Math.ceil(totalData/dataPerPage); // 총 페이지 수

        if (totalPage < pageCount) {
          pageCount = totalPage;
        } // if
        console.log("totalPage : " + totalPage);
        let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
        // let pageGroup = Math.ceil(curPageId/pageCount); // 페이지 그룹
        console.log("pageGroup : " + pageGroup);
        let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
        console.log("last : " + last);
        if (last > totalPage) {
          last = totalPage;
        } // if

        var first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
        if (first < 1) first = 1; // 첫페이지가 1보다 작을 경우 1로 세팅

        console.log("first : " + first);
        let next = last + 1;
        console.log("next : " + next);
        let prev = first - 1;
        console.log("prev : " + prev);
        $pageHtml = "";

        // 이전, 처음으로 가기
        if (prev > 0) { // 이전, 처음으로 갈 수 있다면 이전, 처음버튼 활성화
          currentPage = Number(currentPage);
          console.log("prev > 0 : ");
          $pageHtml +=
              `<li><a title="First"
                    class="datatable-pager-link datatable-pager-link-first"
                    data-page="1">
                      <i class="flaticon2-fast-back"></i></a></li>
             <li><a title="Previous"
                    class="datatable-pager-link datatable-pager-link-prev"
                    data-page="` + (currentPage - 1) + `">
                      <i class="flaticon2-back"></i></a></li>`;
        } else { // 현재 페이지가 첫번째 페이지라면 이전, 처음버튼 비활성화
          $pageHtml +=
              `<li><a title="First"
                    class="datatable-pager-link datatable-pager-link-first datatable-pager-link-disabled"
                    data-page="1"
                    disabled="disabled">
                       <i class="flaticon2-fast-back"></i></a></li>
              <li><a title="Previous"
                      class="datatable-pager-link datatable-pager-link-prev datatable-pager-link-disabled"
                      data-page="1"
                      disabled="disabled">
                        <i class="flaticon2-back"></i></a></li>`;
        } // if-else

        //페이징 번호 표시
        for (var i = first; i <= last; i++) {

          if (currentPage == i) { // 내가 클릭한 페이지(현재페이지) 번호 버튼은 활성화!
            $pageHtml += `
            <li><a class="datatable-pager-link datatable-pager-link-number
                          datatable-pager-link-active"
                   data-page="` + i + `"
                   title="` + i + `">` + i + `</a></li>`
          } else { // 아닌 페이지 번호는 하얗게
            $pageHtml +=
                `<li><a class="datatable-pager-link datatable-pager-link-number"
                      data-page="` + i + `"
                      title="` + i + `">` + i + `</a></li>`;
          } // if-else
        } // for

        // 이후, 맨 뒤로 가기
        if (next < totalPage) { // 이후로 갈 수 있다면(=내 페이지가 맨 끝이 아니라면) 이후 버튼 활성화
          $pageHtml +=
              `<li><a title="Next"
                    class="datatable-pager-link datatable-pager-link-next"
                    data-page="` + (currentPage + 1) + `">
                      <i class="flaticon2-next"></i></a></li>`;
        } else { // 내 페이지가 맨 끝이라면 이후 버튼 비활성화
          $pageHtml +=
              `<li><a title="Next"
                    class="datatable-pager-link datatable-pager-link-next datatable-pager-link-disabled"
                    data-page="` + (currentPage + 1) + `"
                    disabled="disabled">
                      <i class="flaticon2-next"></i></a></li>`
        } // if-else
        if (last < totalPage) { // 내 페이지가 맨 끝이 아니라면 마지막으로 가기 버튼 활성화
          $pageHtml +=
              `<li><a title="Last"
                    class="datatable-pager-link datatable-pager-link-last"
                    data-page="` + totalPage + `">
                      <i class="flaticon2-fast-next"></i></a></li>`;
        } else { // 내 페이지가 마지막이라면 마지막으로 가기 버튼 비활성화
          $pageHtml +=
              `<li><a title="Last"
                    class="datatable-pager-link datatable-pager-link-last
                           datatable-pager-link-disabled"
                    data-page="` + totalPage + `"
                    disabled="disabled">
                    <i class="flaticon2-fast-next"></i></a></li>`
        } // ir-else

        console.log($(".datatable-pager.datatable-paging-loaded"));

        // 페이징 번호 그리기
       // $(".datatable-pager-nav.my-2.mb-sm-0").html(pageHtml);
        $(".datatable-pager.datatable-paging-loaded").html($("<ul>" + $pageHtml + "</ul>"));
        
        //페이징 번호 클릭 이벤트
        $(".datatable-pager.datatable-paging-loaded ul li a").click(function () {
          console.log("s놀아>???: ");

          //전역변수에 선택한 페이지 번호를 담아서
          globalCurrentPage = $(this).attr("data-page");

          //페이징 표시 재호출
          paging(totalData, dataPerPage, pageCount, globalCurrentPage);

          //글 목록 표시 재호출
          displayData(globalCurrentPage, dataPerPage);
        }); // click-fn
      } // pager()

      // 페이지 사이즈 드롭다운 선택하면 화면단에서 적용하여 출력하는 함수
      $('#select-pager').change(function () {
        let pageSizePickerValue = $("#select-pager option:selected").val();
        console.log("pageSizePickerValue: " + pageSizePickerValue);

        //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경
        paging(totalData, pageSizePickerValue, pageCount, currentPage);
        displayData(currentPage, pageSizePickerValue);
      }); // change-fn

      //현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
      function displayData(currentPage, dataPerPage) {
//기본 셋팅에서-> 숫자로 값 변동이 일어난다면 내용 숨기고 몇번째~몇번째 display만 변경하는 형식,
        let chartHtml = "";
        $('.datatable-row.mainTable').attr('style', ('display:none'));

        //Number로 변환하지 않으면 아래에서 +를 할 경우 연산 아닌 결합됨!
        currentPage = Number(currentPage);
        dataPerPage = Number(dataPerPage);

        for (
            var i = ((currentPage) - 1) * dataPerPage + 1;
            i <= (currentPage - 1) * dataPerPage + dataPerPage;
            i++
        ) {
          $('tr[data-row="' + i + '"]').attr('style', ('display:""'));
        } // for

      }

    }
  }


</script>
</html>