<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!----------------Head 시작----------------------->

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="../../../../resources/assets/css/yesol.css" rel="stylesheet" type="text/css">
    <script src="../../../../resources/assets/js/location/location.js"></script>
    <title>챌린지 리스트</title>
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
                                    <form action="/study/challenge/post" method="post" id="article-form" class="article-form" role="form">
                                        <!--parameter 0 : 아이디-->
                                        <input type="hidden" id="member_name" name="member_name" value="${member.member_name}">
                                        <!--parameter 1 : 제목-->
                                        <div id="title-sec">
                                            <input type="text" id="title" name="title" placeholder="제목을 입력해 주세요">
                                        </div>
                                        <!--parameter 2 : 팀네임-->
                                        <div id="teamname-sec">
                                            <input type="text" id="teamname" name="teamname" placeholder="<팀명을 입력해 주세요>">
                                        </div>

                                        <!--parameter 3 : 유형태그-->
                                        <div id="lang-sec">
                                            <ul id="lang-sec-ul">
                                                <li><span>스터디 유형 :</span></li>
                                                <li>
                                                    <select id="challenge-type" name="ch_pattern" class="form-control">
                                                        <option value="">==스터디 유형을 선택해 주세요==</option>
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
                                                        <option value="">==시도 선택==</option>
                                                    </select>
                                                </li>
                                                <li>
                                                    <select id="location2" name="location2" class="form-control">
                                                        <option value="">==시군구 선택==</option>
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
                                                    <input type="date" id="study-start" name="ch_start" class="form-control">
                                                </li>
                                                <li style="margin-left: 35px"><span>종료일 :</span></li>
                                                <li>
                                                    <input type="date" id="study-end" name="ch_end" class="form-control">
                                                </li>
                                            </ul>
                                        </div>


                                        <!--parameter 6 : 글내용-->
                                        <div id="cont-sec">
                                            <textarea id="summernote" name="cont"></textarea>
                                        </div>
                                        <div id="button-sec">
                                            <ul>
                                                <li onclick="onSubmit()">글등록</li>
                                                <li>취소</li>
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
  let today = new Date();
  $(document).ready(function() {
    $('#summernote').summernote({
      height: 300,                  // 에디터 높이
      minHeight: null,              // 최소 높이
      maxHeight: null,              // 최대 높이
      focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
      lang: "ko-KR",				// 한글 설정
      placeholder: '최대 1000자까지 쓸 수 있습니다'	//placeholder 설정
    });
  }); //summernote 관련 설정



  function onSubmit() {

    let today = new Date();
    let year = today.getFullYear();
    let month = ('0' +(today.getMonth()+1)).slice(-2);
    let day=('0' + today.getDate()).slice(-2);

    let dateString = year+'-'+month+'-'+day;

    //console.log("날짜 : " + dateString);
    //console.log(dateString == document.querySelector('#study-start').value);

    if(document.querySelector('#title').value=="" ||document.querySelector('#teamname').value==""){
      alert("제목과 팀명은 비울 수 없습니다.");
      return;
    }else if(document.querySelector('#title').value.length >25){
      alert("제목 길이는 띄어쓰기 포함 25자보다 길 수 없습니다.");
      return;
    }else if(document.querySelector('#challenge-type').value ==""){
      alert("스터디 유형은 필수 선택입니다");
      return;
    }else if(document.querySelector('#location1').value ==""){
      alert("지역은 필수 선택입니다");
      return;
    }else if(document.querySelector('#study-start').value == "" ||
        document.querySelector('#study-start').value == dateString){
      alert("시작일은 적어도 내일 이후의 날짜를 설정할 수 있습니다");
      return;
    }else if(document.querySelector('#study-end').value=="" ||
        document.querySelector('#study-end').value < document.querySelector('#study-start').value) {
      alert("종료일은 시작일로부터 하루 후 부터 설정할 수 있습니다");
      return;
    }else if(document.querySelector('#summernote').value==""){
      alert("본문을 입력해 주세요");
      return;
    }
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