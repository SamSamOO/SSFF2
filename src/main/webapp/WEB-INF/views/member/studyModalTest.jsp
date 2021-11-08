<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2021-11-05
  Time: 오후 3:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
<html>
<!----------------Head 시작----------------------->

<head>
  <meta charset="UTF-8">
  <title>studyModalTest</title>
  <link rel="stylesheet" type="text/css" href="../../../resources/assets/css/style.bundle.css">
  <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
  
  <!--head.html Include-->
  <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>
</head>

<!----------------Head 종료----------------------->
<!----------------Body 시작----------------------->


<body id="kt_body" class="header-fixed subheader-enabled page-loading">
<hr>

<!-- Model객체 전달여부 확인 좀  -->
<%-- 1. applyMemberList: ${applyMemberList}
  1. applyMemberList: ${applyMemberList[0].recruitBoardDTO.teamname}  --%>


<hr>
<!----------------메인 시작----------------------->
<div class="d-flex flex-column flex-root">
  <!----------------페이지 시작----------------------->
  <div class="d-flex flex-row flex-column-fluid page">
    <!--begin::Wrapper-->
    <div class="d-flex flex-column flex-row-fluid wrapper"
         id="kt_wrapper">
      <!------------------header.html Include------------------>
      <jsp:include page="/WEB-INF/commons/header.jsp"></jsp:include>
      <!------------------Header Wrapper : 메뉴 탭 시작------------------>
      <!--menu.html Include-->
      <jsp:include page="/WEB-INF/commons/menu_main.jsp"></jsp:include>
      <!------------------Header Wrapper : 메뉴 탭 종료------------------>
      <!--컨테이너 시작-->
      <div class="d-flex flex-row flex-column-fluid container">
        
        <!---------------- 지혜: 신청자/멤버 명단 모달창 시작 -------------------->
        <a href="#" class="btn btn-light-danger font-weight-bold"
           data-toggle="modal" data-target="#memberListModal" onclick="pager();">멤버확인</a>
        
        <div id="memberListModal" class="modal fade" role="dialog"
             aria-hidden="true">
          <div class="modal-dialog modal-xl">
            <div class="modal-content" style="min-height: 590px;">
              <div class="modal-header py-5" id="studyMemberTab">
                <h5 class="modal-title">
                  현재멤버/버튼으로 <span class="d-block text-muted font-size-sm">대충
											해당 테이블의 멤버 정보를 나타낸다고 설명하는 중</span>
                </h5>
                <h5 class="modal-title">
                  신청자정보<span class="d-block text-muted font-size-sm">
                  신청자 정보를 나타낸다고 설명하는 중</span>
                </h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                  <i aria-hidden="true" class="ki ki-close"></i>
                </button>
              </div>
              <!--------------------------- 현재멤버 시작---------------------------->
<%--              <div class="modal-body" style="display: none;">--%>
<%--                <!--begin::Search Form-->--%>
<%--                <div class="mb-5">--%>
<%--                  <div class="row align-items-center">--%>
<%--                    <div class="col-lg-9 col-xl-8">--%>
<%--                      <div class="row align-items-center">--%>
<%--                        <div class="col-md-4 my-2 my-md-0">--%>
<%--                          <div class="input-icon">--%>
<%--                            <input type="text" class="form-control"--%>
<%--                                   placeholder="Search..." id="kt_datatable_search_query_3"/>--%>
<%--                            <span> <i class="flaticon2-search-1 text-muted"></i>--%>
<%--															</span>--%>
<%--                          </div>--%>
<%--                        </div>                                            --%>
<%--                      --%>
<%--                      </div>--%>
<%--                    </div>--%>
<%--                    <div class="col-lg-3 col-xl-4 mt-5 mt-lg-0">--%>
<%--                      <a href="#"--%>
<%--                         class="btn btn-light-primary px-6 font-weight-bold">Search</a>--%>
<%--                    </div>--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--                <!--end::Search Form-->--%>
<%--                --%>
<%--                --%>
<%--                <!--begin: Datatable-->--%>
<%--                <div--%>
<%--                    class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-scroll datatable-loaded"--%>
<%--                    id="studyMemberList">--%>
<%--                  <table class="datatable-table"--%>
<%--                         style="display: block; min-height: 400px; max-height: 400px;">--%>
<%--                    --%>
<%--                    <thead class="datatable-head">--%>
<%--                    <tr class="datatable-row" style="left: 0px;">--%>
<%--                      <th data-field=""--%>
<%--                          class="datatable-cell datatable-cell-sort"--%>
<%--                          style="width: 5%; text-align: center;"><span>&nbsp;</span></th>--%>
<%--                      --%>
<%--                      <th data-field="Number"--%>
<%--                          class="datatable-cell datatable-cell-sort"--%>
<%--                          style="width: 10%;"><span>#</span></th>--%>
<%--                      --%>
<%--                      <th data-field="studyTeamName"--%>
<%--                          class="datatable-cell datatable-cell-sort"--%>
<%--                          style="width: 45%;"><span style="text-align: center;">study&nbsp;Team&nbsp;Name</span>--%>
<%--                      </th>--%>
<%--                      --%>
<%--                      <th data-field="NickName"--%>
<%--                          class="datatable-cell datatable-cell-sort"--%>
<%--                          style="width: 40%;"><span style="text-align: center;">NickName</span></th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    --%>
<%--                    <tbody class="datatable-body ps">--%>
<%--                    <c:set var="i" value="0"/>--%>
<%--                    <c:forEach items="${applyMemberList}" var="applyMemberList">--%>
<%--                      <c:forEach items="${memberList}" var="memberList">--%>
<%--                        --%>
<%--                        <c:if test="${memberList.member_name eq applyMemberList.member_name}">--%>
<%--                          <c:set var="i" value="${i+1}"/>--%>
<%--                          <tr data-row="${i}" class="datatable-row" style="left: 0px;">--%>
<%--                            <td class="datatable-cell" data-field=""--%>
<%--                                style="width: 5%;"><span>&nbsp;</span></td>--%>
<%--                            --%>
<%--                            <td class="datatable-cell" data-field="Number"--%>
<%--                                aria-label="${i}" style="width: 10%;"><span>${i}</span>--%>
<%--                            </td>--%>
<%--                            --%>
<%--                            <td class="datatable-cell" data-field="studyTeamName"--%>
<%--                                aria-label="${applyMemberList.recruitBoardDTO.teamname}"--%>
<%--                                style="width: 45%;">--%>
<%--                              <span>${applyMemberList.recruitBoardDTO.teamname}</span>--%>
<%--                            </td>--%>
<%--                            --%>
<%--                            --%>
<%--                            <td data-field="NickName"--%>
<%--                                aria-label="${applyMemberList.member_name}"--%>
<%--                                class="datatable-cell" style="width: 40%;"><span>--%>
<%--																		<img class="symbol symbol-40 symbol-sm flex-shrink-0"--%>
<%--                                         src="${memberList.member_profile}" alt="photo"--%>
<%--                                         style="width: 10px; height: 10px;"><!--//TODO 크기안먹음 -->--%>
<%--																		${applyMemberList.member_name}--%>
<%--																</span></td>--%>
<%--                          --%>
<%--                          </tr>--%>
<%--                        --%>
<%--                        </c:if>--%>
<%--                      </c:forEach>--%>
<%--                    </c:forEach>--%>
<%--                    <div class="ps__rail-x"><div class="ps__thumb-x" tabindex="0"></div></div>--%>
<%--                    <div class="ps__rail-y"><div class="ps__thumb-y" tabindex="0"></div></div>--%>
<%--                    </tbody>--%>
<%--                  </table>--%>
<%--                --%>
<%--                </div>--%>
<%--                --%>
<%--                <div class="datatable-pager datatable-paging-loaded">--%>
<%--                  <ul class="datatable-pager-nav my-2 mb-sm-0"></ul>--%>
<%--  --%>
<%--                  <div class="datatable-pager-info my-2 mb-sm-0">--%>
<%--                    <div class="dropdown bootstrap-select datatable-pager-size"--%>
<%--                         style="width: 60px;">--%>
<%--                      <select class="selectpicker datatable-pager-size"--%>
<%--                              title="Select page size" data-width="60px"--%>
<%--                              data-container="body" data-selected="5" id="pageSizePicker">--%>
<%--        --%>
<%--                        <option value="5">5</option>--%>
<%--                        <option value="10">10</option>--%>
<%--                        <option value="20">20</option>--%>
<%--                        <option value="30">30</option>--%>
<%--                        <option value="50">50</option>--%>
<%--                        <option value="100">100</option>--%>
<%--                      </select>--%>
<%--      --%>
<%--                      <div class="dropdown-menu ">--%>
<%--                        <div class="inner show" role="listbox" id="bs-select-10" tabindex="-1">--%>
<%--                          <ul class="dropdown-menu inner show" role="presentation"></ul>--%>
<%--                        </div>--%>
<%--                      </div>--%>
<%--                    </div>--%>
<%--                    <span class="datatable-pager-detail">Showing 11 - 15 of 1000</span>--%>
<%--                  </div>--%>
<%--                </div>--%>
                <!--------------------------- 현재멤버 종료---------------------------->
                
                
                <!--------------------------- 가입신청자명단 시작---------------------------->
              <div class="modal-body">
                <!--begin::Search Form-->
                <div class="mb-5">
                  <div class="row align-items-center">
                    <div class="col-lg-9 col-xl-8">
                      <div class="row align-items-center">
                        <div class="col-md-4 my-2 my-md-0">
                          <div class="input-icon">
                            <input type="text" class="form-control"
                                   placeholder="Search..." id="kt_datatable_search_query_3"/>
                            <span> <i class="flaticon2-search-1 text-muted"></i>
															</span>
                          </div>
                        </div>
            
                        <!-- 해당부분은 신청자 명단에서만 보이면 됨! 시작  -->
                        <div class="col-md-4 my-2 my-md-0">
                          <div class="d-flex align-items-center">
                            <label class="mr-3 mb-0 d-none d-md-block">Status:</label>
                            <select class="form-control"
                                    id="kt_datatable_search_status_3">
                              <option value="">All</option>
                              <option value="1">Pending</option>
                              <option value="2">Delivered</option>
                              <option value="3">Canceled</option>
                              <option value="4">Success</option>
                              <option value="5">Info</option>
                              <option value="6">Danger</option>
                            </select>
                          </div>
                        </div>
            
                        
            
                        <!-- 해당부분은 신청자 명단에서만 보이면 됨! 끝 -->
          
                      </div>
                    </div>
                    <div class="col-lg-3 col-xl-4 mt-5 mt-lg-0">
                      <a href="#"
                         class="btn btn-light-primary px-6 font-weight-bold">Search</a>
                    </div>
                  </div>
                </div>
                <!--end::Search Form-->
    
    
                <!--begin: Datatable-->
                <div
                    class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-scroll datatable-loaded"
                    id="studyMemberList">
                  <table class="datatable-table"
                         style="display: block; min-height: 400px; max-height: 400px;">
        
                    <thead class="datatable-head">
                    <tr class="datatable-row" style="left: 0px;">
                      <th data-field=""
                          class="datatable-cell datatable-cell-sort"
                          style="width: 5%; text-align: center;"><span>&nbsp;</span></th>
          
                      <th data-field="number"
                          class="datatable-cell datatable-cell-sort"
                          style="width: 5%;"><span>#</span></th>
                      <th data-field="applyIdx"
                          class="datatable-cell datatable-cell-sort"
                          style="width: 10%;"><span>apply idx</span></th>
                      <th data-field="studyTeamName"
                          class="datatable-cell datatable-cell-sort"
                          style="width: 25%;"><span style="text-align: center;">study Team Name</span></th>
          
                      <th data-field="nickName"
                          class="datatable-cell datatable-cell-sort"
                          style="width: 25%;"><span style="text-align: center;">NickName</span></th>
                      
  
                      <th data-field="status"
                          class="datatable-cell datatable-cell-sort"
                          style="width: 15%;"><span style="text-align: center;">status</span></th>
  
                      <th data-field="action"
                          class="datatable-cell datatable-cell-sort"
                          style="width: 15%;"><span style="text-align: center;">action</span></th>
                    </tr>
                    </thead>
        
                    <tbody class="datatable-body ps">
                    <c:set var="num" value="0"/>
                   
                    <c:forEach items="${applyMemberList}" var="applyMemberList">
                     <c:if test="${applyMemberList.study_join_arciwf eq 105}">
                     
                      
                          <c:set var="num" value="${num+1}"/>
                          <tr data-row="${num}" class="datatable-row" style="left: 0px;">
                            <td class="datatable-cell" data-field=""
                                style="width: 5%;"><span>&nbsp;</span></td>
                
                            <td class="datatable-cell" data-field="Number"
                                aria-label="${num}" style="width: 5%;"><span>${num}</span>
                            </td>
                            <td class="datatable-cell" data-field="applyIdx"
                                aria-label="${applyMemberList.apply_idx}"
                                style="width: 10%;">
                              <span>${applyMemberList.apply_idx}</span>
                            </td>
                            <td class="datatable-cell" data-field="studyTeamName"
                                aria-label="${applyMemberList.recruitBoardDTO.teamname}"
                                style="width: 25%;">
                              <span>${applyMemberList.recruitBoardDTO.teamname}</span>
                            </td>
                
                            <td data-field="NickName"
                                aria-label="${applyMemberList.member_name}"
                                class="datatable-cell" style="width: 25%;"><span>
																		<img class="symbol symbol-40 symbol-sm flex-shrink-0"
                                         src="${applyMemberList.memberDTO.member_profile}" alt="photo"
                                         style="width: 10px; height: 10px;"><!--//TODO 크기안먹음 -->
																		${applyMemberList.member_name}
																</span></td>
                            <td class="datatable-cell" data-field="status"
                                onload="attr();"
                                aria-label="${applyMemberList.study_join_arciwf}"
                                style="width: 15%;"> <!--//TODO  RR_INCOMPLETE_CHUNKED_ENCODING 200-->
                              <span>${applyMemberList.study_join_arciwf}</span>
                            </td>
                            <td class="datatable-cell" data-field="action"
                                aria-label="action"
                                style="width: 15%;">
                              <span>승거승거</span>
                            </td>
                            
              
                          </tr>

                     
           </c:if>
                    </c:forEach>
                    <div class="ps__rail-x">
                      <div class="ps__thumb-x" tabindex="0"></div>
                    </div>
                    <div class="ps__rail-y">
                      <div class="ps__thumb-y" tabindex="0"></div>
                    </div>
                    </tbody>
                  </table>
    
                </div>
    
                <div class="datatable-pager datatable-paging-loaded">
                  <ul class="datatable-pager-nav my-2 mb-sm-0"></ul>
      
                  <div class="datatable-pager-info my-2 mb-sm-0">
                    <div class="dropdown bootstrap-select datatable-pager-size"
                         style="width: 60px;">
                      <select class="selectpicker datatable-pager-size"
                              title="Select page size" data-width="60px"
                              data-container="body" data-selected="5" id="pageSizePicker">
            
                        <option value="5">5</option>
                        <option value="10">10</option>
                        <option value="20">20</option>
                        <option value="30">30</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                      </select>
          
                      <div class="dropdown-menu ">
                        <div class="inner show" role="listbox" id="bs-select-10" tabindex="-1">
                          <ul class="dropdown-menu inner show" role="presentation"></ul>
                        </div>
                      </div>
                    </div>
                    <span class="datatable-pager-detail">Showing 11 - 15 of 1000</span>
                  </div>
                </div>
              
                <!--------------------------- 가입신청자명단 종료---------------------------->
                <!--end: Datatable-->
                
                
              </div>
            </div>
          </div>
        </div>
        <!--end::Modal-->
        <!---------------- 지혜:  신청자/멤버 명단 모달창 종료 -------------------->
        <!--contents.html Include-->
        <jsp:include page="/WEB-INF/commons/example.jsp"></jsp:include>
      </div>
      <!--컨테이너 종료-->
      <!--footer.html Include-->
      <jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</body>

<!----------------Body 종료----------------------->
<script type="text/javascript">
 
  
  // 페이징 처리하는 함수
  function pager() {
    let totalData; //총 데이터 수
    let dataPerPage; //한 페이지에 나타낼 글 수
    let pageCount =5; //페이징에 나타낼 페이지 수
    let globalCurrentPage ; //현재 페이지
    let currentPage = 1;

    
    dataPerPage = $(".selectpicker").val();
    console.log(dataPerPage);

    //총 road된 게시글 수
    totalData = $('.datatable-body').children().length;
    console.log(totalData);
    if (totalData === 0) {
      alert("해당 조건에 조회되는 데이터가 존재하지 않습니다.");
      $('.datatable-pager').hide(); // 숨김처리
    }

    displayData(1, dataPerPage); //1번째페이지, 한페이지에 나타낼 글 수=체크박스 val(기본-5)
    paging(totalData, dataPerPage, pageCount, 1);

    function paging(totalData, dataPerPage, pageCount, currentPage) {//총데이타, 체크박스 val, 페이징수(10), 현재페이지(1)
      currentPage = Number(currentPage);
      console.log("currentPage : " + currentPage);

      let curPageId =  currentPage>1?Math.round((currentPage/dataPerPage))+1:currentPage; // 현재 페이지 A tag ID
      
      totalPage = Math.floor((totalData / dataPerPage) + ((totalData % dataPerPage) > 0 ? 1 : 0)); //총 페이지 수
      // totalPage = Math.ceil(totalData/dataPerPage); // 총 페이지 수
      
      if (totalPage < pageCount) {
        pageCount = totalPage;
      }
      console.log("totalPage : " + totalPage);
       let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
     // let pageGroup = Math.ceil(curPageId/pageCount); // 페이지 그룹
      console.log("pageGroup : " + pageGroup);
      let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
      console.log("last : " + last);
      if (last > totalPage) {
        last = totalPage;
      }

      
      
      
      var first = last - (pageCount-1); //화면에 보여질 첫번째 페이지 번호
      if(first < 1) first = 1; // 첫페이지가 1보다 작을 경우 1로 세팅
      
      console.log("first : " + first);
      let next = last + 1;
      console.log("next : " + next);
      let prev = first - 1;
      console.log("prev : " + prev);
      let pageHtml = "";
      
  

      if (prev > 0) {
        currentPage = Number(currentPage);
        
        console.log("prev > 0 : ");
        pageHtml += `<li><a title="First" class="datatable-pager-link datatable-pager-link-first" data-page="1"><i class="flaticon2-fast-back"></i></a></li>
<li><a title="Previous" class="datatable-pager-link datatable-pager-link-prev" data-page="`+(currentPage-1)+`"><i class="flaticon2-back"></i></a></li>`;
      } else {
        console.log("prev >딘ㄷ 0 : ");
        pageHtml += `<li><a title="First" class="datatable-pager-link datatable-pager-link-first datatable-pager-link-disabled" data-page="1" disabled="disabled"><i class="flaticon2-fast-back"></i></a></li>
<li><a title="Previous" class="datatable-pager-link datatable-pager-link-prev datatable-pager-link-disabled" data-page="1" disabled="disabled"><i class="flaticon2-back"></i></a></li>`;
      }
    
      //페이징 번호 표시
      for (var i = first; i <= last; i++) {
       
        if (currentPage == i) {
          pageHtml += `<li><a class="datatable-pager-link datatable-pager-link-number datatable-pager-link-active" data-page="`+i+`"
                           title="`+i+`">`+i+`</a></li>`
        } else {
          pageHtml += `<li><a class="datatable-pager-link datatable-pager-link-number" data-page="`+i+`"
                           title="`+i+`">`+i+`</a></li>`;
        }
      }

      if (next < totalPage) {
        pageHtml += `<li><a title="Next" class="datatable-pager-link datatable-pager-link-next"
                           data-page="`+(currentPage+1)+`"><i class="flaticon2-next"></i></a></li>`;
      } else {
        pageHtml += `<li><a title="Next" class="datatable-pager-link datatable-pager-link-next datatable-pager-link-disabled"  data-page="`+(currentPage+1)+`" disabled="disabled"><i class="flaticon2-next"></i></a></li>`
      }
      if (last < totalPage) {
        pageHtml += `<li><a title="Last" class="datatable-pager-link datatable-pager-link-last"
                           data-page="`+totalPage+`"><i class="flaticon2-fast-next"></i></a></li>`;
      } else {
        pageHtml += `<li><a title="Last" class="datatable-pager-link datatable-pager-link-last datatable-pager-link-disabled" data-page="`+totalPage+`" disabled="disabled"><i class="flaticon2-fast-next"></i></a></li>`
      }
      
      console.log($(".datatable-pager.datatable-paging-loaded"));
      
      $(".datatable-pager-nav.my-2.mb-sm-0").html(pageHtml);
      let displayCount = "";
      
      //페이징 번호 클릭 이벤트
      $(".datatable-pager.datatable-paging-loaded ul li a").click(function () {
        let $id = $(this).attr("data-page");
        console.log(`$(this).attr("data-page") =` + $id);
        selectedPage = $(this).attr("data-page");
        console.log("여기까지왔니");
        
        // if ($id == "next") selectedPage = next;
        // if ($id == "prev") selectedPage = prev;
        //전역변수에 선택한 페이지 번호를 담는다...
        globalCurrentPage = selectedPage;
        //페이징 표시 재호출
        paging(totalData, dataPerPage, pageCount, globalCurrentPage);
        //글 목록 표시 재호출
        displayData(globalCurrentPage, dataPerPage);
      });
    }
    
    

    //현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
    function displayData(currentPage, dataPerPage) {
//기본 셋팅에서-> 숫자로 값 변동이 일어난다면 내용 숨기고 몇번째~몇번째 display만 변경하는 형식,
      let chartHtml = "";
      $('.datatable-body .datatable-row').attr('style', ('display:none'));
      // $('tr[data-row="' +i+ '"]').attr('style', ('display:none'));
//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림..
      currentPage = Number(currentPage);
      dataPerPage = Number(dataPerPage);
      
      for (
          var i = ((currentPage) - 1)* dataPerPage + 1;
          i <= (currentPage - 1) * dataPerPage + dataPerPage;
          i++
      ) {
        $('tr[data-row="' +i+ '"]').attr('style', ('display:""'));

      }
    }



    $('#pageSizePicker').change(function () {
      let pageSizePickerValue = $("#pageSizePicker option:selected").val();
      console.log("pageSizePickerValue: " +pageSizePickerValue);
      //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경
      paging(totalData, pageSizePickerValue, pageCount, currentPage);
      displayData(currentPage, pageSizePickerValue);
    });
  };
  

  
</script>
</html>

