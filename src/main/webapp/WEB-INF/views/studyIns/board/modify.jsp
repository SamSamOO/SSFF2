<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
<!----------------Head 시작----------------------->

<head>
    <title>게시물 상세 페이지입니다</title>

    <!--head.html Include-->
    <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>

    <script>
        $(function () {
            console.clear();
            console.debug("제이쿼리 시작");

            $(`#listBtn`).on(`click`, function () {
                console.log("리스트 버튼 클릭");

                self.location = "/studyIns/board/list";
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
                            <!--카드 바디 시작-->
                            <div class="card-header border-0 pt-5 card-body mt-5">
                                <div class="d-flex flex-row flex-column-fluid container">
                                    <form action="/studyIns/board/detail/modify" method="post">

                                        <input type="hidden" name="cont_No" value="<c:out value='${detail.cont_No}'/> "/>
                                        <table style="width: 100%">

                                            <tr>
                                                <td class="row"><label for="title">제목 : </label>
                                                    <input id="title" maxlength="50" value="${detail.title}" name="title">
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>${detail.member_Name}</td>
                                            </tr>

                                            <tr>
                                                <td class="row"><label for="cont">내용 : </label>
                                                    <input id="cont" maxlength="50" value="${detail.cont}" name="cont">
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <div class="container">
                                                        <select name="category" class="selectpicker">
                                                            <option value="인증"
                                                                    <c:if test="${detail.category eq '인증'}">selected</c:if> >인증
                                                            </option>
                                                            <option value="잡담" <c:if test="${detail.category eq '잡담'}">selected</c:if>>잡담</option>
                                                            <option value="QnA" <c:if test="${detail.category eq 'QnA'}">selected</c:if>>QnA</option>
                                                            <option value="기타" <c:if test="${detail.category eq '기타'}">selected</c:if>>기타</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td colspan="6"></td>
                                                <td colspan="2">
                                                    <button type="submit" id="submitBtn">수정하기</button>
                                                    <button type="button" id="listBtn">목록으로</button>
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
            </div>
            <%--컨테이너 종료--%>

            <!--footer.html Include-->
            <jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</body>
<!----------------Body 종료----------------------->
</html>