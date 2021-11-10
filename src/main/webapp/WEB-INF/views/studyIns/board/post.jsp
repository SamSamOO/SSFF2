<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
<!----------------Head 시작----------------------->

<head>
    <title>게시물 상세 페이지입니다</title>

    <!--head.html Include-->
    <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>


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
                                    <form action="/studyIns/board/post" method="post" id="formObj" style="width: 100%">

                                        <input type="hidden" name="cont_No"
                                               value="<c:out value='${detail.cont_No}'/> "/>
                                        <table style="width: 100%">

                                            <tr>
                                                <td class="row"><label for="title">제목 : </label>
                                                    <input id="title" maxlength="50" value="" name="title">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="nickname">닉네임 : </label>
                                                    <input id="nickname" maxlength="20" value=""
                                                           name="nickname">
                                                </td>
                                            </tr>


                                            <tr>
                                                <td style="width: 100%;">
                                                    <div class="card card-custom">

                                                        <div class="card-body">
                                                            <div id="kt_quil_2" style="height: 325px">

                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>

                                            </tr>

                                            <tr>
                                                <td>
                                                    <div class="container">
                                                        <select name="category" class="selectpicker">
                                                            <option value="인증" selected>인증</option>
                                                            <option value="잡담">잡담</option>
                                                            <option value="QnA">QnA</option>
                                                            <option value="기타">기타</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" align="right">
                                                    <button type="submit" id="submitBtn">등록하기</button>
                                                    <button type="button" id="listBtn">목록으로</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="uploadDiv">
                                                        <input type="file" name="uploadFile" multiple/>
                                                    </div>
                                                    <button id="uploadBtn">Upload</button>
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
<script>
    $(function () {
        console.clear();
        console.debug("제이쿼리 시작");
        $(`#listBtn`).on(`click`, function (e) {

            console.log('목록버튼이 클릭됨!');

            const formElement = $("#formObj");
            formElement.attr("action", "/studyIns/board/list");
            formElement.attr("method", "get");
            formElement.submit();
        });

    });

    // Class definition
    var KTQuilDemos = function () {
        // Private functions
        var demo2 = function () {
            var Delta = Quill.import('delta');
            var quill = new Quill('#kt_quil_2', {
                modules: {
                    toolbar: true
                },
                placeholder: 'Type your text here...',
                theme: 'snow'
            });
            // Store accumulated changes
            var change = new Delta();
            quill.on('text-change', function (delta) {
                change = change.compose(delta);
            });
            // Save periodically
            setInterval(function () {
                if (change.length() > 0) {
                    console.log('Saving changes', change);
                    /*
                    Send partial changes
                    $.post('/your-endpoint', {
                    partial: JSON.stringify(change)
                    });
                    Send entire document
                    $.post('/your-endpoint', {
                    doc: JSON.stringify(quill.getContents())
                    });
                    */
                    change = new Delta();
                }
            }, 5 * 1000);
            // Check for unsaved data
            window.onbeforeunload = function () {
                if (change.length() > 0) {
                    return 'There are unsaved changes. Are you sure you want to leave?';
                }
            }
        }
        return {
            // public functions
            init: function () {
                demo2();
            }
        };
    }();

    jQuery(document).ready(function () {
        KTQuilDemos.init();
    });
    $(document).ready(function () {
        $("#uploadBtn").on("click", function (e) {
            e.preventDefault;
            $(`#formObj`).attr('onsubmit', 'return false');

            let formData = new FormData();
            console.log(formData);
            let inputFile = $("input[name='uploadFile']");
            let files = inputFile[0].files;
            console.log(files);

            //add File Data to formData
            for (let i = 0; i < files.length; i++) {
                formData.append("uploadFile", files[i]);
            }

            $.ajax({
                url: '/uploadAjaxAction',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                success: function (result) {
                    alert("Uploaded");
                }
            }); // $ajax

        });
    });
</script>

</html>