<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<!--예솔 for calendar-->
	<link href="../../../resources/assets/css/yesol.css" rel="stylesheet" type="text/css">
	<link href="../../../resources/assets/fullcalendar/modal.css" rel="stylesheet"/>
	<link href='../../../resources/assets/fullcalendar/fullcalendar/lib/main.css' rel='stylesheet'/>
	<script src='../../../resources/assets/fullcalendar/fullcalendar/lib/main.js'></script>
	<script src='../../../resources/assets/fullcalendar/script.js'></script>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<input type="hidden" id="member_name" value="${member.member_name}">

	<script>
		let member_name = document.querySelector('#member_name').value;
		let calendarData
		
		async function doGetCalendarData() {
			calendarData = await getFullCalendarData(member_name,'/calendar/getAll');
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
					left: 'title',
					center: '',
					right: 'prev,next today'//addEventButton,dayGridMonth,timeGridWeek,timeGridDay
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

	<!--예솔 for calendar end-->
	<%-- TODO 로그인한 사람이랑 페이지 주인이 다르면 어쩌구 하고싶어--%>
	<title>${member.member_name}님의 마이 페이지</title>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/commons/head.jsp"></jsp:include>
	<!--<script src="${pageContext.request.contextPath}/resources/assets/js/member/myPage.js"></script>-->
</head>
<!----------------Head 종료----------------------->

<!----------------Body 시작----------------------->
<body id="kt_body" class="header-fixed subheader-enabled page-loading">
<form class="form">
	<!----------------메인 시작----------------------->
	<div class="d-flex flex-column flex-root">
		<!----------------페이지 시작----------------------->
		<div class="d-flex flex-row flex-column-fluid page">
			<!--begin::Wrapper ↓여기 매칭되는 div 태그부터 안닫아도 됨(footer에 있음)-->
			<div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
				<!------------------header.html Include------------------>
				<jsp:include page="/WEB-INF/commons/header.jsp"></jsp:include>
				<!------------------Header Wrapper : 메뉴 탭 시작------------------>
				<!--menu.html Include-->
				<jsp:include page="/WEB-INF/views/member/menu_mypage.jsp"></jsp:include>
				<!------------------Header Wrapper : 메뉴 탭 종료------------------>
				<!--컨테이너 시작-->
				<div class="d-flex flex-row flex-column-fluid container">
					<!--☆contents.html Include☆-->
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
										<i class="fas fa-user"></i>&nbsp;&nbsp;
										<h5 class="text-dark font-weight-bolder mt-2 mb-2 mr-5">
											<title>내 정보</title>
										</h5>
										<!--Page Title : 페이지 제목 종료-->
										<!--Breadcrumb : 로드맵 시작-->
										<ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
											<li class="breadcrumb-item">
												<a href="/member/myPage?r_Idx=${member.member_name}" class="text-muted">회원 정보</a>
											</li>
										</ul>
										<!--Breadcrumb : 로드맵 종료-->
									</div>
									<!--end::Page Heading-->
								</div>
								<!--end::Info-->
							</div>
						</div>
						<div class="content flex-column-fluid" id="kt_content">
							<!--대시보드 시작-->

							<!--풀 사이즈 카드 시작 / 카드 필요 없으면 여기서부터 밀기☆-->
							<div class="card card-custom">
								<!--begin::Body 북마크-->
								<div class="card-body">
									<!--begin::Details-->
									<div class="d-flex mb-9">
										<!--begin: Pic-->
										<div class="flex-shrink-0 mr-7 mt-lg-0 mt-3">
											<div class="symbol symbol-50 symbol-lg-120">
												<img src="${member.member_profile}" alt="image" class="object-cover"/>
											</div>
											<div class="symbol symbol-50 symbol-lg-120 symbol-primary d-none">
												<span class="symbol-label font-size-h5 font-weight-bolder"> ${fn:substring(member_Name,0,1)} </span>
											</div>
										</div>
										<!--수정기능 있는 버전-->
										<%--<div class="flex-shrink-0 mr-7 mt-lg-0 mt-3">
                                           <div class="symbol symbol-50 symbol-lg-120">
                                              <div class="image-input image-input-empty image-input-outline" id="kt_image_5" style="background-image: url(${pageContext.request.contextPath}/resources/assets/media/users/blank.png)">
                                                 <div class="image-input-wrapper"></div>
                                                 <label class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow" data-action="change" data-toggle="tooltip" title="" data-original-title="Change avatar">
                                                    <i class="fa fa-pen icon-sm text-muted"></i>
                                                    <input type="file" name="profile_avatar"
                                                          accept=".png, .jpg, .jpeg"/>
                                                    <input type="hidden" name="profile_avatar_remove"/>
                                                 </label>
                                                 <span class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow" data-action="cancel" data-toggle="tooltip" title="Cancel avatar">
                                                      <i class="ki ki-bold-close icon-xs text-muted"></i>
                                                     </span>
                                                 <span class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow" data-action="remove" data-toggle="tooltip" title="Remove avatar">
                                                   <i class="ki ki-bold-close icon-xs text-muted"></i>
                                                  </span>
                                              </div>
                                           </div>
                                           <div class="symbol symbol-50 symbol-lg-120 symbol-primary d-none">
                                              <span class="font-size-h3 symbol-label font-weight-boldest">JM</span>
                                           </div>
                                        </div>--%>
										<!--end::Pic-->

										<!--begin::Info-->
										<div class="flex-grow-1">
											<!--begin::Title-->
											<div class="d-flex justify-content-between flex-wrap mt-1">
												<div class="d-flex mr-3 align-items-center">

													<span class="text-dark-75 text-hover-primary font-size-h5 font-weight-bold mr-3">${member.member_name}님</span>

													<c:if test="${(sessionScope.member.member_name == member.member_name) || (sessionScope.kname == member.member_name)}">
														<i class="flaticon2-correct text-success font-size-h5 align-self-center"></i>
														<a href="/member/modifyGo" class="mx-4">
															<i class="fa fa-edit"></i>
														</a>
													</c:if>
												</div>
												<div class="my-lg-0 my-3">
													<a href="#" class="btn btn-sm bg-ssff1 bg-hover-danger-o-1 font-weight-bolder text-uppercase mr-3">프로젝트 찾기</a>
													<a href="#" class="btn btn-sm bg-ssff2 bg-hover-danger-o-1 font-weight-bolder text-uppercase mr-3">스터디 찾기</a>
												</div>
												<%--<div class="d-flex1 align-items-center w-70 flex-fill float-right mt-lg-12 mt-8">
                                                   <button type="button" id="modifyMember" onclick="fn_modify();" class="btn btn-primary font-weight-bolder font-size-h5 pl-9 pr-9 py-4 my-5 ">
                                                      정보수정
                                                   </button>
                                                   <button type="button" id="findPJ" onclick="fn_findPJ();" class="btn btn-primary font-weight-bolder font-size-h5 pl-8 pr-7 py-4 my-5 ">
                                                      프로젝트찾기
                                                   </button>
                                                </div>--%>
											</div>
											<!--end::Title-->
											<!--begin::Content-->
											<div class="d-flex flex-wrap justify-content-between mt-1">
												<div class="d-flex flex-column flex-grow-1 pr-8">
													<div class="d-flex flex-wrap mb-4">
														<a href="#" class="text-dark-50 text-hover-primary font-weight-bold mr-lg-8 mr-5 mb-lg-0 mb-2">
															<i class="flaticon2-new-email mr-2 font-size-lg"></i>${member.member_id}
														</a>
														<a href="#" class="text-dark-50 text-hover-primary font-weight-bold mr-lg-8 mr-5 mb-lg-0 mb-2">
															<i class="flaticon2-calendar-3 mr-2 font-size-lg"></i>${member.member_no}
														</a>
													</div>
													<span class="font-weight-bold text-dark-50">${member.member_introduce}</span>
												</div>
											</div>
											<!--end::Content-->
										</div>
										<!--end::Info-->
									</div>
									<!--end::Details-->

									<div class="separator separator-solid"></div>
									<!--begin::사용언어-->
									<div class="d-flex align-items-center flex-wrap mt-8 member_lang">
										<c:forEach items="" var="list">
											<!--begin::아이콘-->
											<div class="d-flex align-items-center flex-lg-fill mr-5 mb-2">
                                <span class="mr-4">
                                   <i class=" display-4 text-muted font-weight-bolder"></i>
                                </span>
											</div>
											<!--end::아이콘-->
										</c:forEach>
										<!--begin::자바-->
										<div class="d-flex align-items-center flex-lg-fill mr-5 mb-2">
											<img src="/resources/assets/images/logos/language/java.png">
										</div>
										<!--end::아이콘-->
										<!--begin::아이콘-->
										<div class="d-flex align-items-center flex-lg-fill mr-5 mb-2">
                                <span class="mr-4">
                                   <i class=" display-4 text-muted font-weight-bolder"></i>
                                </span>
										</div>
										<!--end::아이콘-->
										<!--begin::아이콘-->
										<div class="d-flex align-items-center flex-lg-fill mr-5 mb-2">
                                <span class="mr-4">
                                   <i class=" display-4 text-muted font-weight-bolder"></i>
                                </span>
										</div>
										<!--end::아이콘-->
									</div>
								</div>
								<!--카드 Body 종료-->
							</div>
							<!--풀 사이즈 카드 종료 / 카드 필요 없으면 여기서까지 밀기☆-->
							<!--풀 사이즈 카드 시작 / 카드 필요 없으면 여기서부터 밀기☆-->
							<div class="card card-custom my-5">
								<!--카드 헤더 시작-->
								<div class="card-header border-0 pt-5">
									<h3 class="card-title align-items-start flex-column">
										<span class="card-label font-weight-bolder text-dark">일정</span>
									</h3>
									<div class="card-toolbar">

									</div>
								</div>
								<!--카드 헤더 종료-->
								<!--카드 Body 시작-->
								<div class="card-body">


									<div id='calendar'></div>
									<!--modal part-->

									<!--modal-->
									<div class="calmodal hidden">
										<div class="calmodal-overlay"></div>
										<div class="calmodal-content">
											<img src="../../../../resources/assets/images/icon/close.png"
												 style="width:20px;" id="close">
											<!--❎이거 어케한거지..-->
											<h1 id="cal-title-sec">
												<!--<span>[코벤져스]</span> 팀명 자동으로 들어옴-->
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
									
									
									<!--modal part end-->
								</div>
								<!--카드 Body 종료-->
							</div>
							<!--풀 사이즈 카드 종료 / 카드 필요 없으면 여기서까지 밀기☆-->
						</div>
					</div>
				</div>
				<!--컨테이너 종료-->
				<!--footer.html Include-->
				<jsp:include page="${pageContext.request.contextPath}/WEB-INF/commons/footer.jsp"></jsp:include>


</form>
</body>
<!--script for calendar-->
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
		if (arg) {   // detail 일때
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
		} else {   // 등록 일때
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



<!--script for calendar end-->
</html>
<script type="text/javascript">
	function fn_modify() {
		$.ajax({
			url: "/member/modify",  // 켈린더로 가는 링크
		})
	}


	function fn_findPJ() {
		$.ajax({
			url: "/member/",  // 켈린더로 가는 링크
		})
	}



</script>