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

                                <div class="studylist-header">
                                    <!--스터디리스트 헤더 주황색 부분-->
                                    <h1>프로젝트 팀원 찾기</h1>
                                    <h3>프로젝트를 함께할 든든한 팀원을 삼삼오오에서 찾아보세요</h3>
                                    <ul style="padding-top:40px">
                                        <li><a href="/study/project/postGo"><img
                                                src="../../../../resources/assets/image/writingBtn.png"
                                                width="70px"></a></li>
                                        <li>글쓰러 가기!</li>
                                    </ul>
                                </div>

                                <div class="studylist-nav">
                                    <!--스터디리스트 중간 로고 박힌 네비 부분-->
                                    <ul class="logo-to-sort">
                                        <li><img
                                                src="../../../../resources/assets/image/javascript.png"
                                                width="50px"></li>
                                        <li><img
                                                src="../../../../resources/assets/image/typescript.png"
                                                width="50px"></li>
                                        <li><img src="../../../../resources/assets/image/react.png"
                                                 width="50px"></li>
                                        <li><img src="../../../../resources/assets/image/vue.png"
                                                 width="50px"></li>
                                        <li><img
                                                src="../../../../resources/assets/image/node_js.png"
                                                width="50px"></li>
                                        <li><img src="../../../../resources/assets/image/java.png"
                                                 width="50px"></li>
                                        <li><img src="../../../../resources/assets/image/spring.png"
                                                 width="50px"></li>
                                        <li><img src="../../../../resources/assets/image/kotlin.png"
                                                 width="50px"></li>
                                        <li><img src="../../../../resources/assets/image/c++.png"
                                                 width="50px"></li>
                                        <li><img src="../../../../resources/assets/image/go.png"
                                                 width="50px"></li>
                                        <li><img src="../../../../resources/assets/image/python.png"
                                                 width="50px"></li>
                                        <li><img src="../../../../resources/assets/image/django.png"
                                                 width="50px"></li>
                                        <li><img
                                                src="../../../../resources/assets/image/flutter.png"
                                                width="50px"></li>
                                        <li><img src="../../../../resources/assets/image/swift.png"
                                                 width="50px"></li>
                                    </ul>
                                </div>

                                <div class="studylist-sort">
                                    <!--스터디리스트 버튼 있는 부분-->
                                    <div id="listing-latest-order" class="left-items order-selected">최신순</div>
                                    <div id="listing-popularity-order" class="left-items" onclick="orderSelected('popularity')">인기순</div>
                                    <div class="right-items">
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
                                                        src="../../../../resources/assets/image/${langs}.png"
                                                        width="40px"></li>
                                                </c:forEach>
                                            </ul>

                                            <ul class="studylist-hitAndRepl">
                                                <li><img
                                                        src="../../../../resources/assets/image/repl.png"
                                                        width="15px"></li>
                                                <li>${list.reply_count}</li>
                                                <li><img
                                                        src="../../../../resources/assets/image/hit.png"
                                                        width="15px"></li>
                                                <li>${list.hit}</li>
                                            </ul>
                                        </li>
                                        </c:forEach>
                                    </ul>
                                </div>

                                <div id="pagination">
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
      html += "<li><a onclick='previousBoardPage()'>≪</a></li>";
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
        html += "<li onclick='getBoardsByPageNum("+i+")'>"+i+"</li>";//[1]~[5]찍어주구

        if (i === sc.pagePerBlock) {//i가 한페이지당 보여줄 블록수와 같아지면
          i = sc.totalPage + 1;//i 그만돌리고 끝내겠다
        }

      } else if ((sc.currentBlock - 1) * sc.pagePerBlock < i && sc.currentBlock * sc.pagePerBlock >= i) {
        //case2 : [6]~[10] ,[11]~[15]등 i가 한블록내의 첫숫자와 끝숫자 내에 위치한 경우
        html += "<li onclick='getBoardsByPageNum("+i+")'>"+i+"</li>";

        //[6]~[10] 찍어주고 끝내겠다
      } else {//이도 저도 아니면 i 수 올려서 끝내겠다
        i = sc.totalPage + 1;
      }
    }


    if (sc.currentBlock != sc.totalBlock) {
      html += "<li><a>...</a></li>";
      html +=  "<li onclick='getBoardsByPageNum("+sc.totalPage+")'>"+ sc.totalPage + "</li>";
      html += "<li><a onclick='nextBoardPage()'>≫</a></li>";
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
      url:"/studyRest/project/list",
      type:"POST",
      dataType:"json",
      contentType:"application/json",
      data:JSON.stringify(jsonData),
      success:function(response){
        if(response){
          createBoardTable(response);
          closed_status();
          ifNoLogoInsertQuestion();
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
      html +=   '<p class="studylist-content-title"><a href="/study/project/detail?r_idx='+list[i].r_idx+'">'+list[i].title+'</a></p>';
      html +=   '<ul class="studylist-content-logo">';
        for(let j=0;j<list[i].langs.length;j++){
          html +=   '<li><img src="../../../../resources/assets/image/'+list[i].langs[j]+'.png" width="40px"></li>';
        }
      html +=   '</ul>';
      html +=   '<ul class="studylist-hitAndRepl">';
      html +=       '<li><img src="../../../../resources/assets/image/repl.png" width="15px"></li>';
      html +=       '<li>'+list[i].reply_count+'</li>';
      html +=       '<li><img src="../../../../resources/assets/image/hit.png" width="15px"></li>';
      html +=       '<li>'+list[i].hit+'</li>';
      html +=   '</ul>';
      html +='</li>';

    }
    $('.studylist-content-ul').html(html);

  }//createBoardTable

  function ifNoLogoInsertQuestion(){
    $( '.studylist-content-logo:not(:has( li ))' )
    .prepend('<li><img src="../../../../resources/assets/image/question.png" width="40px"></li>');
  }//ifNoLogoInsertQuestion

  function orderSelected(orderType){
    if(orderType == 'latest'){
      //latest의 클래스에 order-selected 추가&popularity의 클래스에 order-selected 삭제
      $('#listing-latest-order').addClass('order-selected');
      $('#listing-popularity-order').removeClass('order-selected');
      //latest onclick 이벤트 삭제
      $('#listing-latest-order').removeAttr('onclick');
      $('#listing-popularity-order').attr('onclick','orderSelected("popularity")');
    }else if(orderType == 'popularity'){
      //popularity의 클래스에 order-selected 추가&latest의 클래스에 order-selected 삭제
      $('#listing-popularity-order').addClass('order-selected');
      $('#listing-latest-order').removeClass('order-selected');
      //popularity onclick 이벤트 삭제&latest 에 onclick 이벤트 추가
      $('#listing-popularity-order').removeAttr('onclick');
      $('#listing-latest-order').attr('onclick','orderSelected("latest")');

    }
  }//orderSelected

</script>
</html>