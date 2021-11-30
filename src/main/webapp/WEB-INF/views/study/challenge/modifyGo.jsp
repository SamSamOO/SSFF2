<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<!----------------Head 시작----------------------->

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="../../../../resources/assets/css/yesol.css" rel="stylesheet" type="text/css">
    <script src="../../../../resources/assets/js/location/location.js"></script>
    <title>글 수정</title>
    <!--head.html Include-->
    <jsp:include page="../../../commons/head.jsp"/>

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
            <!------------------header.html Include------------------>
            <jsp:include page="../../../commons/header.jsp"/>
            <!------------------Header Wrapper : 메뉴 탭 시작------------------>
            <!--menu.html Include-->
            <jsp:include page="../../../commons/menu_main.jsp"/>
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
                                    <h5 class="text-dark font-weight-bolder my-1 mr-5">챌린지 글쓰기</h5>
                                    <!--Page Title : 페이지 제목 종료-->
                                    <!--Breadcrumb : 로드맵 시작-->
                                    <ul
                                            class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bolder p-0 my-2 font-size-sm">
                                        <li class="breadcrumb-item">
                                            <a href="" class="text-muted">프로젝트</a>
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

                            <!--카드 Body 시작-->
                            <div class="card-header border-0 pt-5 card-body mt-5" id="post-body-wrapper">
                                <!-----------------------------------------------이 안에서 자유롭게 채우기------------------------------------------------------>
                                <div id="post-body">
                                    <form action="/study/challenge/modify?r_idx=${board.r_idx}" method="post" id="article-form" class="article-form" role="form">
                                        <!--parameter 1 : 제목-->
                                        <div id="title-sec">
                                            <input type="text" id="title" name="title" value="${board.title}">
                                        </div>
                                        <!--parameter 2 : 팀네임-->
                                        <div id="teamname-sec">
                                            <input type="text" id="teamname" name="teamname" value="${board.teamname}">
                                        </div>

                                        <!--parameter 3 : 유형태그-->
                                        <div id="lang-sec">
                                            <ul id="lang-sec-ul">
                                                <li><span>스터디 유형 :</span></li>
                                                <li>
                                                    <select id="challenge-type" name="ch_pattern" class="form-control">
                                                        <option value="${board.ch_pattern}">${board.ch_pattern}</option>
                                                        <option value="생활습관 스터디">생활습관 스터디</option>
                                                        <option value="취업 스터디">취업 스터디</option>
                                                        <option value="시험준비 스터디">시험준비 스터디</option>
                                                        <option value="어학 스터디">어학 스터디</option>
                                                        <option value="기타">기타</option>
                                                    </select>
                                                </li>
                                            </ul>
                                        </div>

                                        <br> <!--이것만은 쓰고 싶지 않았는데..-->

                                        <!--parameter 4 : 지역-->
                                        <div id="sido-sec">
                                            <ul id="sido-sec-ul">
                                                <li><span>지역 :</span></li>
                                                <li style="margin-right: 10px">
                                                    <select id="location1" name="location1" class="form-control">
                                                        <option value="" id="sido1">==시도 선택==</option>
                                                    </select>
                                                </li>
                                                <li>
                                                    <select id="location2" name="location2" class="form-control">
                                                        <option value="" id="sido2">==시군구 선택==</option>
                                                    </select>
                                                </li>
                                            </ul>
                                        </div>

                                        <br> <!--이것만은 쓰고 싶지 않았는데..-->

                                        <!--parameter 5 : 시작-종료일-->
                                        <div id="date-sec">
                                            <ul id="date-sec-ul">
                                                <li><span>시작일 :</span></li>
                                                <li>
                                                    <input type="date" id="study-start" name="ch_start" class="form-control" value="${board.ch_start}" readonly>
                                                </li>
                                                <li style="margin-left: 35px"><span>종료일 :</span></li>
                                                <li>
                                                    <input type="date" id="study-end" name="ch_end" class="form-control" value="${board.ch_end}" readonly>
                                                </li>
                                            </ul>
                                        </div>

                                        <!--parameter 6 : 마감 여부 -->
                                        <div id="closed-sec">
                                            <ul>
                                                <li><span>마감 여부 :</span></li>
                                                <li><input type="radio" name="closed_ok" value="n" checked><label>&nbsp;모집중</label></li>
                                                <li><input type="radio" name="closed_ok" value="y"><label>&nbsp;마감</label></li>
                                            </ul>
                                        </div>

                                        <!--parameter 7 : 글내용-->
                                        <div id="cont-sec" style="margin-top:50px">
                                            <textarea id="summernote" name="cont">${board.cont}</textarea>
                                        </div>
                                        <div id="button-sec">
                                            <ul>
                                                <li onclick="onSubmit()">수정하기</li>
                                                <li><a href="/study/challenge/detail?r_idx=${board.r_idx}">취소</a></li>
                                            </ul>
                                        </div>
                                    </form>
                                </div>
                                <!----------------------------------------------------------------------------------------------------------------------------->
                            </div>
                            <!--카드 Body 종료-->
                        </div>
                        <!--풀 사이즈 카드 종료 / 카드 필요 없으면 여기서까지 밀기☆-->



                        <!--대시보드 종료-->
                    </div>
                    <!--end::Content-->
                </div>
                <!--end::Content Wrapper 내용물 종료-->
            </div>
            <!--컨테이너 종료-->
            <!--footer.html Include-->
            <jsp:include page="../../../commons/footer.jsp"/>
</body>
<!----------------Body 종료----------------------->
<script>

  $(document).ready(function() {
    $('#summernote').summernote({
      height: 300,                  // 에디터 높이
      minHeight: null,              // 최소 높이
      maxHeight: null,              // 최대 높이
      focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
      lang: "ko-KR",				// 한글 설정
      placeholder: '최대 1000자까지 쓸 수 있습니다'	//placeholder 설정
    });
    let sido = "${board.sido}";
    let arr = sido.split(' ');
    document.querySelector("#sido1").innerHTML = arr[0];
    document.querySelector("#sido1").value = arr[0];
    document.querySelector("#sido2").innerHTML = arr[1];
    document.querySelector("#sido2").innerHTML = arr[1];
  }); //summernote 관련 설정


  function onSubmit() {
    let str1 = document.querySelector('#location1').value;
    let str2 = document.querySelector('#location2').value;

    let tagArea = document.querySelector('#sido-sec-ul'); //태그를 추가할 곳을 정의해준다
    let new_Tag = document.createElement('input');

    new_Tag.setAttribute('type', 'hidden');
    new_Tag.setAttribute('name', 'sido');
    new_Tag.setAttribute('value', str1 + " " + str2);

    tagArea.appendChild(new_Tag);

    document.querySelector('#article-form').submit();

  }//onSubmit
</script>
</html>