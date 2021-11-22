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


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/0.3.4/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>


    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 0 auto;
            padding: 25px
        }

        .container h1 {
            text-align: left;
            padding: 5px 5px 5px 15px;
            color: #FFBB00;
            border-left: 3px solid #FFBB00;
            margin-bottom: 20px;
        }

        .chating {
            background-color: #000;
            width: 500px;
            height: 500px;
            overflow: auto;
        }

        .chating .me {
            color: #F6F6F6;
            text-align: right;
        }

        .chating .others {
            color: #FFE400;
            text-align: left;
        }

        input {
            width: 330px;
            height: 25px;
        }

        #yourMsg {
            display: none;
        }
    </style>


</head>
<script type="text/javascript">
    var ws;

    $(function () {

        $(`#chating`).empty();
        $.ajax({
            type: 'POST',
            url: '/chat/getAllChat',
            data: {
                "r_Idx": $(`#r_Idx`).val()
            },
            error: function (data) {
                console.log(data);
                Swal.fire({
                    icon: 'warning',                         // Alert 타입
                    title: 'Alert가 실행되었습니다.',         // Alert 제목
                    text: '에러로 데이터를 불러오지 못했습니다.',  // Alert 내용
                });
            },
            success: function (data) {
                console.log(`데이터 불러오기 성공`);
                console.log(data);

                console.log(data.list);
                for (let i = 0; i < data.list.length; i++) {
                    if (data.list[i].member_Name == 'nickname55') {

                        console.log("채팅");
                        $("#chating").append("<p class='me'>나 :" + data.list[i].msg_Cont + "</p><p class='me'>" + data.list[i].send_Time + "</p>");

                    } else {

                        $("#chating").append("<p class='others'>" + data.list[i].member_Name + " :" + data.list[i].msg_Cont + "</p><p class='others'>" + data.list[i].send_Time + "</p>");

                    }

                }
                $('#chating').scrollTop($(`#chating`)[0].scrollHeight);

            }
        })

    });

    function wsOpen() {
        //웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
        ws = new WebSocket("ws://" + location.host + "/chating/" + $("#r_Idx").val());
        wsEvt();
    }

    function wsEvt() {
        ws.onopen = function (data) {
            //소켓이 열리면 동작
        }

        ws.onmessage = function (data) {

            //메시지를 받으면 동작
            var msg = data.data;
            if (msg != null && msg.trim() != '') {

                var d = JSON.parse(msg);
                let now = new Date();
                console.log(now);
                d.time = now;
                console.log(d);
                console.log(d.type);

                if (d.type == "getId") {

                    var si = d.sessionId != null ? d.sessionId : "";

                    if (si != '') {
                        console.log(si);

                    }
                } else if (d.type == "message") {
                    console.log(d.type)

                    if (d.sessionId == $("#sessionId").val()) {

                        $("#chating").append("<p class='me'>나 :" + d.msg + "</p>");

                    } else {

                        $("#chating").append("<p class='others'>" + d.username + " :" + d.msg + "</p>");

                    }

                } else {
                    console.warn("unknown type!");
                }

                console.log(d);
                console.log(JSON.stringify(d));

            }

        };

        document.addEventListener("keypress", function (e) {
            if (e.keyCode == 13) { //enter press
                send();
            }
        });
    }

    function chatName() {
        var userName = $("#userName").val();
        if (userName == null || userName.trim() == "") {
            alert("사용자 이름을 입력해주세요.");
            $("#userName").focus();
        } else {
            wsOpen();
            $("#yourName").hide();
            $("#yourMsg").show();
        }
    }

    function isOpen(ws) {
        return ws.readyState === ws.OPEN
    }

    function send() {
        $(`#chating`).empty();

        var option = {

            type: "message",
            r_Idx: $("#r_Idx").val(),
            sessionId: $("#sessionId").val(),
            member_Name: $("#userName").val(),
            msg_Cont: $("#chatting").val()

        };
        console.log(option);
        if (!isOpen(ws)) {
            Swal.fire({
                icon: 'warning',                         // Alert 타입
                title: 'Alert가 실행되었습니다.',         // Alert 제목
                text: '서버와의 연결이 끊겼습니다.',  // Alert 내용
            });

            return;
        }

        $.ajax({
            type: 'POST',
            url: '/chat/insert',
            data: JSON.stringify(option), // 다음 페이지 번호와 페이지 사이즈를 가지고 출발
            dataType: 'json', // 받을 데이터는 json
            contentType: "application/json; charset=utf-8",
            success: function (d) {
                console.log(d);

                Swal.fire({
                    icon: 'success',                         // Alert 타입
                    title: 'Alert가 실행되었습니다.',         // Alert 제목
                    text: '성공',  // Alert 내용
                });
            },
            error: function (d) {
                console.log(d);
                Swal.fire({
                    icon: 'warning',                         // Alert 타입
                    title: 'Alert가 실행되었습니다.',         // Alert 제목
                    text: '실패',  // Alert 내용
                });
            }
        });
        ws.send(JSON.stringify(option))


        $.ajax({
            type: 'POST',
            url: '/chat/getAllChat',
            data: {
                "r_Idx": $(`#r_Idx`).val()
            },

            error: function (data) {

                console.log(data);

                Swal.fire({
                    icon: 'warning',                         // Alert 타입
                    title: 'Alert가 실행되었습니다.',         // Alert 제목
                    text: '에러로 데이터를 불러오지 못했습니다.',  // Alert 내용
                });

            },

            success: function (data) {

                console.log(`데이터 불러오기 성공`);

                console.log(data);

                console.log(data.list);
                for (let i = 0; i < data.list.length; i++) {
                    if (data.list[i].member_Name == 'nickname55') {

                        console.log("채팅");
                        $("#chating").append("<p class='me'>나 :" + data.list[i].msg_Cont + "</p><p class='me'>" + data.list[i].send_Time + "</p>");

                    } else {

                        $("#chating").append("<p class='others'>" + data.list[i].member_Name + " :" + data.list[i].msg_Cont + "</p><p class='others'>" + data.list[i].send_Time + "</p>");
                    }
                }

                $('#chating').scrollTop($(`#chating`)[0].scrollHeight);

            }

        });
        $('#chatting').val("");

    }
</script>
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
                        </h3>
                        <div class="card-toolbar">

                        </div>
                    </div>
                    <!--카드 헤더 종료-->
                    <!--카드 Body 시작-->
                    <!--카드 Body 시작-->
                    <div id="container" class="container">
                        <h1>${r_Idx}의 채팅방</h1>
                        <input type="hidden" id="sessionId" value=""/>
                        <input type="hidden" id="r_Idx" value="${r_Idx}"/>

                        <div id="chating" class="chating">
                        </div>

                        <div id="yourName">
                            <table class="inputTable">
                                <tr>
                                    <th>사용자명</th>
                                    <th>
                                        <input type="text" name="userName" id="userName" value="nickname55">
                                    </th>
                                    <th>
                                        <button onclick="chatName()" id="startBtn">이름 등록</button>
                                    </th>
                                </tr>
                            </table>
                        </div>
                        <div id="yourMsg">
                            <table class="inputTable">
                                <tr>
                                    <th>메시지</th>
                                    <th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
                                    <th>
                                        <button onclick="send()" id="sendBtn">보내기</button>
                                    </th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <!--카드 Body 종료-->
            </div>
            <!--풀 사이즈 카드 종료 / 카드 필요 없으면 여기서까지 밀기☆-->

            <!--컨테이너 종료-->
            <!--footer.html Include-->
            <jsp:include page="/WEB-INF/commons/footer.jsp"/>
        </div>
    </div>
</div>
</body>

<!----------------Body 종료----------------------->

</html>