<%--
  스터디 카페 생성 화면단
  User: 신지혜
  Date: 2021-11-20
  Time: 오전 6:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html lang="en">
<!----------------Head 시작----------------------->

<head>
  <title>카페 등록하기</title>
  
  <style>
  
  
  </style>
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
    <div class="d-flex flex-column flex-row-fluid wrapper"
         id="kt_wrapper">
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
            <!--begin::Subheader-->
            <div
              class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
              <!--begin::Details-->
              <div class="d-flex align-items-center flex-wrap mr-1">
                <!--begin::Title-->
                <h5 class="text-dark font-weight-bold mt-2 mb-2 mr-5">예약하기</h5>
                <!--end::Title-->
                <!--begin::Separator-->
                <div
                  class="subheader-separator subheader-separator-ver mt-2 mb-2 mr-5 bg-gray-200"></div>
                <!--end::Separator-->
                <!--begin::Search Form-->
                <div class="d-flex align-items-center" id="kt_subheader_search">
                </div>
                <!--end::Search Form-->
              </div>
              <!--end::Details-->
              <!--begin::Toolbar-->
              <div class="d-flex align-items-center">
                <!--begin::Button-->
                <a onclick="ttt();" class="btn btn-default font-weight-bold">Back</a>
                <!--end::Button-->
                <!--begin::Dropdown-->
                <div class="btn-group ml-2">
                  <button type="submit" class="btn btn-primary font-weight-bold"
                          id="submitBtn">Save Changes
                  </button>
                </div>
                <!--end::Dropdown-->
              </div>
              <!--end::Toolbar-->
            </div>
            <!--end::Subheader-->
          </div>
          <!--Subheader : 서브헤더 페이지 제목란 종료-->
          
          <!------------------ 본문 시작 ------------------>
          <!--begin::Content-->
          <div class="content flex-column-fluid">
            
            <!--begin::card-->
            <div class="card card-custom card-sticky">
              <div class="card-body">
                <!--begin::Form-->
                <form class="form" id="formObj" method="post"
                      enctype="multipart/form-data" action="/cafe/register/inserttt">
                  <div class="row">
                    
                    <div class="col-xl-8">
                      <div class="my-5">
                        <h3 class="text-dark font-weight-bold mb-10">카페 정보</h3>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">카페이름</label>
                          <div class="col-9">
                            <input class="form-control" type="text" value="" name="cafe_name"
                            
                                   required/>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">사업자번호</label>
                          <div class="col-9">
                            <input class="form-control" type="number" value=""
                                   name="business_number" placeholder="only number" required/>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">대표이름</label>
                          <div class="col-9">
                            <input class="form-control" type="text" value="" name="boss_name"
                                   required/>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">대표번호</label>
                          <div class="col-9">
                            <div class="input-group">
                              <div class="input-group-prepend">

                                <span class="input-group-text">
                                 <i class="la la-phone"></i>
                                </span>
                              </div>
                              <input type="text" class="form-control" value=""
                                     name="cafe_telephone_number"
                                     placeholder="02-123-1234" required/>
                            </div>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">오픈시간</label>
                          <div class="col-9">
                            <input class="form-control" type="number" value=""
                                   placeholder="only number" name="cafe_open_time"
                                   required/>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">마감시간</label>
                          <div class="col-9">
                            <input class="form-control" type="number" value=""
                                   placeholder="only number" name="cafe_close_time" required/>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">카페주소</label>
                          <div class="col-9">
                            <input class="form-control" type="text" value=""
                                   placeholder="서울시 강남구 강남대로1길 1, 101호" name="cafe_location"
                                   required/>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">담당자 이메일</label>
                          <div class="col-9">
                            <div class="input-group">
                              <div class="input-group-prepend">
                                	<span class="input-group-text">
                                 <i class="la la-at"></i>
                                </span>
                              </div>
                              <input type="email" class="form-control" value=""
                                     name="cafe_contact_email"
                                     placeholder="Email" required/>
                            </div>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">담당자 휴대폰</label>
                          <div class="col-9">
                            
                            <div class="input-group">
                              <div class="input-group-prepend">

                                <span class="input-group-text">
                                 <i class="la la-phone"></i>
                                </span>
                              </div>
                              <input type="text" class="form-control" value=""
                                     name="cafe_contact_phone_number"
                                     placeholder="Phone" required/>
                            </div>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">메인타이틀</label>
                          <div class="col-9">
                            <input class="form-control" type="text" value="" name="cafe_main_title"
                                   required/>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">서브타이틀</label>
                          <div class="col-9">
                            <input class="form-control" type="text" value="" name="cafe_sub_title"
                                   required/>
                          </div>
                        </div>
                        
                        
                        <%--                        <div class="form-group row">--%>
                        <%--                          <label class="col-3" for="cafe_details">홍보글 내용</label>--%>
                        <%--                          <div class="col-9">--%>
                        <%--                            <textarea class="form-control form-control-lg form-control-solid"--%>
                        <%--                                      id="cafe_details" rows="6" name="cafe_details"--%>
                        <%--                                      placeholder="요청사항을 입력해주세요."/>																													--%>
                        <%--                          </div>--%>
                        <%--                        </div>--%>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">대표사진(*3)</label>
                          <div class="col-9">
                            <input class="form-control" type="file" value="" name="cafeFile"
                                   multiple required/>
                          </div>
                        </div>
                      
                      
                      </div>
                      
                      
                      <!-- 룸 시작 (기본 셋팅 하나만 하고 나머지 버튼 -> 동적생성) -->
                      <div class="separator separator-dashed my-10"></div>
                      
                      <div class="card-body">
                        <h3 class="text-dark font-weight-bold mb-10">세부 룸 정보</h3>
                        
                        <div class="form-group row">
                          
                          <label class="col-lg-2 col-form-label text-lg-right">인원수</label>
                          <div class="col-lg-3">
                            <input type="number" class="form-control" placeholder="Enter full name"
                                   name="max_people" value="" required/>
                          </div>
                          
                          <label class="col-lg-2 col-form-label text-lg-right">보유개수</label>
                          <div class="col-lg-3">
                            <input type="number" class="form-control"
                                   placeholder="Enter contact number" name="total_room_number"
                                   value="" required/>
                          </div>
                        
                        </div>
                        
                        
                        <div class="form-group row">
                          
                          <label class="col-lg-2 col-form-label text-lg-right">시간당 요금</label>
                          <div class="col-lg-3">
                            <input type="number" class="form-control" placeholder="Enter full name"
                                   name="amount_hour" value="" required/>
                          </div>
                          
                          <label class="col-lg-2 col-form-label text-lg-right">첨부파일</label>
                          <div class="col-lg-3">
                            <input type="file" class="form-control"
                                   placeholder="Enter contact number" name="roomFile" value=""
                                   required/>
                          </div>
                        
                        </div>
                      
                      
                      </div>
                      <div class="separator separator-dashed my-10"></div>
                    
                    
                    </div>
                  </div>
                
                
                </form>
                <!--end::Form-->
              </div>
            </div>
          </div>
          <!--end::card-->
        
        
        </div>
        <!--end::Content-->
      </div>
      <!--end::Content Wrapper 내용물 end-->
    </div>
    <!--컨테이너 종료-->
  </div>
  <!--end::Wrapper-->
</div>
<!----------------페이지 종료----------------------->
</div>
<!----------------메인 종료----------------------->

<!--컨테이너 종료-->
<!--footer.html Include-->
<jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</body>
<!----------------Body 종료----------------------->

<script>

  function ttt() {

    console.log("ttt");
    $('#formObj').submit();
    console.log("t33tt");

  }

</script>


</html>