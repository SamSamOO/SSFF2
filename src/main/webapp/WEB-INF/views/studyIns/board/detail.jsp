<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>

<html lang="ko">
<!----------------Head 시작----------------------->

<head>
      <title>게시물 상세 페이지입니다</title>
      <!--head.html Include-->
      <jsp:include page="/WEB-INF/commons/head.jsp"/>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
      <script>
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
                <c:when test="${insStudy==0}">
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
                
                console.debug("제이쿼리 시작 ㅇㅇ");
                
                $(`#modifyBtn`).on('click', function() {
                     console.log("수정 버튼 클릭");
                     
                     self.location = '/studyIns/board/detail/modifyGo?cont_No=<c:out value="${detail.cont_No}"/>&r_Idx=<c:out value="${detail.r_Idx}"/>';
                }); // onclick
                
                $(`#removeBtn`).on('click', function() {
                     console.log("삭제 버튼 클릭");
                     
                     <%--self.location = '/studyIns/board/detail/remove?cont_No=<c:out value="${detail.cont_No}"/> ';--%>
                     let formObj = $('form');
                     
                     formObj.attr('method', 'POST');
                     formObj.attr('action', '/studyIns/board/detail/remove');
                     formObj.submit();
                }); // onclick
           }); // jq
           
           function doImgPop(img) {
                img1 = new Image();
                img1.src = (img);
                console.log(img1.src);
                
                imgControll(img);
           }
           
           function imgControll(img) {
                let intervalID;
                let controller;
                
                if ((img1.width != 0) && (img1.height != 0)) {
                     viewImage(img);
                } else {
                     controller = "imgControll('" + img + "')";
                     intervalID = setTimeout(controller, 20);
                }
           }
           
           function viewImage(img) {
                console.log(img);
                W = img1.width;
                H = img1.height;
                O = "width=" + W + ",height=" + H + ",scrollbars=yes";
                imgWin = window.open("", "", O);
                imgWin.document.write("<html lang='ko'><head><title>----------이미지 상세보기----------클릭시 창이 닫힙니다.</title></head>");
                imgWin.document.write("<body topmargin=0 leftmargin=0>");
                imgWin.document.write("<img src=" + img +
                     " onclick = self.close() style= cursor:pointer; title = '클릭하시면 창이 닫힙니다.'>");
                imgWin.document.close();
           }
      </script>
      <style>
            .recommendPost_listWrapper__1Ix8x {
                  width         : 240px;
                  margin-left   : 2rem;
                  padding       : 1rem 0.75rem;
                  line-height   : 1.5;
                  font-size     : .875rem;
                  max-height    : calc(100vh - 128px);
                  overflow      : hidden auto;
                  border        : 2px solid #e2e2e2;
                  border-radius : 1rem;
                  margin-top    : 1.5rem;
                  position      : fixed;
                  top           : 400px;
            }
            
            .recommendPost_index__2o2jf {
                  color        : #4b9ef4;
                  margin-right : 0.25rem;
            }
            
            .recommendPost_title__38iq9 {
                  display            : -webkit-box;
                  -webkit-box-orient : vertical;
                  -webkit-line-clamp : 1;
                  overflow           : hidden;
            }
            
            .recommendPost_userInfoWrapper__2T6u8 {
                  display     : flex;
                  margin-left : 2rem;
                  position    : fixed;
                  top         : 350px;
            }
            
            .recommendPost_bar__3GKlv {
                  width  : 0;
                  height : 2.5rem;
                  border : 2px solid #4482f7;
                  
            }
            
            .recommendPost_userInfoWrapper__2T6u8 {
                  display     : flex;
                  margin-left : 2rem;
                  position    : fixed;
                  top         : 350px;
                  
            }
            
            .recommendPost_userInfo__1Ozvo {
                  font-size   : 20px;
                  margin-left : 0.5rem;
                  
            }
            
            .recommendPost_userName__2gZg6 {
                  font-weight : 700;
            }
      
      
      </style>
</head>
<c:set var="fileListSize" value="${fn:length(fileList)}"/>
<c:set var="slash" value="/"/>
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
                        <!--contents.html Include-->
                        <!--begin::Content Wrapper 내용물 시작-->
                        <div class="main d-flex flex-column flex-row-fluid">
                              <!--Subheader : 서브헤더 페이지 제목란 시작-->
                              <div class="subheader py-2 py-lg-6" id="kt_subheader">
                                    <div class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                                          <!--begin::Info-->
                                          <div class="d-flex align-items-center flex-wrap mr-1">
                                                <!--begin::Page Heading-->
                                                <div class="d-flex align-items-baseline flex-wrap mr-5">
                                                      <!--Page Title : 페이지 제목 시작-->
                                                      <h5 class="text-dark font-weight-bold my-1 mr-5">프로젝트 찾기</h5>
                                                      <!--Page Title : 페이지 제목 종료-->
                                                      <!--Breadcrumb : 로드맵 시작-->
                                                      <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
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
                                          <div class="card-header border-0 pt-5 card-body mt-5">
                                                <%--다크모드--%>
                                                <%--<button class="btn-toggle">Toggle Dark-Mode</button>--%>
                                                <form action="/studyIns/board/detail/modify" method="POST" style="width: 100%">
                                                      <input type="hidden" name="cont_No" value="<c:out value='${detail.cont_No}' />">
                                                      <input type="hidden"  id="r_Idx" name="r_Idx" value="<c:out value='${detail.r_Idx}' />">
                                                      <table class="table table-bordered table-borderless" style="width: 100%;  border-radius: 10px; border-style: hidden ; !important;">
                                                            <tr>
                                                                  <th align="left" height="50px">
                                                                        <a href="javascript:history.back()"><i class="fas fa-arrow-left fa-3x" id="backBtn" style=""></i></a>
                                                                  </th>
                                                            </tr>
                                                            <tr>
                                                                  <td colspan="10" style="text-align: center; font-weight: bold; font-size: 26px;height: 100px">${detail.title}</td>
                                                            
                                                            </tr>
                                                            <tr style="height: 100px">
                                                                  <td colspan="6">카테고리 : ${detail.category}</td>
                                                                  <%--TODO 세션아이디와 현재글 닉네임과 동일한 경우 수정 삭제버튼 보입니다. --%>
                                                                  <td colspan="4" align="right">
                                                                        <i class="far fa-eye">&nbsp;${detail.hit}</i>
                                                                        <%--TODO 조회수 관련 함수 짜야합니다.--%>
                                                                        <c:set var="writer" value="${detail.member_Name}"/>
                                                                        &nbsp;<c:if test="${member.member_name eq writer}">
                                                                        <button type="button" id="modifyBtn" class="btn btn-light fa-1x">수정</button>
                                                                        <button type="button" id="removeBtn" class="btn btn-light fa-1x">삭제</button>
                                                                              </c:if>
                                                                        ${detail.member_Name}
                                                                  </td>
                                                            </tr>
                                                            <tr>
                                                                  
                                                                  <th colspan="4"></th>
                                                                  
                                                                  <th colspan="1" align="right">작성일자</th>
                                                                  <td colspan="2">
                                                                        <fmt:formatDate value="${detail.write_Date}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/>
                                                                  </td>
                                                                  <c:if test="${ not empty detail.modify_Date }">
                                                                        <th colspan="1">수정일자</th>
                                                                        <td colspan="2">
                                                                              <fmt:formatDate value="${detail.modify_Date}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/>
                                                                        </td>
                                                                  
                                                                  </c:if>
                                                            </tr>
                                                            <tr style="height: 600px; border-top: lightblue ;border-style: solid">
                                                                  <td colspan="10" style=" padding: 50px">${detail.cont}</td>
                                                            </tr>
                                                            <tr>
                                                                  <td colspan="8">
                                                                        <div class="form_section">
                                                                              <div class="form_section_title">
                                                                                    <label>첨부파일 이미지 -- 사진 클릭시 확대창이 표시됩니다.</label>
                                                                              </div>
                                                                              <div class="form_section_content">
                                                                                    <div id="uploadResult">
                                                                                          
                                                                                          <c:forEach var="file" items="${fileList}">
                                                                                                <div>
                                                                                                      <c:if test="${fileListSize!=0}">
                                                                                                            <a href="<spring:url value='/image/${file.uuid}_${file.file_Name}'/>"></a>
                                                                                                            <p>${file.file_Name}</p>
                                                                                                      </c:if>
                                                                                                      <c:if test="${fileListSize==0}">
                                                                                                            이미지가 없습니다.
                                                                                                      </c:if>
                                                                                                </div>
                                                                                          
                                                                                          </c:forEach>
                                                                                          
                                                                                          
                                                                                          <c:forEach var="file" items="${fileList}">
                                                                                                
                                                                                                <c:if test="${fileListSize !=0}">
                                                                                                      <a href="<spring:url value='/image/${file.uuid}_${file.file_Name}'/>"><img
                                                                                                              src="<spring:url value='/image/${file.uuid}_${file.file_Name}'/>" width="400" alt="사진"/></a>
                                                                                                </c:if>
                                                                                                
                                                                                                <c:if test="${fileListSize==0}">
                                                                                                      이미지가 없습니다.
                                                                                                </c:if>
                                                                                          
                                                                                          </c:forEach>
                                                                                    
                                                                                    </div>
                                                                              </div>
                                                                        </div>
                                                                        
                                                                  </td>
                                                                  <td align="right">
                                                                        <div class="right">
            
                                                                              <a  class="btn btn-light-instagram right" type="button" href="/studyIns/board/list?r_Idx=${detail.r_Idx}">목록으로 이동</a>
                                                                        </div>
                                                                  </td>
                                                            </tr>
                                                      
                                                      
                                                      </table>
                                                </form>
                                          </div>
                                          <!--카드 바디 종료-->
                                    
                                    </div>
                                    <!--풀 사이즈 카드 종료 / 카드 필요 없으면 여기서까지 밀기☆-->
                                    
                                    
                                    <!--대시보드 종료-->
                              </div>
                              <!--end::Content-->
                        </div>
                        <!--end::Content Wrapper 내용물 종료-->
                        <div class="" style="position: relative; margin-top: 1.3rem">
                              <div style="position:absolute; left: 100%">
                                    <div class="recommendPost_userInfoWrapper__2T6u8">
                                          <div class="recommendPost_bar__3GKlv"></div>
<%--                                          <div>${member.member_profile}</div>--%>
                                          <div class="recommendPost_userInfo__1Ozvo">
                                                <span class="recommendPost_userName__2gZg6">${member.member_name}</span>님이<br>좋아하실 글을 모아봤어요!
                                          </div>
                                    </div>
                                    <ul class="recommendPost_listWrapper__1Ix8x">
                                          <c:forEach var="list" items="${listByHit}" begin="1" end="8" varStatus="status">
                                                <li class="recommendPost_postList__S6Av-">
                                                      <div class="recommendPost_index__2o2jf"></div>
                                                      <div class="recommendPost_title__38iq9">
                                                            <span style="font-size: 24px">${status.count}. </span><a href="?cont_No=${list.cont_No}&r_Idx=${detail.r_Idx}" style="font-weight: 200; font-size: 24px; overflow: hidden"><c:out value="${list.title}"/></a>
                                                      </div>
                                                </li>
                                          </c:forEach>
                                    </ul>
                              
                              
                              </div>
                        </div>
                  </div>
                  <%--컨테이너 종료--%>
                  <!--footer.html Include-->
            </div>
      </div>
      <jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</div>
</body>
<!----------------Body 종료----------------------->

</html>