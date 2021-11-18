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
    <script src="/resources/assets/js/sockjs-0.3.4.js"></script>
    <script src="/resources/assets/js/stomp.js"></script>


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
                        <label for="name">닉네임 입력</label><input id="name"/>
                        <button onclick="connect()">Enter</button>
                        <button onclick="send()">Send</button>
                        <button onclick="disconnect()">Discount</button>
                    </div>
                    <script>
                        function connect() {
                            let socket = new SockJS(`/users`);
                            stompClient = Stomp.over(socket);
                            stompClient.connect({}, function (frame) { // sock에 연결 및 서버로부터 리소스를 listening합니다.
                                console.log('Connected: ' + frame);
                                stompClient.subscribe('/topic/users', function (response) {
                                    console.log(response);
                                    console.log(JSON.parse(response.body));
                                });
                            });
                            console.log("sending~~");
                        }

                        function disconnect() {
                            stompClient.disconnect();
                            console.log("Disconnected");
                        }

                        function send() { // 해당 메서드는 데이터를 서버로 보냅니다.
                            console.log(`sending~!`);
                            let name = document.getElementById("name").value;
                            stompClient.send("/app/user/" + name, {}, JSON.stringify({}));
                        }

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