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
                        <%--                        <h2>${r_Idx}</h2>--%>
                        <h1>/WEB-INF/views/ws.jsp</h1>

                        <hr>

                        <button type="button" id="connect">Connect</button>
                        <button type="button" id="send">Send</button>
                        <button type="button" id="disconnect">Disconnect</button>

                        <p></p>

                        Message: <input type="text" id="message">

                        <hr>

                        <ul id="unorderedList">

                        </ul>

                    </div>

                    <script>


                        $(function () {
                            console.clear();
                            console.group("jquery started.");

                            var ws = null;
                            var messageCount = 0;

                            var unorderedList = document.querySelector('#unorderedList');
                            var message = document.querySelector('#message')

                            $('#connect').click(function (e) {
                                console.debug('connect button clicked.');

                                ws = new WebSocket("ws://localhost:8070/echo");
                                console.log('+ ws:', ws)

                                //--------------------------------------------------//
                                ws.onclose = e => {
                                    console.log('ws.onclose(e) invoked.');
                                    console.log('\t+ e:', e);

                                    var newLI = document.createElement("li");
                                    newLI.innerHTML = 'DISCONNECTED [ code: ' + e.code + ', returnValue: ' + e.returnValue + ']';

                                    unorderedList.append(newLI);
                                }; // onclose

                                ws.onerror = e => {
                                    console.log('ws.onerror(e) invoked.');
                                    console.log('\t+ e:', e);

                                }; // onerror

                                ws.onmessage = e => {
                                    console.log('ws.onmessage(e) invoked.');
                                    console.log('\t+ e:', e);

                                    var newLI = document.createElement("li");
                                    newLI.innerHTML = e.data + ' #' + (messageCount++);

                                    unorderedList.append(newLI);
                                };  //onmessage

                                ws.onopen = e => {
                                    console.log('ws.onopen(e) invoked.');
                                    console.log('\t+ e:', e);

                                };  // onopen
                                //--------------------------------------------------//

                            }); // connect

                            $('#disconnect').click(function (e) {
                                console.debug('disconnect button clicked.');

                                if (ws) {
                                    ws.close();
                                    ws = null;

                                    console.log('\t+ WebSocket Closed.');
                                } // if
                            }); // disconnect

                            $('#send').click(function (e) {
                                console.debug('send button clicked.');

                                if (ws && message.value) {
                                    ws.send(message.value);

                                    console.log(`${message.value} sent.`);
                                } // if
                            }); // send

                            console.groupEnd()
                        });  // jq

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