<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html lang="ko">
<!----------------Head 시작----------------------->

<head>
  <link href="../../../../resources/assets/css/yesol.css" rel="stylesheet" type="text/css">
  <title>"엮인글" 팀의 메인페이지</title><!--r_idx로 스터디 팀네임 가져올것-->
  <!--fullcalendar 관련 설정----------------------------->
  <link href="../../../../resources/assets/fullcalendar/modal.css" rel="stylesheet"/>
  <link href='../../../../resources/assets/fullcalendar/fullcalendar/lib/main.css'
        rel='stylesheet'/>
  <script src='../../../../resources/assets/fullcalendar/fullcalendar/lib/main.js'></script>
  <script src='../../../../resources/assets/fullcalendar/script.js'></script>
  <link href="../../../../resources/assets/css/yesol.css" rel="stylesheet" type="text/css">
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
          referrerpolicy="no-referrer"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/highcharts-more.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
  <script src="https://code.highcharts.com/modules/export-data.js"></script>
  <script src="https://code.highcharts.com/modules/accessibility.js"></script>
  <input type="hidden" id="member_name" name="member_name" value="${member.member_name}">
  <!--이 페이지로 접근한 아이디-->
  <input type="hidden" id="r_idx" name="r_idx" value=${map.get("r_Idx")}><!--이 페이지의 스터디번호-->
  
  <style>
    #container {
      height: 400px;
    }

    .highcharts-figure,
    .highcharts-data-table table {
      min-width: 320px;
      max-width: 800px;
      margin: 1em auto;
    }

    .highcharts-data-table table {
      font-family: Verdana, sans-serif;
      border-collapse: collapse;
      border: 1px solid #ebebeb;
      margin: 10px auto;
      text-align: center;
      width: 100%;
      max-width: 500px;
    }

    .highcharts-data-table caption {
      padding: 1em 0;
      font-size: 1.2em;
      color: #555;
    }

    .highcharts-data-table th {
      font-weight: 600;
      padding: 0.5em;
    }

    .highcharts-data-table td,
    .highcharts-data-table th,
    .highcharts-data-table caption {
      padding: 0.5em;
    }

    .highcharts-data-table thead tr,
    .highcharts-data-table tr:nth-child(even) {
      background: #f8f8f8;
    }

    .highcharts-data-table tr:hover {
      background: #f1f7ff;
    }

    #floatdiv {
      position: fixed;
      width: 175px;
      display: inline-block;
      right: 0px; /* 창에서 오른쪽 길이 */
      top: 94%; /* 창에서 위에서 부터의 높이 */
      background-color: transparent;
      margin: 0;
    }
  
  </style>
  <script>
    let r_idx = document.querySelector('#r_idx').value;
    let calendarData

    async function doGetCalendarData() {
      calendarData = await getFullCalendarData(r_idx);
    }

    doGetCalendarData()

    if (!calendarData) {
      calendarData = exmapleData()
    }
    let calendar
    let currentEvent

    document.addEventListener('DOMContentLoaded', function () {
      let calendarEl = document.getElementById('calendar')
      calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        // initialDate: '2021-11-07',
        headerToolbar: {
          left  : 'prev,next today',
          center: 'title',
          right : 'registAttendance,addEventButton'//addEventButton,dayGridMonth,timeGridWeek,timeGridDay
        },
        selectable   : true,
        editable     : true,
        customButtons: {
          addEventButton  : {
            text : '일정 추가',
            click: () => {
              openModal()
            }
          },
          registAttendance: {
            text : '출석 체크',
            click: () => {
              checkAttendance();
            }
          }
        },
        eventClick   : (arg) => {
          openModal(arg)
        },
        events       : calendarData
      })
      calendar.render()
    })
  </script>
  <!--head.html Include-->
  <jsp:include page="../../../commons/head.jsp"/>
  
  <%--    <script>--%>
  <%--        console.debug("----  1   -------")--%>
  <%--    </script>--%>
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
                  <h5 class="text-dark font-weight-bold my-1 mr-5">메인 페이지 :${dto.teamName}</h5>
                  <!--Page Title : 페이지 제목 종료-->
                  <!--Breadcrumb : 로드맵 시작-->
                  <ul
                    class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                  
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
              <div class="card-header border-0 pt-5 card-body mt-5"
                   id="post-body-wrapper">
                <ul style="list-style: none">
                  <li class="mainpage_index">
                    <div class="d-flex justify-content-between">
                      <div><span>▶ 일정 관리 </span></div>
                      <!--카드 헤더 시작-->
                      
                      <div>
                       <span
                        style="font-weight: 700">
                            <span
                              style="color: #00b300">
                                  <c:set
                                    value="${fn:replace(fn:trim(map.at),' ','')}"
                                    var="at"/>
                                  <c:choose>

                                    <c:when
                                      test="${at==0 or at==null}">0</c:when>
                                    <c:otherwise>${at}</c:otherwise>
                                  </c:choose>
                            </span> 일 출석
                      </span>
                      </div>
                    </div>
                  </li>
                  <!--캘린더 섹션 start------->
                  <div id="calendar-sec" style="width: 100%"><!--캘린더 크기 설정-->
                    <!--calendar api-->
                    <div id='calendar'></div>
                    
                    <!--modal-->
                    <div class="calmodal hidden">
                      <div class="calmodal-overlay"></div>
                      <div class="calmodal-content">
                        <img src="../../../../resources/assets/images/icon/close.png"
                             style="width:20px;" id="close">
                        <!--❎이거 어케한거지..-->
                        <h1 id="cal-title-sec">
                          <span>[코벤져스]</span> <!--팀명 자동으로 들어옴-->
                          <input type="text" id="calendar-title"
                                 placeholder="일정 제목을 입력하세요">
                        </h1>
                        <div id="cal-time-sec">
                          <div class="cal-index"
                               style="display:inline-block">일시
                          </div>
                          <label>종일</label><input type="checkbox"
                                                  id="allday"
                                                  name="allday" checked>
                          <br>
                          <input type="date" id="calendar-start-date"
                                 name="cal_start"
                                 class="form-control inputBoxSetting1">
                          <span>&nbsp;&nbsp;~</span>
                          <input type="date" id="calendar-end-date"
                                 name="cal_end"
                                 class="form-control inputBoxSetting1">
                          <br>
                          <br>
                          <div class="timeHidden hidden">
                            <label for="calendar-start-time">시작</label><input
                            type="time" id="calendar-start-time"
                            step="900" required
                            class="form-control inputBoxSetting2">
                            <label for="calendar-end-time">종료</label><input
                            type="time" id="calendar-end-time"
                            step="900" required
                            class="form-control inputBoxSetting2">
                          </div>
                        </div>
                        <div id="cal-cont-sec">
                          <p class="cal-index">내용</p>
                          <textarea id="calendar-content"></textarea>
                        </div>
                        
                        <div id="cal-button-sec">
                          <button id="modal-regist" class="cal-button"
                                  onclick="eventRegist()">일정 등록하기
                          </button>
                          <button id="modal-modify"
                                  class="hidden cal-button"
                                  onclick="modifyEvent()">수정
                          </button>
                          <button id="modal-delete"
                                  class="hidden cal-button"
                                  onclick="deleteEvent()">삭제
                          </button>
                        
                        </div>
                      </div>
                    </div>
                  
                  </div>
                  <!--캘린더 섹션 end------->
                  <div class="d-flex">
                    <div class="card-body">
                      <div class="mainpage_index">
                        <a href="/studyIns/board/list?r_Idx=${map.get("r_Idx")}"
                           style="color: blue">
                          <li>▶ 게시판 이동</li>
                        </a>
                      </div>
                      
                      
                      <!--to 상준 : 여기 21, 22번째줄을 보면 여기 들어온 아이디랑 여기 게시글번호가 하드코딩 되어있어
                          마이페이지 받고 마이페이지 통해서 정상적으로 들어오게되면 바꿔야 하구 그때까지는 저 하드코딩
                          밸류값 가져오면 될듯해-->
                      <table class="table  table-striped table-hover">
                        
                        <thead>
                        <tr id="mytr">
                          <td>
                <span class="label label-inline label-light-primary font-weight-bold ">
                    카테고리
                </span>
                          </td>
                          <td>
                <span class="label label-inline label-light-primary font-weight-bold ">
                    제목
                </span>
                          </td>
                          <td>
                <span class="label label-inline label-light-primary font-weight-bold">
                    내용
                </span>
                          </td>
                          <td>
                <span class="label label-inline label-light-primary font-weight-bold">
                    닉네임
                </span>
                          </td>
                        
                        </tr>
                        </thead>
                        <tbody>
                        
                        <c:forEach end="1" var="noticeList" items="${notice}">
                          
                          <tr style="background-color: oldlace">
                            <td>공지</td>
                            <td>공지</td>
                            <td><a
                              href="/studyIns/board/detail?cont_No=<c:out value="${noticeList.cont_No}&curPage=${map.boardPager.curPage}&r_Idx=${map.get('r_Idx')}"/> ">
                                <c:out value="${noticeList.title}"/><a/>
                                ${map.boardPager.curPage}
                            </td>
                            <td>
                              <c:out
                                value="${fn:substring(noticeList.cont.replaceAll('\\\<.*?\\\>',''),0, 10)}"/></td>
                            <td>${noticeList.member_Name} </td>
                          
                          
                          </tr>
                        </c:forEach>
                        
                        
                        <c:set value="${fn:replace(pageMaker.total,' ' ,'' ) }" var="total"/>
                        
                        <c:forEach items="${list}" var="list" varStatus="status" end="7">
                          
                          <tr>
                            <c:choose>
                              <c:when test="${map.get('category') eq '공지'}">
                                <td>공지</td>
                              </c:when>
                            
                            </c:choose>
                            
                            <td>${list.category}</td>
                            <td><a
                              href="/studyIns/board/detail?cont_No=<c:out value="${list.cont_No}&curPage=${map.boardPager.curPage}&r_Idx=${map.get('r_Idx')}"/> ">
                                <c:out value="${list.title}"/>
                              <a/>
                            </td>
                            <td>
                              <c:out
                                value="${fn:substring(list.cont.replaceAll('\\\<.*?\\\>',''),0, 10)}"/></td>
                            <td>${list.member_Name} </td>
                          </tr>
                        </c:forEach>
                        <c:if test="${total eq '0'}">
                          <tr>
                            <td colspan="12" style="">
                              <h2
                                style="font-weight: 700; text-align: center; margin-bottom: 10px; margin-top: 10px">
                                불러올 리스트가 없습니다.</h2>
                            </td>
                          </tr>
                        </c:if>
                        </tbody>
                      </table>
                    </div>
                    <div class="card-body">
                      <li class="mainpage_index">▶ 출석 랭킹</li>
                      <div class="container">
                        <button hidden value="" id="attendance" class="btn btn-secondary">출석버튼
                        </button>
                        
                        
                        <figure class="highcharts-figure">
                          <div id="container"></div>
                        </figure>
                      
                      
                      </div>
                    </div>
                  </div>
                
                </ul>
              
              </div>
              <!--풀 사이즈 카드 종료 / 카드 필요 없으면 여기서까지 밀기☆-->
            
            </div>
            <!--대시보드 종료-->
          </div>
          <!--end::Content-->
        </div>
        <!--end::Content Wrapper 내용물 종료-->
      
      </div>
      <!--컨테이너 종료-->
      <!--footer.html Include-->
      
      
      <div id="floatdiv">
        <div class="ribbon ribbon-clip ribbon-right">
          <div class="ribbon-target bg-ssff2 p-4 pr-8 align-items-end pulse cursor-pointer"
               onclick="window.open('/moveChating?r_Idx=${map.get("r_Idx")}','window_name','width=500, height=700,location=no, status=no, scrollbars=yes');">
            <a>
              <span class="pulse-ring mt-n2 ml-n2 border-white"></span>
              <i class="fas fa-comments icon-xl text-white mr-2 position-relative"></i>
            </a>
            <a class="text-white text-hover-primary font-weight-bolder">
                                            <span class="font-size-h5">
                                                채팅방</span>
              <i class="fas fa-angle-double-right text-white font-size-h5"></i>
            </a>
          </div>
        </div>
      </div>
  
      <!--end::Body-->
        <!--begin: Datatable-->
    
    
        <!--end::Body-->
<%--        <div class="d-flex mb-10" style="justify-content: flex-end;">--%>
<%--          <button type="button" class="btn btn-primary font-weight-bold font-size-h6 px-10 py-4 mr-40"--%>
<%--                  data-toggle="modal" id="payBtn" onclick="checkFields();"--%>
<%--                  data-target="#my80sizeCenterModal">--%>
<%--            결제--%>
<%--          </button>--%>
<%--        </div>--%>
    
    
        <!--모달시작::-->
        <div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="-1"
             role="dialog" aria-labelledby="my80sizeCenterModalLabel">
          <div class="modal-dialog modal-80size modal-center" role="document">
            <div class="modal-content modal-80size">
              <div class="modal-header " style="background-color:#ffa800;">
            
                <h4 class="modal-title" id="myModalLabel">챌린지 참여금 결제</h4>
          
              </div>
              <div class="modal-body">
                <div class="datatable datatable-bordered datatable-head-custom
																		datatable-default datatable-primary datatable-loaded" id="결제정보" style="">
                  <table class="datatable-table"
                         style="display: block;margin-left: auto;margin-right: auto;width: 80%;">
                    <thead class="datatable-head">
                    <tr class="datatable-row" style="left: 0px;">
                      <th data-field="OrderID"
                          class="datatable-cell datatable-cell-sorted">
                        <span style="width: 250px;font-size: 1.3rem;">결제정보</span></th>
                    </tr>
                    </thead>
                    <tbody style="" class="datatable-body">
                
                    <tr data-row="0" class="datatable-row" style="left: 0px;">
                      <td class="col-4 pr-8 datatable-cell-right datatable-cell
																													font-weight-bolder">스터디유형
                      </td>
                      <td class="text-dark-75 text-left pl-4 font-size-md mb-0">
                        Challenge
                      </td>
                    </tr>
                
                
                    <tr data-row="0" class="datatable-row" style="left: 0px;">
                      <td class="col-4 pr-8 datatable-cell-right datatable-cell
																													font-weight-bolder">스터디명
                      </td>
                      <td class="text-dark-75 text-left pl-4 font-size-md mb-0">
                        ${rList.teamname}(${rList.r_idx})
                      </td>
                    </tr>
                
                
                    <tr data-row="0" class="datatable-row" style="left: 0px;">
                      <td class="col-4 pr-8 datatable-cell-right datatable-cell
																													font-weight-bolder">참여기간
                      </td>
                      <td class="text-dark-75 text-left pl-4 font-size-md mb-0">
                        ${rList.ch_start} ~ ${rList.ch_end}
                      </td>
                    </tr>
                
                    
                    <tr data-row="0" class="datatable-row" style="left: 0px;">
                      <td class="col-4 pr-8 datatable-cell-right datatable-cell
																													font-weight-bolder">환급예정일
                      </td>
                      <td class="text-dark-75 text-left pl-4 font-size-md mb-0">
                        ${rList.ch_end}
                      </td>
                    </tr>
                
                
                    <tr data-row="0" class="datatable-row">
                      <td class="col-4 pr-8 datatable-cell-right datatable-cell"><span
                        class="font-weight-bolder">결제금액</span></td>
                      <td class="font-weight-bolder mb-0 h3" style="color: #6b984f;">
                    
                        10,000 원
                  
                      </td>
                
                    </tr>
                
                    </tbody>
                  </table>
            
                </div>
                <!--end: 결제정보 -->
            
                <!--end: 환불규정 -->
                <div class="separator separator-dashed my-10"></div>
            
                <div class="datatable datatable-bordered datatable-head-custom
																																					datatable-default datatable-primary datatable-loaded"
                     id="환불규정" style="">
                  <table class="datatable-table"
                         style="display: block;margin-left: auto;margin-right: auto;width: 80%;">
                
                    <thead class="datatable-head">
                    <tr class="datatable-row" style="left: 0px;">
                      <th class="datatable-cell datatable-cell-sorted"
                          data-sort="asc"><span style="width: 250px;font-size: 1.3rem;">환급규정</span></th>
                    </tr>
                    </thead>
                
                    <tbody style="" class="datatable-body">
                
                    <tr data-row="0" class="datatable-row" style="left: 0px;">
                      <td class="col-0 pl-3 pr-0 datatable-cell-center datatable-cell
																													font-weight-bolder">#1
                      </td>
                      <td class="text-dark-75 text-left pl-1 font-size-md mb-0">
                        챌린지 종료일 이전 환불은 불가합니다.
                      </td>
                    </tr>
                
                    <tr data-row="0" class="datatable-row" style="left: 0px;">
                      <td class="col-0 pl-3 pr-0 datatable-cell-center datatable-cell
																													font-weight-bolder">#2
                      </td>
                      <td class="text-dark-75 text-left pl-1 font-size-md mb-0">
                        챌린지 종료일 기준 출석률에 비례하여
                        <br>환급금이 정산됩니다.
                        <br>
                        <span class="text-danger font-size-sm">(100일 챌린지에 50일 출석시 5,000원 환급)</span>
                      </td>
                    </tr>
                
                    <tr data-row="0" class="datatable-row" style="left: 0px;">
                      <td class="col-0 pl-3 pr-0 datatable-cell-center datatable-cell
																													font-weight-bolder">#3
                      </td>
                      <td class="text-dark-75 text-left pl-1 font-size-md mb-0">
                        환급금의 수령은 종료일 이후
                        <br>해당 스터디 페이지에 접속하여 가능합니다.
                        <br>
                        <span class="text-danger font-size-sm">(자동환급되지 않습니다.)</span>
                      </td>
                    </tr>
                
                    <tr data-row="0" class="datatable-row" style="left: 0px;">
                      <td class="col-0 pl-3 pr-0 datatable-cell-center datatable-cell
																													font-weight-bolder">#4
                      </td>
                      <td class="text-dark-75 text-left pl-1 font-size-md mb-0">
                        참여금 미결제시 해당 챌린지 참여가 불가합니다.
                      </td>
                    </tr>
                
                    </tbody>
                  </table>
                </div>
            
            
                <div class="separator separator-dashed my-10"></div>
            
                <div class="datatable datatable-bordered datatable-head-custom
																		datatable-default datatable-primary datatable-loaded" style="">
                  <table class="datatable-table"
                         style="display: block;margin-left: auto;margin-right: auto;width: 80%;">
                    <thead class="datatable-head">
                    <tr class="datatable-row" style="left: 0px;">
                      <th data-field="PayID" style="border-bottom: 1px solid #ebedf3;"
                          class="datatable-cell datatable-cell-sorted"
                          data-sort="asc"><span style="width: 250px;font-size: 1.3rem;">결제방법</span></th>
                    </tr>
                    </thead>
                    <tbody style="" class="datatable-body">
                
                    <tr data-row="0" class="datatable-row ml-15" style="left: 0px;">
                      <td class="datatable-cell-left datatable-cell ml-15">
                    
                        <label class="radio font-weight-bolder" for="cash">
                          <input type="radio" id="cash" name="pay" value="" class="ck" title="결제방법">
                          <span class="mr-2"></span>실시간 출금</label>
                  
                      </td>
                    </tr>
                
                    </tbody>
                  </table>
                </div>
            
            
                <div class="separator separator-dashed my-10"></div>
            
                <div class="datatable datatable-head-custom
																		datatable-default datatable-primary datatable-loaded" style="">
                  <table class="datatable-table mb-10"
                         style="display: block;margin-left: auto;margin-right: auto;width: 80%;">
                    <thead class="datatable-head">
                
                    <tr class="datatable-row" style="left: 0px;">
                      <th class="datatable-cell datatable-cell-sorted"><span style="width: 250px;font-size: 1.3rem;">서비스 동의</span>
                      </th>
                    </tr>
                
                    </thead>
                
                
                    <tbody style="" class="datatable-body checkbox_group">
                    <tr data-row="0" class="datatable-row ml-15" style="left: 0px;">
                      <td class="datatable-cell-left datatable-cell ml-15"><span>
																					
																					<span	class="font-weight-bolder">	<label class="text-right checkbox" for="check_all">
																						<input type="checkbox" id="check_all" name="check_all" class="ck" title="서비스동의">
																						<span class="mr-2"></span>전체 동의</label></span></span></td>
                    </tr>
                
                    <tr data-row="0" class="datatable-row ml-15" style="left: 0px;">
                      <td class="datatable-cell-left datatable-cell ml-15">
																					<span class="font-weight-bolder">	<label class="checkbox mr-2" for="check_1">
																										<input type="checkbox" id="check_1" class="normal">
																										<span class="mr-2"></span>위의 안내 사항 동의 및 결제 진행 동의 <h8
                       class="text-danger ml-1">(필수)</h8></label> </span>
                  
                      </td>
                    </tr>
                    <tr data-row="0" class="datatable-row ml-15" style="left: 0px;">
                      <td class="datatable-cell-left datatable-cell ml-15"
                          aria-label="400"><span>
																					<span class="font-weight-bolder">	<label class="checkbox" for="check_2">
																										<input type="checkbox" id="check_2" class="normal">
																										<span class="mr-2"></span>개인정보 제3자 제공 동의<h8
                       class="text-danger ml-1">(필수)</h8></label></span></span></td>
                    </tr>
                    <tr data-row="0" class="datatable-row ml-15" style="left: 0px;">
                      <td class="datatable-cell-left datatable-cell ml-15"
                          aria-label="400"><span>
																					<span class="font-weight-bolder"><label class="checkbox" for="check_3">
																										<input type="checkbox" id="check_3" class="normal">
																										<span class="mr-2"></span>개인정보 수집 및 이용 동의<h8
                       class="text-danger ml-1">(필수)</h8></label></span></span></td>
                    </tr>
                
                    </tbody>
                  </table>
                </div>
              </div>
          
              <div class="modal-footer">
                <button type="button" class="btn btn-primary  btn-lg "
                        id="rsrvSubmit" style="" onclick="authorize();">결제하기</button>
          
              </div>
            </div>
          </div>
        </div>


      
    </div>
  </div>
  
  <jsp:include page="../../../commons/footer.jsp"/>
  <!----------------페이지 시작----------------------->
</div>


</body>
<!----------------Body 종료----------------------->
<script>


  $(document).ready(function () {
    /*일단은 풀캘에서 들고오는 방법으로 선택해야합니다.*/
    // const ranking = $.ajax({
    //     type:'GET',
    //     url:'/studyRest/getAttendanceByWeek',
    //     data:JSON.stringify({
    //
    //     }),
    //     contentType: 'application/json; charset =utf-8',
    //     cache:false,
    //     success: function (reponse) {
    //         alert('랭킹 들고옴 ㅇㅇ');
    //     },
    //     failure: function (response) {
    //         alert(`랭킹 들고오기 실패`);
    //     }
    // });

    /*이번주 일자 구하기(월~금)*/
    var currentDay = new Date();
    var theYear = currentDay.getFullYear();
    var theMonth = currentDay.getMonth();
    var theDate = currentDay.getDate();
    var theDayOfWeek = currentDay.getDay();

    var thisWeek = [];

    for (var i = 0; i < 7; i++) {
      var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek));
      var yyyy = resultDay.getFullYear();
      var mm = Number(resultDay.getMonth()) + 1;
      var dd = resultDay.getDate();

      mm = String(mm).length === 1 ? '0' + mm : mm;
      dd = String(dd).length === 1 ? '0' + dd : dd;

      thisWeek[i] = yyyy + '-' + mm + '-' + dd;
    }

    console.log(thisWeek);

    /*이번주 일자 구하기(월~금)*/
    var currentDay = new Date();
    var theYear = currentDay.getFullYear();
    var theMonth = currentDay.getMonth();
    var theDate = currentDay.getDate();
    var theDayOfWeek = currentDay.getDay();

    var thisWeek = [];

    for (var i = 0; i < 7; i++) {
      var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek));
      var yyyy = resultDay.getFullYear();
      var mm = Number(resultDay.getMonth()) + 1;
      var dd = resultDay.getDate();

      mm = String(mm).length === 1 ? '0' + mm : mm;
      dd = String(dd).length === 1 ? '0' + dd : dd;

      thisWeek[i] = yyyy + '-' + mm + '-' + dd;
    }

    const chart = Highcharts.chart('container', {
      title   : {
        text: '이번주 누적 출석률 '
      },
      subtitle: {
        text: ''
      },
      xAxis   : {
        categories: thisWeek
      },
      /* 차트 Y축 컬럼 명 */
      yAxis : {
        title: '출석일',
        max  : 100
      },
      series: [{
        type        : 'column',
        colorByPoint: true,
        data        : [87, 79, 50, 100, 96, 100, 80],
        showInLegend: false
      }]
    });

    document.getElementById('plain').addEventListener('click', () => {
      chart.update({
                     chart   : {
                       inverted: false,
                       polar   : false
                     },
                     subtitle: {
                       text: 'Plain'
                     }
                   });
    });

    document.getElementById('inverted').addEventListener('click', () => {
      chart.update({
                     chart   : {
                       inverted: true,
                       polar   : false
                     },
                     subtitle: {
                       text: 'Inverted'
                     }
                   });
    });

    document.getElementById('polar').addEventListener('click', () => {
      chart.update({
                     chart   : {
                       inverted: false,
                       polar   : true
                     },
                     subtitle: {
                       text: 'Polar'
                     }
                   });
    });

  });
  const modal = document.querySelector('.calmodal')
  const modalRegist = document.querySelector('#modal-regist')
  const modalModify = document.querySelector('#modal-modify')
  const modalDelete = document.querySelector('#modal-delete')

  const timeHidden = document.querySelector('.timeHidden')

  const overlay = document.querySelector('.calmodal-overlay')
  //모달창이 활성화되면 흐린 배경을 표현하는 요소

  const closeBtn = document.getElementById('close')
  //offModal button

  const checkbox = document.querySelector("input[name=allday]");
  let checkboxStatus = 'y' //종일이면 y, 아니면 n
  //종일체크

  const closeModal = () => {
    modal.classList.add('hidden')
  }

  closeBtn.addEventListener('click', closeModal)
  //모달창 내부의 닫기 버튼

  overlay.addEventListener('click', (e) => {
    if (e.target.className === 'calmodal-overlay') {
      closeModal()
    }
  })

  function checkAttendance() {
    let now = new Date();
    var rtn = true;

    Swal.fire({
                title           : "출석",
                text            : now.getDate() + "일 출석하시겠습니까?",
                showCancelButton: true,
                buttonsStyling  : true,
                button          : {
                  cancel : {
                    text     : '취소',
                    value    : false,
                    className: 'btn btn-outline-primary' // 클래스 이름을 줄 수도 있다.
                  },
                  confirm: {
                    text     : '출석',
                    value    : true,
                    className: 'btn btn-outline-primary'
                  }
                }
              }).then(function (result) {
      if (result) {
        $.ajax({
                 type       : "POST",
                 url        : "/studyRest/updateAttendance",
                 data       : JSON.stringify({
                                               'r_Idx'      : $(`#r_idx`).val(),
                                               'member_Name': $(`#member_name`).val()
                                             }),
                 contentType: 'application/json; charset=utf-8',
                 cache      : false,
                 success    : function (data) {
                   console.log("data" + data); // false
                   console.log("data: " + JSON.stringify(data)); // false
                   if (data===false ||data==='false') {
                     Swal.fire({
                                 title: '출석',
                                 text : '오늘 이미 출석하셨습니다',
                                 type : 'info'

                               });

                   } else {
                     Swal.fire({
                                 title: '출석',
                                 text : '출석완료!',
                                 type : 'info'
                               });
                     location.reload();
                   };
                 },
                 failure    : function (data) {
                   console.log(data);
                 },
               });

      }

    });
  }

  //모달창 영역 밖

  function openModal(arg) {
    if (arg) {	// detail 일때
      currentEvent = arg.event
      console.log('arg : ', arg)
      console.log(calendar.getEvents())
      console.log(arg.event.id)
      document.getElementById('calendar-title').value = arg.event.title

      let startDay = arg.event._instance.range.start;
      let endDay = arg.event._instance.range.end;
      let allday_ok = arg.event.extendedProps.allday_ok;

      console.log(allday_ok);
      if (allday_ok == 'n') {
        $('#allday').removeAttr('checked');
        timeHidden.classList.remove('hidden')
      } else {
        $("#allday").attr("checked", true);
        timeHidden.classList.add('hidden')
      }
      document.getElementById('calendar-start-date').value = new Date(
          startDay + 3240 * 10000).toISOString().split("T")[0];
      document.getElementById('calendar-end-date').value = new Date(
          endDay + 3240 * 10000).toISOString().split("T")[0];
      document.getElementById('calendar-start-time').value = startDay.toTimeString().split(
          " ")[0].substr(0, 5);
      document.getElementById('calendar-end-time').value = endDay.toTimeString().split(
          " ")[0].substr(0, 5);
      document.getElementById('calendar-content').value = arg.event.extendedProps.cal_cont
      modalRegist.classList.add('hidden')
      modalModify.classList.remove('hidden')
      modalDelete.classList.remove('hidden')
    } else {	// 등록 일때
      document.getElementById('calendar-title').value = ''
      document.getElementById('calendar-start-date').value = ''
      document.getElementById('calendar-end-date').value = ''
      modalRegist.classList.remove('hidden')
      modalModify.classList.add('hidden')
      modalDelete.classList.add('hidden')
    }
    modal.classList.remove('hidden')
  }

  function eventRegist() {
    let time_start = "";
    let time_end = "";
    if (document.getElementById('calendar-start-time').value != "" && document.getElementById(
        'calendar-end-time').value != "") {
      time_start = "T" + document.getElementById('calendar-start-time').value + ":00";
      time_end = "T" + document.getElementById('calendar-end-time').value + ":00";
    } else {
      time_start = "T00:00:00";
      time_end = "T23:59:59";
    }
    let addEvent = {
      member_name: document.querySelector('#member_name').value,
      allday_ok  : checkboxStatus,
      title      : document.getElementById('calendar-title').value,
      start      : new Date(document.getElementById('calendar-start-date').value + time_start),
      end        : new Date(document.getElementById('calendar-end-date').value + time_end),
      cal_cont   : document.querySelector('#calendar-content').value
    }
    let flag = true
    if (!addEvent.title) {
      flag = showAlarm(0)
    } else if (!(addEvent.start).valueOf()) {
      flag = showAlarm(1)
    } else if (!(addEvent.end).valueOf()) {
      flag = showAlarm(1)
    }
    if (!flag) return
    //console.log(addEvent)
    console.log('addEvent : ', addEvent)
    calendar.addEvent(addEvent) // front calendar update
    console.log(calendar.getEvents())
    setFullCalendarData(document.querySelector('#r_idx').value, calendar.getEvents()) // db update 일단 뭔지 몰라서 엎어놓음
    // setFullCalendarData(addEvent)
    showAlarm(2)
    closeModal()
  }

  function deleteEvent() {
    if (showAlarm(5)) {
      currentEvent.remove()  // front calendar update
      setFullCalendarData(document.querySelector('#r_idx').value, calendar.getEvents()) // db update
      showAlarm(3)
      closeModal()
    } else {
      showAlarm(4)
    }
  }

  function modifyEvent() {
    if (showAlarm(6)) {
      currentEvent.remove()  // front calendar update
      setFullCalendarData(document.querySelector('#r_idx').value, calendar.getEvents()) // db update
      eventRegist()
      //showAlarm(7)
      //closeModal()
    } else {
      showAlarm(8)
    }
  }

  function showAlarm(type) {
    switch (type) {
      case 0:
        alert('제목을 입력해주세요');
        return false;
        break;
      case 1:
        alert('날짜를 입력해 주세요');
        return false;
        break;
      case 2:
        alert('성공적으로 완료되었습니다( ":D" )');
        return false;
        break;
      case 3:
        alert('일정이 정상적으로 삭제되었습니다');
        return false;
        break;
      case 4:
        alert('일정 삭제가 취소되었습니다');
        return false;
        break;
      case 5:
        return confirm('정말 삭제하시겠습니까?');
        break;
      case 6:
        return confirm('정말 수정하시겠습니까?');
        break;
      case 7:
        alert('일정이 정상적으로 수정되었습니다');
        return false;
        break;
      case 8:
        alert('일정 수정이 취소되었습니다');
        return false;
        break;
    }
  }

  checkbox.addEventListener('change', function () {
    if (this.checked) {
      timeHidden.classList.add('hidden')
      checkboxStatus = 'y'
    } else {
      timeHidden.classList.remove('hidden')
      checkboxStatus = 'n'
    }
  });//종일 체크가 되어있으면 시간체크를 보여주지 않는다

</script>


<script>
// 모달 결제창 팝업
  // 동적 생성한 modal 오픈 이벤트 수동 부여
  $(document).ready(function () {
    if(${amem.study_join_arciwf eq 103 || amem.study_join_arciwf eq 120}){ // 가입상태가 g/x(==챌린지 승인 후 결제 대기상태)
     
     
      $('#my80sizeCenterModal').modal(
          { keyboard: false, backdrop: 'static' }
      );
      $('#my80sizeCenterModal').modal('show');
    } else {
      console.log("ah못읽으거라고????")
    }
 
   
  });
  

  const clientID = '8492614f-7af7-472e-9c00-f0b61b38ed33';
  const clientPWD = 'e9366e92-5b66-450e-8299-f1ebbf9473db';

  // 결제를 위해 인증창 팝업
  function authorize() {


    callAjax();

    let location = "https://testapi.openbanking.or.kr/oauth/2.0/authorize?" +
                   "response_type=code&" +
                   "client_id=" + clientID + "&" +
                   "redirect_uri=http://localhost:8070/payment/rest/withdraw/challenge&" +
                   "scope=login inquiry transfer&" +
                   "client_info=test&" +
                   "state=b80BLsfigm9OokPTjy03elbJqRHOfGSY&" +
                   "auth_type=0&" +
                   "cellphone_cert_yn=Y&" +
                   "authorized_cert_yn=Y&" +
                   "account_hold_auth_yn=N&" +
                   "register_info=A";

    var popup = window.open(location, '오픈뱅킹 본인인증', 'width=700px,height=800px,scrollbars=yes');
    //
  }



  function callAjax(){
    var submitObj = new Object();
    let searchID = '${amem.apply_idx}'; // 여기 화면단 ap-idx 뿌리기
    submitObj.apply_idx = searchID;

    console.log("submitObj.rsrv_idx: " + submitObj.rsrv_idx);

    $.ajax({
             type       : 'POST',
             url        : '/payment/rest/challenge/applyStatusChange',
             data       : JSON.stringify(submitObj), // 예약번호 들고 출발
             dataType   : 'text', // 받을 데이터는 json
             contentType: "application/json; charset=utf-8",
             success    : successCallback,
             error      : errorCallback
           });

    // 성공시 데이터 처리
    function successCallback(data) {
      console.log("data: " + data);

      Swal.fire('결제요청처리완!', '', 'success')

      //window.location.href = '/study/challenge/main?r_Idx=${rList.r_idx}&member_name=${rList.member_name}';

    } // successCallback

    // 실패
    function errorCallback() {
      Swal.fire({
                  icon : 'warning', // Alert 타입
                  title: '요청실패', // Alert 제목
                  text : '요청에 실패하였습니다. 다시 시도해주세요!', // Alert 내용
                });
      //window.location.href = '/study/challenge/main?r_Idx=${rList.r_idx}&member_name=${rList.member_name}';
    } // errorCallback
  }
</script>



<script>


  // 체크박스 전체 선택, 전체 해제
  $(".checkbox_group").on("click", "#check_all", function () {

    // 전체선택이 체크가 되어있는지 확인 한 후,
    var checked = $(this).is(":checked");

    if(checked){ // 체크가 되어 있으면 div.checkbox_group 의 input들에 모두 checked, true
      $(this).parents(".checkbox_group").find('input').prop("checked", true);
    } else { // 체크가 해제 되면 모두 checked, false
      $(this).parents(".checkbox_group").find('input').prop("checked", false);
    }
  });


  // 전체선택 후 하나만 해제했을 때, 전체선택도 해체
  $(".checkbox_group").on("click", ".normal", function() {
    console.log("TLqkf" +  $(this).is(":checked"))
    //  checked 속성을 판단

    if ($(this).is(":checked")==false) { // 체크 해제가 되어 있다면 전체선택의 체크박스도 해제
      $("#check_all").prop("checked", false);
    }
  });


  // 개별 선택으로 전체 다 선택되었을 때, 전체선택에도 체크
  // 체크박스 개별 선택
  $(".checkbox_group").on("click", ".normal", function() {
    var is_checked = true;

    $(".normal").each(function(){
      is_checked = is_checked && $(this).is(":checked");
    });

    $("#check_all").prop("checked", is_checked);
  });

</script>

</html>