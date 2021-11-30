<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2021-11-05
  Time: 오후 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--begin::Content Wrapper 내용물 시작-->
<div class="main d-flex flex-column flex-row-fluid">
  <!--Subheader : 서브헤더 페이지 제목란 시작-->
  <div class="subheader py-2 py-lg-6" id="kt_subheader">
    <div class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
      <!--begin::Info-->
      <div class="d-flex align-items-center flex-wrap mr-1">
        <!--begin::Page Heading-->
        <div class="d-flex align-items-baseline flex-wrap mr-5">
          <!--Page Title : 페이지 제목 시작-->
          <h5 class="text-dark font-weight-bolder my-1 mr-5">메인페이지단</h5>
          <!--Page Title : 페이지 제목 종료-->
          <!--Breadcrumb : 로드맵 시작-->
          <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
            <li class="breadcrumb-item">
              <a href="" class="text-muted">카테고리1</a>
            </li>
            <li class="breadcrumb-item">
              <a href="" class="text-muted">카테고리2</a>
            </li>
          </ul>
          <!--Breadcrumb : 로드맵 종료-->
        </div>
        <!--end::Page Heading-->
      </div>
      <!--end::Info-->

    </div>
  </div>
  <!--Subheader : 서브헤더 페이지 제목란 종료-->
  <div class="content flex-column-fluid" id="kt_content">
    <!--대시보드 시작-->

    <!--풀 사이즈 카드 시작 / 카드 필요 없으면 여기서부터 밀기☆-->
    <div class="card card-custom gutter-b card-stretch">
      <!--카드 헤더 시작-->
      <div class="card-header border-0 pt-5">
        <h3 class="card-title align-items-start flex-column">
          <span class="card-label font-weight-bolder text-dark">메인페이지 임시 공사중..</span>
        </h3>
        <div class="card-toolbar">

        </div>
      </div>
      <!--카드 헤더 종료-->
      <!--카드 Body 시작-->
      <div class="card-body pt-2 pb-0 mt-n3">
        <p><a href="/study/challenge/list">(예솔)여기 누르면 챌린지 리스트로</a> </p>
        <p><a href="/study/project/list">(예솔)여기 누르면 프로젝트 리스트로</a></p>
        <p><a href="/study/challenge/main">(상준) 여기 누르면 챌린지 메인으로</a> </p>
        <p><a href="/manager/member/list">관리자 페이지</a></p>
        <p><a href="/cafe/reservationList">예약 내역 페이지</a></p>
        <p><a href="/studyIns/board/list?r_Idx=130">스터디내 게시판</a></p>
        <p><a href="/study/project/main">(예솔)여기 누르면 nickname55 -> 마이페이지 -> r_idx 129번 프로젝트 스터디 메인단</a></p>
        <p><a href="/study/mypage/main">(예솔)여기 누르면 zxc -> 마이페이지 메인단 (캘린더 로직짜기용 임시)</a></p>

      </div>
      <!--카드 Body 종료-->
    </div>
    <!--풀 사이즈 카드 종료 / 카드 필요 없으면 여기서까지 밀기☆-->



    <!--대시보드 종료-->
  </div>
  <!--end::Content-->
</div>
<!--end::Content Wrapper 내용물 종료-->