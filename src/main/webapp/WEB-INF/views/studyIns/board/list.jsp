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
            <jsp:include page="/WEB-INF/commons/header.jsp"></jsp:include>
            <!------------------Header Wrapper : 메뉴 탭 시작------------------>
            <!--menu.html Include-->
            <jsp:include page="/WEB-INF/commons/menu_main.jsp"></jsp:include>
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
                        </h3>
                        <div class="card-toolbar">

                        </div>
                    </div>
                    <!--카드 헤더 종료-->
                    <!--카드 Body 시작-->
                    <div class="card-body pt-2 pb-0 mt-n3">
                        <table class="table table-borderless">

                            <tr>
                                <td colspan="7">ddddddddd</td>
                                <td align="right">

                                    <label class="col-form-label text-right col-lg-3 col-sm-12">카테고리</label>
                                    <div class="col-lg-4 col-md-5 col-sm-5">
                                        <select class="form-control selectpicker">
                                            <option data-content="<span class='label label-success label-inline label-rounded'>인증</span>">인증</option>
                                            <option data-content="<span class='label label-warning label-inline label-rounded'>잡담</span>">잡담</option>
                                            <option data-content="<span class='label label-primary label-inline label-rounded'>QnA</span>">QnA</option>
                                            <option data-content="<span class='label label-danger label-inline label-rounded'>기타</span>">기타</option>
                                        </select>
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
                            <c:forEach items="${list}" var="list">

                                <tr>
                                    <th scope="row">${list.cont_No}</th>
                                    <td>${list.category}</td>
                                    <td><a href="/studyIns/board/detail?cont_No=<c:out value="${list.cont_No}"/> ">
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
                            <tr>
                                <td colspan="5">&nbsp;</td>
                                <td>
                                    <button type="button" class="btn btn-outline-primary" id="regBtn">새 글 쓰기</button>
                                </td>
                            </tr>
                            <tr style="all: revert;" >
                                <td>
                                    <!--begin::Pagination-->
                                    <div class="d-flex justify-content-between align-items-center flex-wrap ">
                                        <div class="d-flex flex-wrap py-2 mr-3">
                                            <a href="#" class="btn btn-icon btn-sm btn-light mr-2 my-1"><i class="ki ki-bold-double-arrow-back icon-xs"></i></a>
                                            <a href="#" class="btn btn-icon btn-sm btn-light mr-2 my-1"><i class="ki ki-bold-arrow-back icon-xs"></i></a>

                                            <a href="#" class="btn btn-icon btn-sm border-0 btn-light mr-2 my-1">...</a>
                                            <a href="#" class="btn btn-icon btn-sm border-0 btn-light mr-2 my-1">23</a>
                                            <a href="#" class="btn btn-icon btn-sm border-0 btn-light btn-hover-primary active mr-2 my-1">24</a>
                                            <a href="#" class="btn btn-icon btn-sm border-0 btn-light mr-2 my-1">25</a>
                                            <a href="#" class="btn btn-icon btn-sm border-0 btn-light mr-2 my-1">26</a>
                                            <a href="#" class="btn btn-icon btn-sm border-0 btn-light mr-2 my-1">27</a>
                                            <a href="#" class="btn btn-icon btn-sm border-0 btn-light mr-2 my-1">28</a>
                                            <a href="#" class="btn btn-icon btn-sm border-0 btn-light mr-2 my-1">...</a>

                                            <a href="#" class="btn btn-icon btn-sm btn-light mr-2 my-1"><i class="ki ki-bold-arrow-next icon-xs"></i></a>
                                            <a href="#" class="btn btn-icon btn-sm btn-light mr-2 my-1"><i class="ki ki-bold-double-arrow-next icon-xs"></i></a>
                                        </div>
                                        <div class="d-flex align-items-center py-3">
                                            <div class="d-flex align-items-center">
                                                <div class="mr-2 text-muted">Loading...</div>
                                                <div class="spinner mr-10"></div>
                                            </div>

                                            <select class="form-control form-control-sm font-weight-bold mr-4 border-0 bg-light" style="width: 75px;">
                                                <option value="10">10</option>
                                                <option value="20">20</option>
                                                <option value="30">30</option>
                                                <option value="50">50</option>
                                                <option value="100">100</option>
                                            </select>
                                            <span class="text-muted">Displaying 10 of 230 records</span>
                                        </div>
                                    </div>
                                    <!--end:: Pagination-->
                                </td>

                            </tr>

                            </tbody>
                        </table>

                    </div>
                </div>
                <!--카드 Body 종료-->
            </div>
            <!--풀 사이즈 카드 종료 / 카드 필요 없으면 여기서까지 밀기☆-->

            <!--컨테이너 종료-->
            <!--footer.html Include-->
            <jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</body>
<script>
    $(`#dropDiv`).on("change", function () {
        $.ajax({
            async: false,
            type: 'POST',
            url: '데이터가 처리될 url주소',
            data: '',
            error: function (response, status, request) {
                Swal.fire('에러 발생');
            },
            success: function (resHtml) {
                Swal.fire('성공');
            }
        })
    });
</script>
<!----------------Body 종료----------------------->

</html>