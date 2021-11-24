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
        $(function () {
            console.clear();
            console.log("제이쿼리 시작");
            $(`#regBtn`).on('click', function () {
                console.log("regBtn 클릭");
                self.location = "/studyIns/board/postGo";
            });

        });


    </script>
</head>

<!----------------Head 종료----------------------->
<!----------------Body 시작----------------------->


<body id="kt_body" class="header-fixed subheader-enabled page-loading ">
<!----------------메인 시작----------------------->
<div class="d-flex flex-column flex-root">
    <!----------------페이지 시작----------------------->
    <div class="d-flex flex-row flex-column-fluid page">
        <!--begin::Wrapper-->
        <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
            <!--header.html Include-->
            <jsp:include page="/WEB-INF/commons/header.jsp"></jsp:include>
            <!------------------Header Wrapper : 메뉴 탭 시작------------------>
            <!--menu.html Include-->
            <jsp:include page="/WEB-INF/commons/menu_mypage.jsp"></jsp:include>
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
                                <h5 class="text-dark font-weight-bold mt-2 mb-2 mr-5">게시판</h5>
                                <!--end::Title-->
                                <!--Breadcrumb : 로드맵 시작-->
                                <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                                    <li class="breadcrumb-item">
                                        <a href="" class="text-muted">스터디 이름</a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="" class="text-muted">게시판</a>
                                    </li>
                                </ul>
                                <!--Breadcrumb : 로드맵 종료-->
                            </div>
                            <!--end::Details-->
                            <div>
                                <a href="/studyIns/chatRoom?r_Idx=9002">
                                    <button type="button" class="btn btn-outline-primary font-weight-bolder">
                                        채팅방
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!--end::Subheader  페이지 서브 헤더 종료-->
                    <div class="content flex-column-fluid" id="kt_content">
                        <!--begin::Card-->
                        <div class="card card-custom pt-12">
                            <!--begin::Header-->
                            <%--                            <div class="card-header flex-wrap border-0 pt-6 pb-0 min-h-20px">--%>
                            <%--                            </div>--%>
                            <!--end::Header-->
                            <!--카드 Body 시작-->
                            <div class="card-body pt-2 pb-0 mt-n3">

                                <form id="actionForm" method="get" action="/studyIns/board/list">
                                    <input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum}"/>
                                    <input type="hidden" name="amount" value="${pageMaker.criteria.amount}"/>
                                    <input type="hidden" name="category" value="${category}"/>
                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <div class="col-lg-4 col-md-5 col-sm-5 ">
                                            <span class="mr-4">카테고리</span>
                                            <label>
                                                <select class="form-control selectpicker" id="category">
                                                    <option value="전체" data-content="전체">전체</option>
                                                    <option value="공지" data-content="공지">공지</option>
                                                    <option value="인증" data-content="인증">인증</option>
                                                    <option value="잡담" data-content="잡담">잡담</option>
                                                    <option value="QnA" data-content="QnA">QnA</option>
                                                    <option value="기타" data-content="기타">기타</option>
                                                </select>
                                            </label>
                                        </div>

                                        <div class="d-flex align-items-center py-3">
                                            <button type="button" class="btn btn-outline-primary font-weight-bolder" id="regBtn">새 글 쓰기</button>
                                        </div>
                                    </div>
                                    <%--                            <table class="table table-borderless">--%>


                                    <%--                                <!--카테고리별-->--%>
                                    <%--                                <tr>--%>
                                    <%--                                    <td colspan="7"></td>--%>
                                    <%--                                    <td>--%>
                                    <%--                                        <div class="col-lg-4 col-md-5 col-sm-5">--%>
                                    <%--                                            <label>--%>
                                    <%--                                                <select class="form-control selectpicker" id="category">--%>
                                    <%--                                                    <option value="전체" data-content="전체">전체</option>--%>
                                    <%--                                                    <option value="공지" data-content="공지">공지</option>--%>
                                    <%--                                                    <option value="인증" data-content="인증">인증</option>--%>
                                    <%--                                                    <option value="잡담" data-content="잡담">잡담</option>--%>
                                    <%--                                                    <option value="QnA" data-content="QnA">QnA</option>--%>
                                    <%--                                                    <option value="기타" data-content="기타">기타</option>--%>
                                    <%--                                                </select>--%>
                                    <%--                                            </label>--%>
                                    <%--                                        </div>--%>
                                    <%--                                    </td>--%>
                                    <%--                                </tr>--%>
                                    <%--                            </table>--%>
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
                                            <%--                                    <td>--%>
                                            <%--                                        내용--%>
                                            <%--                                    </td>--%>
                                            <td>
                                                닉네임
                                            </td>
                                            <td>
                                                작성일자
                                            </td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach begin="1" end="3" var="noticeList" items="${noticeList}">
                                            <tr class="notice">
                                                <td></td>
                                                    <%--카테고리--%>
                                                <td>
                                                    <div class="d-flex align-items-center justify-content-center">
                                                <span class="label label-danger label-inline label-rounded">
                                                    공지
                                                </span>
                                                    </div>
                                                </td>

                                                    <%--제목--%>
                                                <td>
                                                    <a
                                                            href="/studyIns/board/detail?cont_No=<c:out value="${noticeList.cont_No}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}"/>">
                                                 <span class="text-dark-75 font-weight-bolder font-size-lg mb-0 text-hover-primary">
                                                    <c:out value="${noticeList.title}"/>
                                                 </span>
                                                    </a>
                                                </td>

                                                    <%--내용--%>
                                                    <%--                                        <td>--%>
                                                    <%--                                            <c:out value="${fn:substring(noticeList.cont.replaceAll('\\\<.*?\\\>',''),0, 10)}"/>--%>
                                                    <%--                                        </td>--%>
                                                    <%--작성자--%>
                                                <td>
                                                    <div class="d-flex align-items-center justify-content-center">
                                                        <a href="">
                                                    <span class="mb-0 text-hover-primary">
                                                            ${noticeList.member_Name}
                                                    </span>
                                                        </a>
                                                    </div>
                                                </td>
                                                    <%--작성일자--%>
                                                <td>
                                                    <div class="d-flex align-items-center justify-content-center">
                                                    <span class="mb-0">
                                        <fmt:formatDate value="${noticeList.write_Date}" pattern="yyyy/MM/dd"/>
                                                    </span>
                                                    </div>
                                                </td>

                                            </tr>
                                        </c:forEach>

                                        <c:forEach items="${list}" var="list">
                                            <tr>
                                                    <%--게시물 번호--%>
                                                <td>
                                                        ${list.cont_No}
                                                </td>
                                                    <%--카테고리--%>
                                                <td>
                                                    <div class="d-flex align-items-center justify-content-center">
                                                <span class="label label-inline label-rounded">
                                                        ${list.category}
                                                </span>
                                                    </div>
                                                </td>
                                                    <%--제목--%>
                                                <td>
                                                    <a
                                                            href="/studyIns/board/detail?cont_No=<c:out value="${list.cont_No}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}"/> ">
                                                <span class="text-dark-75 font-weight-bolder font-size-lg mb-0 text-hover-primary">
                                                <c:out value="${list.title}"/>
                                                </span>
                                                    </a>
                                                </td>
                                                    <%--내용--%>
                                                    <%--                                        <td>--%>
                                                    <%--                                            <c:out value="${fn:substring(list.cont.replaceAll('\\\<.*?\\\>',''),0, 10)}"/>--%>
                                                    <%--                                        </td>--%>
                                                    <%--작성자--%>
                                                <td>
                                                    <div class="d-flex align-items-center justify-content-center">
                                                        <a href="">
                                                        <span class="mb-0 text-hover-primary">
                                                                ${list.member_Name}
                                                        </span>
                                                        </a>
                                                    </div>
                                                </td>
                                                    <%--작성일자--%>
                                                <td>
                                                    <div class="d-flex align-items-center justify-content-center">
                                                    <span class="mb-0">
                                        <fmt:formatDate value="${list.write_Date}" pattern="yyyy/MM/dd"/>
                                                </span>
                                                    </div>
                                                </td>

                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                    <%--페이지--%>
                                    <!--begin::Pagination-->
                                    <div class="mt-10 d-flex justify-content-center align-items-center flex-wrap">
                                        <ul class="pagination">
                                            <c:if test="${pageMaker.prev}">
                                                <li id="prev" class="paginate_button btn btn-icon btn-light-primary mr-2 my-1">
                                                    <a class="ki ki-bold-arrow-back icon-xs"
                                                       id="prev_a" href="${pageMaker.startPage -1}"></a></li>
                                            </c:if>

                                            <c:forEach var="num" begin="${pageMaker.startPage}"
                                                       end="${pageMaker.endPage}">
                                                <li id="num" class="paginate_button btn btn-icon border-0 btn-hover-primary mr-2 my-1 ${pageMaker.criteria.pageNum == num ? "active":""} ">
                                                    <a id="num_a" href="${num}">${num}</a>
                                                </li>
                                            </c:forEach>

                                            <c:if test="${pageMaker.next}">
                                                <li id="next" class="paginate_button btn btn-icon btn-light-primary mr-2 my-1">
                                                    <a id="next_a" class="ki ki-bold-arrow-next icon-xs" href="${pageMaker.endPage +1 }"></a>
                                                </li>
                                            </c:if>
                                        </ul>

                                        <h2>${pageMaker}</h2>
                                    </div>
                                    <!--end:: Pagination-->
                                </form>
                            </div>
                        </div>
                        <!--카드 Body 종료-->
                    </div>
                    <!--풀 사이즈 카드 종료 / 카드 필요 없으면 여기서까지 밀기☆-->

                    <!--컨테이너 종료-->
                    <!--footer.html Include-->
                    <jsp:include page="/WEB-INF/commons/footer.jsp"/>
</body>
<script>
    let kind = $(`#category`).val();
    $(function () {
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
    $(`#category`).on("change", function (e) {
        console.log(`카테고리 변경되었습니다` + kind);

        location.href = "/studyIns/board/list?category=" + $(`#category`).val();

    });
    $(".paginate_button a").on("click", function (e) {

        e.preventDefault(); //기본 동작 제한

        actionForm.find("input[name='pageNum']").val($(this).attr("href"));

        actionForm.submit();

    });

</script>
<!----------------Body 종료----------------------->

</html>