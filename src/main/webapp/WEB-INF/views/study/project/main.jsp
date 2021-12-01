<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<!----------------Head 시작----------------------->

<head>
      <!--head.html Include-->
      <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>
      <link href="/resources/assets/css/yesol.css" rel="stylesheet" type="text/css">
      <title>"엮인글" 팀의 메인페이지</title><!--r_idx로 스터디 팀네임 가져올것-->
      <!--fullcalendar 관련 설정----------------------------->
      <link href="/resources/assets/fullcalendar/modal.css" rel="stylesheet"/>
      <link href='/resources/assets/fullcalendar/fullcalendar/lib/main.css'
            rel='stylesheet'/>
      <script src='/resources/assets/fullcalendar/fullcalendar/lib/main.js'></script>
      <script src='/resources/assets/fullcalendar/script.js'></script>
      <!--상부 js를 위한 설정-->
      <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
      <!--이게 여기있는게 맞나 싶긴 한데.. 그래도 넣어놓음-->
      <input type="hidden" id="member_name" value="${member.member_name}"><!--이 페이지로 접근한 아이디-->
      <input type="hidden" id="r_idx" value= ${map.r_Idx}><!--이 페이지의 스터디번호-->
      
      <script>
           let r_idx = ${map.r_Idx};
           console.log(r_idx);
           //document.querySelector('#r_idx').value;
           let calendarData;
           
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
                          right: 'addEventButton'//addEventButton,dayGridMonth,timeGridWeek,timeGridDay
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
                               click: () => {
                                    openModal()
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
      
      <!--fullcalendar 관련 설정 end---------------------------->
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
                  <jsp:include page="/WEB-INF/commons/header.jsp"/>
                  <!------------------Header Wrapper : 메뉴 탭 시작------------------>
                  <!--menu.html Include-->
                  <jsp:include page="/WEB-INF/views/member/menu_mypage.jsp"/>
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
                                                      <h5 class="text-dark font-weight-bold my-1 mr-5">메인페이지 :${dto.teamName}
                                                      </h5>
                                                      <!--Page Title : 페이지 제목 종료-->
                                                      <!--Breadcrumb : 로드맵 시작-->
                                                      <ul
                                                              class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                                                            <li class="breadcrumb-item">
                                                                  <a hidden href="" class="text-muted">프로젝트</a>
                                                                  <!--숨겨놓음-->
                                                            </li>
                                                            <!--<li class="breadcrumb-item">
                                                                <a hidden href="" class="text-muted">카테고리2</a>
                                                            </li>-->
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
                                    <div class="card card-custom">
                                          
                                          <!--카드 Body 시작-->
                                          <div class="border-0 pt-5 card-body mt-5"
                                               id="post-body-wrapper"><!--id="post-body-wrapper" 이거 넣으면 가운데정렬-->
                                                <!-----------------------------------------------이 안에서 자유롭게 채우기------------------------------------------------------>
                                                <div class="d-flex flex-column w-100">
                                                      <div class="mainpage_index border rounded">▶ 일정 관리</div>
                                                      <!--캘린더 섹션 start------->
                                                      <div id="calendar-sec" class="d-flex justify-content-center"><!--캘린더 크기 설정-->
                                                            <!--calendar api-->
                                                            <div id='calendar' class="d-flex flex-column w-100"></div>
                                                            <!--modal-->
                                                            <div class="calmodal hidden">
                                                                  <div class="calmodal-overlay"></div>
                                                                  <div class="calmodal-content">
                                                                        <img src="/resources/assets/images/icon/close.png"
                                                                             style="width:20px;" id="close">
                                                                        <!--❎이거 어케한거지..-->
                                                                        <h1 id="cal-title-sec">
                                                                              <!--팀명 자동으로 들어옴-->
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
                                                      <li class="mainpage_index" style="list-style: none">
                                                            <a href="/studyIns/board/list?r_Idx=${map.get("r_Idx")}" style="color: blue"><span>▶ 게시판 이동</span></a>
                                                      </li>
                                                      
                                                      
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
                                                </div>
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