<%--
  스터디 카페 리스트 단
  User: 신지혜
  Date: 2021-11-05
  Time: 오후 3:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib	uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<%@taglib	uri="http://java.sun.com/jsp/jstl/fmt"	prefix="fmt" %>
<!DOCTYPE html>

<html lang="en">
<!----------------Head 시작----------------------->

<head>
  <title>cafeList</title>
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
  />
  
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  

  <!--head.html Include-->
  <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>
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
      <jsp:include page="../../commons/header.jsp"/>
      <!------------------Header Wrapper : 메뉴 탭 시작------------------>
      <!--menu.html Include-->
      <jsp:include page="../../commons/menu_main.jsp"/>
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
                  <h5 class="text-dark font-weight-bolder my-1 mr-5">스터디카페 리스트</h5>
                  <!--Page Title : 페이지 제목 종료-->
                  <!--Breadcrumb : 로드맵 시작-->
                  <ul
                    class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                    <li class="breadcrumb-item">
                      <a href="" class="text-muted">스터디카페</a>
                    </li>
                    <li class="breadcrumb-item">
                      <a href="" class="text-muted">예약내역</a>
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
            
            <!------------------ 본문 시작 ------------------>
              <!--begin::Row-->
              <div class="row" id="cafeListCardLow">
  
              
                
                
              </div>
              <!--begin::Row-->
            <!------------------ 본문 종료 ------------------>
          
          </div>       
        
        
        </div>
      
      </div>
      <!--컨테이너 종료-->
      <!--footer.html Include-->
      <jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</body>
<!----------------Body 종료----------------------->

<script>

  const clientID = '8492614f-7af7-472e-9c00-f0b61b38ed33';
  const clientPWD = 'e9366e92-5b66-450e-8299-f1ebbf9473db';
  // 인증 버튼이 눌리면 인증 페이지로 이동
  $("#authBtn").click(function(){
    var tmpWindow = window.open('about:blank')
    tmpWindow.location = "https://testapi.openbanking.or.kr/oauth/2.0/authorize?" +
                         "response_type=code&"+
                         "client_id=8492614f-7af7-472e-9c00-f0b61b38ed33&" + //
                         "redirect_uri=http://localhost:8070/payment/authIn&"+
                         "scope=login inquiry transfer&"+
                         "client_info=test&"+
                         "state=b80BLsfigm9OokPTjy03elbJqRHOfGSY&"+
                         "auth_type=0&" +
                         "cellphone_cert_yn=Y&" +
                         "authorized_cert_yn=Y&" +
                         "account_hold_auth_yn=N&" +
                         "register_info=A"


    
    
    
  })

</script>
</html>