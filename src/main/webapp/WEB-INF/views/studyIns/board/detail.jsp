<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html lang="ko">
<!----------------Head 시작----------------------->

<head>
    <title>게시물 상세 페이지입니다</title>
    <!--head.html Include-->
    <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <script>

        $(function () {
            console.clear();
            console.debug("제이쿼리 시작 ㅇㅇ");

            $(`#modifyBtn`).on('click', function () {
                console.log("수정 버튼 클릭");

                self.location = '/studyIns/board/detail/modifyGo?cont_No=<c:out value="${detail.cont_No}"/>';
            }); // onclick

            $(`#removeBtn`).on('click', function () {
                console.log("삭제 버튼 클릭");

                <%--self.location = '/studyIns/board/detail/remove?cont_No=<c:out value="${detail.cont_No}"/> ';--%>
                let formObj = $('form');

                formObj.attr('method', 'POST');
                formObj.attr('action', '/studyIns/board/detail/remove');
                formObj.submit();
            }); // onclick
        }); // jq

    </script>
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
                            <div class="card-header border-0 pt-5 card-body mt-5">

                                <form action="/studyIns/board/detail/modify" method="POST" style="width: 100%">
                                    <input type="hidden" name="cont_No" value="<c:out value='${detail.cont_No}' />">
                                    <table style="width: 100%;  border-radius: 10px; border-style: hidden ; !important;">
                                        <tr>
                                            <th align="left" height="50px"><a href="javascript:history.back()">뒤로가기 들어갈곳</a></th>
                                        </tr>
                                        <tr>
                                            <td colspan="10" style="text-align: center; font-weight: bold; font-size: 26px;height: 100px">${detail.title}</td>
                                        </tr>
                                        <tr style="height: 100px">
                                            <td colspan="6">카테고리 : ${detail.category}</td>
                                            <%--TODO 세션아이디와 현재글 닉네임과 동일한 경우 수정 삭제버튼 보입니다. --%>
                                            <td colspan="4" align="right">
                                                <i class="far fa-eye"></i> ${detail.hit} <%--TODO 조회수 관련 함수 짜야합니다.--%>

                                                <button type="button" id="modifyBtn">수정</button>
                                                <button type="button" id="removeBtn">삭제</button>
                                                ${detail.member_Name}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th colspan="2">다운로드</th>
                                            <td colspan="2"><a href="">파일이름</a></td>

                                            <th colspan="1">작성일자</th>
                                            <td colspan="2"><fmt:formatDate value="${detail.write_Date}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/></td>

                                            <th colspan="1">수정일자</th>
                                            <td colspan="2"><fmt:formatDate value="${detail.modify_Date}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/></td>
                                        </tr>
                                        <tr style="height: 600px; border-top: lightblue ;border-style: solid">
                                            <td colspan="10">${detail.cont}</td>
                                        </tr>
                                        <tr>
                                            <td> 첨부 파일</td>
                                            <td>
                                                파일네임
                                            </td>
                                        </tr>


                                    </table>
                                </form>
                            </div>
                            <!--카드 바디 종료-->

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