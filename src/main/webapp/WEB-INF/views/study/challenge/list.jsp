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

                                <div class="studylist-header bg-ssff1 d-inline-block w-100 p-8 pt-40 rounded-xl text-white text-center">
                                    <!--스터디리스트 헤더 초록색 부분-->
                                    <h1>챌린지 팀원 찾기</h1>
                                    <h3>인생을 바꿀 습관을 만들어 보세요!삼삼오오가 도와드립니다</h3>
                                    <br><br>
                                    <ul class="list-style-none">
                                        <li><a href="/study/challenge/postGo"><img src="../../../../resources/assets/image/writingBtn.png" width="70px"></a></li>
                                        <li>글쓰러 가기!</li>
                                    </ul>
                                </div>

                                <div class="studylist-nav d-inline-block w-100 mt-4 mb-4 pt-4 pb-4 rounded-xl shadow">
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
                                    <div id="listing-latest-order" class="left-items order-selected">최신순</div>
                                    <div d="listing-popularity-order" class="left-items" onclick="orderSelected('popularity')">인기순</div>
                                    <div class="right-items align-items-end">
                                        <input type="checkbox" id="closedException" name="closedException"
                                               style="zoom:1.3;">
                                        <label for="closedException">마감 제외</label>
                                    </div>
                                </div>

                                <div class="studylist-content-wrapper">
                                    <!--내용 wrapper-->
                                    <ul class="studylist-content-ul">
                                        <!--비동기로 내용 뿌려짐-->
                                        <!---------------------->
                                    </ul>
                                </div>

                                <div id="pagination mt-10 d-flex justify-content-between align-items-center flex-wrap">
                                    <ul id="pagination-ul">
                                        <!--비동기로 내용 뿌려짐-->
                                        <!---------------------->
                                    </ul>
                                </div>
                            </div>
                            <!----------------------------------------------------------------------------------------------------------------------------->
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
    //페이지단 만듦
    createBoardPage();
    //1페이지에 해당하는 board 자료 가져오기
    getBoardsByPageNum(1);
  });
  /*==========================function==========================*/
  // 모집완료는 회색으로 보이게 하는 로직 ///////////////////
  function closed_status(){
    if(document.querySelector('.status-y') !=null){
      let tagArea = document.querySelector('.status-y');
      let new_Tag = document.createElement('div');
      new_Tag.setAttribute('class', 'closed-ok-indicator');
      new_Tag.innerHTML = '모집완료';
      tagArea.appendChild(new_Tag);
    }
  }//closed_status
  function createBoardPage(){
    if (sc.totalPage === 0) {
      sc.totalPage = 1;
      //총페이지수 = 총게시물/페이지당글갯수 이며 page 0 일때에는 1로 친다
    }
    let html = "<ul id='pagination-ul'>";
    if (sc.currentBlock != 1) { //현재 첫번째 블록이 아니면 ≪를 붙인다
      html += "<li class=\"btn btn-icon btn-light-primary mr-2 my-1\"><a onclick='previousBoardPage()'>≪</a></li>";
    }
    let firstPageInBoard;
    if (sc.currentBlock === 1) {
      firstPageInBoard = 1; ////첫번째 블록에 있으면 그 블록의 첫페이지는1이다
    } else {
      firstPageInBoard = (sc.currentBlock - 1) * sc.pagePerBlock + 1;
      //첫번째 블록이 아니라면 그 블록의 첫페이지는 (현재페이지-1)*5+1 이다
    }
    for (let i = firstPageInBoard; i < sc.totalPage + 1; i++) {//시작페이지부터 총페이지수까지
      if (sc.currentBlock === 1) {//case1 : 1페이지일경우
        html += "<li class=\"btn btn-icon btn-light-primary mr-2 my-1\" onclick='getBoardsByPageNum("+i+")'>"+i+"</li>";//[1]~[5]찍어주구
        /*html += "<li><a href='/study/challenge/list?page=" + i + "'>" + i + "</a></li>";*/
        if (i === sc.pagePerBlock) {//i가 한페이지당 보여줄 블록수와 같아지면
          i = sc.totalPage + 1;//i 그만돌리고 끝내겠다
        }
      } else if ((sc.currentBlock - 1) * sc.pagePerBlock < i && sc.currentBlock * sc.pagePerBlock >= i) {
        //case2 : [6]~[10] ,[11]~[15]등 i가 한블록내의 첫숫자와 끝숫자 내에 위치한 경우
        html += "<li class=\"btn btn-icon btn-light-primary mr-2 my-1\" onclick='getBoardsByPageNum("+i+")'>"+i+"</li>";
        /*html += "<li><a href='/study/challenge/list?page=" + i + "'>" + i + "</a></li>";*/
        //[6]~[10] 찍어주고 끝내겠다
      } else {//이도 저도 아니면 i 수 올려서 끝내겠다
        i = sc.totalPage + 1;
      }
    }
    if (sc.currentBlock != sc.totalBlock) {
      html += "<li class=\"btn btn-icon btn-light-primary mr-2 my-1\" onclick='getBoardsByPageNum("+sc.totalPage+")'>"+ sc.totalPage + "</li>";
      html += "<li class=\"btn btn-icon btn-light-primary mr-2 my-1\"><a>...</a></li>";
      /*html += "<li><a href='/study/challenge/list?page=" + sc.totalPage + "'>" + sc.totalPage + "</a></li>";*/
      html += "<li class=\"btn btn-icon btn-light-primary mr-2 my-1\"><a onclick='nextBoardPage()'>≫</a></li>";
    }
    html += "</ul>";
    $('#pagination-ul').html(html);
  }//createBoardPage
  function previousBoardPage() {
    sc.currentBlock--;
    if (sc.currentBlock === 0) {
      alert('처음 페이지입니다.');
    } else {
      createBoardPage(sc);
    }
  }//previousBoardPage
  function nextBoardPage() {
    sc.currentBlock++;
    if (sc.totalBlock < sc.currentBlock) {
      alert('마지막 페이지입니다.');
    } else {
      createBoardPage(sc);
    }
  }//nextBoardPage
  function getBoardsByPageNum(pageNum){
    let jsonData ={
      pageNum:pageNum
    }
    $.ajax({
      url:"/studyRest/challenge/list",
      type:"POST",
      dataType:"json",
      contentType:"application/json",
      data:JSON.stringify(jsonData),
      success:function(response){
        if(response){
          createBoardTable(response);
          cateColorChangeCSS();
          closed_status();
        }else{
          alert("error occured")
        }
      },
      error : function(request,status,error){
        console.log(error);
      }
    })
  }//getBoardsByPageNum
  function createBoardTable(list){
    let html = "";
    for(let i=0;i<list.length;i++){
      html +='<li class="studylist-content status-'+list[i].closed_ok+'">';
      html +=   '<p class="studylist-content-title"><a href="/study/challenge/detail?r_idx='+list[i].r_idx+'">'+list[i].title+'</a></p>';
      html +=   '<ul class="studylist-content-info">';
      html +=       '<li><span class="span-sido">'+list[i].sido+' </span> 의,</li>';
      html +=       '<li style="margin-top:10px"><span class="span-cate color-'+list[i].ch_pattern+'">'+list[i].ch_pattern+'</span></li>';
      html +=   '</ul>';
      html +=   '<ul class="studylist-hitAndRepl">';
      html +=       '<li><img src="../../../../resources/assets/image/repl.png" width="15px"></li>';
      html +=       '<li class="replyCount">'+list[i].reply_count+'</li>';
      html +=       '<li><img src="../../../../resources/assets/image/hit.png" width="15px"></li>';
      html +=       '<li>'+list[i].hit+'</li>';
      html +=   '</ul>';
      html +='</li>';
    }
    $('.studylist-content-ul').html(html);
  }//createBoardTable
  function cateColorChangeCSS(){
    $(".color-생활습관.스터디").css("backgroundColor", "rgb(255,51,153)");
    $(".color-취업.스터디").css("backgroundColor", "rgb(204,204,0)");
    $(".color-시험준비.스터디").css("backgroundColor", "rgb(24,114,0)");
    $(".color-어학.스터디").css("backgroundColor", "rgb(51,204,204)");
    $(".color-기타").css("backgroundColor", "rgb(153,102,255)");
  }//cateColorChangeCSS
  function orderSelected(orderType){
    if(orderType == 'latest'){
      //latest의 클래스에 order-selected 추가
      //latest onclick 이벤트 삭제
      //popularity 에 onclick 이벤트 추가
    }else if(orderType == 'popularity'){
      //popularity의 클래스에 order-selected 추가
      //popularity onclick 이벤트 삭제
      //latest 에 onclick 이벤트 추가
    }
  }//orderSelected
</script>
</html>