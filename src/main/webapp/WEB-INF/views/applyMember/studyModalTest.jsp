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
  <style>


    ul {
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

    li {
      padding: 1em;
    }

    a[disabled="disabled"] {
      /*pointer-events: none;*/

    }

    /* modal scroll*/
    .modal-dialog {
      overflow-y: initial !important
    }

    .modal-body {
      height: 100%;
      overflow-y: auto;
    }


    /*---------- 모달 ----------*/

    .modal-dialog.modal-80size {
      width: 90%;
      height: 90%;
      margin: 0;
      padding: 0;
    }

    .modal-content.modal-80size {
      height: auto;
      min-height: 90%;
    }

    .modal.modal-center {
      text-align: center;
    }

    @media screen and (min-width: 768px) {
      .modal.modal-center:before {
        display: inline-block;
        vertical-align: middle;
        content: " ";
        height: 100%;
      }
    }

    .modal-dialog.modal-center {
      display: inline-block;
      text-align: left;
      vertical-align: middle;
    }

    /*---------- 모달 end ----------*/
  
  
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
           onclick="start.callAjax('NA', '9002');">멤버확인</a>
        
        
        <div id="memberListModal" class="modal modal-center fade" role="dialog"
        
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

  // 페이지 진입시 리스트 세팅
  $(document).ready(function () {
    // start.init();
    set();

  }); // ready

  function set() {
    let putListModalHtml =
            `<div class="modal-dialog modal-center modal-80size">
            <div class="modal-content modal-80size" style="min-height: 400px;width:700px; ">
              <div class="modal-header py-5" id="studyMemberTab">
                <div id="btnMemberList" class="btn btn-success btn-lg btn-block"
                onclick="start.callAjax('NA', '9002');">
                <h5 class="modal-title">
                  스터디 멤버 <span class="d-block text-muted font-size-sm">
											스터디 멤버를 확인해보세요!</span>
                </h5></div>
                <div id="btnApplyMemberList" class="btn btn-primary btn-lg btn-block"
                    onclick="start.callAjax('YA', '9002');" style="margin-top: 0px;" ><h5 class="modal-title">
                  참여 신청자<span class="d-block text-muted font-size-sm">
                  가입신청한 회원을 확인해보세요!</span>
                </h5></div>
                
                
               
              </div>
             <div class="modal-body pt-1">

    
              </div>
            </div>
          </div>`
    $('#memberListModal').html(putListModalHtml);
  }

  let start = {
// style="visibility: hidden;"
    // 백단으로 db 달라 요청
    callAjax: function (applyType, rId) {
      <%--"${member.member_name}";--%>
      let param = new Object();
      param.memName = 'admin';
      param.applyType = applyType;
      param.rId = rId; //TODO 스터디 번호 설정

      $.ajax({
               type       : 'POST',
               url        : '/applyMemberRest/applyList',
               data       : JSON.stringify(param), // 로그인 정보와 검색값 담아서 출발
               dataType   : 'json', // 받을 데이터는 json
               contentType: "application/json; charset=utf-8",
               success    : successCallback,
               error      : errorCallback
             });

      // 성공시 데이터 처리
      function successCallback(data) {

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
          if (applyType == "YA") {
            start.setListApplyMem(data);  // 참여신청자 명단조회
          } else {
            start.setListStudyMem(data); // 스터디 멤버원 명단 조회
          } // if-else
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

    // 참여신청자 명단 뷰 셋팅 !
    setListApplyMem: function (data) {
      console.log(data.list);
      /*
      apply_idx: "9213"
      attendance_days: 17
      member_name: "nickname9193"
      member_profile: "https://tistory3.daumcdn.net/tistory/1506548/attach/c1ddffa044eb4d1786ae6f5445392603"
      r_idx: 9003
      study_boss_yn: "n"
      study_join_arciwf: "a"
      study_join_change_date: null
      teamname: "팀이름 9003"
      type_pc: "c"
      * */
      console.log("setListApplyMem 셋팅창 떴어유~");

      // 테이블 동적생성을 위해 불러온 data를 각 변수에 담아 활용
      let apply_idx = '';
      let r_idx = '';
      let member_name = '';
      let study_join_arciwf = '';
      let study_join_change_date = '';
      let study_boss_yn = '';
      let attendance_days = '';
      let teamname = '';
      let type_pc = '';
      let member_profile = '';

      // 기본 템플릿 셋팅
      let aHtml =

              `<!--begin: Datatable-->
        <div class="datatable datatable-bordered datatable-head-custom
                  datatable-default datatable-primary datatable-scroll datatable-loaded"
            id="applyMemberList" style="display:block;">
          <table class="datatable-table"
                 style="display: block; min-height: 300px; ">
            
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
            
            <tbody class="datatable-body ps" id="aMemTBody">
              <!-- 대기a97, 거절r72, 취소c99, 가입중i105, 탈퇴w119, 실패(결제x)f114 -->
              
            </tbody>
          </table>
        
        </div>
        <div id="s-dtbl-pager" style="padding-left: 230px;"  class="datatable-pager datatable-paging-loaded">
        </div>`;

      $('.modal-body').html(aHtml);

      aHtml = '';

      for (let i = 0; i < data.list.length; i++) {

        apply_idx = data.list[i].apply_idx;
        r_idx = data.list[i].r_idx;
        member_name = data.list[i].member_name;
        study_join_arciwf = data.list[i].study_join_arciwf;
        study_join_change_date = data.list[i].study_join_change_date;
        study_boss_yn = data.list[i].study_boss_yn;
        attendance_days = data.list[i].attendance_days;
        teamname = data.list[i].teamname;
        type_pc = data.list[i].type_pc;
        member_profile = data.list[i].member_profile;

        aHtml +=
            `
            <tr data-row="` + (i + 1) + `" class="datatable-row">
  
            <td class="datatable-cell" data-field="Number"
                aria-label="` + (i + 1) + `" style="width: 5%;"><span style="text-align: center;">`
            + (i + 1) + `</span>
            </td>
            <td class="datatable-cell" data-field="applyIdx"
                aria-label="` + apply_idx + `"
                                style=" width: 15%;">
            <span style="text-align: center;">` + apply_idx + `</span>
            </td>
            <td class="datatable-cell" data-field="studyTeamName"
                aria-label="` + teamname + `"
                style="width: 25%;">
              <span style="text-align: center;">` + teamname + `</span>
            </td>
            
            <td data-field="NickName"
                aria-label="` + member_name + `"
                class="datatable-cell" style="width: 25%;">
            <span style="text-align: center;">
          <img class="symbol symbol-40 symbol-sm flex-shrink-0"
               src="` + member_profile + `"
               alt="photo"
               style="width: 10px; height: 10px;"><!--//TODO 크기안먹음 -->
          ` + member_name + `
           </span></td>
            
            <td class="datatable-cell" data-field="action"
                aria-label="action"
                style="width: 20%; text-align: center;">
              <a href="javascript:void(0);" data-value="re"
                 onclick="applyAction('` + apply_idx + `','` + type_pc + `','approval', ` + r_idx
            + `);"
                 class="btn btn-light-success font-weight-bold mr-2">승인</a>
              <!--//TODO 밸류값에 스터디 타입 엮어서 챌린지면 'approval->challenge'  -->
              <a href="javascript:void(0);" data-value="re"
                 onclick="applyAction('` + apply_idx + `','` + type_pc + `','refusal', ` + r_idx + `);"
                 class="btn btn-light-warning font-weight-bold mr-2">거부</a>
            </td>
          </tr>
            `;

      } // for

      $('#aMemTBody').html(aHtml);

      pager(data);

      console.log("탄다탄다?")

    }, // setApplyMem

    // 멤버 명단 뷰 셋팅 !
    setListStudyMem: function (data) {
      console.log(data.list);
      /*
      apply_idx: "9213"
      attendance_days: 17
      member_name: "nickname9193"
      member_profile: "https://tistory3.daumcdn.net/tistory/1506548/attach/c1ddffa044eb4d1786ae6f5445392603"
      r_idx: 9003
      study_boss_yn: "n"
      study_join_arciwf: "a"
      study_join_change_date: null
      teamname: "팀이름 9003"
      type_pc: "c"
      * */
      console.log("setListStudyMem 셋팅창 떴어유~");

      // 테이블 동적생성을 위해 불러온 data를 각 변수에 담아 활용
      let apply_idx = '';
      let r_idx = '';
      let member_name = '';
      let study_join_arciwf = '';
      let study_join_change_date = '';
      let study_boss_yn = '';
      let attendance_days = '';
      let teamname = '';
      let type_pc = '';
      let member_profile = '';

      // 기본 템플릿 셋팅
      let aHtml =

              `<!--begin: Datatable-->
        <div class="datatable datatable-bordered datatable-head-custom
        datatable-default datatable-primary datatable-scroll datatable-loaded"
        id="studyMemberList">
      <table class="datatable-table"
             style="display: block; min-height: 300px; max-height: 400px;">
        
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
        
        <tbody class="datatable-body ps" id="sMemberTbody">
              <!-- 대기a97, 거절r72, 취소c99, 가입중i105, 탈퇴w119, 실패(결제x)f114 -->
              
            </tbody>
          </table>
        
        </div>
        <div id="s-dtbl-pager" style="padding-left: 230px;" class="datatable-pager datatable-paging-loaded">
        </div>`;

      $('.modal-body').html(aHtml);

      aHtml = '';

      for (let i = 0; i < data.list.length; i++) {

        apply_idx = data.list[i].apply_idx;
        r_idx = data.list[i].r_idx;
        member_name = data.list[i].member_name;
        study_join_arciwf = data.list[i].study_join_arciwf;
        study_join_change_date = data.list[i].study_join_change_date;
        study_boss_yn = data.list[i].study_boss_yn;
        attendance_days = data.list[i].attendance_days;
        teamname = data.list[i].teamname;
        type_pc = data.list[i].type_pc;
        member_profile = data.list[i].member_profile;

        aHtml +=
            `
            <tr data-row="` + (i + 1) + `" class="datatable-row" style="left: 0px;">
            <td class="datatable-cell" data-field=""
                style="width: 5%;"><span>&nbsp;</span></td>
            
            <td class="datatable-cell" data-field="Number"
                aria-label="` + (i + 1) + `" style="width: 10%;padding: 0px 45px 0px 16px;"><span>`
            + (i + 1) + `</span>
            </td>
            
            <td class="datatable-cell" data-field="studyTeamName"
                aria-label="` + teamname + `"
                style="width: 45%;padding-right:45px;">
              <span>` + teamname + `</span>
            </td>
            
            
            <td data-field="NickName"
                aria-label="` + member_name + `"
                class="datatable-cell" style="width: 40%;"><span>
                    <img class="symbol symbol-40 symbol-sm flex-shrink-0"
                         src="` + member_profile + `" alt="photo"
                         style="width: 10px; height: 10px;"><!--//TODO 크기안먹음 -->
                    ` + member_name + `
                </span></td>
          </tr>
          
            `;

      } // for

      $('#sMemberTbody').html(aHtml);

      pager(data);

      console.log("sMemberTbody?")

    } // setListItem
  } // start



</script>

<script>
  // pager

  /* 페이징 처리하는 함수
 *  작성자: 신지혜
 */
  function pager(data) {
    //-------------- pager --------------//
    let totalData = data.list.length; //총 데이터 수
    let dataPerPage = 5; //한 페이지에 나타낼 글 수
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
      Swal.fire('조회되는 데이터가 없습니다. \n확인 후 이용해주세요!', '', 'warning')

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
        console.log('tlqotlqk');
        $pageHtml +=
            `<li><a title="Next"
                    class="datatable-pager-link datatable-pager-link-next"
                    data-page="` + (currentPage + 1) + `">
                      <i class="flaticon2-next"></i></a></li>`;
      } else { // 내 페이지가 맨 끝이라면 이후 버튼 비활성화
        console.log('tlq444444444444444otlqk');

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
        // $('tr').removeClass("datatable-row-subtable-expanded");
        // $('tr[class="datatable-row-subtable"]').css('display', 'none');

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
      $('.datatable-body tr').css('display', 'none');

      //Number로 변환하지 않으면 아래에서 +를 할 경우 연산 아닌 결합됨!
      currentPage = Number(currentPage);
      dataPerPage = Number(dataPerPage);

      for (
          var i = ((currentPage) - 1) * dataPerPage + 1;
          i <= (currentPage - 1) * dataPerPage + dataPerPage;
          i++
      ) {
        $('tr[data-row="' + i + '"]').css('display', 'block');
      } // for

    } // displayData

  }


</script>

<script>

  /* 회원의 스터디 참여 상태 정보를 변경하는 함수
   가입신청 [거절, 승인, 취소] , [탈퇴],
매개변수: 참여번호, 변경하려는 action(거절, 승인, 탈퇴)
작성자 : 신지혜
*/

  function applyAction(apply_idx, study_type, action, rId) {

    actionName =
        action == 'refusal' ? '가입신청 거절' :
        action == 'approval' ? '가입신청 승인' :
        action == 'cancle' ? '가입신청 취소' :
        '해당 스터디에서 탈퇴';

    Swal.fire({
                title            : actionName,
                text             : actionName + '하시겠습니까?',
                showDenyButton   : true,
                showCancelButton : true,
                confirmButtonText: '예',
                denyButtonText   : `아니오`,
              }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        callAjax();
      } else if (result.isDenied) {
        Swal.fire('다음에 꼭 함께해요!', '', 'info')
      }
    })

    function callAjax() {

      var submitObj = new Object();
      submitObj.apply_idx = apply_idx;
      submitObj.study_type = study_type;
      submitObj.action = action;

      console.log("JSON.stringify(submitObj): " + JSON.stringify(submitObj));

      $.ajax({
               url        : "/applyMemberRest/apply_action",
               type       : "POST",
               contentType: "application/json;charset=UTF-8",
               data       : JSON.stringify(submitObj), // 예약번호 들고 출발
               dataType   : 'text', // 받을 데이터는 json
               success    : successCallback,
               error      : errorCallback
             });

      // 성공시 데이터 처리
      function successCallback(data) {
        console.log("data: " + data);

        Swal.fire(actionName + ' 처리 되었습니다!', '', 'success')

        start.callAjax('YA', rId);

      } // successCallback

      // 실패
      function errorCallback() {
        Swal.fire(actionName + ' 실패하였습니다!', '', 'warning')
        start.callAjax('YA', rId);
      } // errorCallback
    } // callAjax

  }


</script>
</html>

