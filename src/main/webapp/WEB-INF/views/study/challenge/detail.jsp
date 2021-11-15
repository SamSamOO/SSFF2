<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<!----------------Head 시작----------------------->

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="../../../../resources/assets/css/yesol.css" rel="stylesheet" type="text/css">
    <title>챌린지 리스트</title>
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
                                                <li><a href="javascript:void(0);" data-value="세션아이디"
                       																 onclick="applyChallenge('challenge')" 
                       																 id="applyChallenge">지원하기</a></li>
                                                <li style="padding-right:10px"><a href="/study/challenge/modifyGo?r_idx=${board.r_idx}">수정</a> | 삭제</li>
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
                                            <div><p id="reply-count">n개의 댓글이 있습니다</p></div>
                                            <input type="hidden" id="member_name" name ="member_name" value="nickname101"><!--나중에 세션 아이디로 바꿔야 될 부분-->
                                            <div><textarea id="reply-write-sec"></textarea></div>
                                            <div id="reply-submit"><p onclick="replySubmit()">댓글등록</p></div>
                                        </div>
                                        <div class="reply-list">


                                            <div class="reply">
                                                <!-----------------------여기에 댓글 반복---------------------->
                                                <div class="reply-detail"><!--댓글 하나 더미데이터-->
                                                    <div class="reply-item-sec"> <!--사진,닉넴,날짜-->
                                                        <div class="item1">
                                                            <div class="symbol symbol-30 symbol-lg-40 symbol-circle mr-3">
                                                                <img alt="Profile Pic"
                                                                     src="/resources/assets/media/users/300_21.jpg"/>
                                                            </div>
                                                        </div>
                                                        <div class="item2">
                                                            <div>admintest22</div>
                                                            <div>2021-11-01</div>
                                                        </div>
                                                        <div class="item3"><!--자기 글이면 수정 삭제 버튼-->
                                                            <p>수정 | 삭제</p>
                                                        </div>
                                                    </div>
                                                    <div><!--글 있는 단-->
                                                        Lorem ipsum dolor sit amet, consectetur
                                                        adipiscing elit, sed do eiusmod tempor
                                                        incididunt.
                                                        Lorem ipsum dolor sit amet, consectetur
                                                        adipiscing elit, sed do eiusmod tempor
                                                        incididunt.
                                                        Lorem ipsum dolor sit amet, consectetur
                                                        adipiscing elit, sed do eiusmod tempor
                                                        incididunt.
                                                    </div>
                                                </div>
                                                <!---------------------------------------------------------->
                                                <!-----------------------여기에 댓글 반복---------------------->
                                                <div class="reply-detail"><!--댓글 하나 더미데이터-->
                                                    <div class="reply-item-sec"> <!--사진,닉넴,날짜-->
                                                        <div class="item1">
                                                            <div class="symbol symbol-30 symbol-lg-40 symbol-circle mr-3">
                                                                <img alt="Profile Pic"
                                                                     src="/resources/assets/media/users/300_21.jpg"/>
                                                            </div>
                                                        </div>
                                                        <div class="item2">
                                                            <div>admintest22</div>
                                                            <div>2021-11-01</div>
                                                        </div>
                                                        <div class="item3"><!--자기 글이면 수정 삭제 버튼-->
                                                            <p>수정 | 삭제</p>
                                                        </div>
                                                    </div>
                                                    <div><!--글 있는 단-->
                                                        Lorem ipsum dolor sit amet, consectetur
                                                        adipiscing elit, sed do eiusmod tempor
                                                        incididunt.
                                                        Lorem ipsum dolor sit amet, consectetur
                                                        adipiscing elit, sed do eiusmod tempor
                                                        incididunt.
                                                        Lorem ipsum dolor sit amet, consectetur
                                                        adipiscing elit, sed do eiusmod tempor
                                                        incididunt.
                                                    </div>
                                                </div>
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
            &e
            <jsp:include page="../../../commons/footer.jsp"/>
</body>
<!----------------Body 종료----------------------->
<script>
    function replySubmit(){
      let jsonData= {
        r_idx:${board.r_idx},
        member_name:$('#member_name').val(),
        c_cont:$('#reply-write-sec').val
      }
      $.ajax({
        url:'/study/comment/post',
        type:'POST',
        dataType:'json',
        contentType:'application/json;charset=UTF-8',
        data: JSON.stringify(jsonData),
        success: function (data) {
          alert("댓글이 등록되었습니다");
          $('#reply-content').val("");
        },
        error: function () {
          alert('댓글 등록 실패');
        }
      });
    }
    
    // 접속자의 권한을 확인하는 함수 
    function access(){
    	
    	
    }
    

    // 지원신청 누르면 작업 고고
    function applyChallenge(action){
    	
    	// 유형별로 다른 문구
    	let actionName =
            action == 'challenge' ? '스터디장이 승인하더라도\n스터디 시작일에 [ 10,000원 ]이 결제하지 않으면 \n 참여되지 않습니다.\n\n' : '';
                
    	
    	if (!confirm("\n\n해당 스터디에서 지원신청 하시겠습니까?\n" + 
    			"스터디장의 승인 이후 가입됩니다.\n" + actionName)) {
            return false;
      } // if
    	
      var submitObj = new Object();
      submitObj.boss = 'n',
      submitObj.r_idx = ${board.r_idx},
      submitObj.member_name = 'nickname104';
      
      console.log("submitObj.boss: "+submitObj.boss);
      console.log("submitObj.r_idx: "+submitObj.r_idx);
      console.log("submitObj.member_name: "+ submitObj.member_name);
      
       $.ajax({
                type       : 'POST',
                url        : '/applyMember/insert',
                data       : JSON.stringify(submitObj), // 다음 페이지 번호와 페이지 사이즈를 가지고 출발
                dataType   : 'text', // 받을 데이터는 json
                contentType: "application/json; charset=utf-8",
                success    : successCallback,
                error      : errorCallback
              });

       // 성공시 데이터 처리
       function successCallback(data) {
        console.log("data: " + data);
    	   //TODO data(닉네임 받아서 닉네임) = 세션아이디일 때만 밑에 함수 고
    	    
    	   // 참여신청 버튼 비활성화처리 //TODO 전역함수로도 설정해서 재신청 불가능하게~    	   
    	  $('#applyChallenge').css("background-color","gray"); //색 변경
    	  // $('#applyChallenge').unbind('mouseenter mouseleave'); // 호버 제거 안되죠?
           $("#applyChallenge").attr('onclick', '').unbind('click');
    
           
    	   $('#applyChallenge').text('지원완료'); // 글자 변경
       } // successCallback

       // 실패
       function errorCallback() {
        
     	 alert("요청에 실패하였습니다. 다시 시도해주세요!");
       } // errorCallback
    }   
</script>
</html>