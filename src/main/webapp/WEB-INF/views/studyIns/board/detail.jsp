<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="ko">
<!----------------Head 시작----------------------->

<head>
      <title>게시물 상세 페이지입니다</title>
      <!--head.html Include-->
      <jsp:include page="/WEB-INF/commons/head.jsp" />
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <script
              src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <script>
        //따라오는 바
        $(document).ready(function(){
            var currentPosition = parseInt($(".recmdListBar").css("top"));
            $(window).scroll(function() {
                var position = $(window).scrollTop();
                $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
            });
        });
    </script>
    <script>
            $(function() {
                  <c:choose>
                  <c:when test="${member.member_id==null}">

                  Swal.fire({
                        icon: 'warning', // Alert 타입
                        title: '로그인 오류', // Alert 제목
                        text: '로그인 하세요', // Alert 내용

                        buttons: {
                              confirm: {
                                    text: '확인 ',
                                    value: true,
                                    className: 'btn btn-outline-primary'
                              }
                        }
                  }).then((result) => {
                        if (result) {
                              location.href = "/member/loginGo";
                        }
                  });

                  </c:when>
                  <c:when test="${insStudy==0}">
                  Swal.fire({
                        icon: 'warning', // Alert 타입
                        title: '스터디원이 아닙니다.', // Alert 제목
                        text: '스터디원이 아닙니다.', // Alert 내용

                        buttons: {
                              confirm: {
                                    text: '스터디 ',
                                    value: true,
                                    className: 'btn btn-outline-primary'
                              }
                        }
                  }).then((result) => {
                        if (result) {
                              location.href = "javascript:history.back()";
                        }
                  });

                  </c:when>
                  </c:choose>

                  console.debug("제이쿼리 시작 ㅇㅇ");

                  $(`#modifyBtn`).on('click', function() {
                        console.log("수정 버튼 클릭");

                        self.location = '/studyIns/board/detail/modifyGo?cont_No=<c:out value="${detail.cont_No}"/>&r_Idx=<c:out value="${detail.r_Idx}"/>';
                  }); // onclick

                  $(`#removeBtn`).on('click', function() {
                        console.log("삭제 버튼 클릭");

                        <%--self.location = '/studyIns/board/detail/remove?cont_No=<c:out value="${detail.cont_No}"/> ';--%>
                        let formObj = $('form');

                        formObj.attr('method', 'POST');
                        formObj.attr('action', '/studyIns/board/detail/remove');
                        formObj.submit();
                  }); // onclick
            }); // jq

            function doImgPop(img) {
                  img1 = new Image();
                  img1.src = (img);
                  console.log(img1.src);

                  imgControll(img);
            }

            function imgControll(img) {
                  let intervalID;
                  let controller;

                  if ((img1.width != 0) && (img1.height != 0)) {
                        viewImage(img);
                  } else {
                        controller = "imgControll('" + img + "')";
                        intervalID = setTimeout(controller, 20);
                  }
            }

            function viewImage(img) {
                  console.log(img);
                  W = img1.width;
                  H = img1.height;
                  O = "width=" + W + ",height=" + H + ",scrollbars=yes";
                  imgWin = window.open("", "", O);
                  imgWin.document.write("<html lang='ko'><head><title>----------이미지 상세보기----------클릭시 창이 닫힙니다.</title></head>");
                  imgWin.document.write("<body topmargin=0 leftmargin=0>");
                  imgWin.document.write("<img src=" + img +
                          " onclick = self.close() style= cursor:pointer; title = '클릭하시면 창이 닫힙니다.'>");
                  imgWin.document.close();
            }
      </script>

</head>
<c:set var="fileListSize" value="${fn:length(fileList)}" />
<c:set var="slash" value="/" />
<!----------------Head 종료----------------------->

<!----------------Body 시작----------------------->
<body id="kt_body" class="header-fixed subheader-enabled page-loading">
<!----------------메인 시작----------------------->
<div class="d-flex flex-column flex-root">

    <!----------------.인기글 추천 시작----------------------->
    <div class="recmdListBar position-absolute overflow-hidden">
        <div class="recommendPost_userInfoWrapper d-flex flex-row mb-2">
            <div class="recommendPost_bar">
            </div>
            <div class="recommendPost_userInfo">
                <span class="recommendPost_userName font-weight-bolder text-ssff2">${member.member_name}</span>
                님이<br>좋아하실 것 같아요!
            </div>
        </div>
        <div class="separator separator-solid my-4"></div>
        <div>
            <ul class="recommendPost_listWrapper">
            <c:forEach var="list" items="${listByHit}"
                       begin="1" end="5"
                       varStatus="status">
                <li class="recommendPost_postList">
                    <div class="recommendPost_title">
                        <span class="mr-1">${status.count}</span>
                        <a href="?cont_No=${list.cont_No}&r_Idx=${detail.r_Idx}"
                           class="font-size-h6-md font-weight-bolder">
                            <c:out value="${fn:substring(list.title.replaceAll('\\\<.*?\\\>',''),0, 10)}"/><c:if test="list.title >= 11">...</c:if>
                        </a>
                    </div>
                </li>
            </c:forEach>
        </ul>
        </div>
    </div>

    <!----------------.인기글 추천 종료----------------------->

    <!----------------페이지 시작----------------------->
      <div class="d-flex flex-row flex-column-fluid page">
            <!--begin::Wrapper ↓여기 매칭되는 div 태그부터 안닫아도 됨(footer에 있음)-->
            <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
                  <!------------------header.html Include------------------>
                  <jsp:include page="/WEB-INF/commons/header.jsp" />
                  <!------------------Header Wrapper : 메뉴 탭 시작------------------>
                  <!--menu.html Include-->
                  <jsp:include page="/WEB-INF/views/member/menu_mypage.jsp"></jsp:include>
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
                                                      <h5 class="text-dark font-weight-bold my-1 mr-5"><i
                                                              class="far fa-sticky-note"></i>
                                                            ${detail.title}
                                                      </h5>
                                                      <!--Page Title : 페이지 제목 종료-->
                                                      <!--Breadcrumb : 로드맵 시작-->
                                                      <ul
                                                              class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                                                            <li class="breadcrumb-item">
                                                                  <a href="/study/" class="text-muted"></a>

                                                            </li>
                                                            <li class="breadcrumb-item">
                                                                  <a href="/studyIns/board/list?r_Idx=${detail.r_Idx}" class="text-muted">게시판</a>
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
                                    <div class="study_board card card-custom gutter-b card-stretch">
                                          <%--버튼영역--%>
                                          <div class="d-flex justify-content-between align-items-center pt-6 pl-8 pr-4">
                                                <%--뒤로가기--%>
                                                <div>
                                                      <a href="javascript:history.back()"><i
                                                              class="fas fa-arrow-left fa-2x text-hover-ssff-orange"
                                                              id="backBtn"></i></a>
                                                </div>
                                                <%--TODO 세션아이디와 현재글 닉네임과 동일한 경우 수정 삭제버튼 보입니다. --%>
                                                <%--수정삭제--%>
                                                <c:set var="writer" value="${detail.member_Name}" />
                                                <c:if test="${member.member_name eq writer}">
                                                      <div>
                                                            <button type="button" id="modifyBtn"
                                                                    class="btn fa-1x mr-1 bg-ssff1 bg-hover-ssff2">
                                                                  <i class="fas fa-edit text-white"></i>
                                                                  수정
                                                            </button>
                                                            <button type="button" id="removeBtn"
                                                                    class="btn fa-1x ml-1 text-white bg-danger bg-hover-ssff2">
                                                                  <i class="fas fa-times text-white"></i>
                                                                  삭제
                                                            </button>
                                                      </div>
                                                </c:if>
                                          </div>

                                          <!--카드 Body 시작-->
                                                <div class="card-body border-0 pt-0">
                                                      <form action="/studyIns/board/detail/modify"
                                                            class="d-flex w-100" method="POST">
                                                            <input type="hidden" name="cont_No"
                                                                   value="<c:out value='${detail.cont_No}' />">
                                                            <input type="hidden" id="r_Idx" name="r_Idx"
                                                                   value="<c:out value='${detail.r_Idx}' />">
                                                            <table class="table table-borderless">
                                                                  <%--카테고리--%>
                                                                  <tr>
                                                                        <td>
                                                                            <c:choose>
                                                                            <c:when test="${detail.category == '인증'}">
                                                                            <span class="label label-md label-primary label-inline label-rounded">
                                                                            </c:when>
                                                                            <c:when test="${detail.category == '잡담'}">
                                                                                <span class="label label-md label-warning label-inline label-rounded">
                                                                            </c:when>
                                                                            <c:when test="${detail.category == 'QnA'}">
                                                                                <span class="label label-md label-success label-inline label-rounded">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="label label-md label-info label-inline label-rounded">
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                                    ${detail.category}
                                                                              </span>
                                                                        </td>
                                                                  </tr>

                                                                  <%--제목--%>
                                                                  <tr>
                                                                        <td>
                                                                              <span class="font-weight-bolder font-size-h3">
                                                                                    ${detail.title}
                                                                              </span>
                                                                        </td>
                                                                  </tr>

                                                                  <%--작성자--%>
                                                                  <tr class="font-size-sm pt-0">
                                                                        <td>
                                                                              <a href="/member/myPage?r_Idx=?${detail.member_Name}">
                                                                                ${detail.member_Name}
                                                                              </a>
                                                                        </td>
                                                                  </tr>

                                                                  <%--작성일 /수정일--%>
                                                                  <tr class="font-size-xs text-dark-25">
                                                                      <%--<th colspan="1" align="right">작성일자</th>--%>
                                                                      <td class="pt-0">
                                                                          <fmt:formatDate value="${detail.write_Date}"
                                                                               pattern="yyyy/MM/dd hh:mm" />
                                                                      </td>

                                                                  <c:if
                                                                          test="${ not empty detail.modify_Date }">
                                                                        <%--<th colspan="1">수정일자</th>--%>
                                                                    <tr class="font-size-xs text-dark-25">
                                                                    <td>
                                                                              <fmt:formatDate
                                                                                      value="${detail.modify_Date}"
                                                                                      pattern="yyyy/MM/dd hh:mm" />
                                                                        </td>
                                                                  </tr>
                                                                  </c:if>
                                                            </tr>

                                                            <%--첨부파일--%>
                                                            <tr>
                                                                <td class="text-right">
                                                                   <c:if test="${fileListSize==0}">
                                                                     이미지가 없습니다.
                                                                   </c:if>
                                                                   <c:if test="${fileListSize!=0}">
                                                                    <div class="accordion accordion-light accordion-toggle-arrow"
                                                                         id="filelist${detail.cont_No}">
                                                                             <div class="card">
                                                                                  <div class="card-header"
                                                                                       id="headingOne5">
                                                                                       <div class="card-title justify-content-end text-ssff1 text-hover-ssff-orange font-weight-bolder pt-0 pr-6"
                                                                                             data-toggle="collapse"
                                                                                            data-target="#filelistOne">
                                                                                            <i class="fas fa-download text-ssff1"></i>
                                                                                               첨부파일
                                                                                       </div>
                                                                                  </div>
                                                                             <div id="filelistOne" class="collapse"
                                                                                  data-parent="#filelist${detail.cont_No}">
                                                                                  <div class="card-body">
                                                                                       <div class="form_section">
                                                                                            <div class="form_section_content">
                                                                                                 <div id="uploadResult">
                                                                                                     <c:forEach var="file" items="${fileList}">
                                                                                                         <a href="<spring:url value='/image/${file.uuid}_${file.file_Name}'/>">
                                                                                                             <p>
                                                                                                                ${file.file_Name}
                                                                                                            </p>
                                                                                                         </a>
                                                                                                       </c:forEach>
                                                                                                </div>
                                                                                            </div>
                                                                                       </div>
                                                                                  </div>
                                                                             </div>
                                                                             </div>
                                                                    </div>
                                                                   </c:if>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                  <td>
                                                                        <div class="separator separator-solid my-4 px-p15"></div>
                                                                  </td>
                                                            </tr>

                                                            <%--내용--%>
                                                            <tr>
                                                                  <td  id="contcont" class="text-left px-p15">
                                                                        ${detail.cont}
                                                                  </td>
                                                            </tr>
                                                      </table>
                                                      </form>
                                                </div>
                                          <!--카드 바디 종료-->
                                          <%--조회수--%>
                                          <div class="text-right p-4">
                                                <i class="far fa-eye font-size-sm">${detail.hit}</i>&nbsp;
                                          </div>
                                    </div>
                                    <!--풀 사이즈 카드 종료 / 카드 필요 없으면 여기서까지 밀기☆-->
                                    <!--대시보드 종료-->
                              </div>
                              <!--end::Content-->
                        </div>
                        <!--end::Content Wrapper 내용물 종료-->
                  </div>
                  <%--컨테이너 종료--%>
                  <!--footer.html Include-->
            <jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</body>
<!----------------Body 종료----------------------->

</html>