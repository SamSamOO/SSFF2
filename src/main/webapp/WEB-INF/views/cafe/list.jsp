<%--
  스터디 카페 리스트 단
  User: 신지혜
  Date: 2021-11-05
  Time: 오후 3:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib	uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<%@taglib	uri="http://java.sun.com/jsp/jstl/fmt"	prefix="fmt" %>
<!DOCTYPE html>

<html lang="en">
<!----------------Head 시작----------------------->

<head>
  <title>cafeList</title>

  
  
  <!--head.html Include-->
  <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>
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
      <jsp:include page="/WEB-INF/commons/header.jsp"></jsp:include>
      <!------------------Header Wrapper : 메뉴 탭 시작------------------>
      <!--menu.html Include-->
      <jsp:include page="/WEB-INF/commons/menu_main.jsp"></jsp:include>
      <!------------------Header Wrapper : 메뉴 탭 종료------------------>
      <!--컨테이너 시작-->
      <div class="d-flex flex-row flex-column-fluid container">
        <!--contents.html Include-->
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
                  <h5 class="text-dark font-weight-bold my-1 mr-5">스터디 카페 리스트</h5>
                  <!--Page Title : 페이지 제목 종료-->
                  <!--Breadcrumb : 로드맵 시작-->
                  <ul
                    class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                    <li class="breadcrumb-item">
                      <a href="" class="text-muted">서브메뉴1</a>
                    </li>
                    <li class="breadcrumb-item">
                      <a href="/cafe/reservationList?세션아이디" class="text-muted">예약내역확인</a>
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
            <!------------------ 본문 시작 ------------------>
            <div class="자이제시작이야">
              <!--begin::Row-->
              <div class="row">
      
                <!--begin::Col-->
                <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                  <!--begin::Card-->
                  <div class="card card-custom gutter-b card-stretch">
                    <div id="image99">
                    <div><img src="../../../../resources/assets/images/1.png" title="cafe_idx" width="100%"></div>
                    <div><img src="../../../../resources/assets/images/2.png" title="cafe_idx" width="100%"></div>
                    <div><img src="../../../../resources/assets/images/3.png" title="cafe_idx" width="100%"></div>
                    </div>
                      <!--begin::Body-->
                    <div class="card-body pt-4" style="flex: 1 1 auto; padding: 1px 2rem 2rem 2rem!important;">
                      <span class="text-dark-75 font-weight-bolder" style="font-size: 28px !important;">[강남구] 메데메데 삼오오삼</span>
                      <!--begin::Info-->
                      <div class="mb-7">
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">Budget:</span>
                          <a href="#" class="text-muted text-hover-primary">$249,500</a>
                        </div>
                        <div class="d-flex justify-content-between align-items-cente my-1">
                          <span class="text-dark-75 font-weight-bolder mr-2">Expences:</span>
                          <a href="#" class="text-muted text-hover-primary">$76,810</a>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="text-dark-75 font-weight-bolder mr-2">Due Date:</span>
                          <span class="text-muted font-weight-bold">21.05.2016</span>
                        </div>
                      </div>
                      <!--end::Info-->
                      <a href="#" class="btn btn-block btn-sm btn-light-success font-weight-bolder text-uppercase py-4">예약하기</a>
                    </div>
                    <!--end::Body-->
                  </div>
                  <!--end:: Card-->
                </div>
                <!--end::Col-->
    
              </div>
              <!--begin::Row-->
            </div>
            <!------------------ 본문 종료 ------------------>
          
          </div>
        
        
        
        
        </div>
      
      </div>
      <!--컨테이너 종료-->
      <!--footer.html Include-->
      <jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</body>
<!----------------Body 종료----------------------->
<script>
  
  // 이미지 슬라이드
  $(function(){
    var winW=cnt=setId=0;

    resizeFn(); //함수 호출
    setTimeout(resizeFn, 100); //오픈하자마다 실행

    function resizeFn(){ //반응형 이미지크기 조정함수
      winW=$(window).innerWidth();

      $(".slide").css({width: winW}); //창크기에 슬라이드이미지 맞춤

    };

    $(window).resize(function(){
      resizeFn();	//창크기 변경될 때 마다 함수 반복 실행
    });

    autoplayFn(); //함수 호출

    function autoplayFn(){ //2.5초마다 슬라이드 자동 작동
      setId = setInterval(nextCountFn, 2500);
    };



    $(".pageBt").each(function(idx){ //page버튼 클릭시마다 해당 이미지로 이동
      $(this).click(function(){
        clearInterval(setId); //autoplay함수 정지
        cnt = idx;
        mainslideFn();
      });
    });


    function nextCountFn(){ //count(cnt)가 증가될때마다 슬라이드 작동
      cnt++;
      mainslideFn();
    };

    function prevCountFn(){ //count가 감소될때마다 슬라이드 작동
      cnt--;
      mainslideFn();
    };


    function mainslideFn(){ //메인슬라이드 함수
      $(".slideWrap").stop().animate({left: (-100*cnt)+"%"},600, function(){
        if(cnt>3){
          cnt=0; //count가 끝까지 이동했을때 다시 처음으로 돌아감
        }
        if(cnt<0){
          cnt=3
        }
        $(".slideWrap").stop().animate({left: (-100*cnt)+"%"},0)
      });
      $(".pageBt").removeClass("addPageBt");
      $(".pageBt").eq(cnt>3?cnt=0:cnt).addClass("addPageBt");
    };
    //animation사용시에는 stop을 넣어 부드럽게(덜컹거리지 않음)
    //count 변경시마다 버튼색깔 변경됨

  });







</script>
</html>