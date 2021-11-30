<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html lang="en">
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
      
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
      <script src="https://code.highcharts.com/highcharts.js"></script>
      <script src="https://code.highcharts.com/highcharts-more.js"></script>
      <script src="https://code.highcharts.com/modules/exporting.js"></script>
      <script src="https://code.highcharts.com/modules/export-data.js"></script>
      <script src="https://code.highcharts.com/modules/accessibility.js"></script>
      <input type="hidden" id="member_name" name="member_name" value="${member.member_name}"><!--이 페이지로 접근한 아이디-->
      <input type="hidden" id="r_idx" name="r_idx" value=${map.get("r_Idx")}><!--이 페이지의 스터디번호-->
      
      <style>
            #container {
                  height : 400px;
            }
            
            .highcharts-figure,
            .highcharts-data-table table {
                  min-width : 320px;
                  max-width : 800px;
                  margin    : 1em auto;
            }
            
            .highcharts-data-table table {
                  font-family     : Verdana, sans-serif;
                  border-collapse : collapse;
                  border          : 1px solid #ebebeb;
                  margin          : 10px auto;
                  text-align      : center;
                  width           : 100%;
                  max-width       : 500px;
            }
            
            .highcharts-data-table caption {
                  padding   : 1em 0;
                  font-size : 1.2em;
                  color     : #555;
            }
            
            .highcharts-data-table th {
                  font-weight : 600;
                  padding     : 0.5em;
            }
            
            .highcharts-data-table td,
            .highcharts-data-table th,
            .highcharts-data-table caption {
                  padding : 0.5em;
            }
            
            .highcharts-data-table thead tr,
            .highcharts-data-table tr:nth-child(even) {
                  background : #f8f8f8;
            }
            
            .highcharts-data-table tr:hover {
                  background : #f1f7ff;
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
           
           document.addEventListener('DOMContentLoaded', function() {
                let calendarEl = document.getElementById('calendar')
                calendar = new FullCalendar.Calendar(calendarEl, {
                     initialView: 'dayGridMonth',
                     // initialDate: '2021-11-07',
                     headerToolbar: {
                          left: 'prev,next today',
                          center: 'title',
                          right: 'registAttendance,addEventButton'//addEventButton,dayGridMonth,timeGridWeek,timeGridDay
                     },
                     selectable: true,
                     editable: true,
                     customButtons: {
                          addEventButton: {
                               text: '일정 추가',
                               click: () => {
                                    openModal()
                               }
                          },
                          registAttendance: {
                               text: '출석 체크',
                               click: (e) => {
                                    let now = new Date();
                                    var rtn = true;
                                    
                                    console.log(e.target + `좀 돼라`);
                                    Swal.fire({
                                         title: "출석",
                                         text: now.getDate() + "일 출석하시겠습니까?",
                                         showCancelButton: true,
                                         buttonsStyling: true,
                                         button: {
                                              cancel: {
                                                   text: '취소',
                                                   value: false,
                                                   className: 'btn btn-outline-primary' // 클래스 이름을 줄 수도 있다.
                                              },
                                              confirm: {
                                                   text: '출석',
                                                   value: true,
                                                   className: 'btn btn-outline-primary'
                                              }
                                         }
                                    }).then(function(result) {
                                         if (result) {
                                              $.ajax({
                                                   type: "POST",
                                                   url: "/studyRest/updateAttendance",
                                                   data: JSON.stringify({
                                                        'r_Idx': $(`#r_Idx`).val(),
                                                        'member_Name': $(`#member_Name`).val()
                                                   }),
                                                   contentType: 'application/json; charset=utf-8',
                                                   cache: false,
                                                   success: function(data) {
                                                        console.log(data);
                                                        if (data == false) {
                                                             Swal.fire({
                                                                  title: '출석',
                                                                  text: '오늘 이미 출석하셨습니다',
                                                                  type: "warning"
                                                             });
                                                        } else {
                                                             Swal.fire({
                                                                  title: '출석',
                                                                  text: '출석완료!',
                                                                  type: 'info'
                                                             })
                                                        }
                                                   },
                                                   failure: function(data) {
                                                        console.log(data);
                                                        
                                                   },
                                              });
                                              
                                         }
                                         
                                         
                                         
                                    });
                               }
                          }
                     },
                     eventClick: (arg) => {
                          openModal(arg)
                     },
                     events: calendarData
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
                                                      <h5 class="text-dark font-weight-bolder my-1 mr-5">챌린지</h5>
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
                                          <div class="card-header border-0 pt-5 card-body mt-5"
                                               id="post-body-wrapper">
                                                <ul style="list-style: none">
                                                      <li class="mainpage_index">▶ 일정 관리</li>
                                                      <!--캘린더 섹션 start------->
                                                      <div id="calendar-sec" style="width: 900px"><!--캘린더 크기 설정-->
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
                                                      <li class="mainpage_index"><a href="/studyIns/board/list?r_Idx=${map.get("r_Idx")}"><span>▶ 게시판 이동</span></a></li>
                                                      
                                                      
                                                      <!--to 상준 : 여기 21, 22번째줄을 보면 여기 들어온 아이디랑 여기 게시글번호가 하드코딩 되어있어
                                                          마이페이지 받고 마이페이지 통해서 정상적으로 들어오게되면 바꿔야 하구 그때까지는 저 하드코딩
                                                          밸류값 가져오면 될듯해-->
                                                      <table class="table  table-striped table-hover">
                                                            
                                                            <thead>
                                                            <tr id="mytr">
                                                                  <td>
                <span class="label label-inline label-light-primary font-weight-bolder ">
                    카테고리
                </span>
                                                                  </td>
                                                                  <td>
                <span class="label label-inline label-light-primary font-weight-bolder ">
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
                                                            
                                                            <c:forEach end="3" var="noticeList" items="${notice}">
                                                                  
                                                                  <tr style="background-color: oldlace">
                                                                        <td>공지</td>
                                                                        <td>공지</td>
                                                                        <td><a
                                                                                href="/studyIns/board/detail?cont_No=<c:out value="${noticeList.cont_No}&curPage=${map.boardPager.curPage}&r_Idx=${map.get('r_Idx')}"/> ">
                                                                                    <c:out value="${noticeList.title}"/><a/>
                                                                                    ${map.boardPager.curPage}
                                                                        </td>
                                                                        <td>
                                                                              <c:out value="${fn:substring(noticeList.cont.replaceAll('\\\<.*?\\\>',''),0, 10)}"/></td>
                                                                        <td>${noticeList.member_Name} </td>
                                                                  
                                                                  
                                                                  </tr>
                                                            </c:forEach>
                                                            
                                                            
                                                            <c:set value="${fn:replace(pageMaker.total,' ' ,'' ) }" var="total"/>
                                                            
                                                            <c:forEach items="${list}" var="list" varStatus="status" end="5">
                                                                  
                                                                  <tr>
                                                                        <c:choose>
                                                                              <c:when test="${map.get('category') eq '공지'}">
                                                                                    <td>공지</td>
                                                                              </c:when>
                                                                        
                                                                        </c:choose>
                                                                        
                                                                        <td>${list.category}</td>
                                                                        <td><a
                                                                                href="/studyIns/board/detail?cont_No=<c:out value="${list.cont_No}&curPage=${map.boardPager.curPage}&r_Idx=${map.get('r_Idx')}"/> ">
                                                                                    <c:out value="${list.title}"/> <a/>
                                                                        </td>
                                                                        <td>
                                                                              <c:out value="${fn:substring(list.cont.replaceAll('\\\<.*?\\\>',''),0, 10)}"/></td>
                                                                        <td>${list.member_Name} </td>
                                                                  </tr>
                                                            </c:forEach>
                                                            <c:if test="${total eq '0'}">
                                                                  <tr>
                                                                        <td colspan="12" style="">
                                                                              <h2 style="font-weight: 700; text-align: center; margin-bottom: 10px; margin-top: 10px">불러올 리스트가 없습니다.</h2>
                                                                        </td>
                                                                  </tr>
                                                            </c:if>
                                                            </tbody>
                                                      </table>
                                                      <li class="mainpage_index">▶출석 랭킹</li>
                                                      <div class="container">
                                                            <button hidden value="" id="attendance" class="btn btn-secondary">출석버튼</button>
            
            
                                                            <figure class="highcharts-figure">
                                                                  <div id="container"></div>
                                                            </figure>
      
      
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
            </div>
      </div>
      
      <jsp:include page="../../../commons/footer.jsp"/>
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
                                    <h5 class="text-dark font-weight-bolder my-1 mr-5">챌린지</h5>
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
                            <div class="container">
                                <input type="text" value="${map.get("r_Idx")}" id="r_Idx"/>
                                <input type="text" value="${member.member_name}" id="member_Name"/>
                                <button type="button" value="" id="attendance" class="btn btn-secondary">출석버튼</button>


                                <figure class="highcharts-figure">
                                    <div id="container"></div>


                                </figure>


                            </div>
                        </div>
                        <!--풀 사이즈 카드 종료 / 카드 필요 없으면 여기서까지 밀기☆-->

                    </div>
                    <!--대시보드 종료-->
                </div>
                <!--end::Content-->
            </div>
            <!--end::Content Wrapper 내용물 종료-->
            <jsp:include page="../../../commons/footer.jsp"/>

        </div>
        <!--컨테이너 종료-->
        <!--footer.html Include-->
    </div>
</div>


</body>
<!----------------Body 종료----------------------->
<script>
     
     
     $(document).ready(function() {
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
               title: {
                    text: '이번주 누적 출석률 '
               },
               subtitle: {
                    text: ''
               },
               xAxis: {
                    categories: thisWeek
               },
                /* 차트 Y축 컬럼 명 */
               yAxis: {
                    title: '출석일',
                    max:100
               },
               series: [{
                    type: 'column',
                    colorByPoint: true,
                    data: [87, 79, 50, 100, 96, 100,80],
                    showInLegend: false
               }]
          });
          
          document.getElementById('plain').addEventListener('click', () => {
               chart.update({
                    chart: {
                         inverted: false,
                         polar: false
                    },
                    subtitle: {
                         text: 'Plain'
                    }
               });
          });
          
          document.getElementById('inverted').addEventListener('click', () => {
               chart.update({
                    chart: {
                         inverted: true,
                         polar: false
                    },
                    subtitle: {
                         text: 'Inverted'
                    }
               });
          });
          
          document.getElementById('polar').addEventListener('click', () => {
               chart.update({
                    chart: {
                         inverted: false,
                         polar: true
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
               'calendar-end-time').value != "")
          {
               time_start = "T" + document.getElementById('calendar-start-time').value + ":00";
               time_end = "T" + document.getElementById('calendar-end-time').value + ":00";
          } else {
               time_start = "T00:00:00";
               time_end = "T23:59:59";
          }
          let addEvent = {
               member_name: document.querySelector('#member_name').value,
               allday_ok: checkboxStatus,
               title: document.getElementById('calendar-title').value,
               start: new Date(document.getElementById('calendar-start-date').value + time_start),
               end: new Date(document.getElementById('calendar-end-date').value + time_end),
               cal_cont: document.querySelector('#calendar-content').value
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
     
     checkbox.addEventListener('change', function() {
          if (this.checked) {
               timeHidden.classList.add('hidden')
               checkboxStatus = 'y'
          } else {
               timeHidden.classList.remove('hidden')
               checkboxStatus = 'n'
          }
     });//종일 체크가 되어있으면 시간체크를 보여주지 않는다

</script>
</html>