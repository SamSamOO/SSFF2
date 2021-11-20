<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<!----------------Head 시작----------------------->

<head>
    <link href="../../../../resources/assets/css/yesol.css" rel="stylesheet" type="text/css">
    <title>프로젝트 리스트</title>
    <!--head.html Include-->
    <jsp:include page="../../../commons/head.jsp"/>
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

                            <!--카드 Body 시작-->
                            <div class="card-header border-0 pt-5 card-body mt-5"
                                 id="post-body-wrapper">
                                <!-----------------------------------------------이 안에서 자유롭게 채우기------------------------------------------------------>
                                <div id="post-body" style="width: 55%">
                                    <div id="article"><!--본문-->
                                        <div class="back-button">
                                            <img src="../../../../resources/assets/image/arrow.png"
                                                 style="width:20px;" onclick="location.href='/study/project/list'">
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
                                                <li>사용 언어 :
                                                    <c:forEach var="langList" items="${langList}">
                                                        <span class="langList-tag">${langList.lang_name}</span>
                                                    </c:forEach>
                                                </li>

                                            </ul>
                                        </div>
                                        <div class="content-sec">
                                            ${board.cont}
                                        </div>
                                        <div class="apply-sec">
                                            <ul>
                                                <li><p>지원하기</p></li>
                                                <li style="padding-right:10px"><a href="/study/project/modifyGo?r_idx=${board.r_idx}">수정</a> | <a href="/study/project/remove?r_idx=${board.r_idx}">삭제</a></li>
                                                <li style="padding-right:10px">
                                                    <img src="../../../../resources/assets/image/hit.png"
                                                         width="15px">
                                                    <span>${board.hit}</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div id="reply-sec"><!--댓글-->

                                        <div class="reply-write">
                                            <div><p id="reply-count"><span id="reply-count-here">${replyCount}</span>개의 댓글이 있습니다</p></div>
                                            <input type="hidden" id="member_name" name ="member_name" value="nickname55"><!--나중에 세션 아이디로 바꿔야 될 부분-->
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
  $(function(){
    getReply();
  });//window-start

  function getReply(){
    let html ="";
    let jsonData = {r_idx:${board.r_idx}};
    $.ajax({
      url:"/studyRest/comment/get",
      type:'POST',
      dataType:'json',
      contentType:'application/json;charset=UTF-8',
      data: JSON.stringify(jsonData),
      success:function(data){
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
            html+=      '<p><a href="javascript:modifyReply(`'+reply.no+'`,`'+reply.c_cont+'`)">수정</a> |' ;
            html+=       '<a href="javascript:deleteReply(`'+reply.no+'`)">삭제</a></p>';
            html+=    '</div>';
            html+=  '</div>';
            html+=  '<div id="reply-cont-sec-'+reply.no+'">'+reply.c_cont+'</div>';
            html+='</div>';
          }
        }
        $('.reply').html(html);
      },
      error:function(){
        alert('댓글 로드 실패');
      }
    })
  }//getReply

  function replySubmit(){
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
      error: function () {
        alert('댓글 등록 실패');
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
</html>