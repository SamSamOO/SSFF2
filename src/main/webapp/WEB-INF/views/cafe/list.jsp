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
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
  />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  
  <style>
    /* ---------- carousel ---------- */
    body{
      background:#000;
    }

    #cafeListCardLow li{ /* bundle이랑 겹쳐서 안들어감 화가남 TODO 고쳐야해 */
      -webkit-box-sizing: content-box;
      box-sizing: content-box;
      -webkit-box-flex: 0;
      -ms-flex: 0 1 auto;
      flex: 0 1 auto;
      /*width: 30px;*/
      height: 3px;
      margin-right: 5px;
      margin-left: 5px;
      text-indent: -999px;
      cursor: pointer;
      background-color: #ffffff;
      /*background-clip: padding-box;*/
      /*border-top: 10px solid transparent;*/
      /*border-bottom: 10px solid transparent;*/
      opacity: .5;
      -webkit-transition: opacity 0.6s ease;
      transition: opacity 0.6s ease;
    }

    section.awSlider{
      margin:0px auto;
      padding:20px;
      position:relative;
      display:table;
      -webkit-touch-callout: none;
      -webkit-user-select: none;
      -khtml-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
    }

    section.awSlider:hover > img{
      -ms-transform: scale(1.2);
      -webkit-transform: scale(1.2);
      transform: scale(1.2);
      opacity:1;
    }

    section.awSlider img{
      pointer-events: none;
    }

    section.awSlider > img{
      position:absolute;
      top:30px;
      z-i:1;
      transition:all .3s;
      filter: blur(1.8vw);
      -webkit-filter: blur(2vw);
      -moz-filter: blur(2vw);
      -o-filter: blur(2vw);
      -ms-filter: blur(2vw);
      -ms-transform: scale(1.1);
      -webkit-transform: scale(1.1);
      transform: scale(1.1);
      opacity:.5;
    }
    /* ---------- carousel ---------- */

    /* ---------- card-body ---------- */
  
  </style>
  
  <!--head.html Include-->
  <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>
</head>

<!----------------Head 종료----------------------->
<!----------------Body 시작----------------------->

<body id="kt_body" class="header-fixed subheader-enabled page-loading">
<!----------------메인 시작----------------------->
<div class="d-flex flex-column flex-root"> <div class="tttt"></div>
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
              <div class="row" id="cafeListCardLow">
              
                
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
  
  
              
  console.log("g힘들어잉")

  $(document).ready(function () {
    start.init();
    console.log("start.init();")

  });

  var start = {
    param: {
      curPage     : 1,
      pageListSize: 18,
    },

    init     : function () {
      this.testData();
      this.testEvent();
    },
    testData : function () {
      start.testAjax();
      // this.setListItems(data); // 첫 진입시 데이터 셋팅
    },
    testEvent: function () {
      // 무한 스크롤
      $(window).scroll(function () {
        console.log("scroll;")

        // 맨 밑으로 스크롤이 갔을경우 if문을 탑니다.
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
          console.log("scrollTop;")
          start.param.curPage++; // 현재 페이지에서 +1 처리.

          start.testAjax(); //ajax 호출
        }
      });
    },
    // 무한 스크롤 ajax 요청
    testAjax: function () {
      $.ajax({
               type       : 'POST',
               url        : '/cafe/listData',
               data       : JSON.stringify(start.param), // 다음 페이지 번호와 페이지 사이즈를 가지고 갑니다.
               dataType   : 'json',
               contentType: "application/json; charset=utf-8",
               success    : successCallback,
               error      : errorCallback
             });

      // 성공
      function successCallback(data) {
        console.log("data: " + data.cafeList.length);
        console.log("data: " + data.cafeList[1].cafe_idx); // cafe_idx_10
        console.log("data: " + data.cafeList[1].roomImgs[1]); // 10번카페의 2번이미지입니다
        console.log("data: " + data.cafeList[1].roomImgs.length); // 14

        if (data.cafeList.length == 0) {
          // $(".gridList").append('<div class="noList"><span>표시할 항목이 없습니다.</span></div>');
          alert("더이상 표시할 항목이 없습니다");
        }
        if (data.length != 0) {
          // testLoading.show(); //로딩바 on
          start.setListItems(data);  //테스트 데이터 리스트 입니다.
          // testLoading.hide(); //로딩 off
        }
      }

      // 실패
      function errorCallback() {
        alert("실패");
      }
    },

    // 데이터 setting
    setListItems: function (data) {

      let templet =
              `<!--begin::Col-->
              <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                <!--begin::Card-->
                <div class="card card-custom gutter-b card-stretch">

                  <section class="awSlider">
                    <div  class="carousel slide" data-ride="carousel">
                      <!-- Indicators -->
                      <ol class="carousel-indicators">
                      </ol>
              
                      <!-- Wrapper for slides -->
                      <div class="carousel-inner" role="listbox">
                      </div>
              
                      <!-- Controls $aPrev $aNext -->
                    </div>
                  </section>

                </div>
<!--end::Card-->
              </div>
<!--end::Col-->`

      console.log("템플릿 셋팅 완료했다 이거라고!");
      console.log("data.cafeList[i].length" + data.cafeList[0].length);

      let mainTitle = '';
      let subTitle = '';
      let amountHour = '';
      let maxPeople = '';
      let link = '';

      for (let i = 0; i < data.cafeList.length; i++) {

        // 기본 구조 셋팅!
        $('#cafeListCardLow').append(templet);

        console.log("이거 data" + data);
        console.log("이거 data.cafeList[i].roomImgs.length : " + data.cafeList[0].roomImgs.length);

        // cafe, room의 이미지 개수만큼 이미지 슬라이드 버튼을 동적 생성
        for (let j = 0; j < data.cafeList[i].roomImgs.length; j++) {
          $li = $('<li>', {
            "data-target"  : ".carousel",
            "data-slide-to": j,
          });
          $('ol').eq(i).append($li); // ol에 넣고

          let $div = $('<div>').addClass("carousel-caption")
          let $item = $('<div>').addClass("item")
                                .append($('<img>').attr("src", "http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-1051.jpg"/*data.cafeList[i].roomImgs[j]*/))
                                .append($div);

          $('.carousel-inner').eq(i).append($item);

        } // for

        $('.carousel-indicators').eq(i).children().eq(0).addClass("active");
        $('.carousel-inner').eq(i).children().eq(0).addClass("active");

        let $aPrev = $('<a>', {
          class       : "left carousel-control",
          href        : ".carousel",
          role        : "button",
          "data-slide": "prev"
        }).append(
            $('<span>', {
              class        : "glyphicon glyphicon-chevron-left",
              "aria-hidden": "true"
            }))

        let $aNext = $('<a>', {
          class       : "right carousel-control",
          href        : ".carousel",
          role        : "button",
          "data-slide": "next"
        }).append(
            $('<span>', {
              class        : "glyphicon glyphicon-chevron-right",
              "aria-hidden": "true"
            }))

        $('.carousel.slide').eq(i).append($aPrev, $aNext);

        mainTitle = String(data.cafeList[i].cafe_main_title);
        subTitle = String(data.cafeList[i].cafe_sub_title);
        amountHour = String(data.cafeList[i].amount_hour);
        maxPeople = String(data.cafeList[i].max_people);
        link = String("아직몰라잉~");

        let cardHtml;
        cardHtml = `
    <!--begin::Body-->
         <div class="card-body pt-4" style="flex: 1 1 auto; padding: 1px 2rem 2rem 2rem!important;">
           <span class="text-dark-75 font-weight-bolder" style="font-size: 20px !important;">
                  ` + mainTitle + `</span>
           <!--begin::Info-->
           <div class="mb-7">
             <div class="d-flex justify-content-between align-items-center">
               <span class="text-dark-75 mr-2">
                  ` + subTitle + `</span>
             </div>
             <div class="d-flex justify-content-between align-items-center my-1">

               <span class="text-dark-75 font-weight-bolder"
                       style="color: #bf7e00; font-size: 18px !important;">
                   ` + amountHour + `
                 <em class="text-dark-75"  style="font-size: 10px !important;">원/시간</em>
               </span>
               <span class="text-dark-75" style="float: right; margin-top: 10px"><i
                 class="fa fa-users" ></i> 최대
            ` + maxPeople + `인</span>
            </div>
           </div><a href="detail링크"
                    class="btn btn-block btn-sm btn-light-success
                           font-weight-bolder text-uppercase py-4">예약하기</a></div>`

        $('.card.card-custom.gutter-b.card-stretch').eq(i).append(cardHtml);

        
      }
      

    }
  }


</script>
</html>