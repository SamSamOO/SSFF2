<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                                    <h5 class="text-dark font-weight-bolder my-1 mr-5">프로젝트 글쓰기</h5>
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
                                    <form action="/study/project/modify?r_idx=${board.r_idx}" method="post" id="article-form" class="article-form" role="form">
                                        <!--parameter 1 : 제목-->
                                        <div id="title-sec">
                                            <input type="text" id="title" name="title" value="${board.title}">
                                        </div>
                                        <!--parameter 2 : 팀네임-->
                                        <div id="teamname-sec">
                                            <input type="text" id="teamname" name="teamname" value="${board.teamname}">
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
                                                        <div id="dropdown-menu-id" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                            <a id ="dropdown-javascript" class="dropdown-item" onclick="tagClick('javascript')">javascript</a>
                                                            <a id ="dropdown-typescript" class="dropdown-item" onclick="tagClick('typescript')">typescript</a>
                                                            <a id ="dropdown-react" class="dropdown-item" onclick="tagClick('react')">react</a>
                                                            <a id ="dropdown-vue" class="dropdown-item" onclick="tagClick('vue')">vue</a>
                                                            <a id ="dropdown-node_js" class="dropdown-item" onclick="tagClick('node_js')">node_js</a>
                                                            <a id ="dropdown-java" class="dropdown-item" onclick="tagClick('java')">java</a>
                                                            <a id ="dropdown-spring" class="dropdown-item" onclick="tagClick('spring')">spring</a>
                                                            <a id ="dropdown-kotlin" class="dropdown-item" onclick="tagClick('kotlin')">kotlin</a>
                                                            <a id ="dropdown-c++" class="dropdown-item" onclick="tagClick('c++')">c++</a>
                                                            <a id ="dropdown-go" class="dropdown-item" onclick="tagClick('go')">go</a>
                                                            <a id ="dropdown-python" class="dropdown-item" onclick="tagClick('python')">python</a>
                                                            <a id ="dropdown-django" class="dropdown-item" onclick="tagClick('django')">django</a>
                                                            <a id ="dropdown-flutter" class="dropdown-item" onclick="tagClick('flutter')">flutter</a>
                                                            <a id ="dropdown-swift" class="dropdown-item" onclick="tagClick('swift')">swift</a>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <!--parameter 4 : 마감 여부 -->
                                        <div id="closed-sec">
                                            <ul>
                                                <li><span>마감 여부 :</span></li>
                                                <li><input type="radio" name="closed_ok" value="n" checked><label>&nbsp;모집중</label></li>
                                                <li><input type="radio" name="closed_ok" value="y"><label>&nbsp;마감</label></li>
                                            </ul>
                                        </div>
                                        <!--parameter 5 : 글내용-->
                                        <div id="cont-sec" style="margin-top:50px">
                                            <textarea id="summernote" name="cont">${board.cont}</textarea>
                                        </div>
                                        <div id="button-sec">
                                            <ul>
                                                <li onclick="document.querySelector('#article-form').submit();">수정하기</li>
                                                <li><a href="/study/project/detail?r_idx=${board.r_idx}">취소</a></li>
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
  }); //summernote 관련 설정

  let tag_count=0;  //선택한 태그 갯수 카운트. 0개부터 3개까지 가능

  function tagClick(name){
    if(tag_count>=3){
      alert("태그는 3개를 초과하여 지정할 수 없습니다.")
    }else{
      tag_count+=1;
      document.querySelector('#dropdown-'+name).remove(); //선택한 언어를 드롭다운에서 지워준다

      let tagArea = document.querySelector('#lang-sec-ul'); //태그를 추가할 곳을 정의해준다
      let new_Tag = document.createElement('li'); //li 태그를 생성해준다

      //생성한 태그에 속성과 내용을 채워준다
      new_Tag.setAttribute('class', 'mini-tag');
      new_Tag.setAttribute('id', name+'-tag');
      new_Tag.innerHTML = name+" ";
      new_Tag.innerHTML +='<span onclick=tagRemove(`'+name+'`) id="xButton-'+name+'">x</span>'; //x표 치는곳
      new_Tag.innerHTML +='<input type="hidden" id='+name+' name="tag" value='+name+'>';

      //태그를 추가할 곳 하위에 새로 생성된 태그를 넣어준다
      tagArea.appendChild(new_Tag);
    };

  }//tagClick

  function tagRemove(name){ //x버튼을 누르면 동작하는 함수
    document.querySelector('#'+name+'-tag').remove(); //태그를 삭제한다

    tag_count-=1;

    let tagArea = document.querySelector('#dropdown-menu-id');
    let new_Tag = document.createElement('a');

    //예시 : <a id ="dropdown-javascript" class="dropdown-item" onclick="tagClick('javascript')">javascript</a>
    new_Tag.setAttribute('id', 'dropdown-'+name);
    new_Tag.setAttribute('class', 'dropdown-item');
    new_Tag.setAttribute('onclick', 'tagClick(`'+name+'`)');

    new_Tag.innerHTML = name;
    tagArea.appendChild(new_Tag);

  }//tagRemove

</script>
</html>