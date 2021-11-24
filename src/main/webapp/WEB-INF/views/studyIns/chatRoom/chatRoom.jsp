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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js" integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.js"
            integrity="sha512-Vl3LfTwTl2UYaupOww2SD1ng4ZSOrLYc1Pnag6KCipvEy9Be4KSmeFH8KnX6FcURxeZufGUKxOO77EsfzT/4Zg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        /*.container {*/
        /*    width: 500px;*/
        /*    margin: 0 auto;*/
        /*    padding: 25px*/
        /*}*/

        /*.container h1 {*/
        /*    text-align: left;*/
        /*    padding: 5px 5px 5px 15px;*/
        /*    color: #FFBB00;*/
        /*    border-left: 3px solid #FFBB00;*/
        /*    margin-bottom: 20px;*/
        /*}*/

        /*.roomContainer {*/
        /*    background-color: #F6F6F6;*/
        /*    width: 500px;*/
        /*    height: 500px;*/
        /*    overflow: auto;*/
        /*}*/

        .roomList {
            border: none;
        }

        .roomList th {
            border: 1px solid #FFBB00;
            background-color: #fff;
            color: #FFBB00;
        }

        .roomList td {
            border: 1px solid #FFBB00;
            background-color: #fff;
            text-align: left;
            color: #FFBB00;
        }

        .roomList .num {
            width: 75px;
            text-align: center;
        }

        .roomList .room {
            width: 350px;
        }

        .roomList .go {
            width: 71px;
            text-align: center;
        }

        button {
            background-color: #FFBB00;
            font-size: 14px;
            color: #000;
            border: 1px solid #000;
            border-radius: 5px;
            padding: 3px;
            margin: 3px;
        }

        .inputTable th {
            padding: 5px;
        }

        .inputTable input {
            width: 330px;
            height: 25px;
        }
    </style>
</head>

<script type="text/javascript">
    var ws;
    window.onload = function () {
        getRoom();
        createRoom();
    }

    function getRoom() {
        commonAjax('/getRoom', "", 'post', function (result) {
            createChatingRoom(result);
        });
    }

    function createRoom() {
        $("#createRoom").click(function () {
            var msg = {roomName: $('#roomName').val()};

            commonAjax('/createRoom', msg, 'post', function (result) {
                createChatingRoom(result);
            });

            $("#roomName").val("");
        });
    }

    function goRoom(number, name) {
        location.href = "/moveChating?roomName=" + name + "&" + "roomNumber=" + number;
    }

    function createChatingRoom(res) {
        if (res != null) {
            var tag = "";
            Array.from(res).forEach(function (d, idx) {
                var rn = d.roomName.trim();
                var roomNumber = d.roomNumber;
                tag += "<tr>" +
                    "<td class='num'>" + (idx + 1) + "</td>" +
                    "<td class='room'>" + rn + "</td>" +
                    "<td class='go'><button type='button' onclick='goRoom(\"" + roomNumber + "\", \"" + rn + "\")'>참여</button></td>" +
                    "</tr>";
            });
            $(`#roomList`).append(tag);
            // $("#roomList").empty().append(tag);
        }
    }

    function commonAjax(url, parameter, type, calbak, contentType) {
        $.ajax({
            url: url,
            data: parameter,
            type: type,
            contentType: contentType != null ? contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
            success: function (res) {
                calbak(res);
            },
            error: function (err) {
                console.log('error');
                calbak(err);
            }
        });
    }
</script>
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
                        </h3>
                        <div class="card-toolbar">

                        </div>
                    </div>
                    <div class="container">
                        <h1>채팅방</h1>
                        <div id="roomContainer" class="roomContainer">
                            <table id="roomList" class="roomList">
                                <tr>
                                    <th class='num'>순서</th>
                                    <th class='room'>방 이름</th>
                                    <th class='go'></th>
                                </tr>
                                <tr>
                                    <td class="num">1</td>
                                    <td class="room">ㅇㅇㅇㅇㅇㅇ</td>
                                    <%--밑 부분 채팅방에 가져다 붙이면 됩니다.--%>
                                    <td class="go"><a href="#none" onclick="window.open('/moveChating?r_Idx=9002','new','scrollbars=yes,resizable=no width=600 height=400, left=0,top=0');return false" ><i class="fa fa-arrow-left"></i> </a></td>
                                </tr>
                                <tr>
                                    <td class="num">2</td>
                                    <td class="room">ㅇㅇㅇㅇㅇㅇ</td>
                                    <%--밑 부분 채팅방에 가져다 붙이면 됩니다.--%>
                                    <td class="go"><a href="#none" onclick="window.open('/moveChating?r_Idx=9003','new','scrollbars=yes,resizable=no width=600 height=400, left=0,top=0');return false" ><i class="fa fa-arrow-left"></i> </a></td>
                                </tr>
                                <tr>
                                    <td class="num">3</td>
                                    <td class="room">ㅇㅇㅇㅇㅇㅇ</td>
                                    <%--밑 부분 채팅방에 가져다 붙이면 됩니다.--%>
                                    <td class="go"><a href="#none" onclick="window.open('/moveChating?r_Idx=9004','new','scrollbars=yes,resizable=no width=600 height=400, left=0,top=0');return false" ><i class="fa fa-arrow-left"></i> </a></td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <table class="inputTable">
                                <tr>
                                    <th>방 제목</th>
                                    <th><input type="text" name="roomName" id="roomName"></th>
                                    <th>
                                        <button id="createRoom">방 만들기</button>
                                    </th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>