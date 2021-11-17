<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="ko">
<!----------------Head 시작----------------------->

<head>

    <title>챌린지 리스트</title>

    <link href="../../../../resources/assets/css/yesol.css" rel="stylesheet" type="text/css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>

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
                                    <h5 class="text-dark font-weight-bold my-1 mr-5">프로젝트 찾기</h5>
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
                            <div class="card-header border-0 pt-5 card-body mt-5">
                                <!-----------------------------------------------이 안에서 자유롭게 채우기------------------------------------------------------>

                                <div class="studylist-header-chal">
                                    <!--스터디리스트 헤더 주황색 부분-->
                                    <h1>챌린지 팀원 찾기</h1>
                                    <h3>인생을 바꿀 습관을 만들어 보세요!삼삼오오가 도와드립니다</h3>
                                    <br><br>
                                    <ul>
                                        <li><a href="/study/challenge/postGo"><img src="../../../../resources/assets/image/writingBtn.png" width="70px"></a></li>
                                        <li>글쓰러 가기!</li>
                                    </ul>
                                </div>

                                <div class="studylist-nav">
                                    <!--스터디리스트 중간 로고 박힌 네비 부분-->

                                    <div class="dropdown-to-sort">


                                        <div class="dropdown-label">유형 :</div>

                                        <div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle" type="button"
                                                    data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">
                                                유형을 선택해 주세요
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="#">유형1</a>
                                                <a class="dropdown-item" href="#">유형2</a>
                                                <a class="dropdown-item" href="#">유형3</a>
                                            </div>
                                        </div>

                                        <div class="dropdown-label">지역 :</div>

                                        <div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle" type="button"
                                                    data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">
                                                시도
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="#">서울특별시</a>
                                                <a class="dropdown-item" href="#">경기도</a>
                                                <a class="dropdown-item" href="#">온라인</a>
                                            </div>
                                        </div>
                                        <div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle" type="button"
                                                    data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">
                                                시군구
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="#">시군구1</a>
                                                <a class="dropdown-item" href="#">시군구2</a>
                                                <a class="dropdown-item" href="#">시군구3</a>
                                            </div>
                                        </div>


                                    </div>

                                </div>

                                <div class="studylist-sort">
                                    <!--스터디리스트 버튼 있는 부분-->
                                    <div class="left-items">최신순</div>
                                    <div class="left-items">인기순</div>
                                    <div class="right-items">
                                        <input type="checkbox" id="closedException" name="closedException"
                                               style="zoom:1.3;">
                                        <label for="closedException">마감 제외</label>
                                    </div>
                                </div>

                                <div class="studylist-content-wrapper">
                                    <!--내용 wrapper-->


                                    <ul class="studylist-content-ul">
                                        <c:forEach items="${list}" var="list">
                                            <li class="studylist-content status-${list.closed_ok}">
                                                <p class="studylist-content-title"><a href="/study/challenge/detail?r_idx=${list.r_idx}">${list.title}</a></p>

                                                <ul class="studylist-content-info">
                                                    <li><span class="span-sido">${list.sido} </span> 의,</li>
                                                    <li style="margin-top:10px"><span class="span-cate" >${list.ch_pattern} </span></li>
                                                </ul>

                                                <ul class="studylist-hitAndRepl">
                                                    <li><img src="../../../../resources/assets/image/repl.png" width="15px"></li>
                                                    <li>99</li>
                                                    <li><img src="../../../../resources/assets/image/hit.png" width="15px"></li>
                                                    <li>${list.hit}</li>
                                                </ul>
                                            </li>
                                        </c:forEach>

                                    </ul>

                                </div>
                                <div id="pagination">
                                    <ul id="pagination-ul">
                                        <li>맨앞으로</li>
                                        <li>이전페이지</li>
                                        <li>1</li>
                                        <li>2</li>
                                        <li>3</li>
                                        <li>4</li>
                                        <li>5</li>
                                        <li>다음페이지</li>
                                        <li>맨뒤로</li>
                                    </ul>
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
  let sc = {
    totalPost: ${studyCriteria.totalPost},
    postPerPage: ${studyCriteria.postPerPage},
    totalPage: ${studyCriteria.totalPage},
    currentPage: ${studyCriteria.currentPage},
    pagePerBlock: ${studyCriteria.pagePerBlock},
    currentBlock: ${studyCriteria.currentBlock},
    totalBlock: ${studyCriteria.totalBlock}
  }
  $(function(){
    // 모집완료는 회색으로 보이게 하는 로직 ///////////////////

    closed_status();

    //페이징 관련 찍어보기
    console.log("sc.totalPost:"+sc.totalPost);
    console.log("sc.postPerPage:"+sc.postPerPage);
    console.log("sc.totalPage:"+sc.totalPage);
    console.log("sc.currentPage:"+sc.currentPage);
    console.log("sc.pagePerBlock:"+sc.pagePerBlock);
    console.log("sc.currentBlock:"+sc.currentBlock);
    console.log("sc.totalBlock:"+sc.totalBlock);
  });

  function closed_status(){
    let tagArea = document.querySelector('.status-y');
    let new_Tag = document.createElement('div');
    new_Tag.setAttribute('class', 'closed-ok-indicator');
    new_Tag.innerHTML = '모집완료';
    tagArea.appendChild(new_Tag);
  }

</script>
</html>