<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>

<html lang="en">
<!----------------Head 시작----------------------->

<head>
      <title>스터디 채팅방</title>
      <!--head.html Include-->
      <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>

      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/0.3.4/sockjs.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>

      <style>
            <%--        * {--%>
            <%--            margin: 0;--%>
            <%--            padding: 0;--%>
            <%--        }--%>
            
            <%--        .container {--%>
            <%--            width: 500px;--%>
            <%--            margin: 0 auto;--%>
            <%--            padding: 25px--%>
            <%--        }--%>
            
            <%--        .container h1 {--%>
            <%--            text-align: left;--%>
            <%--            padding: 5px 5px 5px 15px;--%>
            <%--            color: #FFBB00;--%>
            <%--            border-left: 3px solid #FFBB00;--%>
            <%--            margin-bottom: 20px;--%>
            <%--        }--%>
            
            .messages {
                  background-color : lightblue;
                  border-radius    : 10px;
      
padding: 20px;
                  width            : 650px;
                  height           : 750px;
                  overflow         : auto;
            }
            
            .chating .me {
                  color         : black;
                  font-size     : 20px;
                  font-weight   : 700;
                  padding-right : 10px;
                  text-align    : right;
            }
            
            .chating .others {
                  color        : red;
                  padding-left : 10px;
                  
                  text-align   : left;
            }
            
            input {
                  width  : 330px;
            !important;
                  height : 25px;
            !important;
            }
      
      
      </style>

</head>
<script type="text/javascript">
     var ws;
     $(function() {
          <c:choose>
          <c:when test="${member.member_id==null}">
          
          Swal.fire({
               icon: 'warning', // Alert 타입
               title: '로그인 오류', // Alert 제목
               text: '로그인 하세요', // Alert 내용
               
               buttons: {
                    confirm: {
                         text: '확인 ',
                         value: true,
                         className: 'btn btn-outline-primary'
                    }
               }
          }).then((result) => {
               if (result) {
                    location.href = "/member/loginGo";
               }
          });
          
          </c:when>
          <c:when test="${inStudy==0}">
          Swal.fire({
               icon: 'warning', // Alert 타입
               title: '스터디원이 아닙니다.', // Alert 제목
               text: '스터디원이 아닙니다.', // Alert 내용
               
               buttons: {
                    confirm: {
                         text: '스터디 ',
                         value: true,
                         className: 'btn btn-outline-primary'
                    }
               }
          }).then((result) => {
               if (result) {
                    location.href = "javascript:history.back()";
               }
          });
          </c:when>
          </c:choose>
          wsOpen();
     });
     
     function wsOpen() {
          //웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
          ws = new WebSocket("ws://" + location.host + "/chating/" + $("#r_Idx").val());
          wsEvt();
     }
     
     function wsEvt() {
          ws.onopen = function(data) {
               //소켓이 열리면 동작
          }
     
          ws.onmessage = function(data) {
               let now = new Date();
               
               let hours = now.getHours();
               let minutes = now.getMinutes();
               let seconds = now.getSeconds();
               let now2 = hours+"시"+minutes+"분"+seconds+"초"
               console.log(data);
               //메시지를 받으면 동작
               var msg = data.data;
          
               console.log(typeof msg);
               msg.memberName = '${member.member_name}';
               msg.userProfile = '${member.member_profile}';
               msg.sendTime = now2;
               console.log(data.data);
          
               if (msg != null && msg.trim() != '') {
                    var d = JSON.parse(msg);
               
                    if (d.type == "getId") {
                         var si = d.sessionId != null ? d.sessionId : "";
                    
                         if (si != '') {
                              $("#sessionId").val(si);
                         }
                    
                    } else if (d.type == "message") {
                    
                         if (d.msg == '' || d.msg == null) {
                              Swal.fire({
                                   title: '공백은 안됩니다',
                                   type: 'warning',
                                   buttonsStyling: false,
                                   confirmButtonText: '확인',
                                   confirmButtonClass: 'btn btn-primary font-weight-bolder'
                              });
                         } else if (d.sessionId == $("#sessionId").val()) {
                              // $("#chating").
                              //      append("<p align='right' style='margin: 0;padding:0'><img  style='width: 50px; height:50px;border-radius: 70%; overflow: hidden;' src=" +
                              //           d.userProfile + " /></p>");
                              // $("#chating").append("<p class='me'>나 :" + d.msg + "</p>");
                              $(".messages").
                                   append("<div class='d-flex flex-column mb-5 align-items-start'><div class='d-flex align-items-center'><div class='symbol symbol-circle symbol-40 mr-3'><img alt='Pic' src='" +
                                        d.userProfile +
                                        "'></div><div><a href='#' class='text-dark-75 text-hover-primary font-weight-bolder font-size-h6'>나</a><span class='text-muted font-size-sm'>"+now2+"</span></div></div><div class='mt-2 rounded p-5 bg-light-success text-dark-50 font-weight-bolder font-size-lg text-left max-w-400px'>"+d.msg+"</div></div></div>");
                         } else {
                              $('.messages').
                                   append("<div class='d-flex flex-column mb-5 align-items-end'><div class='d-flex align-items-center'><div><span class='text-muted font-size-sm'>"+now2+"</span><a href='#' class='text-dark-75 text-hover-primary font-weight-bolder font-size-h6'>" +
                                        d.userName +
                                        "</a></div><div class='symbol symbol-circle symbol-40 ml-3'><img alt='Pic' src='" +
                                        d.userProfile +
                                        "'></div></div><div class='mt-2 rounded p-5 bg-warning text-dark-50 font-weight-bolder font-size-lg text-left max-w-400px'>"+d.msg+"</div></div></div>");
                         
                              // $("#chating").
                              //      append("<p align='left' style='margin: 0;padding:0><img style='width: 50px;height: 50px;border-radius: 70%;overflow: hidden;'  src=" +
                              //           d.userProfile + " /></p>");
                              // $("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
                         }
                    
                    } else {
                         console.warn("unknown type!");
                    }
               }
          };
          ws.onclose = e => {
               setTimeout(wsOpen, 1000);
          }
          
          document.addEventListener("keypress", function(e) {
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
     
     function send() {
          var option = {
               type: "message",
               r_Idx: $("#r_Idx").val(),
               sessionId: $("#sessionId").val(),
               userName: $("#userName").val(),
               msg: $("#chatting").val(),
               userProfile: $('#userProfile').attr("src")
          };
          ws.send(JSON.stringify(option))
          $('#chatting').val("");
     }
</script>
<!----------------Head 종료----------------------->
<!----------------Body 시작----------------------->


<body id="kt_body" class="header-fixed subheader-enabled page-loading">
<!----------------메인 시작----------------------->
<input hidden id="userName" name="userName" value="${member.member_name}"/>
<img src="<spring:url value='${member.member_profile}'/>" hidden id="userProfile"/>
<div class="d-flex flex-column flex-root">
      <!----------------페이지 시작----------------------->
      <div class="d-flex flex-row flex-column-fluid page">
            <!--begin::Wrapper-->
            <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
                  <!------------------header.html Include------------------>
<%--                  <jsp:include page="/WEB-INF/commons/header.jsp"/>--%>
                  <!------------------Header Wrapper : 메뉴 탭 시작------------------>
                  <!--menu.html Include-->
<%--                  <jsp:include page="/WEB-INF/commons/menu_main.jsp"/>--%>
                  <!------------------Header Wrapper : 메뉴 탭 종료------------------>
                  <!--컨테이너 시작-->
                  <div class="d-flex flex-row flex-column-fluid container">
                        <!--풀 사이즈 카드 시작 / 카드 필요 없으면 여기서부터 밀기☆-->
                        <div class="card card-custom gutter-b card-stretch" style="width: 100%">
                              <!--카드 헤더 시작-->
                              <div class="card-header border-0 pt-5">
                                    <h3 class="card-title align-items-start flex-column">
                                    </h3>
                                    <div class="card-toolbar">
                                    
                                    </div>
                              </div>
                              <!--카드 헤더 종료-->
                              <!--카드 Body 시작-->
                              <!--카드 Body 시작-->
                              <div class="card-body pt-2 pb-0 mt-n3">
                                    <div id="container" class="container" align="center">
                                          <h1>${map.get("teamName")}의 채팅방</h1>
                                          <input type="hidden" id="sessionId" value="">
                                          <input type="hidden" id="roomNumber" value="2">
                                          <input type="hidden" id="r_Idx" value="${r_Idx}">
                                          
<%--                                          <div id="chating" class="chating">--%>
<%--                                          </div>--%>
                                          <div class="messages"></div>
                                          
                                          <%--                            <div id="yourName">--%>
                                          <%--                                <table class="inputTable">--%>
                                          <%--                                    <tr>--%>
                                          <%--                                        <th>사용자명</th>--%>
                                          <%--                                        <th>--%>
                                          <%--                                            <input type="text" name="userName" id="userName" value="nickname55">--%>
                                          <%--                                        </th>--%>
                                          <%--                                        <th>--%>
                                          <%--                                            <button onclick="chatName()" id="startBtn">이름 등록</button>--%>
                                          <%--                                        </th>--%>
                                          <%--                                    </tr>--%>
                                          <%--                                </table>--%>
                                          <%--                            </div>--%>
                                          <div id="yourMsg">
                                                <table class="inputTable">
                                                      <tr>
                                                            <th>메시지</th>
                                                            <th>
                                                                  <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="chatting"
                                                                         placeholder="보내실 메시지를 입력하세요....................................">
                                                            </th>
                                                            <th>
                                                                  <button onclick="send()" id="sendBtn" class="btn btn-light-success font-weight-bolder mr-2">보내기</button>
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
                  </div>
            </div>
      </div>
</div>
<jsp:include page="/WEB-INF/commons/footer.jsp"/>
</body>

<!----------------Body 종료----------------------->

</html>