<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en">
<!----------------Head 시작----------------------->

<head>
    <title>스터디 내 게시판</title>
    <!--head.html Include-->
    <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>

    <script type="text/javascript" src="/resources/assets/js/pagination/pagination.js"></script>
      
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/0.3.4/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
      
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
                
                console.clear();
                console.log("제이쿼리 시작");
                $(`#regBtn`).on('click', function() {
                     console.log("regBtn 클릭");
                     self.location = "/studyIns/board/postGo?r_Idx=" + $(`#r_Idx`).val();
                });
                
           });
      
      
      </script>
</head>
<!----------------Head 종료----------------------->


<!----------------Body 시작----------------------->
<body id="kt_body" class="header-fixed subheader-enabled page-loading">
<!----------------메인 시작----------------------->
    <div class="d-flex flex-column flex-root">
        <!----------------페이지 시작----------------------->
        <div class="d-flex flex-row flex-column-fluid page">
            <!--begin::Wrapper ↓여기 매칭되는 div 태그부터 안닫아도 됨(footer에 있음)-->
            <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
                <!--header.html Include-->
                <jsp:include page="/WEB-INF/commons/header.jsp"></jsp:include>
                <!------------------Header Wrapper : 메뉴 탭 시작------------------>
                <!--menu.html Include-->
                <jsp:include page="/WEB-INF/views/member/menu_mypage.jsp"></jsp:include>
                <!------------------Header Wrapper : 메뉴 탭 종료------------------>
                <!--컨테이너 시작-->
                <div class="d-flex flex-row flex-column-fluid container">
                    <!--contents.html Include-->
                    <!--begin::Content Wrapper 내용물 시작-->
                    <div class="main d-flex flex-column flex-row-fluid">
                        <!--begin::Subheader 페이지 서브 헤더 시작-->
                        <div class="subheader py-2 py-lg-4" id="kt_subheader">
                            <div class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                                <!--begin::Details-->
                                <div class="d-flex align-items-center flex-wrap mr-2">
                                    <!--begin::Title-->
                                    <i class="fas fa-chalkboard-teacher"></i>&nbsp;&nbsp;
                                    <h5 class="text-dark font-weight-bolder mt-2 mb-2 mr-5">게시판</h5>
                                    <!--end::Title-->
                                    <!--Breadcrumb : 로드맵 시작-->
                                    <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                                        <li class="breadcrumb-item">
                                            <a href="" class="text-muted">스터디</a>
                                        </li>
                                        <li class="breadcrumb-item">
                                            <a href="/studyIns/board/list?r_Idx=${map.get("r_Idx")}" class="text-muted">게시판</a>
                                        </li>
                                    </ul>
                                    <!--Breadcrumb : 로드맵 종료-->
                                </div>
                                <div class="d-flex align-items-center">
                                    <button type="button" id="regBtn" class="btn btn-outline-primary font-weight-bolder">
                                        <span class="fas fa-pen"></span> 새 글 쓰기
                                    </button>
                                </div>
                                <!--end::Details-->
                            </div>
                        </div>
                        <!--end::Subheader  페이지 서브 헤더 종료-->

                        <div class="content flex-column-fluid" id="kt_content">
                            <!--begin::Card-->
                            <div class="card card-custom pt-4">
                            
<%--                                <button onclick="window.open('/moveChating?r_Idx=${map.get("r_Idx")}','window_name','width=600,height=500,location=no,status=no,scrollbars=yes');"></button>--%>
                                <!--end::Header-->
                                <!--카드 헤더 종료-->

                                <!--카드 Body 시작-->
                                <div class="card-body pt-2 pb-0 mt-4">
                                    <form id="actionForm" method="get" action="/studyIns/board/list">
                                        <input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum}"/>
                                        <input type="hidden" name="amount" value="${pageMaker.criteria.amount}"/>
                                        <input type="hidden" name="category" value="${category}"/>
                                        <input type="hidden" name="r_Idx" id="r_Idx" value="${map.get("r_Idx")}"/>
                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <div class="w-100">
                                                <span class="mr-4">카테고리</span>
                                                <label>
                                                    <select class="form-control selectpicker" id="category">
                                                        <option value="전체"
                                                                data-content="<span class='label label-md label-white label-inline label-rounded'>전체</span>">전체</option>
                                                        <option value="공지"
                                                                data-content="<span class='label label-md label-danger label-inline label-rounded'>공지</span>">공지</option>
                                                        <option value="인증"
                                                                data-content="<span class='label label-md label-primary label-inline label-rounded'>인증</span>">인증</option>
                                                        <option value="잡담"
                                                                data-content="<span class='label label-md label-warning label-inline label-rounded'>잡담</span>">잡담</option>
                                                        <option value="QnA"
                                                                data-content="<span class='label label-md label-success label-inline label-rounded'>QnA</span>">QnA</option>
                                                        <option value="기타"
                                                                data-content="<span class='label label-md label-info label-inline label-rounded'>기타</span>">기타</option>
                                                    </select>
                                                </label>


                                                <!--게시글 리스트 내용 시작-->
                                                <table class="board_list table table-hover">
                                                    <thead class="text-center">
                                                        <tr id="mytr">
                                                            <td>
                                                                #
                                                            </td>
                                                            <td>
                                                                카테고리
                                                            </td>
                                                            <td class="w-50">
                                                                제목
                                                            </td>
                                                            <td>
                                                                닉네임
                                                            </td>
                                                            <td>
                                                                작성일자
                                                            </td>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                    <c:forEach end="3" var="noticeList" items="${noticeList}">

                                                        <tr class="notice" style="background-color: oldlace">
                                                                <td></td>

                                                                <%--카테고리--%>
                                                            <td>
                                                                <div class="d-flex align-items-center justify-content-center">
                                                                    <span class="label label-md label-danger label-inline label-rounded">
                                                                        공지
                                                                    </span>
                                                                </div>
                                                            </td>

                                                                <%--제목--%>
                                                            <td>
                                                                <a
                                                                    href="/studyIns/board/detail?cont_No=<c:out value="${noticeList.cont_No}&curPage=${map.boardPager.curPage}&r_Idx=${map.get('r_Idx')}"/> ">
                                                                         <span class="font-weight-bolder font-size-lg mb-0 text-ssff1 text-hover-ssff-orange"
                                                                               data-container="body" data-toggle="popover"
                                                                               data-placement="top"
                                                                               data-content='<c:out value="${fn:substring(noticeList.cont.replaceAll('\\\<.*?\\\>',''),0, 10)}"/><c:if test="noticeList.cont >= 11">...</c:if>'>
                                                                            <c:out value="${noticeList.title}"/>
                                                                        </span>
                                                                </a>
                                                            </td>

                                                            <%--<td>
                                                                <c:out value="${fn:substring(noticeList.cont.replaceAll('\\\<.*?\\\>',''),0, 10)}"/>....
                                                            </td>--%>

                                                                <%--작성자--%>
                                                            <td>
                                                                <div class="d-flex align-items-center justify-content-center">
                                                                    <a href="/member/myPage?r_Idx=${noticeList.member_Name}">
                                                                        <span class="mb-0">
                                                                            ${noticeList.member_Name}
                                                                        </span>
                                                                    </a>
                                                                </div>
                                                            </td>

                                                                <%--작성일자--%>
                                                            <td>
                                                                <div class="d-flex align-items-center justify-content-center">
                                                                    <span class="mb-0 font-size-xs">
                                                                        <fmt:formatDate value="${noticeList.write_Date}" pattern="yyyy/MM/dd"/>
                                                                    </span>
                                                                </div>
                                                            </td>

                                                          </tr>
                                                    </c:forEach>

                                                    <c:set value="${fn:replace(pageMaker.total,' ' ,'' ) }" var="total"/>

                                                    <c:forEach items="${list}" var="list" varStatus="status">
                                                          <tr>
                                                                  <%--게시물 번호--%>
                                                                <c:choose>
                                                                      <c:when test="${map.get('category') eq '공지'}">
                                                                            <td>공지</td>
                                                                      </c:when>
                                                                      <c:otherwise>
                                                                            <td>${pageMaker.total - (pageMaker.criteria.pageNum*(status.index))}</td>
                                                                      </c:otherwise>
                                                                </c:choose>

                                                                   <%--카테고리--%>
                                                                <td>
                                                                    <div class="d-flex align-items-center justify-content-center">
                                                                        <c:choose>
                                                                            <c:when test="${list.category == '인증'}">
                                                                                <span class="label label-md label-primary label-inline label-rounded">
                                                                            </c:when>
                                                                            <c:when test="${list.category == '잡담'}">
                                                                                <span class="label label-md label-warning label-inline label-rounded">
                                                                            </c:when>
                                                                            <c:when test="${list.category == 'QnA'}">
                                                                                <span class="label label-md label-success label-inline label-rounded">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="label label-md label-info label-inline label-rounded">
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                     ${list.category}
                                                                        </span>
                                                                    </div>
                                                                </td>

                                                                   <%--제목--%>
                                                                <td>
                                                                    <a
                                                                        href="/studyIns/board/detail?cont_No=<c:out value="${list.cont_No}&curPage=${map.boardPager.curPage}&r_Idx=${map.get('r_Idx')}"/> ">
                                                                           <span class="font-weight-bolder font-size-lg mb-0 text-ssff1 text-hover-ssff-orange"
                                                                                 data-container="body" data-toggle="popover"
                                                                                 data-placement="top"
                                                                                 data-content='<c:out value="${fn:substring(list.cont.replaceAll('\\\<.*?\\\>',''),0, 10)}"/><c:if test="list.cont >= 11">...</c:if>'>
                                                                                <c:out value="${list.title}"/>
                                                                            </span>
                                                                    </a>
                                                                </td>

                                                                    <%--내용--%>
                                                                <%--<td>
                                                                      <c:out value="${fn:substring(list.cont.replaceAll('\\\<.*?\\\>',''),0, 10)}"/>
                                                                </td>--%>

                                                                          <%--작성자--%>
                                                                <td>
                                                                    <div class="d-flex align-items-center justify-content-center">
                                                                        <a href="/member/myPage?r_Idx=${list.member_Name}">
                                                                            <span class="mb-0">
                                                                                 ${list.member_Name}
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                </td>

                                                                <%--작성일자--%>
                                                                <td>
                                                                    <div class="d-flex align-items-center justify-content-center">
                                                                         <span class="mb-0 font-size-xs">
                                                                              <fmt:formatDate value="${list.write_Date}" pattern="yyyy/MM/dd"/>
                                                                         </span>
                                                                    </div>
                                                                </td>
                                                          </tr>
                                                    </c:forEach>


                                                    <c:if test="${total eq '0'}">
                                                          <tr>
                                                                <td colspan="12" style="">
                                                                      <h2 style="font-weight: 700; text-align: center; margin-bottom: 10px; margin-top: 10px">
                                                                          불러올 리스트가 없습니다.
                                                                      </h2>
                                                                </td>
                                                          </tr>
                                                    </c:if>
                                                    </tbody>
                                              </table>
                                                <%--페이지--%>
                                                <!--begin::Pagination-->
                                                <div class="mt-10 d-flex justify-content-center align-items-center flex-wrap">
                                                    <ul class="pagination">
                                                        <c:if test="${pageMaker.prev}">
                                                            <li id="prev"
                                                                class="paginate_button btn btn-icon btn-light-primary mr-2 my-1">
                                                                <a class="ki ki-bold-arrow-back icon-xs"
                                                                   id="prev_a" href="${pageMaker.startPage -1}"></a></li>
                                                        </c:if>

                                                        <c:forEach var="num" begin="${pageMaker.startPage}"
                                                                   end="${pageMaker.endPage}">
                                                            <li id="num"
                                                                class="paginate_button btn btn-icon border-0 btn-hover-primary mr-2 my-1 ${pageMaker.criteria.pageNum == num ? "active":""} ">
                                                                <a id="num_a" href="${num}">${num}</a>
                                                            </li>
                                                        </c:forEach>

                                                        <c:if test="${pageMaker.next}">
                                                            <li id="next"
                                                                class="paginate_button btn btn-icon btn-light-primary mr-2 my-1">
                                                                <a id="next_a" class="ki ki-bold-arrow-next icon-xs"
                                                                   href="${pageMaker.endPage +1 }"></a>
                                                            </li>
                                                        </c:if>
                                                    </ul>

<%--                                                    <h2>${pageMaker}</h2>--%>
                                                </div>
                                                <!--end:: Pagination-->
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                            <!--카드 Body 종료-->
                      </div>
                </div>
                <!--풀 사이즈 카드 종료 / 카드 필요 없으면 여기서까지 밀기☆-->
                </div>
          <!--컨테이너 종료-->
          <!--footer.html Include-->
    <jsp:include page="/WEB-INF/commons/footer.jsp"/>
</body>

<script>

     let kind = $(`#category`).val();
     $(function() {
          $(`#category`).val('${category}').prop("selected", true);
          console.log('${category}');
          
     });
     // $(`#dropDiv`).on("change", function () {
     //     $.ajax({
     //         async: false,
     //         type: 'POST',
     //         url: '데이터가 처리될 url주소',
     //         data: '',
     //         error: function (response, status, request) {
     //             Swal.fire('에러 발생');
     //         },
     //         success: function (resHtml) {
     //             Swal.fire('성공');
     //         }
     //     })
     // });


     let actionForm = $("#actionForm");
     $(`#category`).on("change", function(e) {
          console.log(`카테고리 변경되었습니다` + kind);
          
          location.href = "/studyIns/board/list?category=" + $(`#category`).val() + "&r_Idx=" + $(`#r_Idx`).val();
          
     });
     $(".paginate_button a").on("click", function(e) {
          
          e.preventDefault(); //기본 동작 제한
          
          actionForm.find("input[name='pageNum']").val($(this).attr("href"));
          
          actionForm.submit();
          
     });

</script>
<!----------------Body 종료----------------------->

</html>
