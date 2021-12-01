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
</head>
<!----------------Head 종료----------------------->

<!----------------Body 시작----------------------->
<body id="kt_body" class="header-fixed subheader-enabled page-loading">
<!----------------메인 시작----------------------->
<div class="d-flex flex-column flex-root">
      <!----------------페이지 시작----------------------->
      <form action="/manager/study/list" id="actionForm" method="get">
            <input hidden name="member" value="${member}"/>
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
                                          <div class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                                                <!--begin::Details-->
                                                <div class="d-flex align-items-center flex-wrap mr-2">
                                                      <!--begin::Title-->
                                                      <i class="far fa-list-alt"></i>&nbsp;&nbsp;
                                                      <h5 class="text-dark font-weight-bolder mt-2 mb-2 mr-5">내 정보</h5>
                                                      <!--end::Title-->
                                                      <!--Breadcrumb : 로드맵 시작-->
                                                      <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
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
                                                <div class="card-header flex-wrap justify-content-end zindex-1 border-0 pt-6 mb-n16">
                                                      <!--begin::Search Form 검색-->
                                                      <div class="d-flex align-items-start">
                                                            <form class="ml-5">
                                                                  <div class="input-group input-group-sm input-group-solid align-self-center">
                                                                        <input type="text" class="form-control" name="keyword" placeholder="Search..."/>
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
                                                    <label class="checkbox checkbox-single checkbox-all mr-4">
                                                        <input name="chk" id="all" type="checkbox"
                                                               value="전체" checked>&nbsp;<span></span>
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
                                                                  <button class="btn btn-light-instagram" type="submit"
                                                                          id="submitBtn" style="margin-top: 10px">검색하기
                                                                  </button>
                                                            </ul>
                                                      </div>
<%--                                                        구분선--%>
<%--                                                      <div class="separator separator-solid mb-4"></div>--%>
                                                     <div id="filter_2">
<%--                                                         <h6 class="font-weight-bolder text-ssff2 mb-2">진행</h6>--%>
<%--                                                         <ul class="list-inline checklist">--%>
<%--                                                            <li class="d-inline-flex">--%>
<%--                                                                             <span class="mr-2 w-20px">--%>
<%--                                                                                 <label class="checkbox checkbox-single checkbox-all">--%>
<%--                                                                                    <input name="chk2"--%>
<%--                                                                                           id="all2"--%>
<%--                                                                                           type="checkbox"--%>
<%--                                                                                           value="전체" checked>--%>
<%--                                                                                    &nbsp;<span></span>--%>
<%--                                                                                 </label>--%>
<%--                                                                             </span>--%>
<%--                                                               전체--%>
<%--                                                            </li>--%>
<%--                  --%>
<%--                                                            <li class="d-inline-flex">--%>
<%--                                                               <span class="mr-2 w-20px">--%>
<%--                                                                  <label class="checkbox checkbox-single">--%>
<%--                                                                     <input name="chk2"--%>
<%--                                                                            type="checkbox"--%>
<%--                                                                            value="a">--%>
<%--                                                                     &nbsp;--%>
<%--                                                                     <span></span>--%>
<%--                                                                  </label>--%>
<%--                                                               </span>--%>
<%--                                                               가입 신청중--%>
<%--                                                            </li>--%>
<%--                                                            <li class="d-inline-flex">--%>
<%--                                                               <span class="mr-2 w-20px">--%>
<%--                                                                  <label class="checkbox checkbox-single">--%>
<%--                                                                     <input name="chk2"--%>
<%--                                                                            type="checkbox"--%>
<%--                                                                            value="r">&nbsp;--%>
<%--                                                                     <span></span>--%>
<%--                                                                  </label>--%>
<%--                                                               </span>--%>
<%--                                                               가입 거절--%>
<%--                                                            </li>--%>
<%--                                                            <li class="d-inline-flex">--%>
<%--                                                               <span class="mr-2 w-20px">--%>
<%--                                                                  <label class="checkbox checkbox-single">--%>
<%--                                                                     <input type="checkbox"--%>
<%--                                                                            value="c"--%>
<%--                                                                            name="chk2">&nbsp;<span></span>--%>
<%--                                                                  </label>--%>
<%--                                                               </span>--%>
<%--                                                               가입 취소--%>
<%--                                                            </li>--%>
<%--                  --%>
<%--                                                            <li class="d-inline-flex" style="width: 20%">--%>
<%--                                                               <span class="mr-2 w-20px">--%>
<%--                                                                  <label class="checkbox checkbox-single">--%>
<%--                                                                     <input type="checkbox"--%>
<%--                                                                            value="i"--%>
<%--                                                                            name="chk2">&nbsp;<span></span>--%>
<%--                                                                  </label>--%>
<%--                                                               </span>--%>
<%--                                                               가입 중 (정상승인/ 프로젝트)--%>
<%--                                                            </li>--%>
<%--                  --%>
<%--                                                            <li class="d-inline-flex ml-n8" style="width: 20%">--%>
<%--                                                               <span class="mr-2 w-20px">--%>
<%--                                                                  <label class="checkbox checkbox-single">--%>
<%--                                                                     <input type="checkbox"--%>
<%--                                                                            value="g"--%>
<%--                                                                            name="chk2">&nbsp;<span></span>--%>
<%--                                                                  </label>--%>
<%--                                                               </span>--%>
<%--                                                               가입 중 (승인 후 대기/ 챌린지)--%>
<%--                                                            </li>--%>
<%--                  --%>
<%--                                                            <li class="d-inline-flex ml-n8">--%>
<%--                                                               <span class="mr-2 w-20px">--%>
<%--                                                                  <label class="checkbox checkbox-single">--%>
<%--                                                                     <input type="checkbox"--%>
<%--                                                                            value="w"--%>
<%--                                                                            name="chk2">&nbsp;<span></span>--%>
<%--                                                                  </label>--%>
<%--                                                               </span>--%>
<%--                                                               탈퇴--%>
<%--                                                            </li>--%>
<%--                  --%>
<%--                                                            <li class="d-inline-flex ml-n8">--%>
<%--                                                               <span class="mr-2 w-20px">--%>
<%--                                                                  <label class="checkbox checkbox-single">--%>
<%--                                                                     <input type="checkbox"--%>
<%--                                                                            value="f"--%>
<%--                                                                            name="chk2">&nbsp;<span></span>--%>
<%--                                                                  </label>--%>
<%--                                                               </span>--%>
<%--                                                               가입실패--%>
<%--                                                            </li>--%>
<%--                                                         </ul>--%>
<%--                                                         구분선--%>
                                                      
                                                      
                                                      </div>
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
                                                                                    <a href="/member/myPage?member_Name=${list.member_name}">
                                                       <span class="mb-0 text-hover-primary font-size-sm">
                                                                   ${list.member_name}
                                                       </span>
                                                                                    </a>
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
                                                                <span class="label label-lg label-inline mb-0 bg-ssff1">
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
                                                                                    <c:when test="${list.type_pc =='c'.charAt(0) or list.type_pc == 'C'.charAt(0)}">
                                                                                    <a href="/study/challenge/main?r_Idx=${list.r_idx}">
                                                                                          </c:when>
                                                                                          <c:otherwise>
                                                                                          <a href="/study/project/main?r_Idx=${list.r_idx}">
                                                                                                </c:otherwise>
                                                                                                </c:choose>
                                                                                                <span class="text-dark-75 font-weight-bolder font-size-lg mb-0 text-hover-primary">
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
                                                              <span class="label label-lg label-inline ml-2 bg-secondary">
                                                             종료
                                                         </c:when>
                                                         <c:when test="${list.dead_ok == 121}">
                                                             <span class="label label-lg label-inline ml-2 bg-info text-white">
                                                             모집마감
                                                         </c:when>
                                                         <c:otherwise>
                                                             <span class="label label-lg label-inline ml-2 bg-success text-white">
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
                                                                              <a href="javascript:;"
                                                                                 class="btn btn-xs btn-default btn-text-primary btn-hover-primary btn-icon m-1">
                                                                                    <i class="far fa-user-circle"></i>
                                                                              </a>
                                                                        </td>
                                                                        </tr>
      
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
                                               <span class="label label-lg label-inline mb-0">
                                                           ${list.ch_pattern}
                                               </span>
                                                                                                            </td>
                                                                                                      </tr>
                                                                                                      
                                                                                                      <tr>
                                                                                                            <td>스터디명</td>
                                                                                                            <td colspan="3" class="font-weight-bolder">
                                                                                                                  <c:choose>
                                                                                                                  <c:when test="${list.type_pc =='c'.charAt(0) or list.type_pc == 'C'.charAt(0)}">
                                                                                                                  <a href="/study/challenge/main?rInx=${list.r_idx}">
                                                                                                                        </c:when>
                                                                                                                        <c:otherwise>
                                                                                                                        <a href="/study/project/main?rInx=${list.r_idx}">
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
                                                                                                            
                                                                                                            <td> 챌린지 지역</td>
                                                                                                            <td>
                                                                                                                        ${list.sido}
                                                                                                            </td>
                                                                                                      </tr>
                                                                                                      </tbody>
                                                                                                </table>
                                                                                                
                                                                                                
                                                                                                <div class="accordion accordion-light accordion-light-borderless accordion-svg-toggle mb-8"
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

     $(function() {
          let sch = location.search;
          console.log(sch);
     
          let params = new URLSearchParams(sch);
          let sch_keyword = "";
     
          let array = []; //배열1의 선언
          let array2 = []; //배열2의 선언
     
          let chk = [];
          let chk2 = [];
     
          let actionForm = $("#actionForm");
     
          $(`#searchBtn`).on('click', function(e) {
          
               e.preventDefault(); //기본 동작 제한
          
               location.href = '/member/studyList?memberName='+${member_name};
          });
     
          $("input[name='keyword']").on("keyup", function(key) {
               let aa = "";
               if (key.keyCode == 13) {
               
                    key.preventDefault(); //기본 동작 제한
                    $(`input:checkbox[name='chk']`).each(function() {
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
     
          $(".paginate_button a").on("click", function(e) {
          
               e.preventDefault(); //기본 동작 제한
          
               actionForm.find("input[name='pageNum']").val($(this).attr("href"));
          
               actionForm.submit();
          
          });
     
          $("#all").on('click', function() {
          
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
     
          $("#all2").on('click', function() {
          
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
     
          $(`input:checkbox[name='chk']`).on(`click`, function() {
               console.log(`체크체크체크체크11`)
               if ($(this).val() != "전체") {
                    $(`#all`).prop(`checked`, false);
               }
          
               if ($(`input:checkbox[name='chk']:checked`).length == 0 && $(this).val() != "전체") {
                    console.log(`체크체크체크체크`)
                    $(`#all`).prop('checked', true);
               }
          });
     
          $(`input:checkbox[name='chk2']`).on(`click`, function() {
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
               $(`input:checkbox[name='chk']`).each(function() {
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
               $(`input:checkbox[name='chk2']`).each(function() {
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
          $(document).on('click', "tr[title='Load sub table']", function() {
               $(this).closest("tr").toggleClass("datatable-row-subtable-expanded").next().fadeToggle();
          
          })
     });
</script>
</html>