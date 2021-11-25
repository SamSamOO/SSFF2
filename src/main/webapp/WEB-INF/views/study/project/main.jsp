<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<!----------------Head 시작----------------------->

<head>
    <link href="../../../../resources/assets/css/yesol.css" rel="stylesheet" type="text/css">
    <title>"엮인글" 팀의 메인페이지</title><!--r_idx로 스터디 팀네임 가져올것-->
    <!--fullcalendar 관련 설정----------------------------->
    <link href="../../../../resources/assets/fullcalendar/modal.css" rel="stylesheet" />
    <link href='../../../../resources/assets/fullcalendar/fullcalendar/lib/main.css' rel='stylesheet' />
    <script src='../../../../resources/assets/fullcalendar/fullcalendar/lib/main.js'></script>
    <script src='../../../../resources/assets/fullcalendar/script.js'></script>

    <script>
      let calendarData = getFullCalendarData()
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
            left: 'prev,next today',
            center: 'title',
            right: 'addEventButton,dayGridMonth,timeGridWeek,timeGridDay'
          },
          selectable: true,
          editable: true,
          customButtons: {
            addEventButton: {
              text: 'add event',
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
                            <div class="card-header border-0 pt-5 card-body mt-5" id="post-body-wrapper">
                                <!-----------------------------------------------이 안에서 자유롭게 채우기------------------------------------------------------>
                                <input type="hidden" id="nickname" value="nickname55"><!--이 페이지로 접근한 아이디-->
                                <input type="hidden" id="r_idx" value=129><!--이 페이지로 접근한 아이디-->
                                <!--캘린더 섹션 start------->
                                <div id="calendar-sec">

                                    <!--calendar api-->
                                    <div id='calendar'></div>

                                    <!--modal-->
                                    <div class="modal hidden">
                                        <div class="modal-overlay"></div>
                                        <div class="modal-content">
                                            <h1>I'm a modal</h1>
                                            <label>제목 :</label>
                                            <input type="text" id="calendar-title">
                                            <label>일시 start :</label>
                                            <input type="text" id="calendar-start-date">
                                            <label>일시 end :</label>
                                            <input type="text" id="calendar-end-date">
                                            <label>내용 :</label>
                                            <input type="textarea" id="calendar-content">
                                            <label>태그 :</label>
                                            <input type="textarea" id="calendar-tag">
                                            <button id="modal-regist" onclick="eventRegist()">등록한다 조심해라</button>
                                            <button id="modal-modify" class="hidden">수정</button>
                                            <button id="modal-delete" class="hidden" onclick="deleteEvent()">삭제</button>
                                            <button id="close">❎</button>
                                        </div>
                                    </div>
                                </div>
                                <!--캘린더 섹션 end------->


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
  const modal = document.querySelector('.modal')
  const modalRegist = document.querySelector('#modal-regist')
  const modalModify = document.querySelector('#modal-modify')
  const modalDelete = document.querySelector('#modal-delete')

  const overlay = document.querySelector('.modal-overlay')
  //모달창이 활성화되면 흐린 배경을 표현하는 요소

  const closeBtn = document.getElementById('close')
  //offModal button

  const closeModal = () => {
    modal.classList.add('hidden')
  }

  closeBtn.addEventListener('click', closeModal)
  //모달창 내부의 닫기 버튼

  overlay.addEventListener('click', (e) => {
    if (e.target.className === 'modal-overlay') {
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
      document.getElementById('calendar-start-date').value = arg.event.startStr
      document.getElementById('calendar-end-date').value = arg.event.endStr
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
    let addEvent = {
      title: document.getElementById('calendar-title').value,
      start: document.getElementById('calendar-start-date').value,
      end: document.getElementById('calendar-end-date').value
    }
    let flag = true
    if (!addEvent.title) {
      flag = showAlarm(0)
    } else if (!(new Date(addEvent.start + 'T00:00:00')).valueOf()) {
      flag = showAlarm(1)
    } else if (!(new Date(addEvent.end + 'T00:00:00')).valueOf()) {
      flag = showAlarm(1)
    }
    if (!flag) return
    calendar.addEvent(addEvent) // front calendar update
    setFullCalendarData(calendar.getEvents()) // db update
    showAlarm(2)
    closeModal()
  }

  function deleteEvent () {
    if (showAlarm(5)) {
      currentEvent.remove()  // front calendar update
      setFullCalendarData(calendar.getEvents()) // db update
      showAlarm(3)
      closeModal()
    } else {
      showAlarm(4)
    }
  }

  function showAlarm (type) {
    switch (type) {
      case 0: alert('제목 알맞게 입력하라고!!!!!!!!!!!!'); return false; break;
      case 1: alert('날짜 제대로 입력안하냐!!!? 정신차리라고!!'); return false; break;
      case 2: alert('일정이 등록되었습니다.( ":D" )'); return false; break;
      case 3: alert('그래...삭제했다...너 혼자 잘살아봐라....'); return false; break;
      case 4: alert('음~~삭제 안하는거지? 잘생각했어~~ ( ":D" )'); return false; break;
      case 5: return confirm('일정을 삭제하겠다고? 와이? 정신차려이각박한세상속에!!!!!!!!'); break;
    }
  }
</script>
</html>