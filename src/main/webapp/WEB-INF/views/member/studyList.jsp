<%-- Created by IntelliJ IDEA. User: bitcamp Date: 2021-11-09 Time: 오후 3:45 To change this template use File | Settings
   | File Templates. --%>
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
  <title>가입한 스터디 목록</title>
  <!--head.html Include-->
  <jsp:include page="/WEB-INF/commons/head.jsp"/>

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

</head>
<!----------------Head 종료----------------------->

<!----------------Body 시작----------------------->
<body id="kt_body" class="header-fixed subheader-enabled page-loading">
<!----------------메인 시작----------------------->
<div class="d-flex flex-column flex-root">
  <!----------------페이지 시작----------------------->
  <form action="/manager/study/list" id="actionForm" method="get">
    <input type="hidden" name="member" value="${member}"/>
    <input type="hidden" name="member_name" value="${member.member_name}"/>
    <input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum}"/>
    <input type="hidden" name="amount" value="${pageMaker.criteria.amount}"/>

    <div class="d-flex flex-row flex-column-fluid page">
      <!--begin::Wrapper ↓여기 매칭되는 div 태그부터 안닫아도 됨(footer에 있음>3개)-->
      <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
        <!--header.html Include-->
        <jsp:include page="/WEB-INF/commons/header.jsp"/>
        <!------------------Header Wrapper : 메뉴 탭 시작------------------>
        <!--menu.html Include-->
        <jsp:include page="/WEB-INF/views/member/menu_mypage.jsp"/>
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
                  <h5 class="text-dark font-weight-bolder mt-2 mb-2 mr-5">내 정보</h5>
                  <!--end::Title-->
                  <!--Breadcrumb : 로드맵 시작-->
                  <ul
                    class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                    <li class="breadcrumb-item">
                      <a href="/manager/member/list" class="text-muted">회원정보</a>
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
                <div
                  class="card-header flex-wrap justify-content-end zindex-1 border-0 pt-6 mb-n16">
                  <!--begin::Search Form 검색-->
                  <div class="d-flex align-items-start">
                    <form class="ml-5">
                      <div class="input-group input-group-sm input-group-solid align-self-center">
                        <input type="text" class="form-control" name="keyword"
                               placeholder="Search..."/>
                        <div id="searchBtn" class="input-group-append">
									                <span class="input-group-text">
									                    <i class="flaticon2-search-1 icon-sm"></i>
									                </span>
                        </div>
                      </div>
                    </form>
                    <div class="align-self-center">
                      <a href="" onclick="submitConfirm()">
                        <i class="fas fa-sync-alt icon-lg text-hover-ssff-orange mx-2"></i>
                      </a>
                    </div>
                  </div>
                  <!--end::Search Form-->
                </div>
                <!--end::Header-->
                <!--begin::Body-->
                <div class="card-body">
                  <!--begin::Card 카테고리 항목 접기 시작-->
                  <%------ 모집글 -------%>
                  <div id="filter_1">
                    <h6 class="font-weight-bolder text-ssff2 mb-2">스터디 타입</h6>
                    <ul class="list-inline checklist" aria-required="true">
                      <li class="d-inline-flex">
                                                <span class="mr-2 w-20px">
                                                    <label
                                                      class="checkbox checkbox-single checkbox-all mr-4">
                                                        <input name="chk" id="all" type="checkbox"
                                                               value="전체"
                                                               checked>&nbsp;<span></span>
                                                    </label>
                                                </span>
                        전체
                      </li>

                      <li class="d-inline-flex">
                                            <span class="mr-2 w-20px">
                                               <label class="checkbox checkbox-single">
                                                  <input name="chk" type="checkbox"
                                                         value="P">&nbsp;<span></span>
                                               </label>
                                            </span>
                        <span class="label label-lg label-inline mb-0 bg-ssff1">
                                                                프로젝트
												</span>
                      </li>

                      <li class="d-inline-flex">
                                            <span class="mr-2 w-20px">
                                               <label class="checkbox checkbox-single">
                                                  <input name="chk" type="checkbox"
                                                         value="C">&nbsp;<span></span>
                                               </label>
                                            </span>
                        <span class="label label-lg label-inline mb-0 bg-ssff2">
                                                                챌린지
												</span>
                      </li>
                    </ul>
                  </div>
                  <%--  구분선--%>
                  <%--<div class="separator separator-solid mb-4"></div>
                  <div id="filter_2">
                     <h6 class="font-weight-bolder text-ssff2 mb-2">진행</h6>
                     <ul class="list-inline checklist">
                        <li class="d-inline-flex">
                                         <span class="mr-2 w-20px">
                                             <label class="checkbox checkbox-single checkbox-all">
                                                <input name="chk2"
                                                       id="all2"
                                                       type="checkbox"
                                                       value="전체" checked>
                                                &nbsp;<span></span>
                                             </label>
                                         </span>
                           전체
                        </li>

                        <li class="d-inline-flex">
                           <span class="mr-2 w-20px">
                              <label class="checkbox checkbox-single">
                                 <input name="chk2"
                                        type="checkbox"
                                        value="a">
                                 &nbsp;
                                 <span></span>
                              </label>
                           </span>
                           가입 신청중
                        </li>
                        <li class="d-inline-flex">
                           <span class="mr-2 w-20px">
                              <label class="checkbox checkbox-single">
                                 <input name="chk2"
                                        type="checkbox"
                                        value="r">&nbsp;
                                 <span></span>
                              </label>
                           </span>
                           가입 거절
                        </li>
                        <li class="d-inline-flex">
                           <span class="mr-2 w-20px">
                              <label class="checkbox checkbox-single">
                                 <input type="checkbox"
                                        value="c"
                                        name="chk2">&nbsp;<span></span>
                              </label>
                           </span>
                           가입 취소
                        </li>

                        <li class="d-inline-flex" style="width: 20%">
                           <span class="mr-2 w-20px">
                              <label class="checkbox checkbox-single">
                                 <input type="checkbox"
                                        value="i"
                                        name="chk2">&nbsp;<span></span>
                              </label>
                           </span>
                           가입 중 (정상승인/ 프로젝트)
                        </li>

                        <li class="d-inline-flex ml-n8" style="width: 20%">
                           <span class="mr-2 w-20px">
                              <label class="checkbox checkbox-single">
                                 <input type="checkbox"
                                        value="g"
                                        name="chk2">&nbsp;<span></span>
                              </label>
                           </span>
                           가입 중 (승인 후 대기/ 챌린지)
                        </li>

                        <li class="d-inline-flex ml-n8">
                           <span class="mr-2 w-20px">
                              <label class="checkbox checkbox-single">
                                 <input type="checkbox"
                                        value="w"
                                        name="chk2">&nbsp;<span></span>
                              </label>
                           </span>
                           탈퇴
                        </li>

                                          <li class="d-inline-flex ml-n8">
                                             <span class="mr-2 w-20px">
                                                <label class="checkbox checkbox-single">
                                                   <input type="checkbox"
                                                          value="f"
                                                          name="chk2">&nbsp;<span></span>
                                                </label>
                                             </span>
                                             가입실패
                                          </li>
                                       </ul>
                                       구분선
                                       <div class="separator separator-solid mb-4"></div>
                                       <table class="ml-auto mr-auto">
                                          <tr class="row">
                                             <td colspan="1" align="right">
                                                <button class="btn btn-light-instagram" type="submit"
                                                        id="submitBtn">검색하기
                                                </button>
                                             </td>
                                          </tr>
                                       </table>
                                    </div>--%>
                                    <!--end::Card 카테고리 항목 접기 종료-->

                                    <!--begin: Datatable-->
                                    <div class="mng_study_list  datatable-default datatable-primary overflow-auto"
                                         id="kt_datatable">
                                        <%------ 테이블 시작-------%>
                                        <%------ 테이블 헤드-------%>
                                        <table class="table table-hover">
                                            <thead class="text-center">
                                            <tr>
                                                <th data-field="StudyNum"
                                                    class="study_num">
                                                    <i class=""/>
                                                </th>
                                                <th data-field="StudyBoss"
                                                    class="study_nick">
                                                    개설자
                                                </th>

                                                <th data-field="StudyType"
                                                    class="study_type w-90px">
                                                    타입
                                                </th>

                                                <th data-field="StudyName"
                                                    class="study_name">
                                                    스터디명
                                                </th>

                                                <th data-field="StudyDate"
                                                    class="study_date">
                                                    개설일자
                                                </th>

                                                <th data-field="StudyIng"
                                                    class="list_ing w-90px">
                                                    상태
                                                </th>

                                                <th class="list_action w-90px">
                                                    모집글 / 회원목록
                                                </th>
                                            </thead>

                                            <%------ 테이블 바디-------%>
                                            <tbody>
                                            <c:forEach var="list" items="${myStudyList}">

                                                <c:choose>
                                                    <%--삭제됨--%>
                                                    <c:when test="${list.dead_ok == 121}">
                                                        <tr data-row="0" aria-label="1"
                                                        title="Load sub table"
                                                        class="bg-dark-o-40 bg-hover-dark-o-1">
                                                    </c:when>
                                                    <%--종료--%>
                                                    <c:when test="${list.dead_ok == 121}">
                                                        <tr data-row="0" aria-label="1"
                                                        title="Load sub table"
                                                        class="bg-dark-o-20 bg-hover-dark-o-1">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <tr data-row="0" aria-label="1"
                                                        title="Load sub table"
                                                        class="cursor-pointer">
                                                    </c:otherwise>
                                                </c:choose>

                                                <%--스터디번호--%>
                                                <td class="study_num"
                                                    aria-label="스터디 번호"
                                                    data-field="StudyNum">
                                                    <div class="text-center font-size-sm font-weight-bolder">${list.r_idx}</div>
                                                </td>

                                                <%--개설자--%>
                                                <td data-field="StudyBoss"
                                                    aria-label="개설자"
                                                    class="study_nick">
                                                    <div class="d-flex align-items-center justify-content-center">
                                                        <c:choose>
                                                            <c:when test="${list.member_name == member.member_name}">
                                                               <span class="mb-0 text-warning font-size-sm">
                                                                   <i class="fas fa-crown"></i>
                                                               </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="/member/myPage?member_Name=${list.member_name}">
                                                                   <span class="mb-0 text-hover-primary font-size-sm">
                                                                           ${list.member_name}
                                                                   </span>
                                                                </a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </td>

                                                <%--스터디 타입--%>
                                                <td data-field="StudyType"
                                                    aria-label="스터디 타입"
                                                    class="study_type">
                                                    <div class="d-flex align-items-center justify-content-center">
                                                        <c:choose>
                                                        <c:when test="${list.type_pc =='c'.charAt(0) or list.type_pc == 'C'.charAt(0)}">
                                                        <span class="label label-lg label-inline mb-0 bg-ssff2">
                                                                챌린지
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span
                                                                  class="label label-lg label-inline mb-0 bg-ssff1">
                                                                프로젝트
                                                            </c:otherwise>
                                                        </c:choose>
                                                   </span>
                          </div>
                        </td>

                        <%--스터디명--%>
                        <td data-field="StudyName"
                            aria-label="스터디명"
                            class="study_name">
                          <div class="d-flex align-items-center justify-content-center">
                            <c:choose>
                            <c:when
                              test="${list.type_pc =='c'.charAt(0) or list.type_pc == 'C'.charAt(0)}">
                            <a href="/study/challenge/main?r_Idx=${list.r_idx}&member_name=${member.member_name}">
                              </c:when>
                              <c:otherwise>
                              <a href="/study/project/main?r_Idx=${list.r_idx}&member_name=${member.member_name}">
                                </c:otherwise>
                                </c:choose>
                                <span
                                  class="text-dark-75 font-weight-bolder font-size-lg mb-0 text-hover-primary">
                                    ${list.teamname}
                                </span>
                              </a>
                          </div>
                        </td>

                        <%--개설일자--%>
                        <td data-field="StudyDate"
                            aria-label="개설일자"
                            class="study_date">
                          <div class="d-flex align-items-center justify-content-center">
                                                   <span class="mb-0 font-size-sm">
                                                       <fmt:formatDate
                                                         value="${list.writedate}"
                                                         pattern="yyyy/MM/dd"/>
                                                   </span>
                          </div>
                        </td>

                        <%--진행 / 상태--%>
                        <td data-field="StudyIng"
                            aria-label="진행 상태"
                            class="list_ing">
                          <div class="d-flex align-items-center justify-content-center">
                            <c:choose>
                            <c:when test="${list.removed_ok == 121}">
                            <span class="label label-lg label-inline ml-2 text-white bg-danger">
                                 삭제
                             </c:when>
                             <c:when test="${list.dead_ok == 121}">
                                  <span
                                    class="label label-lg label-inline ml-2 bg-secondary">
                                 종료
                             </c:when>
                             <c:when test="${list.dead_ok == 121}">
                                 <span
                                   class="label label-lg label-inline ml-2 bg-info text-white">
                                 모집마감
                             </c:when>
                             <c:otherwise>
                                 <span
                                   class="label label-lg label-inline ml-2 bg-success text-white">
                                 모집중
                             </c:otherwise>
                         </c:choose>
                                </span>
                          </div>
                        </td>
                        <%--액션--%>
                        <td data-field="Actions"
                            aria-label="액션 버튼"
                            class="list_action text-center">
                            <%-- 스터디 모집글--%>
                          <a href="/study/challenge/detail?r_idx=${list.r_idx}"
                             class="btn btn-xs btn-default btn-text-primary btn-hover-primary btn-icon m-1">
                            <i class="far fa-newspaper"></i>
                          </a>
                            <%-- 가입회원 목록 TODO 가입회원 목록 빼앟ㅁ....--%>
                              <a href="#"
                                 class="btn btn-xs btn-default btn-text-primary btn-hover-primary btn-icon m-1"
                                 data-toggle="modal" data-target="#memberListModal"
                                 onclick="start.callAjax('NA','${list.r_idx}')">
                                <i class="far fa-user-circle"></i>
                          </a>
                        </td>
                        </tr>

                        <!--start::Modal-->
                        <div id="memberListModal" class="modal modal-center fade"
                             role="dialog" aria-hidden="true">
                          <div class="modal-dialog modal-center modal-80size">
                            <div class="modal-content modal-80size" style="min-height: 400px;width:700px; ">
                              <div class="modal-header pl-7 pr-7 pt-5 pb-0" id="studyMemberTab">
                                <div id="btnMemberList" class="btn btn btn-outline-warning btn-lg btn-block"

                                     onclick="start.callAjax('NA', '${list.r_idx}');">
                                  <h5 class="modal-title">
                                    스터디 멤버 <span class="d-block text-muted font-size-sm">
											스터디 멤버를 확인해보세요!</span>
                                  </h5></div>

                                <div id="btnApplyMemberList" class="btn btn btn-outline-primary btn-lg btn-block"
                                  <c:if test="${member.member_name ne list.member_name}">
                                    style="visibility: hidden; margin-top: 0px;"
                                  </c:if>
                                  <c:if test="${member.member_name eq list.member_name}">
                                    style="visibility: visible; margin-top: 0px;"
                                  </c:if>
                                     onclick="start.callAjax('YA','${list.r_idx}');" ><h5 class="modal-title">
                                  참여 신청자<span class="d-block text-muted font-size-sm">
                  가입신청한 회원을 확인해보세요!</span>
                                </h5></div>
                              </div>
                              <div class="modal-body pt-0">
                              </div>
                            </div>
                          </div>
                        </div>
                        <!--end::Modal-->

                        <%--클릭시 상세정보 페이지 아코디언 북마크--%>
                        <tr class="datatable-row-subtable bg-hover-white" style="display: none;">
                          <!-- display none-block  -->
                          <td colspan="7" class="pt-0 border-top-0">
                            <!--begin::Body-->
                            <div>
                              <!--begin: Datatable 내용-->
                              <div class="mng_info flex-column align-items-center">

                                <table class="table table-sm w-75 mx-auto">
                                  <tbody>
                                  <tr>
                                    <td> 번호</td>
                                    <td>
                                        ${list.r_idx}
                                    </td>

                                    <td> 유형</td>
                                    <td>
                                      <c:choose>
                                      <c:when test="${list.type_pc =='c'.charAt(0) or list.type_pc == 'C'.charAt(0)}">
                                      <span class="label label-lg label-inline mb-0 bg-ssff2">
                                                                                챌린지
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="label label-lg label-inline mb-0 bg-ssff1">
                                                                                프로젝트
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                          </span>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td>스터디명</td>
                                                                        <td colspan="3" class="font-weight-bolder">
                                                                            <c:choose>
                                                                            <c:when test="${list.type_pc =='c'.charAt(0) or list.type_pc == 'C'.charAt(0)}">
                                                                            <a href="/study/challenge/main?r_Idx=${list.r_idx}">
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                <a href="/study/project/main?r_Idx=${list.r_idx}">
                                                                                    </c:otherwise>
                                                                                    </c:choose>
                                                                                        ${list.teamname}
                                                                                </a>

                                                                        </td>
                                                                    </tr>


                                                                    <tr>
                                                                        <td> 개설자</td>
                                                                        <td>
                                                                            <a href="/member/myPage?member_Name=${list.member_name}">
                                                                                    ${list.member_name}
                                                                            </a>

                                                                        </td>

                                                                        <td> 개설일</td>
                                                                        <td>
                                                                            <fmt:formatDate
                                                                                    value="${list.writedate}"
                                                                                    pattern="yyyy/MM/dd"/>
                                                                        </td>
                                                                    </tr>

                                                                    <%--이하 챌린지일 경우에만 공개--%>
                                                                    <c:if test="${list.type_pc =='c'.charAt(0) or list.type_pc == 'C'.charAt(0)}">
                                                                    <tr>
                                                                        <td> 시작일</td>
                                                                        <td>
                                                                            <fmt:formatDate value="${list.ch_start}"
                                                                                            pattern="yyyy/MM/dd"/>
                                                                        </td>

                                                                        <td> 종료일</td>
                                                                        <td>
                                                                            <fmt:formatDate value="${list.ch_end}"
                                                                                            pattern="yyyy/MM/dd"/>
                                                                        </td>
                                                                    </tr>


                                                                    <tr>
                                                                        <td> 챌린지 유형</td>
                                                                        <td>
                                                                           <span class="label label-lg label-inline mb-0">
                                                                               ${list.ch_pattern}
                                                                           </span>
                                      </td>

                                      <td> 챌린지 지역</td>
                                      <td>
                                          ${list.sido}
                                      </td>
                                    </tr>
                                  </c:if>
                                  </tbody>
                                </table>


                                <div class="accordion accordion-light accordion-light-borderless accordion-svg-toggle mx-auto mb-8 w-75"
                                     id="data${list.r_idx}">
                                  <div class="card">
                                    <div class="card-header" id="headingTwo7">
                                      <div class="card-title collapsed"
                                           data-toggle="collapse"
                                           data-target="#collapse${list.r_idx}">
                                                       <span class="svg-icon svg-icon-primary">
                                                           <svg xmlns="http://www.w3.org/2000/svg" width="24px"
                                                                height="24px" viewBox="0 0 24 24" version="1.1">
                                                           <g stroke="none" stroke-width="1" fill="none"
                                                              fill-rule="evenodd">
                                                           <polygon points="0 0 24 0 24 24 0 24"></polygon>
                                                           <path d="M12.2928955,6.70710318 C11.9023712,6.31657888 11.9023712,5.68341391
                                                           12.2928955,5.29288961 C12.6834198,4.90236532 13.3165848,4.90236532 13.7071091,5.29288961
                                                           L19.7071091,11.2928896 C20.085688,11.6714686 20.0989336,12.281055 19.7371564,12.675721 L14.2371564,18.675721
                                                           C13.863964,19.08284 13.2313966,19.1103429 12.8242777,18.7371505 C12.4171587,18.3639581 12.3896557,17.7313908
                                                           12.7628481,17.3242718 L17.6158645,12.0300721 L12.2928955,6.70710318 Z"
                                                                 fill="#000000" fill-rule="nonzero">
                                                           </path>
                                                           <path d="M3.70710678,15.7071068 C3.31658249,16.0976311 2.68341751,16.0976311 2.29289322,15.7071068 C1.90236893,15.3165825
                                                           1.90236893,14.6834175 2.29289322,14.2928932 L8.29289322,8.29289322 C8.67147216,7.91431428 9.28105859,7.90106866
                                                           9.67572463,8.26284586 L15.6757246,13.7628459 C16.0828436,14.1360383 16.1103465,14.7686056 15.7371541,15.1757246
                                                           C15.3639617,15.5828436 14.7313944,15.6103465 14.3242754,15.2371541 L9.03007575,10.3841378 L3.70710678,15.7071068 Z"
                                                                 fill="#000000"
                                                                 fill-rule="nonzero" opacity="0.3"
                                                                 transform="translate(9.000003, 11.999999) rotate(-270.000000) translate(-9.000003, -11.999999) ">
                                                           </path>
                                                           </g> </svg>
                                                       </span>
                                        <div class="card-label pl-4 font-weight-bolder text-hover-primary">
                                            ${list.title}
                                        </div>
                                      </div>
                                    </div>

                                    <div id="collapse${list.r_idx}" class="collapse"
                                         data-parent="#data${list.r_idx}">
                                      <div class="card-body pl-12 font-weight-light">
                                          ${list.cont}
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <!--end: Datatable-->
                              </div>
                              <!--end::Body-->
                            </div>
                            <!--end::Card-->
                          </td>
                        </tr>
                      </c:forEach>
                      </tbody>
                    </table>
                    <%------ 테이블 종료-------%>

                    <%--------------아랫단 시작-----------%>
                    <!--begin::Pagination-->
                    <!--end::Body-->

                  </div>

                </div>
                <!--end::Card-->
              </div>
              <!--end::Content-->
            </div>
            <!--end::Content Wrapper 내용물 종료-->
          </div>
        </div>
        <!--컨테이너 종료-->
      </div>
    </div>
    <!--footer.html Include-->
    <jsp:include page="/WEB-INF/commons/footer.jsp"/>
  </form>


</div>
</body>
<!----------------Body 종료----------------------->

<script>
  function submitConfirm() {

    $('#actionForm').submit();

  }

  $(function () {
    let sch = location.search;
    console.log(sch);

    let params = new URLSearchParams(sch);
    let sch_keyword = "";

    let array = []; //배열1의 선언
    let array2 = []; //배열2의 선언

    let chk = [];
    let chk2 = [];

    let actionForm = $("#actionForm");

    $(`#searchBtn`).on('click', function (e) {

      e.preventDefault(); //기본 동작 제한

      location.href = '/manager/study/list?pageNum=1&amount=20&keyword=${keyword}&chk=${chk}';
    });

    $("input[name='keyword']").on("keyup", function (key) {
      let aa = "";
      if (key.keyCode == 13) {

        key.preventDefault(); //기본 동작 제한
        $(`input:checkbox[name='chk']`).each(function () {
          if ($(this).val() == "전체") {
            location.href = '/manager/study/list?pageNum=1&amount=20&keyword=' +
                            $(`input[name='keyword']`).val();
            return;
          }
          aa += `&chk=` + $(this).val();
        });

        location.href = '/manager/study/list?pageNum=1&amount=20&keyword=' +
                        $(`input[name='keyword']`).val() + aa;
      }
    });

    $(".paginate_button a").on("click", function (e) {

      e.preventDefault(); //기본 동작 제한

      actionForm.find("input[name='pageNum']").val($(this).attr("href"));

      actionForm.submit();

    });

    $("#all").on('click', function () {

      console.log("all2클릭");

      $(`input:checkbox[name='chk']`).prop('checked', false); // 체크박스 전체 뺴고 해제합니다.

      if ($(`input:checkbox[id='all']`).is(':checked')) {

        console.log(`체크`);
        console.log($(`#all`).attr("checked"));
        $(`#all`).prop("checked", false);

      } else {

        console.log(`체크안됨`)
        $(`#all`).prop("checked", true);

      }

    });

    $("#all2").on('click', function () {

      console.log("all2 클릭");

      $(`input:checkbox[name='chk2']`).prop('checked', false); // 체크박스 전체 뺴고 해제합니다.

      if ($(`input:checkbox[id='all2']`).is(':checked')) {

        console.log(`체크`);
        console.log($(`#all2`).attr("checked"));
        $(`#all2`).prop("checked", false);

      } else {

        console.log(`체크안됨`)
        $(`#all2`).prop("checked", true);

      }
    });

    $(`input:checkbox[name='chk']`).on(`click`, function () {
      console.log(`체크체크체크체크11`)
      if ($(this).val() != "전체") {
        $(`#all`).prop(`checked`, false);
      }

      if ($(`input:checkbox[name='chk']:checked`).length == 0 && $(this).val() != "전체") {
        console.log(`체크체크체크체크`)
        $(`#all`).prop('checked', true);
      }
    });

    $(`input:checkbox[name='chk2']`).on(`click`, function () {
      console.log(`체크체크체크체크11`)
      if ($(this).val() != "전체") {
        $(`#all2`).prop(`checked`, false);
      }

      if ($(`input:checkbox[name='chk2']:checked`).length == 0 && $(this).val() != "전체") {
        console.log(`체크체크체크체크`)
        $(`#all2`).prop('checked', true);
      }
    });

    <c:forEach var="list" items="${map.get('chk')}">

    chk.push(`${list}`);
    </c:forEach>

    <c:forEach var="list2" items="${map.get('chk2')}">

    chk2.push(`${list2}`);

    </c:forEach>
    console.log("chk" + chk);
    console.log("chk2" + chk2);
    if (chk[0] == '전체') {
      $(`input:checkbox[name='chk']`).prop("checked", false);
      $(`#all`).prop("checked", true);
    }

    if (chk2[0] == '전체') {
      $(`input:checkbox[name='chk2']`).prop("checked", false);
      $(`#all2`).prop("checked", true);
    }

    for (let i = 0; i < chk.length; i++) {
      $(`input:checkbox[name='chk']`).each(function () {
        console.log($(this).val());

        if (chk[i] == $(this).val()) {

          $(this).prop("checked", true);
          $(`#all`).prop("checked", false);

        } else if (chk[i] == "전체") {

          $(this).prop("checked", false);
          $(`#all`).prop("checked", true);

        }
      });

    }
    for (let i = 0; i < chk2.length; i++) {
      $(`input:checkbox[name='chk2']`).each(function () {
        if (chk2[i] == $(this).val()) {

          $(this).prop("checked", true);
          $(`#all2`).prop("checked", false);

        } else if (chk2[i] == "전체") {

          $(this).prop("checked", false);
          $(`#all2`).prop("checked", true);

        }
      });

    }

    // 버튼 클릭을 통해 세부 스터디정보 add, delete
    $(document).on('click', "tr[title='Load sub table']", function () {
      $(this).closest("tr").toggleClass("datatable-row-subtable-expanded").next().fadeToggle();

    })
  });
</script>



<script type="text/javascript">

  // 모달 : 스터디 멤버, 참여신청자 확인
  let start = {
// style="visibility: hidden;"
    // 백단으로 db 달라 요청
    callAjax: function (applyType, rId) {
      <%--"${member.member_name}";--%>
      let param = new Object();
      param.memName = 'admin';
      param.applyType = applyType;
      param.rId = rId;

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
          if (applyType == "YA") {// 참여신청자 명단조회
            $('#btnMemberList').css('background-color', 'transparent');
            $('#btnApplyMemberList').css('background-color', '#6b984f');
            start.setListApplyMem(data);


          } else {// 스터디 멤버원 명단 조회
            $('#btnMemberList').css('background-color', '#FFA800');
            $('#btnApplyMemberList').css('background-color', 'transparent');
            start.setListStudyMem(data);

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

            <thead class="datatable-head" style="background-color: #6b984f33;">
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
        <tr class="datatable-row" style="background-color: #ffa50042;left: 0px;C">
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
      } else  {
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

        // 3초 후 리로드
        setTimeout(start.callAjax('YA', rId), 3000)


      } // successCallback

      // 실패
      function errorCallback() {
        Swal.fire(actionName + ' 실패하였습니다!', '', 'warning')

        setTimeout(start.callAjax('YA', rId), 3000)
      } // errorCallback
    } // callAjax

  }


</script>



</html>