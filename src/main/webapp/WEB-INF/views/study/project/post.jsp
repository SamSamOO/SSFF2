<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!----------------Head 시작----------------------->

<head>
    <!--내 css-->
    <link href="../../../../resources/assets/css/yesol.css" rel="stylesheet" type="text/css">
    <!--setting for summernote-->
    <script src="../../../../WEB-INF/summernote/js/summernote-lite.js"></script>
    <script src="../../../../WEB-INF/summernote/js/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="../../../../WEB-INF/summernote/css/summernote-lite.css">

    <title>프로젝트 리스트</title>
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
                                    <h5 class="text-dark font-weight-bold my-1 mr-5">프로젝트 글쓰기</h5>
                                    <!--Page Title : 페이지 제목 종료-->
                                    <!--Breadcrumb : 로드맵 시작-->
                                    <ul
                                            class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
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
                                    <form action="" method="post" id="article-form" class="article-form" role="form">
                                        <!--parameter 1 : 제목-->
                                        <div id="title-sec">
                                            <input type="text" id="title" name="title" placeholder="제목을 입력해 주세요">
                                        </div>
                                        <!--parameter 2 : 팀네임-->
                                        <div id="teamname-sec">
                                            <input type="text" id="teamname" name="teamname" placeholder="<팀명을 입력해 주세요>">
                                        </div>
                                        <!--parameter 3 : 언어태그-->
                                        <div id="lang-sec">
                                            <ul id="lang-sec-ul">
                                                <li>
                                                    <span>사용 언어 :</span>
                                                </li>
                                                <li>
                                                    <div class="dropdown" style="margin-right: 15px">
                                                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            언어 선택
                                                        </button>
                                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                            <a class="dropdown-item" onclick="tagClick('javascript')">javascript</a>
                                                            <a class="dropdown-item" onclick="tagClick('typescript')">typescript</a>
                                                            <a class="dropdown-item" onclick="tagClick('react')">react</a>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <!--parameter 4 : 글내용-->
                                        <div id="cont-sec">
                                            <textarea id="summernote" name="editordata"></textarea>
                                        </div>
                                        <div id="button-sec">
                                            <ul>
                                                <li>글등록</li>
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

  $(document).ready(function() {
    $('#summernote').summernote({
      height: 300,                 // 에디터 높이
      minHeight: null,             // 최소 높이
      maxHeight: null,             // 최대 높이
      focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
      lang: "ko-KR",					// 한글 설정
      placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
    });
  });

function tagClick(name){
    console.log(name);

    let tagArea = document.querySelector('#lang-sec-ul');
    let new_pTag = document.createElement('li');

    new_pTag.setAttribute('class', 'mini-tag');
    new_pTag.innerHTML = name+" ";
    new_pTag.innerHTML +='<span onclick=tagRemove('+name+')>x</span>';
    tagArea.appendChild(new_pTag);
}
function tagRemove(name){
    console.log(name); /*this target 써볼것*/
}
</script>
</html>