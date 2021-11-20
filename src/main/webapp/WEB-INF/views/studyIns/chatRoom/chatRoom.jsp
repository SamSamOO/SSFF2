<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="ko">
<!----------------Head 시작----------------------->

<head>
    <title>Chating</title>

    <!--head.html Include-->
    <jsp:include page="/WEB-INF/commons/head.jsp"/>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="<c:url value="/resources/assets/js/sockjs-0.3.4.js"/>"></script>
    <script src="<c:url value="/resources/assets/js/stomp.js"/>"></script>
    <style>
        *{
            margin:0;
            padding:0;
        }
        .container{
            width: 500px;
            margin: 0 auto;
            padding: 25px
        }
        .container h1{
            text-align: left;
            padding: 5px 5px 5px 15px;
            color: #FFBB00;
            border-left: 3px solid #FFBB00;
            margin-bottom: 20px;
        }
        .chating{
            background-color: #000;
            width: 500px;
            height: 500px;
            overflow: auto;
        }
        .chating p{
            color: #fff;
            text-align: left;
        }
        input{
            width: 330px;
            height: 25px;
        }
        #yourMsg{
            display: none;
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

                    <div id="container" class="container">
                        <h1>채팅</h1>
                        <div id="chating" class="chating">
                        </div>

                        <div id="yourName">
                            <table class="inputTable">
                                <tr>
                                    <th>사용자명</th>
                                    <th><input type="text" name="userName" id="userName"></th>
                                    <th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
                                </tr>
                            </table>
                        </div>
                        <div id="yourMsg">
                            <table class="inputTable">
                                <tr>
                                    <th>메시지</th>
                                    <th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
                                    <th><button onclick="send()" id="sendBtn">보내기</button></th>
                                </tr>
                            </table>
                        </div>
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
                                    newLI.innerHTML = e.data;

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
<script>
    var ws;

    function wsOpen(){
        ws = new WebSocket("ws://" + location.host + "/chating");
        wsEvt();
    }

    function wsEvt() {
        ws.onopen = function(data){
            //소켓이 열리면 초기화 세팅하기
        }

        ws.onmessage = function(data) {
            var msg = data.data;
            if(msg != null && msg.trim() != ''){
                $("#chating").append("<p>" + msg + "</p>");
            }
        }

        document.addEventListener("keypress", function(e){
            if(e.keyCode == 13){ //enter press
                send();
            }
        });
    }

    function chatName(){
        var userName = $("#userName").val();
        if(userName == null || userName.trim() == ""){
            alert("사용자 이름을 입력해주세요.");
            $("#userName").focus();
        }else{
            wsOpen();
            $("#yourName").hide();
            $("#yourMsg").show();
        }
    }

    function send() {
        var uN = $("#userName").val();
        var msg = $("#chatting").val();
        ws.send(uN+" : "+msg);
        $('#chatting').val("");
    }
</script>

<!----------------Body 종료----------------------->

</html>