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
           data-toggle="modal" data-target="#memberListModal"
           onclick="x();pager('${applyMemberList}');">멤버확인</a>
        
        <div id="memberListModal" class="modal fade" role="dialog"
             aria-hidden="true">
        
        
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
  // TODO 승인되고난 후 해당 버튼 비활성화(처리 중이라는 것을 확인시키기위한 view 작업 필요함)
  function x() { // TODO 멤버 확인버튼 누를때 스터디번호, 개설자여부 받아와야함! 민주, 예솔 작업시 버튼에 값 매칭하기
    let putListModalHtml = '';
    putListModalHtml +=
        `<div class="modal-dialog modal-xl">
            <div class="modal-content" style="min-height: 590px;">
              <div class="modal-header py-5" id="studyMemberTab">
                <div id="btnMemberList" class="btn btn-success btn-lg btn-block" onclick="studyMemberListOn();"><h5 class="modal-title">
                  스터디 멤버 <span class="d-block text-muted font-size-sm">
											스터디 멤버를 확인해보세요!</span>
                </h5></div>
                <div id="btnApplyMemberList" class="btn btn-primary btn-lg btn-block"  onclick="applyMemberListOn();" style="display:none;"><h5 class="modal-title">
                  참여 신청자<span class="d-block text-muted font-size-sm">
                  가입신청한 회원을 확인해보세요!</span>
                </h5></div>
                
                
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close" style="width: 10%;">
                  <i aria-hidden="true" class="ki ki-close"></i>
                </button>
              </div>
             <div class="modal-body">
>
    
              </div>
            </div>
          </div>`
    $('#memberListModal').html(putListModalHtml);

    let putBodyHtml = '';
    putBodyHtml +=
        `<div class="mb-5">
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
            </div>
          </div>
          <div class="col-lg-3 col-xl-4 mt-5 mt-lg-0">
            <a href="#"
               class="btn btn-light-primary px-6 font-weight-bold">Search</a>
          </div>
        </div>
      </div>`

    // 일반 회원이라면
    putBodyHtml +=

        `<div class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-scroll datatable-loaded"
        id="studyMemberList">
      <table class="datatable-table"
             style="display: block; min-height: 400px; max-height: 400px;">
        
        <thead class="datatable-head">
        <tr class="datatable-row" style="left: 0px;">
          <th data-field=""
              class="datatable-cell datatable-cell-sort"
              style="width: 5%; text-align: center;"><span>&nbsp;</span></th>
          
          <th data-field="Number"
              class="datatable-cell datatable-cell-sort"
              style="width: 10%;"><span>#</span></th>
          
          <th data-field="studyTeamName"
              class="datatable-cell datatable-cell-sort"
              style="width: 45%;"><span style="text-align: center;">study&nbsp;Team&nbsp;Name</span>
          </th>
          
          <th data-field="NickName"
              class="datatable-cell datatable-cell-sort"
              style="width: 40%;"><span style="text-align: center;">NickName</span></th>
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
                    aria-label="${num}" style="width: 10%;"><span>${num}</span>
                </td>
                
                <td class="datatable-cell" data-field="studyTeamName"
                    aria-label="${applyMemberList.teamname}"
                    style="width: 45%;">
                  <span>${applyMemberList.teamname}</span>
                </td>
                
                
                <td data-field="NickName"
                    aria-label="${applyMemberList.member_name}"
                    class="datatable-cell" style="width: 40%;"><span>
                        <img class="symbol symbol-40 symbol-sm flex-shrink-0"
                             src="${applyMemberList.member_profile}" alt="photo"
                             style="width: 10px; height: 10px;"><!--//TODO 크기안먹음 -->
                        ${applyMemberList.member_name}
                    </span></td>
              </tr>
          
          </c:if>
        </c:forEach>
        <div class="ps__rail-x"><div class="ps__thumb-x" tabindex="0"></div></div>
        <div class="ps__rail-y"><div class="ps__thumb-y" tabindex="0"></div></div>
        </tbody>
      </table>
    
    </div>
    
    <div id="s-dtbl-pager" class="datatable-pager datatable-paging-loaded">
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

          <div class="dropdown-menu">
            <div class="inner show" role="listbox" id="bs-select-10" tabindex="-1">
              <ul class="dropdown-menu inner show" role="presentation"></ul>
            </div>
          </div>
        </div>
      </div>
    </div>`

    if (1 == 1) {     // TODO 개설자라면
                      // 참여신청자 버튼이 보이도록
      $("#btnApplyMemberList").attr('style', ('display:""'));
      putBodyHtml +=
          `<!--begin: Datatable-->
        <div
            class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-scroll datatable-loaded"
            id="applyMemberList" style="display:none;">
          <table class="datatable-table"
                 style="display: block; min-height: 400px; max-height: 400px;">
            
            <thead class="datatable-head">
            <tr class="datatable-row" style="left: 0px;">
           
              
              <th data-field="number"
                  class="datatable-cell datatable-cell-sort"
                  style="width: 5%;"><span style="text-align: center;">#</span></th>
              <th data-field="applyIdx"
                  class="datatable-cell datatable-cell-sort"
                  style="width: 15%;"><span style="text-align: center;">apply idx</span></th>
              <th data-field="studyTeamName"
                  class="datatable-cell datatable-cell-sort"
                  style="width: 25%;"><span
                  style="text-align: center;">study Team Name</span></th>
              
              <th data-field="nickName"
                  class="datatable-cell datatable-cell-sort"
                  style="width: 25%;"><span style="text-align: center;">NickName</span></th>
              
              
              <th data-field="action"
                  class="datatable-cell datatable-cell-sort"
                  style="width: 20%;"><span style="text-align: center;">action</span></th>
            </tr>
            </thead>
            
            <tbody class="datatable-body ps">
            <c:set var="num" value="0"/>
            
            <c:forEach items="${applyMemberList}" var="applyMemberList">
              <!-- 대기a97, 거절r72, 취소c99, 가입중i105, 탈퇴w119, 실패(결제x)f114 -->
              <c:if test="${applyMemberList.study_join_arciwf eq 97}">
                
                
                <c:set var="num" value="${num+1}"/>
                <tr data-row="${num}" class="datatable-row" style="left: 0px;">
                  
                  <td class="datatable-cell" data-field="Number"
                      aria-label="${num}" style="width: 5%;"><span style="text-align: center;">${num}</span>
                  </td>
                  <td class="datatable-cell" data-field="applyIdx"
                      aria-label="${applyMemberList.apply_idx}"
                      style="width: 15%;">
                    <span style="text-align: center;">${applyMemberList.apply_idx}</span>
                  </td>
                  <td class="datatable-cell" data-field="studyTeamName"
                      aria-label="${applyMemberList.teamname}"
                      style="width: 25%;">
                    <span style="text-align: center;">${applyMemberList.teamname}</span>
                  </td>
                  
                  <td data-field="NickName"
                      aria-label="${applyMemberList.member_name}"
                      class="datatable-cell" style="width: 25%;"><span style="text-align: center;">
                            <img class="symbol symbol-40 symbol-sm flex-shrink-0"
                                 src="${applyMemberList.member_profile}"
                                 alt="photo"
                                 style="width: 10px; height: 10px;"><!--//TODO 크기안먹음 -->
                            ${applyMemberList.member_name}
                        </span></td>
                  
                  <td class="datatable-cell" data-field="action"
                      aria-label="action"
                      style="width: 20%; text-align: center;">
                    <a href="javascript:void(0);" data-value="re"
                         onclick="applyAction('${applyMemberList.apply_idx}','${applyMemberList.type_pc}','approval');"
                         class="btn btn-light-success font-weight-bold mr-2">승인</a><!--//TODO 밸류값에 스터디 타입 엮어서 챌린지면 'approval->challenge'  -->
                    <a href="javascript:void(0);" data-value="re"
                       onclick="applyAction('${applyMemberList.apply_idx}','${applyMemberList.type_pc}','refusal');"
                       class="btn btn-light-warning font-weight-bold mr-2">거부</a>
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
   
        <div id="a-dtbl-pager" class="datatable-pager datatable-paging-loaded" style="display:none;">
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

              <div class="dropdown-menu">
                <div class="inner show" role="listbox" id="bs-select-10" tabindex="-1">
                  <ul class="dropdown-menu inner show" role="presentation"></ul>
                </div>
              </div>
            </div>
          </div>
        </div>`

    } // if-else

//TODO 페이지 드롭다운 왜 안나올까낭~

    $('.modal-body').html(putBodyHtml);
  }

  // 멤버목록 버튼 클릭시에 리스트가 보였다 안보였다 toggle

  // TODO 페이징 공유되는 에러 잡기~~

  // TODO  함수 2가지 부트스트랩화 (addCalss)
  /* 스터디버튼 누르면 스터디목록 활성화 / 참여자목록 비활성화
   * 매개변수 : 없음. 해당 버튼에 인라인으로 onclick event 부여
   * 작성자 : 신지혜
   */
  function studyMemberListOn() { // 스터디버튼 누르면 스터디목록 활성화 / 참여자목록 비활성화
    console.log("studyMemberListOn 클릭했니");
    $("#applyMemberList").attr('style', ('display:none'));
    $("#a-dtbl-pager").attr('style', ('display:none'));
    $("#studyMemberList").attr('style', ('display:""'));
    $("#s-dtbl-pager").attr('style', ('display:""'));

  } // studyMemberListOn

  /* 스터디버튼 누르면 스터디목록 활성화 / 참여자목록 비활성화
   * 매개변수 : 없음. 해당 버튼에 인라인으로 onclick event 부여
   * 작성자 : 신지혜
   */
  function applyMemberListOn() { // 참여자 누르면 참여자목록 활성화 / 스터디목록 비활성화
    console.log("applyMemberListOn 클릭했니");
    $("#studyMemberList").attr('style', ('display:none'));
    $("#s-dtbl-pager").attr('style', ('display:none'));
    $("#applyMemberList").attr('style', ('display:""'));
    $("#a-dtbl-pager").attr('style', ('display:""'));

  } // applyMemberListOn

  /* 회원의 스터디 참여 상태 정보를 변경하는 함수
     가입신청 [거절, 승인, 취소] , [탈퇴],
  매개변수: 참여번호, 변경하려는 action(거절, 승인, 탈퇴)
  작성자 : 신지혜
  */
  function applyAction(apply_idx, study_type, action) {
    actionName =
        action == 'refusal' ? '가입신청 거절' :
        action == 'approval' ? '가입신청 승인' :
        action == 'cancle' ? '가입신청 취소' :
        '해당 스터디에서 탈퇴';
    if (!confirm(actionName + " 하시겠습니까?")) {
      return false;

    } // if

    var submitObj = new Object();
    submitObj.apply_idx = apply_idx;
    submitObj.study_type = study_type;
    submitObj.action = action;

    console.log("JSON.stringify(submitObj): " + JSON.stringify(submitObj));

    // 받은 action과 참여번호를 json 객체로 /apply_action 전송하여 db update!!
    $.ajax({
             url        : "/applyMemberRest/apply_action",
             type       : "POST",
             contentType: "application/json;charset=UTF-8",
             data       : JSON.stringify(submitObj),
             dataType   : "text",
             error      : function (request, status, error) {
               console.log(
                   "code:" + request.status + "\n" + "message:" + request.responseText + "\n"
                   + "error:" + error);
             }

           })
     .fail(function (e) { //
       alert(actionName + " 실패하였습니다.");
       console.log("data: "+ data);

     })
     .done(function () {
       alert(actionName + " 처리 되었습니다.");
       console.log("data: "+ data);
     })

    //TODO 완료시에 화면 다시 뿌려주기(필수)
  } // end fn_refusal





  /* 페이징 처리하는 함수
  *  작성자: 신지혜
  */
  function pager(data) {
    let totalData = data.length; //총 데이터 수
    let dataPerPage; //한 페이지에 나타낼 글 수
    let pageCount = 5; //페이징에 나타낼 페이지 수
    let globalCurrentPage; //현재 페이지
    let currentPage = 1;

    dataPerPage = $(".selectpicker").val();
    console.log(dataPerPage);

    //총 road된 게시글 수
    totalData = $('.datatable-body').children().length;
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
      let pageHtml = "";

      // 이전, 처음으로 가기
      if (prev > 0) { // 이전, 처음으로 갈 수 있다면 이전, 처음버튼 활성화
        currentPage = Number(currentPage);
        console.log("prev > 0 : ");
        pageHtml +=
            `<li><a title="First"
                    class="datatable-pager-link datatable-pager-link-first"
                    data-page="1">
                      <i class="flaticon2-fast-back"></i></a></li>
             <li><a title="Previous"
                    class="datatable-pager-link datatable-pager-link-prev"
                    data-page="` + (currentPage - 1) + `">
                      <i class="flaticon2-back"></i></a></li>`;
      } else { // 현재 페이지가 첫번째 페이지라면 이전, 처음버튼 비활성화
        pageHtml +=
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
          pageHtml += `
            <li><a class="datatable-pager-link datatable-pager-link-number
                          datatable-pager-link-active"
                   data-page="` + i + `"
                   title="` + i + `">` + i + `</a></li>`
        } else { // 아닌 페이지 번호는 하얗게
          pageHtml +=
              `<li><a class="datatable-pager-link datatable-pager-link-number"
                      data-page="` + i + `"
                      title="` + i + `">` + i + `</a></li>`;
        } // if-else
      } // for

      // 이후, 맨 뒤로 가기
      if (next < totalPage) { // 이후로 갈 수 있다면(=내 페이지가 맨 끝이 아니라면) 이후 버튼 활성화
        pageHtml +=
            `<li><a title="Next"
                    class="datatable-pager-link datatable-pager-link-next"
                    data-page="` + (currentPage + 1) + `">
                      <i class="flaticon2-next"></i></a></li>`;
      } else { // 내 페이지가 맨 끝이라면 이후 버튼 비활성화
        pageHtml +=
            `<li><a title="Next"
                    class="datatable-pager-link datatable-pager-link-next datatable-pager-link-disabled"
                    data-page="` + (currentPage + 1) + `"
                    disabled="disabled">
                      <i class="flaticon2-next"></i></a></li>`
      } // if-else
      if (last < totalPage) { // 내 페이지가 맨 끝이 아니라면 마지막으로 가기 버튼 활성화
        pageHtml +=
            `<li><a title="Last"
                    class="datatable-pager-link datatable-pager-link-last"
                    data-page="` + totalPage + `">
                      <i class="flaticon2-fast-next"></i></a></li>`;
      } else { // 내 페이지가 마지막이라면 마지막으로 가기 버튼 비활성화
        pageHtml +=
            `<li><a title="Last"
                    class="datatable-pager-link datatable-pager-link-last
                           datatable-pager-link-disabled"
                    data-page="` + totalPage + `"
                    disabled="disabled">
                    <i class="flaticon2-fast-next"></i></a></li>`
      } // ir-else

      console.log($(".datatable-pager.datatable-paging-loaded"));

      // 페이징 번호 그리기
      $(".datatable-pager-nav.my-2.mb-sm-0").html(pageHtml);

      //페이징 번호 클릭 이벤트
      $(".datatable-pager.datatable-paging-loaded ul li a").click(function () {
        //전역변수에 선택한 페이지 번호를 담아서
        globalCurrentPage = $(this).attr("data-page");

        //페이징 표시 재호출
        paging(totalData, dataPerPage, pageCount, globalCurrentPage);

        //글 목록 표시 재호출
        displayData(globalCurrentPage, dataPerPage);
      }); // click-fn
    } // pager()

    // 페이지 사이즈 드롭다운 선택하면 화면단에서 적용하여 출력하는 함수
    $('#pageSizePicker').change(function () {
      let pageSizePickerValue = $("#pageSizePicker option:selected").val();
      console.log("pageSizePickerValue: " + pageSizePickerValue);

      //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경
      paging(totalData, pageSizePickerValue, pageCount, currentPage);
      displayData(currentPage, pageSizePickerValue);
    }); // change-fn
  }

  //현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
  function displayData(currentPage, dataPerPage) {
//기본 셋팅에서-> 숫자로 값 변동이 일어난다면 내용 숨기고 몇번째~몇번째 display만 변경하는 형식,
    let chartHtml = "";
    $('.datatable-body .datatable-row').attr('style', ('display:none'));

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
  } // displayData()

</script>
</html>

