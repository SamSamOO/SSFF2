<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="en">
<!----------------Head 시작----------------------->

<head>
    <title>챌린지 리스트</title>

    <link href="../../../../resources/assets/css/yesol.css" rel="stylesheet" type="text/css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-more.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <style>
        #container {
            height: 400px;
        }

        .highcharts-figure,
        .highcharts-data-table table {
            min-width: 320px;
            max-width: 800px;
            margin: 1em auto;
        }

        .highcharts-data-table table {
            font-family: Verdana, sans-serif;
            border-collapse: collapse;
            border: 1px solid #ebebeb;
            margin: 10px auto;
            text-align: center;
            width: 100%;
            max-width: 500px;
        }

        .highcharts-data-table caption {
            padding: 1em 0;
            font-size: 1.2em;
            color: #555;
        }

        .highcharts-data-table th {
            font-weight: 600;
            padding: 0.5em;
        }

        .highcharts-data-table td,
        .highcharts-data-table th,
        .highcharts-data-table caption {
            padding: 0.5em;
        }

        .highcharts-data-table thead tr,
        .highcharts-data-table tr:nth-child(even) {
            background: #f8f8f8;
        }

        .highcharts-data-table tr:hover {
            background: #f1f7ff;
        }
    </style>

    <!--head.html Include-->
    <jsp:include page="../../../commons/head.jsp"/>

    <%--    <script>--%>
    <%--        console.debug("----  1   -------")--%>
    <%--    </script>--%>
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
                                    <h5 class="text-dark font-weight-bold my-1 mr-5">챌린지</h5>
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
                            <div class="container">
                                <input hidden value="9001" id="r_Idx"/>
                                <input hidden value="nickname9001" id="member_Name"/>
                                <button type="button" value="" id="attendance" class="btn btn-secondary">출석버튼</button>




                                <figure class="highcharts-figure">
                                    <div id="container"></div>


                                </figure>





                            </div>
                        </div>
                        <!--풀 사이즈 카드 종료 / 카드 필요 없으면 여기서까지 밀기☆-->

                    </div>
                    <!--대시보드 종료-->
                </div>
                <!--end::Content-->
            </div>
            <!--end::Content Wrapper 내용물 종료-->
            <jsp:include page="../../../commons/footer.jsp"/>

        </div>
        <!--컨테이너 종료-->
        <!--footer.html Include-->
    </div>
</div>


</body>
<!----------------Body 종료----------------------->
<script>
    $(function () {
        let now = new Date();

        $(`#attendance`).on('click', function (e) {
            console.log(e.target + `좀 돼라`);
            Swal.fire({
                title: "출석",
                text: now.getDate() + " 출석하시겠습니까?",
                showCancelButton: true,
                confirmButtonColor: "#1FAB45",
                confirmButtonText: "출석",
                cancelButtonText: "취소",
                buttonsStyling: true
            }).then(function () {
                    $.ajax({
                        type: "POST",
                        url: "/studyRest/updateAttendance",
                        data: JSON.stringify({
                            'r_Idx': $(`#r_Idx`).val(),
                            'member_Name': $(`#member_Name`).val()
                        }),
                        contentType: 'application/json; charset=utf-8',
                        cache: false,
                        success: function (response) {
                            Swal.fire(
                                "알림",
                                "출석되었습니다.",
                                "success"
                            )
                        },
                        failure: function (response) {
                            Swal.fire(
                                "내부 오류",
                                "출석에 실패했습니다.", // had a missing comma
                                "error"
                            )
                        }
                    });
                },
                function (dismiss) {
                    if (dismiss === "cancel") {
                        Swal.fire(
                            "취소",
                            "취소 되었습니다.",
                            "error"
                        )
                    }
                })

        });

    });
    $(document).ready(function () {
        /*일단은 풀캘에서 들고오는 방법으로 선택해야합니다.*/
        // const ranking = $.ajax({
        //     type:'GET',
        //     url:'/studyRest/getAttendanceByWeek',
        //     data:JSON.stringify({
        //
        //     }),
        //     contentType: 'application/json; charset =utf-8',
        //     cache:false,
        //     success: function (reponse) {
        //         alert('랭킹 들고옴 ㅇㅇ');
        //     },
        //     failure: function (response) {
        //         alert(`랭킹 들고오기 실패`);
        //     }
        // });

        /*이번주 일자 구하기(월~금)*/
        var currentDay = new Date();
        var theYear = currentDay.getFullYear();
        var theMonth = currentDay.getMonth();
        var theDate  = currentDay.getDate();
        var theDayOfWeek = currentDay.getDay();

        var thisWeek = [];

        for(var i=0; i<7; i++) {
            var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek));
            var yyyy = resultDay.getFullYear();
            var mm = Number(resultDay.getMonth()) + 1;
            var dd = resultDay.getDate();

            mm = String(mm).length === 1 ? '0' + mm : mm;
            dd = String(dd).length === 1 ? '0' + dd : dd;

            thisWeek[i] = yyyy + '-' + mm + '-' + dd;
        }

        console.log(thisWeek);

        /*이번주 일자 구하기(월~금)*/
        var currentDay = new Date();
        var theYear = currentDay.getFullYear();
        var theMonth = currentDay.getMonth();
        var theDate  = currentDay.getDate();
        var theDayOfWeek = currentDay.getDay();

        var thisWeek = [];

        for(var i=0; i<7; i++) {
            var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek));
            var yyyy = resultDay.getFullYear();
            var mm = Number(resultDay.getMonth()) + 1;
            var dd = resultDay.getDate();

            mm = String(mm).length === 1 ? '0' + mm : mm;
            dd = String(dd).length === 1 ? '0' + dd : dd;

            thisWeek[i] = yyyy + '-' + mm + '-' + dd;
        }

        const chart = Highcharts.chart('container', {
            title: {
                text: '이번주 출석률 랭킹'
            },
            subtitle: {
                text: ''
            },
            xAxis: {
                categories: thisWeek
            },
            /* 차트 Y축 컬럼 명 */
            yAxis: {
                title: '출석일',
            },
            series: [{
                type: 'column',
                colorByPoint: true,
                data: [10,10,10,10,10,10,10],
                showInLegend: false
            }]
        });

        document.getElementById('plain').addEventListener('click', () => {
            chart.update({
                chart: {
                    inverted: false,
                    polar: false
                },
                subtitle: {
                    text: 'Plain'
                }
            });
        });

        document.getElementById('inverted').addEventListener('click', () => {
            chart.update({
                chart: {
                    inverted: true,
                    polar: false
                },
                subtitle: {
                    text: 'Inverted'
                }
            });
        });

        document.getElementById('polar').addEventListener('click', () => {
            chart.update({
                chart: {
                    inverted: false,
                    polar: true
                },
                subtitle: {
                    text: 'Polar'
                }
            });
        });

    });

</script>
</html>