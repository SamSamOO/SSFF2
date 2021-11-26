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
    <style>


    </style>


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
            <jsp:include page="/WEB-INF/commons/menu_main.jsp"/>
            <!------------------Header Wrapper : 메뉴 탭 종료------------------>
            <!--컨테이너 시작-->
            <div class="d-flex flex-row flex-column-fluid container">
                <!--풀 사이즈 카드 시작 / 카드 필요 없으면 여기서부터 밀기☆-->
                <div class="card card-custom gutter-b card-stretch" style="width: 100%">
                    <!--카드 헤더 시작-->
                    <div class="card-header border-0 pt-5">
                        <h3 class="card-title align-items-start flex-column">
                            <span class="card-label font-weight-bolder text-dark font-size-h2-lg">메인페이지 임시 공사중..</span>
                            <p>&nbsp;</p>
                            <a href="/studyIns/movingChang?r_Idx=9002">채팅방 입장</a>
                        </h3>
                        <div class="card-toolbar">

                        </div>
                    </div>
                    <!--카드 헤더 종료-->
                    <!--카드 Body 시작-->
                    <div class="card-body pt-2 pb-0 mt-n3">
                        <form id="actionForm" method="get" action="/studyIns/board/list">
                            <input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum}"/>
                            <input type="hidden" name="amount" value="${pageMaker.criteria.amount}"/>
                            <input type="hidden" name="category" value="${category}"/>
                            <input type="hidden" name="r_Idx" value="9002"/>
                            <table class="table table-borderless">

                                <tr>
                                    <td colspan="7"></td>
                                    <td align="right">

                                        <label class="col-form-label text-right col-lg-3 col-sm-12">카테고리</label>
                                        <div class="col-lg-4 col-md-5 col-sm-5">
                                            <label>
                                                <select class="form-control selectpicker" id="category">
                                                    <option value="전체" data-content="<span class='label label-success label-inline label-rounded'>전체</span>">전체</option>
                                                    <option value="공지" data-content="<span class='label label-danger label-inline label-rounded'>공지</span>">공지</option>
                                                    <option value="인증" data-content="<span class='label label-primary label-inline label-rounded'>인증</span>">인증</option>
                                                    <option value="잡담" data-content="<span class='label label-success label-inline label-rounded'>잡담</span>">잡담</option>
                                                    <option value="QnA" data-content="<span class='label label-danger label-inline label-rounded'>QnA</span>">QnA</option>
                                                    <option value="기타" data-content="<span class='label label-primary label-inline label-rounded'>기타</span>">기타</option>
                                                </select>
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                            </table>

                            <table class="table table-striped table-hover">

                                <thead>
                                <tr id="mytr">
                                    <td>
                <span class="label label-inline label-light-primary font-weight-bold">
                    #
                </span>
                                    </td>
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
                                    <td>
                <span class="label label-inline label-light-primary font-weight-bold">
                    작성일자
                </span>
                                    </td>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach begin="1" end="3" var="noticeList" items="${noticeList}">

                                    <tr style="background-color: oldlace">
                                        <td>공지</td>
                                        <td>공지</td>
                                        <td><a
                                            href="/studyIns/board/detail?cont_No=<c:out value="${noticeList.cont_No}&curPage=${map.boardPager.curPage}&r_Idx=9002"/> ">
                                                <c:out value="${noticeList.title}"/><a/></td>
                                        <td><c:out value="${fn:substring(noticeList.cont.replaceAll('\\\<.*?\\\>',''),0, 10)}"/></td>
                                        <td>${noticeList.member_Name} </td>
                                        <td>
                                <span class="label label-inline label-light-primary font-weight-bold">
                                        <fmt:formatDate value="${noticeList.write_Date}" pattern="yyyy/MM/dd"/>
                                </span>
                                        </td>

                                    </tr>
                                </c:forEach>


                                <c:forEach items="${list}" var="list">

                                    <tr>
                                        <td>${list.cont_No}</td>
                                        <td>${list.category}</td>
                                        <td><a
                                            href="/studyIns/board/detail?cont_No=<c:out value="${list.cont_No}&curPage=${map.boardPager.curPage}&r_Idx=9002"/> ">
                                                <c:out value="${list.title}"/> <a/></td>
                                        <td><c:out value="${fn:substring(list.cont.replaceAll('\\\<.*?\\\>',''),0, 10)}"/></td>
                                        <td>${list.member_Name} </td>
                                        <td>

                                <span class="label label-inline label-light-primary font-weight-bold">
                                        <fmt:formatDate value="${list.write_Date}" pattern="yyyy/MM/dd"/>
                                </span>
                                        </td>

                                    </tr>
                                </c:forEach>
                                <tr style="background-color: white" class="align-center">
                                    <td colspan="8">
                                        <!--begin::Pagination-->
                                        <div class="d-flex justify-content-between align-items-center flex-wrap ">
                                            <h2>${pageMaker}</h2>
                                            <div style="width: 8%"></div>
                                            <div class='pull-right'>
                                                <ul class="pagination">

                                                    <c:if test="${pageMaker.prev}">
                                                        <li id="prev" class="paginate_button btn btn-icon btn-sm btn-light mr-2 my-1"><a class="ki ki-bold-arrow-back icon-xs p-4"
                                                                                                                                         id="prev_a" href="${pageMaker.startPage -1}"></a></li>
                                                    </c:if>

                                                    <c:forEach var="num" begin="${pageMaker.startPage}"
                                                               end="${pageMaker.endPage}">
                                                        <li id="num" class="paginate_button btn btn-icon btn-sm border-0 btn-light mr-2 my-1 ${pageMaker.criteria.pageNum == num ? "active":""} ">
                                                            <a class="p-4" id="num_a" href="${num}">${num}</a>
                                                        </li>
                                                    </c:forEach>

                                                    <c:if test="${pageMaker.next}">
                                                        <li id="next" class="paginate_button btn btn-icon btn-sm btn-light mr-2 my-1">
                                                            <a id="next_a" class="ki ki-bold-arrow-next icon-xs p-4" href="${pageMaker.endPage +1 }"></a>
                                                        </li>
                                                    </c:if>


                                                </ul>
                                            </div>
                                            <div class="d-flex align-items-center py-3">
                                                <button type="button" class="btn btn-outline-primary" style="vertical-align: center" id="regBtn">새 글 쓰기</button>
                                            </div>
                                        </div>
                                        <!--end:: Pagination-->
                                    </td>
                                </tr>
                                <%--                            <tr>--%>


                                <%--                            </tr>--%>

                                </tbody>
                            </table>
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


    $(`#category`).on("change", function (e) {
        console.log(`카테고리 변경되었습니다` + kind);

        location.href = "/studyIns/board/list?category=" + $(`#category`).val();

    });
    let actionForm = $("#actionForm");
    $(".paginate_button a").on("click", function (e) {

        e.preventDefault(); //기본 동작 제한

        actionForm.find("input[name='pageNum']").val($(this).attr("href"));

        actionForm.submit();

    });

</script>
<!----------------Body 종료----------------------->

</html>