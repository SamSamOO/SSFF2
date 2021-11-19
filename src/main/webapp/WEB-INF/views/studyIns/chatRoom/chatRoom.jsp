<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="ko">
<!----------------Head 시작----------------------->

<head>
    <title>스터디 내 게시판</title>
    <!--head.html Include-->
    <jsp:include page="/WEB-INF/commons/head.jsp"/>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="<c:url value="/resources/assets/js/sockjs-0.3.4.js"/>"></script>
    <script src="<c:url value="/resources/assets/js/stomp.js"/>"></script>

    <style>
        body {
            background-color: #f5f5f5;
        }

        #main-content {
            max-width: 940px;
            padding: 2em 3em;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }
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
                        </h3>
                        <div class="card-toolbar">

                        </div>
                    </div>
                    <!--카드 헤더 종료-->
                    <!--카드 Body 시작-->

                    <div class="card-body pt-2 pb-0 mt-n3">
                        <h2>Hi there</h2>
                        <h2>${r_Idx}</h2>
                        <div class="row">
                            <div class="col-md-6">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="connect">WebSocket connection:</label>
                                        <button id="connect" class="btn btn-default" type="submit">Connect</button>
                                        <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">Disconnect
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-6">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="name">What is your name?</label>
                                        <input type="text" id="name" class="form-control" placeholder="Your name here...">
                                    </div>
                                    <button id="send" class="btn btn-default" type="submit">Send</button>
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <table id="conversation" class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Greetings</th>
                                    </tr>
                                    </thead>
                                    <tbody id="greetings">

                                    </tbody>
<%--                                    <c:forEach var="list" items="${listOfChatMsg}">--%>
<%--                                        <tr><td>${list.msg_Cont}</td></tr>--%>

<%--                                    </c:forEach>--%>
                                </table>
                            </div>
                        </div>
                    </div>

                    <script>
                        var stompClient = null;

                        function setConnected(connected) {
                            $("#connect").prop("disabled", connected);
                            $("#disconnect").prop("disabled", !connected);
                            if (connected) {
                                $("#conversation").show();
                            } else {
                                $("#conversation").hide();
                            }
                            $("#greetings").html("");
                        }

                        function connect() {
                            var socket = new SockJS('/websockethandler');
                            stompClient = Stomp.over(socket);
                            stompClient.connect({}, function (frame) {
                                setConnected(true);
                                console.log('Connected: ' + frame);
                                stompClient.subscribe('/topic/chat', function (greeting) {
                                    console.log(JSON.parse(greeting.body).content);
                                    showGreeting(JSON.parse(greeting.body).content);
                                });
                            });
                        }

                        function disconnect() {
                            if (stompClient !== null) {
                                stompClient.disconnect();
                            }
                            setConnected(false);
                            console.log("Disconnected");
                        }

                        function sendName() {
                            stompClient.send("/app/hello", {}, JSON.stringify({'name': $("#name").val()}));
                        }

                        function showGreeting(message) {
                            $("#greetings").append("<tr><td>" + message + "</td></tr>");
                        }

                        $(function () {
                            $("form").on('submit', function (e) {
                                e.preventDefault();
                            });
                            $("#connect").click(function () {
                                connect();
                            });
                            $("#disconnect").click(function () {
                                disconnect();
                            });
                            $("#send").click(function () {
                                sendName();
                            });
                        });


                    </script>
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