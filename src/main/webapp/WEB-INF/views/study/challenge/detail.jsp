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
                                    <h5 class="text-dark font-weight-bolder my-1 mr-5">프로젝트 찾기</h5>
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

                            <!--카드 Body 시작-->
                            <div class="card-header border-0 pt-5 card-body mt-5"
                                 id="post-body-wrapper">
                                <!-----------------------------------------------이 안에서 자유롭게 채우기------------------------------------------------------>
                                <div id="post-body" style="width: 55%">
                                    <div id="article"><!--본문-->
                                        <input type="hidden" id="closed_ok" value="${board.closed_ok}">
                                        <div class="back-button">
                                            <img src="../../../../resources/assets/images/icon/arrow.png"
                                                 style="width:20px;" onclick="location.href='/study/challenge/list'">
                                        </div>
                                        <div class="title-sec">
                                            <h2>${board.title}</h2>
                                        </div>
                                        <div class="reply-item-sec">
                                            <div class="item1">
                                                <div class="symbol symbol-30 symbol-lg-40 symbol-circle mr-3">
                                                    <img alt="Profile Pic"
                                                         src="/resources/assets/media/users/300_21.jpg"/>
                                                </div>
                                            </div>
                                            <div class="item2">
                                                <div>${board.member_name}</div>
                                                <div>${board.writedate}</div>
                                            </div>
                                        </div>
                                        <div class="info-sec">
                                            <ul>
                                                <li>방장 : ${board.member_name}</li>
                                                <li>팀이름 : ${board.teamname}</li>
                                                <li>챌린지 유형 : ${board.ch_pattern}</li>
                                                <li>지역 : ${board.sido}</li>
                                                <li>기간 : ${board.ch_start} ~ ${board.ch_end}</li>
                                            </ul>
                                        </div>
                                        <div class="content-sec">
                                            ${board.cont}
                                        </div>
                                        <div class="apply-sec">
                                            <ul>
                                            <!-- TODO data-value="re" << 값 세션 아이디로 바꿔야 될 부분  -->
                                                <c:choose>
                                                    <c:when test="${member.member_name != board.member_name}">

                                                        <c:set var="myStatus" value="false"/>
                                                        <c:set var="loop_flag" value="false"/>
                                                        <c:forEach var="applylist" items="${applylist}">
                                                                <c:if test="${not loop_flag}">
                                                                    <c:if test="${member.member_name eq applylist.member_name}">
                                                                        <c:set var="myStatus" value="true"/>
                                                                        <c:set var="loop_flag" value="true"/>
                                                                    </c:if>
                                                                </c:if>
                                                        </c:forEach>

                                                        <c:choose>

                                                            <c:when test="${board.closed_ok eq 'y'.charAt(0)}">
                                                                <li><a href="javascript:void(0);" data-value="세션아이디"
                                                                       onclick="" class="applyBtn" style="background-color: grey"
                                                                       id="">마감완료</a></li>
                                                            </c:when>


                                                            <c:when test="${not myStatus}">
                                                                <li><a href="javascript:void(0);" data-value="세션아이디"
                                                                       onclick="applyChallenge('challenge')" class="applyBtn"
                                                                       id="applyChallenge">지원하기</a></li>
                                                            </c:when>



                                                            <c:otherwise>
                                                                <li><a href="javascript:void(0);" data-value="세션아이디"
                                                                      
                                                                       class="applyBtn" style="background-color: gray; pointer-events: none;"
                                                                       >지원완료</a></li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>

                                                    <c:when test="${member.member_name == board.member_name}">
                                                        <li style="padding-right:10px">
                                                            <a href="/study/challenge/modifyGo?r_idx=${board.r_idx}">수정</a> |
                                                            <a href="/study/challenge/remove?r_idx=${board.r_idx}">삭제</a>
                                                        </li>
                                                    </c:when>
                                                </c:choose>

                                                <li style="padding-right:10px">
                                                    <img src="../../../../resources/assets/images/icon/hit.png"
                                                         width="15px">
                                                    <span>${board.hit}</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div id="reply-sec"><!--댓글-->

                                        <div class="reply-write">
                                            <div><p id="reply-count"><span id="reply-count-here">${replyCount}</span>개의 댓글이 있습니다</p></div>
                                            <input type="hidden" id="member_name" name ="member_name" value="${member.member_name}"><!--나중에 세션 아이디로 바꿔야 될 부분-->
                                            <div><textarea id="reply-write-sec"></textarea></div>
                                            <div id="reply-submit"><p onclick="replySubmit()">댓글등록</p></div>
                                        </div>
                                        <div class="reply-list">


                                            <div class="reply">
                                                <!-----------------------여기에 댓글 반복---------------------->

                                                <!---------------------------------------------------------->

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!----------------------------------------------------------------------------------------------------------------------------->
                            </div>
                            <!--카드 Body 종료-->
                        </div>
                        <!--풀 사이즈 카드 종료 / 카드 필요 없으면 여기서까지 밀기☆-->


                        <!--대시보드 종료-->
                    </div>
                    <!--end::Content-->
                </div>
                <!--end::Content Wrapper 내용물 종료-->
            </div>
            <!--컨테이너 종료-->
            <!--footer.html Include-->
            <jsp:include page="../../../commons/footer.jsp"/>
</body>
<!----------------Body 종료----------------------->
<script>
    $(function () {
      console.log("글번호:"+${board.r_idx});
      console.log("closed_ok:"+$('#closed_ok').val());
      /////
      if($('#closed_ok').val()=='y'){
        $('#applyChallenge').html = '마감완료';
      }
      ////

      getReply();
    });//window-start

    function getReply(){
      let html ="";

      let jsonData = {r_idx:${board.r_idx}};
      console.debug(`------ 1. jsonData: %s ------`, jsonData)
      console.debug(jsonData)
      console.debug(`------ 2. jsonData.r_idx: %s  ------`, jsonData.r_idx)

      $.ajax({
        url:"/studyRest/comment/get",
        type:'POST',
        dataType:'json',
        contentType:'application/json;charset=UTF-8',
        data: JSON.stringify(jsonData),
        success:function(data){
          console.debug('---------- success -----------')
          document.querySelector("#reply-count-here").innerHTML = data.length;
          //안의 내용 비우고
          $('.reply').empty();
          if(data.length ==0){
          }else{
            // 반복하면서 채우기
            for (let reply of data) {
              html+='<div class="reply-detail">';
              html+=  '<div class="reply-item-sec">';
              html+=    '<div class="item1">';
              html+=      '<div class="symbol symbol-30 symbol-lg-40 symbol-circle mr-3">';
              html+=        '<img alt="Profile Pic" src="/resources/assets/media/users/300_21.jpg"/>';
              html+=      '</div>';
              html+=    '</div>';
              html+=    '<div class="item2">';
              html+=      '<div>'+reply.member_name+'</div>';
              html+=      '<div>'+reply.c_date+'</div>';
              html+=    '</div>';
              html+=    '<div class="item3">';
              html+=      '<p hidden class="auth-'+reply.member_name+'"><a href="javascript:modifyReply(`'+reply.no+'`,`'+reply.c_cont+'`)">수정</a> |' ;
              html+=       '<a href="javascript:deleteReply(`'+reply.no+'`)">삭제</a></p>';
              html+=    '</div>';
              html+=  '</div>';
              html+=  '<div id="reply-cont-sec-'+reply.no+'">'+reply.c_cont+'</div>';
              html+='</div>';
            }
          }
          $('.reply').html(html);
          //본인의 댓글만 수정삭제 보이는 로직
          let member_name = '${member.member_name}';
          let member_name_auth = '.'+'auth-'+member_name;
          $(member_name_auth).removeAttr( 'hidden' );
        },
        error:function(request,status,error){
          console.debug('---------- error -----------')

          // alert('댓글 로드 실패');
          console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
        }
      }) //.ajax
    }//getReply

    function replySubmit(){
      let member_name = '${member.member_name}';
      if(member_name==""){
        alert('로그인이 필요한 서비스입니다');
        return;
      }
      let jsonData= {
        r_idx:"${board.r_idx}",
        member_name:$('#member_name').val(),
        c_cont:$('#reply-write-sec').val()
      }
      $.ajax({
        url:'/studyRest/comment/post',
        type:'POST',
        dataType:'json',
        contentType:'application/json;charset=UTF-8',
        data: JSON.stringify(jsonData),
        success: function (data) {
          alert("댓글이 등록되었습니다");
          $('#reply-write-sec').val("");
          getReply();
        },
        error: function (request,status,error){
          alert('댓글 등록 실패');
          console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
        }
      });
    }//replySubmit

    function deleteReply(no){
      let jsonData= {
        no:no
      }
      $.ajax({
        url :"/studyRest/comment/remove",
        type:'POST',
        dataType:'json',
        contentType:'application/json;charset=UTF-8',
        data: JSON.stringify(jsonData),
        success: function (data) {
          alert("댓글이 삭제되었습니다");
          $('#reply-write-sec').val("");
          getReply();
        },
        error: function (request,status,error) {
          alert('댓글 삭제 실패');
          console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
        }
      });
    }//deleteReply

    function modifyReply(no,c_cont){
      let source = "#" + "reply-cont-sec-"+no; //원래 글써져 있는 부분 reply-cont-sec-`'+reply.no+'
      document.querySelector(source).innerHTML="";
      $(source).append(
          '<textarea name="replyUpdate" class="form-control" id="update-cont-'+no+'">'+c_cont+'</textarea>'+
          '<input type="button" value="수정하기" Style="margin-top: 5px;" onclick="modifyReplySubmit('+no+')">'
      );
    }//modifyReply

    function modifyReplySubmit(no){
      let temp = "#" + "update-cont-"+no;
      let temp2 = no+"";
      let jsonData= {
        no:temp2,
        c_cont:$(temp).val()
      }
      $.ajax({
        url :"/studyRest/comment/modify",
        type:'POST',
        dataType:'json',
        contentType:'application/json;charset=UTF-8',
        data: JSON.stringify(jsonData),
        success: function (data) {
          alert("댓글이 정상적으로 수정되었습니다.");
          getReply();
        },
        error: function (request,status,error) {
          alert('댓글 수정 실패');
          console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
        }
      });
    }//modifyReplySubmit

    
</script>

<script>


// 지원신청 누르면 작업 고고
function applyChallenge(action){
    //예솔 : 세션 없는사람은 튕겨내는 로직///////////////////
    let member_name ='${member.member_name}';
    if(!member_name){
        alert('로그인후 지원 부탁드립니다');
        return;
    }
    ///////////////////////////////////////////////////
    sAlert();
    
     // errorCallback
}


function sAlert(){
    
    Swal.fire({
                  title : '가입 신청하시겠습니까?',
                  text : '스터디장의 승인 이후 가입되며\n' +
                         '스터디장이 승인하더라도\n' +
                         '스터디 시작일에 [ 10,000원 ]을 결제하지 않으면 \n' +
                         '참여되지 않습니다.',
                  showDenyButton: true,
                  showCancelButton: true,
                  confirmButtonText: '예',
                  denyButtonText: `아니오`,
              }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            callAjax();
            setTimeout( Swal.fire('지원 신청되었습니다!', '', 'success'), 3000);
        } else  {
            Swal.fire('다음에 꼭 함께해요!', '', 'info')
        }
    })
    
}

function callAjax(){
    var submitObj = new Object();
      submitObj.boss = 'n',
      submitObj.r_idx = ${board.r_idx},
      submitObj.member_name = '${member.member_name}'
    
    console.log("submitObj.boss: "+submitObj.boss);
    console.log("submitObj.r_idx: "+submitObj.r_idx);
    console.log("submitObj.member_name: "+ submitObj.member_name);
    
    $.ajax({
               type       : 'POST',
               url        : '/applyMemberRest/insert',
               data       : JSON.stringify(submitObj), // 다음 페이지 번호와 페이지 사이즈를 가지고 출발
               dataType   : 'text', // 받을 데이터는 json
               contentType: "application/json; charset=utf-8",
               success    : successCallback,
               error      : errorCallback
           });
    
    // 성공시 데이터 처리
    function successCallback(data) {
        console.log("data: " + data);
        
        // 참여신청 버튼 비활성화처리
        $('#applyProject').css("background-color","gray"); //색 변경 pointer-events: none
        
        // 마우스 이벤트 제거
        $('#applyProject').css("pointer-events","none");
        
        
        $('#applyProject').text('지원완료'); // 글자 변경
    } // successCallback
    
    // 실패
    function errorCallback() {
        Swal.fire('요청에 실패하였습니다. 다시 시도해주세요!', '', 'warning')
    }
}



</script>
</html>