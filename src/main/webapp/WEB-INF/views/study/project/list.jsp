<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<!----------------Head 시작----------------------->

<head>

    <title>프로젝트 리스트</title>

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
            <div class="d-flex flex-column container">
                <!--contents.html Include-->
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
                                    <h5 class="text-dark font-weight-bolder my-1 mr-5">프로젝트 찾기</h5>
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

                                <div class="studylist-header bg-ssff2 d-inline-block w-100 p-8 pt-40 rounded-xl text-white text-center">
                                    <!--스터디리스트 헤더 주황색 부분-->
                                    <h1>프로젝트 팀원 찾기</h1>
                                    <h3>프로젝트를 함께할 든든한 팀원을 삼삼오오에서 찾아보세요</h3>
                                    <ul class="list-style-none">
                                        <li><a href="/study/project/postGo">
                                            <img src="/resources/assets/images/button/writingBtn.png"
                                                 width="70px"></a></li>
                                        <li>글쓰러 가기!</li>
                                    </ul>
                                </div>

                                <div class="studylist-nav d-inline-block w-100 mt-4 mb-4 pt-4 rounded-xl shadow">
                                    <!--스터디리스트 중간 로고 박힌 네비 부분-->
                                    <ul class=" logo-to-sort d-flex flex-wrap justify-content-center ">
                                        <li><img src="/resources/assets/images/logos/language/javascript.png"
                                                 width="50px" onclick="logoClicked('javascript')" id="logo_javascript"></li>
                                        <li><img src="/resources/assets/images/logos/language/typescript.png"
                                                 width="50px" onclick="logoClicked('typescript')" id="logo_typescript"></li>
                                        <li><img src="/resources/assets/images/logos/language/react.png"
                                                 width="50px" onclick="logoClicked('react')" id="logo_react"></li>
                                        <li><img src="/resources/assets/images/logos/language/vue.png"
                                                 width="50px" onclick="logoClicked('vue')" id="logo_vue"></li>
                                        <li><img src="/resources/assets/images/logos/language/node_js.png"
                                                 width="50px" onclick="logoClicked('node_js')" id="logo_node_js"></li>
                                        <li><img src="/resources/assets/images/logos/language/java.png"
                                                 width="50px" onclick="logoClicked('java')" id="logo_java"></li>
                                        <li><img src="/resources/assets/images/logos/language/spring.png"
                                                 width="50px" onclick="logoClicked('spring')" id="logo_spring"></li>
                                        <li><img src="/resources/assets/images/logos/language/kotlin.png"
                                                 width="50px" onclick="logoClicked('kotlin')" id="logo_kotlin"></li>
                                        <li><img src="/resources/assets/images/logos/language/c++.png"
                                                 width="50px" onclick="logoClicked('c++')" id="logo_c++"></li>
                                        <li><img src="/resources/assets/images/logos/language/go.png"
                                                 width="50px" onclick="logoClicked('go')" id="logo_go"></li>
                                        <li><img src="/resources/assets/images/logos/language/python.png"
                                                 width="50px" onclick="logoClicked('python')" id="logo_python"></li>
                                        <li><img src="/resources/assets/images/logos/language/django.png"
                                                 width="50px" onclick="logoClicked('django')" id="logo_django"></li>
                                        <li><img src="/resources/assets/images/logos/language/flutter.png"
                                                 width="50px" onclick="logoClicked('flutter')" id="logo_flutter"></li>
                                        <li><img src="/resources/assets/images/logos/language/swift.png"
                                                 width="50px" onclick="logoClicked('swift')" id="logo_swift"></li>
                                    </ul>
                                </div>

                                <div class="studylist-sort">
                                    <!--스터디리스트 버튼 있는 부분-->
                                    <div id="listing-latest-order" class="left-items order-selected" onclick="orderSelected('latest')">최신순</div>
                                    <div id="listing-popularity-order" class="left-items" onclick="orderSelected('popularity')">인기순</div>
                                    <div class="right-items align-items-end">
                                        <input type="checkbox" id="closedException"
                                               name="closedException"
                                               style="zoom:1.3;">
                                        <label for="closedException">마감 제외</label>
                                    </div>
                                </div>

                                <div class="studylist-content-wrapper">
                                    <!--내용 wrapper-->


                                    <ul class="studylist-content-ul">
                                        <c:forEach var="list" items="${list}">
                                            <li class="studylist-content status-${list.closed_ok}">
                                                <p class="studylist-content-title"><a href="/study/project/detail?r_idx=${list.r_idx}">${list.title}</a></p>

                                                <ul class="studylist-content-logo">
                                                    <c:forEach var="langs" items="${list.langs}">
                                                        <li><img
                                                                src="/resources/assets/images/logos/language/${langs}.png"
                                                                width="40px"></li>
                                                    </c:forEach>
                                                </ul>

                                                <ul class="studylist-hitAndRepl">
                                                     <img
                                                            src="/resources/assets/images/icon/repl.png"
                                                            width="15px"></li>
                                                    <li>${list.reply_count}</li>
                                                    <li><img
                                                            src="/resources/assets/images/icon/hit.png"
                                                            width="15px"></li>
                                                    <li>${list.hit}</li>
                                                </ul>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>

                                <div id="pagination mt-10 d-flex justify-content-between align-items-center flex-wrap">
                                    <ul id="pagination-ul">
                                        <!--비동기로 내용 뿌려짐-->
                                        <!---------------------->
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

                                <jsp:include page="../../../commons/footer.jsp"/>

            </div>
            <!--컨테이너 종료-->
            <!--footer.html Include-->
</body>
<!----------------Body 종료----------------------->
<script>
  /*==========================variable==========================*/

  let sc = {
    totalPost: null,
    postPerPage: null,
    totalPage: null,
    currentPage: null,
    pagePerBlock: null,
    currentBlock: null,
    totalBlock: null
  }
  let currentOrderType = 'latest'; //최신순 인기순
  let checkbox = document.querySelector('input[id="closedException"]'); //마감제외
  let closedStatus = false; ///검색창
  let selectedLogoSet =[];//선택된 로고들
  /*==========================onload or eventListener==========================*/
  $(function(){
    getBoardsByPageNum(1, currentOrderType);
  });
  //마감 체크 관련
  checkbox.addEventListener('change', function(e) {
    closedStatus = e.target.checked;
    getBoardsByPageNum(1, currentOrderType);
  });

  /*==========================function==========================*/
  //로고선택
  function logoClicked(logo){
    if(selectedLogoSet.length ==0){ //초기에 logo가 아무것도 없을 경우
      selectedLogoSet.push(logo);
      $('#logo_'+logo).addClass('logo-selected');
    }else{
      for(let i=0;i<selectedLogoSet.length;i++){
        if(selectedLogoSet[i]==logo){
          deleteLogo(i);
          getBoardsByPageNum(1, currentOrderType);
          return;
        }
      }
      insertLogo(logo);
    }
    function deleteLogo(i){
      selectedLogoSet.splice(i, 1);
      $('#logo_'+logo).removeClass('logo-selected');
    }
    function insertLogo(logo){
      selectedLogoSet.push(logo);
      $('#logo_'+logo).addClass('logo-selected');
    }
    console.log("선택현황 : "+selectedLogoSet);
    getBoardsByPageNum(1, currentOrderType);
  }//logoClicked


  //페이징 출력
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
        html += "<li class=\"btn btn-icon btn-light-primary mr-2 my-1\" onclick='getBoardsByPageNum("+i+",currentOrderType,"+i+")'>"+i+"</li>";//[1]~[5]찍어주구
        /*html += "<li><a href='/study/challenge/list?page=" + i + "'>" + i + "</a></li>";*/
        if (i === sc.pagePerBlock) {//i가 한페이지당 보여줄 블록수와 같아지면
          i = sc.totalPage + 1;//i 그만돌리고 끝내겠다
        }
      } else if ((sc.currentBlock - 1) * sc.pagePerBlock < i && sc.currentBlock * sc.pagePerBlock >= i) {
        //case2 : [6]~[10] ,[11]~[15]등 i가 한블록내의 첫숫자와 끝숫자 내에 위치한 경우
        html += "<li class=\"btn btn-icon btn-light-primary mr-2 my-1\" onclick='getBoardsByPageNum("+i+",currentOrderType,"+i+")'>"+i+"</li>";
        /*html += "<li><a href='/study/challenge/list?page=" + i + "'>" + i + "</a></li>";*/
        //[6]~[10] 찍어주고 끝내겠다
      } else {//이도 저도 아니면 i 수 올려서 끝내겠다
        i = sc.totalPage + 1;
      }
    }
    if (sc.currentBlock != sc.totalBlock) {
      html += "<li class=\"btn btn-icon btn-light-primary mr-2 my-1\"><a>...</a></li>";
      html += "<li class=\"btn btn-icon btn-light-primary mr-2 my-1\" onclick='getBoardsByPageNum("+sc.totalPage+",currentOrderType,"+sc.totalPage+")'>"+ sc.totalPage + "</li>";

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

  //비동기로 게시글 정보 가져오기
  function getBoardsByPageNum(pageNum, orderRule, currentPage){
    console.log(selectedLogoSet);
    let jsonData ={
      pageNum:pageNum,
      orderRule :orderRule,
      closed :closedStatus,
      selectedLogoSet:selectedLogoSet+""
    }
    $.ajax({
      url:"/studyRest/project/list",
      type:"POST",
      dataType:"json",
      contentType:"application/json",
      data:JSON.stringify(jsonData),
      success:function(response){
        if(response){
          createBoardTable(response.boardList);
          setPageElementVar(response.boardTotal, currentPage)
          ifNoLogoInsertQuestion();
          createBoardPage();
        }else{
          alert("error occured")
        }
      },
      error : function(request,status,error){
        console.log(error);
      }
    })
  }//getBoardsByPageNum

  //criteria 설정
  function setPageElementVar(boardTotalLength, currentPage) {
    console.log(boardTotalLength, currentPage)
    sc.totalPost = boardTotalLength
    sc.totalPage = Math.ceil(sc.totalPost / 15)
    sc.postPerPage = 15
    sc.totalBlock = Math.ceil(sc.totalPage / 3)
    sc.pagePerBlock = 3
    if (!currentPage || currentPage == 1) sc.currentBlock = 1
    else {
      if (currentPage % sc.pagePerBlock == 0) sc.currentBlock = Math.floor(currentPage / sc.pagePerBlock)
      else sc.currentBlock = Math.floor(currentPage / sc.pagePerBlock) + 1
    }
    if (!currentPage) sc.currentPage = 1
    else sc.currentPage = currentPage
  }//setPageElementVar

  //게시글 내용 반복 채우기
  function createBoardTable(list){
    let html = "";
    for(let i=0;i<list.length;i++){
      html +='<li class="studylist-content status-'+list[i].closed_ok+'">';

      if (list[i].closed_ok === 'y') {
        html += '<div class=closed-ok-indicator>모집완료</div>'
      }

      html +=   '<p class="studylist-content-title"><a href="/study/project/detail?r_idx='+list[i].r_idx+'">'+list[i].title+'</a></p>';
      html +=   '<ul class="studylist-content-logo">';
      for(let j=0;j<list[i].langs.length;j++){
        html +=   '<li><img src="/resources/assets/images/logos/language/'+list[i].langs[j]+'.png" width="40px"></li>';
      }
      html +=   '</ul>';
      html +=   '<ul class="studylist-hitAndRepl">';
      html +=       '<li><img src="/resources/assets/images/icon/repl.png" width="15px"></li>';
      html +=       '<li>'+list[i].reply_count+'</li>';
      html +=       '<li><img src="/resources/assets/images/icon/hit.png" width="15px"></li>';
      html +=       '<li>'+list[i].hit+'</li>';
      html +=   '</ul>';
      html +='</li>';
    }
    $('.studylist-content-ul').html(html);
  }//createBoardTable

  function ifNoLogoInsertQuestion(){
    $( '.studylist-content-logo:not(:has( li ))' )
    .prepend('<li><img src="/resources/assets/images/logos/language/question.png" width="40px"></li>');
  }//ifNoLogoInsertQuestion

  function orderSelected(orderType) {
    if (currentOrderType === orderType) return
    if (orderType == 'latest') {
      $('#listing-popularity-order').removeClass('order-selected');
      $('#listing-latest-order').addClass('order-selected');
    } else if (orderType == 'popularity') {
      $('#listing-latest-order').removeClass('order-selected');
      $('#listing-popularity-order').addClass('order-selected');
    }//orderSelected
    currentOrderType = orderType
    getBoardsByPageNum(1, currentOrderType);
  }//orderSelected
</script>
</html>