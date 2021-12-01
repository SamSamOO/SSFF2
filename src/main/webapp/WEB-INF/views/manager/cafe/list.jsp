<%--
  매니저 ** 스터디 카페 리스트 디테일 단
  User: 신지혜
  Date: 2021-11-26
  Time: 오후 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
  <title>관리자::스터디카페</title>
  <!--head.html Include-->
  <jsp:include page="/WEB-INF/commons/head.jsp"/>
  <link href="/resources/assets/css/style.list.css" rel="stylesheet" type="text/css"/>

<style>

  .datatable-pager.datatable-paging-loaded ul {
    list-style: none;
    margin: 0;
    padding: 0;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    flex-direction: row;
    box-sizing: border-box;
    text-align: left;
    font-weight: 400;
    font-size: 12px !important;
    color: #3F4254;
    word-wrap: break-word;
    -webkit-box-direction: normal;
  }

  .datatable-pager.datatable-paging-loaded li {
    padding: 1em;
  }

  

</style>
</head>

<!----------------Head 종료----------------------->
<!----------------Body 시작----------------------->


<body id="kt_body" class="header-fixed subheader-enabled page-loading">
<!----------------메인 시작----------------------->
<div class="d-flex flex-column flex-root">
  <!----------------페이지 시작----------------------->
    
    <div class="d-flex flex-row flex-column-fluid page">
      <!--begin::Wrapper-->
      <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
        <!--header.html Include-->
        <jsp:include page="/WEB-INF/commons/header.jsp"/>
        <!------------------Header Wrapper : 메뉴 탭 시작------------------>
        <!--menu.html Include-->
        <jsp:include page="/WEB-INF/commons/menu_admin.jsp"/>
        <!------------------Header Wrapper : 메뉴 탭 종료------------------>
        <!--컨테이너 시작-->
        <div class="d-flex flex-row flex-column-fluid container">
          <!--contents.html Include-->
          
          <!--begin::Content Wrapper 내용물 시작-->
          <div class="main d-flex flex-column flex-row-fluid">
            <!--begin::Subheader 페이지 서브 헤더 시작-->
            <div class="subheader py-2 py-lg-4" id="kt_subheader">
              <div
                class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                <!--begin::Details-->
                <div class="d-flex align-items-center flex-wrap mr-2">
                  <!--begin::Title-->
                  <i class="far fa-list-alt"></i>&nbsp;&nbsp;
                  <h5 class="text-dark font-weight-bolder mt-2 mb-2 mr-5">제휴카페 목록</h5>
                  <!--end::Title-->
                  <!--Breadcrumb : 로드맵 시작-->
                  <ul
                    class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                    <li class="breadcrumb-item">
                      <a href="" class="text-muted">관리자 페이지</a>
                    </li>
                    <li class="breadcrumb-item">
                      <a href="" class="text-muted">스터디 카페 관리</a>
                    </li>
                  </ul>
                  <!--Breadcrumb : 로드맵 종료-->
                </div>
                <!--end::Details-->
              </div>
            </div>
            <!--end::Subheader  페이지 서브 헤더 종료-->
            <div class="content flex-column-fluid" id="kt_content">
              <!--begin::Card-->
              <div class="card card-custom">
                <!--begin::Header-->
                <div class="card-header flex-wrap border-0 pt-6 pb-0">
                  <div class="card-title">
                    <button type="button"  class="btn btn-primary font-weight-bold font-size-h6 px-10 py-4 mr-40"
                    onclick="location.href='/cafe/register'">
                      
                      
                      신규등록</button>
                    <h3 class="card-label"></h3>
                  </div>
                  <!--begin::Search Form 검색-->
                  <div class="d-flex align-items-center" id="kt_subheader_search">
                                                <span class="text-dark-50 font-weight-bold"
                                                      id="kt_subheader_total" style="width: 40%">
                                                     전체  </span>
                    <span style="width: 30%"><a href="/manager/cafe/list"><i
                      class="fas fa-sync-alt"></i></a></span>
                    <form class="ml-5">
                      <div class="input-group input-group-sm input-group-solid">
                        <input type="text" class="form-control"
                               id="kt_subheader_search_form" name="keyword"
                               placeholder="Search..."/>
                        <div id="searchBtn" class="input-group-append">
                          <span class="input-group-text">
                              <i
                                class="flaticon2-search-1 icon-sm"></i>
                          </span>
                        </div>
                      </div>
                    </form>
                  </div>
                  <!--end::Search Form-->
                </div>
                <!--end::Header-->
                <!--begin::Body 북마크-->
                <div class="card-body">
                  <!--begin::Card 카테고리 항목 접기 시작-->
                  <%------ 모집글 -------%>
                  <div
                    class="accordion accordion-light accordion-light-borderless accordion-svg-toggle mb-8"
                    id="accordionExample7">
                    
                    <div class="card" style="display: none;">
                      <div class="card-header" id="headingTwo7">
                        <div class="card-title collapsed" data-toggle="collapse"
                             data-target="#collapseTwo7">
                          <span class="svg-icon svg-icon-primary">
                              <svg xmlns="http://www.w3.org/2000/svg"
                                   width="24px" height="24px"
                                   viewBox="0 0 24 24" version="1.1">
                              <g stroke="none" stroke-width="1"
                                 fill="none"
                                 fill-rule="evenodd">
                              <polygon
                                points="0 0 24 0 24 24 0 24"></polygon>
                              <path d="M12.2928955,6.70710318 C11.9023712,6.31657888 11.9023712,5.68341391
                              12.2928955,5.29288961 C12.6834198,4.90236532 13.3165848,4.90236532 13.7071091,5.29288961
                              L19.7071091,11.2928896 C20.085688,11.6714686 20.0989336,12.281055 19.7371564,12.675721 L14.2371564,18.675721
                              C13.863964,19.08284 13.2313966,19.1103429 12.8242777,18.7371505 C12.4171587,18.3639581 12.3896557,17.7313908
                              12.7628481,17.3242718 L17.6158645,12.0300721 L12.2928955,6.70710318 Z"
                                    fill="#000000"
                                    fill-rule="nonzero">
                              </path>
                              <path d="M3.70710678,15.7071068 C3.31658249,16.0976311 2.68341751,16.0976311 2.29289322,15.7071068 C1.90236893,15.3165825
                              1.90236893,14.6834175 2.29289322,14.2928932 L8.29289322,8.29289322 C8.67147216,7.91431428 9.28105859,7.90106866
                              9.67572463,8.26284586 L15.6757246,13.7628459 C16.0828436,14.1360383 16.1103465,14.7686056 15.7371541,15.1757246
                              C15.3639617,15.5828436 14.7313944,15.6103465 14.3242754,15.2371541 L9.03007575,10.3841378 L3.70710678,15.7071068 Z"
                                    fill="#000000" fill-rule="nonzero"
                                    opacity="0.3"
                                    transform="translate(9.000003, 11.999999) rotate(-270.000000) translate(-9.000003, -11.999999) ">
                              </path>
                              </g> </svg>
                          </span>
                          <div class="card-label pl-4 font-weight-bolder text-hover-primary">
                            검색 필터
                          </div>
                        
                        </div>
                      </div>
                      <div id="collapseTwo7" class="collapse"
                           data-parent="#accordionExample7">
                        <div class="card-body pl-12 font-weight-light">
                          <div id="filter_1">
                            <h6 class="font-weight-bolder text-ssff2 mb-2">스터디 타입</h6>
                            <ul class="list-inline checklist" aria-required="true">
                              <li class="d-inline-flex">
                                <span class="mr-2 w-20px">
                                  <label
                                    class="checkbox checkbox-single checkbox-all mr-4">
                                      <input name="chk" id="all"
                                             type="checkbox"
                                             value="전체" checked>&nbsp;<span></span>
                                  </label>
                                </span>
                                전체
                              </li>
                              
                              <li class="d-inline-flex">
                               <span class="mr-2 w-20px">
                                <label class="checkbox checkbox-single">
                                 <input name="chk" type="checkbox" value="P">&nbsp;<span></span>
                                </label>
                               </span>
                                프로젝트
                              </li>
                              
                              <li class="d-inline-flex">
                               <span class="mr-2 w-20px">
                                <label class="checkbox checkbox-single">
                                 <input name="chk" type="checkbox" value="C">&nbsp;<span></span>
                                </label>
                               </span>
                                챌린지
                              </li>
                            </ul>
                          </div>
                          
                          <%--  구분선--%>
                          <div class="separator separator-solid mb-4"></div>
                          
                          
                          <div id="filter_2">
                           
                            <table class="ml-auto mr-auto">
                              <tr class="row">
                                <td colspan="1" align="right">
                                  <button class="btn btn-light-instagram" type="submit"
                                          id="submitBtn">검색하기
                                  </button>
                                </td>
                              </tr>
                            </table>
                          
                          </div>
                        
                        </div>
                      </div>
                    </div>
                    
                    <!--end::Card 카테고리 항목 접기 종료-->
                    
                    <!--begin: Datatable-->
                    <!--begin: Datatable-->
                    <div class=" datatable-default datatable-primary"
                         id="kt_datatable">
                      <%------ 테이블 시작-------%>
                      <table class="mng_study_list table table-hover">
                        <thead class="text-center">
                        <tr>
                          <th data-field="CafeIDX" class="cafe_idx">
                            카페번호
                          </th>
        
                          <th data-field="CafeName" class="cafe_name">
                            카페명
                          </th>
        
                          <th data-field="CafeMainTitle" class="cafe_main_title">
                            카페타이틀
                          </th>
        
                          <th data-field="CafeRemoveYN" class="cafe_remove_yn">
                            삭제여부
                          </th>
        
                          <th class="list_action"> 수정하기</th>
                        </tr>
                        </thead>
                        <tbody id="cafeManagertableBody">
                        </tbody>
                      </table>
                        <!--begin: pager-->
                        <div class="datatable-pager datatable-paging-loaded center" style="padding-left: 360px;">
    
    
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
                            <%--<span class="datatable-pager-detail">Showing 1 - 10 of 350</span>--%>
                          </div>
                        </div>
                        <!--end: pager-->
  
                    </div>
                    <!--end::Body-->
                  
                  </div>
                  <!--end::Card-->
                </div>
                <!--end::Content-->
              </div>
              <!--end::Content Wrapper 내용물 종료-->
            </div>
          </div>
          <!--컨테이너 종료-->
          <!--footer.html Include-->
        </div>
      </div>
    </div>
  <jsp:include page="/WEB-INF/commons/footer.jsp"/>

</div>
</body>
<!----------------Body 종료----------------------->

<script>


  // 페이지 처리를 위한 함수 / 카드 증가시 1씩 증가
  let num = 0;

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
               url        : '/cafeRest/manager/listData',
               data       : JSON.stringify(start.param), // 다음 페이지 번호와 페이지 사이즈를 가지고 출발
               dataType   : 'json', // 받을 데이터는 json
               contentType: "application/json; charset=utf-8",
               success    : successCallback,
               error      : errorCallback
             });

      // 성공시 데이터 처리
      function successCallback(data) {
        console.log("data: " + JSON.stringify(data)); // cafe_idx_10
        console.log("data: " + data.cafeList.length);

        console.log("data: " + data.cafeList[1].cafe_idx[1]); // 10번카페의 2번이미지입니다

        // 불러온 데이터가 없다면
        if (data.cafeList.length == 0) {
          // $(".gridList").append('<div class="noList"><span>표시할 항목이 없습니다.</span></div>');
          alert("불러온 데이터가 업쪄")
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
        alert("불러오기 실패해져ㅠㅠ")

      } // errorCallback
    }, // callAjax: function

    // 데이터 setting
    setListItems: function (data) {
      $('#kt_subheader_total').html('전체 ' +  data.cafeList.length + '건');
      
      console.log("셋팅창 떴어유~");

      // 기본 템플릿 셋팅
      let templet =
              `
              `
      
      // 기본 구조 셋팅!
      $('#accordionExample7').append(templet);
      // 테이블 동적생성을 위해 불러온 data를 각 변수에 담아 활용
      $rsrvHtml = '';

      let CafeIDX = '';
      let CafeName = '';
      let CafeMainTitle = '';
      let CafeRemoveYN = '';
      
      let checkNum =0;

      // 불러온 데이터 수만큼 돌며 목록 생성
      for (let i = 0; i < data.cafeList.length; i++) {

        checkNum += 1;
        
         CafeIDX = data.cafeList[i].cafe_idx;
         CafeName = data.cafeList[i].cafe_name;
         CafeMainTitle = data.cafeList[i].cafe_main_title;
         CafeRemoveYN = data.cafeList[i].cafe_remove_yn;
         
        $rsrvHtml +=`
        <tr data-row="`+i+`" aria-label="`+i+`" class="cafe-row">
          <%--스터디카페 번호--%>
          <td data-field="CafeIDX"
              aria-label="`+CafeIDX+`"
              class="cafe_idx">
            <div class="d-flex align-items-center justify-content-center">
              <a href="/cafe/detail?cafe_idx=`+CafeIDX+`">
                <span class="mb-0 text-hover-primary">
                    `+CafeIDX+`
                </span>
              </a>
            </div>
          </td>
            
            <%--카페명--%>
          <td data-field="CafeName"
              aria-label="`+CafeName+`"
              class="cafe_name">
            <div class="d-flex align-items-center justify-content-center">
              <span
                class="text-dark-75 font-weight-bolder font-size-lg mb-0 text-hover-primary">
                 `+CafeName+`
              </span>
            
            </div>
          </td>
            
            <%--카페타이틀--%>
          <td data-field="CafeMainTitle"
              aria-label="`+CafeMainTitle+`"
              class="cafe_main_title">
            <div class="d-flex align-items-center justify-content-center">
              <span class="mb-0">
                  `+CafeMainTitle+`
              </span>
            </div>
          </td>
            
            <%--삭제여부--%>
          <td data-field="CafeRemoveYN"
              aria-label="`+CafeRemoveYN+`"
              class="cafe_remove_yn">
            <div class="d-flex align-items-center justify-content-center">
              <span class="mb-0 label label-inline">
                  `+CafeRemoveYN+`
              </span>
            </div>
          </td>
            
            <%--액션--%>
          <td data-field="Actions"
              aria-label="액션 버튼"
              class="list_action text-center">
             
            <a href="/cafe/modify?cafe_idx=`+CafeIDX+`"
               class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2">
              <i class="far fa-newspaper"></i>
            </a>
         
          </td>
        </tr>
        `
      }

      $('#cafeManagertableBody').append($rsrvHtml);

      //-------------- pager --------------//
      let totalData = checkNum; //총 데이터 수
      let dataPerPage = 15; //한 페이지에 나타낼 글 수
      let pageCount = 5; //페이징에 나타낼 페이지 수
      let globalCurrentPage; //현재 페이지
      let currentPage = 1;

      // 드롭다운 value pix

      // $("#select-pager").val(10); // 그래서 강제로 줬엉..
      // dataPerPage = $("#select-pager option:selected").val(); //TODO 안댐
      console.log(dataPerPage);

      //총 road된 게시글 수
      // totalData = $('.datatable-body').children().length;
      console.log(totalData);
      if (totalData === 0) {
        alert("해당 조건에 조회되는 데이터가 존재하지 않습니다.");
        $('.datatable-pager').hide(); // 숨김처리
      } // if

      displayData(1, dataPerPage); //1번째페이지, 한페이지에 나타낼 글 수=체크박스 val(기본-15)
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
        } // if6

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
          // $(this).closest("tr").toggleClass("datatable-row-subtable-expanded").next().fadeToggle();
          $('tr[class^="datatable"]').removeClass("datatable-row-subtable-expanded");
          $('td[class="datatable-subtable"]').css('display','none');

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
        $('tr[class="cafe-row"]').attr('style', ('display:none'));

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

      } // displayData
      
    } // setListItem
  } // start

</script>

<%--<script>--%>
<%--  function submitConfirm() {--%>

<%--    $('#actionForm').submit();--%>

<%--  }--%>

<%--  $(function () {--%>
<%--    let sch = location.search;--%>
<%--    console.log(sch);--%>

<%--    let params = new URLSearchParams(sch);--%>
<%--    let sch_keyword = "";--%>

<%--    let array = []; //배열1의 선언--%>
<%--    let array2 = []; //배열2의 선언--%>

<%--    let chk = [];--%>
<%--    let chk2 = [];--%>

<%--    let actionForm = $("#actionForm");--%>

<%--    $(`#searchBtn`).on('click', function (e) {--%>

<%--      e.preventDefault(); //기본 동작 제한--%>

<%--      location.href = '/manager/study/list?pageNum=1&amount=20&keyword=${keyword}&chk=${chk}';--%>
<%--    });--%>

<%--    $("input[name='keyword']").on("keyup", function (key) {--%>
<%--      let aa = "";--%>
<%--      if (key.keyCode == 13) {--%>

<%--        key.preventDefault(); //기본 동작 제한--%>
<%--        $(`input:checkbox[name='chk']`).each(function () {--%>
<%--          if ($(this).val() == "전체") {--%>
<%--            location.href = '/manager/study/list?pageNum=1&amount=20&keyword=' + $(--%>
<%--                `input[name='keyword']`).val();--%>
<%--            return;--%>
<%--          }--%>
<%--          aa += `&chk=` + $(this).val();--%>
<%--        });--%>

<%--        location.href = '/manager/study/list?pageNum=1&amount=20&keyword=' + $(--%>
<%--            `input[name='keyword']`).val() + aa;--%>
<%--      }--%>
<%--    });--%>

<%--    $(".paginate_button a").on("click", function (e) {--%>

<%--      e.preventDefault(); //기본 동작 제한--%>

<%--      actionForm.find("input[name='pageNum']").val($(this).attr("href"));--%>

<%--      actionForm.submit();--%>

<%--    });--%>

<%--    $("#all").on('click', function () {--%>

<%--      console.log("all2클릭");--%>

<%--      $(`input:checkbox[name='chk']`).prop('checked', false); // 체크박스 전체 뺴고 해제합니다.--%>

<%--      if ($(`input:checkbox[id='all']`).is(':checked')) {--%>

<%--        console.log(`체크`);--%>
<%--        console.log($(`#all`).attr("checked"));--%>
<%--        $(`#all`).prop("checked", false);--%>

<%--      } else {--%>

<%--        console.log(`체크안됨`)--%>
<%--        $(`#all`).prop("checked", true);--%>

<%--      }--%>

<%--    });--%>

<%--    $("#all2").on('click', function () {--%>

<%--      console.log("all2 클릭");--%>

<%--      $(`input:checkbox[name='chk2']`).prop('checked', false); // 체크박스 전체 뺴고 해제합니다.--%>

<%--      if ($(`input:checkbox[id='all2']`).is(':checked')) {--%>

<%--        console.log(`체크`);--%>
<%--        console.log($(`#all2`).attr("checked"));--%>
<%--        $(`#all2`).prop("checked", false);--%>

<%--      } else {--%>

<%--        console.log(`체크안됨`)--%>
<%--        $(`#all2`).prop("checked", true);--%>

<%--      }--%>
<%--    });--%>

<%--    $(`input:checkbox[name='chk']`).on(`click`, function () {--%>
<%--      console.log(`체크체크체크체크11`)--%>
<%--      if ($(this).val() != "전체") {--%>
<%--        $(`#all`).prop(`checked`, false);--%>
<%--      }--%>

<%--      if ($(`input:checkbox[name='chk']:checked`).length == 0 && $(this).val() != "전체") {--%>
<%--        console.log(`체크체크체크체크`)--%>
<%--        $(`#all`).prop('checked', true);--%>
<%--      }--%>
<%--    });--%>

<%--    $(`input:checkbox[name='chk2']`).on(`click`, function () {--%>
<%--      console.log(`체크체크체크체크11`)--%>
<%--      if ($(this).val() != "전체") {--%>
<%--        $(`#all2`).prop(`checked`, false);--%>
<%--      }--%>

<%--      if ($(`input:checkbox[name='chk2']:checked`).length == 0 && $(this).val() != "전체") {--%>
<%--        console.log(`체크체크체크체크`)--%>
<%--        $(`#all2`).prop('checked', true);--%>
<%--      }--%>
<%--    });--%>

<%--    <c:forEach var="list" items="${map.get('chk')}">--%>

<%--    chk.push(`${list}`);--%>
<%--    </c:forEach>--%>

<%--    <c:forEach var="list2" items="${map.get('chk2')}">--%>

<%--    chk2.push(`${list2}`);--%>

<%--    </c:forEach>--%>
<%--    console.log("chk" + chk);--%>
<%--    console.log("chk2" + chk2);--%>
<%--    if (chk[0] == '전체') {--%>
<%--      $(`input:checkbox[name='chk']`).prop("checked", false);--%>
<%--      $(`#all`).prop("checked", true);--%>
<%--    }--%>

<%--    if (chk2[0] == '전체') {--%>
<%--      $(`input:checkbox[name='chk2']`).prop("checked", false);--%>
<%--      $(`#all2`).prop("checked", true);--%>
<%--    }--%>

<%--    for (let i = 0; i < chk.length; i++) {--%>
<%--      $(`input:checkbox[name='chk']`).each(function () {--%>
<%--        console.log($(this).val());--%>

<%--        if (chk[i] == $(this).val()) {--%>

<%--          $(this).prop("checked", true);--%>
<%--          $(`#all`).prop("checked", false);--%>

<%--        } else if (chk[i] == "전체") {--%>

<%--          $(this).prop("checked", false);--%>
<%--          $(`#all`).prop("checked", true);--%>

<%--        }--%>
<%--      });--%>

<%--    }--%>
<%--    for (let i = 0; i < chk2.length; i++) {--%>
<%--      $(`input:checkbox[name='chk2']`).each(function () {--%>
<%--        if (chk2[i] == $(this).val()) {--%>

<%--          $(this).prop("checked", true);--%>
<%--          $(`#all2`).prop("checked", false);--%>

<%--        } else if (chk2[i] == "전체") {--%>

<%--          $(this).prop("checked", false);--%>
<%--          $(`#all2`).prop("checked", true);--%>

<%--        }--%>
<%--      });--%>

<%--    }--%>
<%--    // 버튼 클릭을 통해 세부 룸정보 add, delete--%>
<%--    $(document).on('click', "td[title='Load sub table']", function () {--%>
<%--      $(this).closest("tr").toggleClass("datatable-row-subtable-expanded").next().fadeToggle();--%>

<%--    })--%>
<%--  });--%>
<%--</script>--%>
</html>