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
  <title>카페 수정하기</title>
  
  <style>
    .row {
      justify-content: space-evenly;
    }
  
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
                <h5 class="text-dark font-weight-bolder mt-2 mb-2 mr-5">수정하기</h5>
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
                
                <button type="button" class="btn btn-primary font-weight-bold"
                        onclick="goRegister();"> 수정하기
                </button>
                
                
                <a href="/cafe/remove?cafe_idx=${cafeVO.cafe_idx}"
                   class="btn btn-warning font-weight-bold ml-5"> 삭제하기
                </a>
                <!--end::Button-->
  
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
                      enctype="multipart/form-data" action="/cafe/register/insert">
                  <div class="row">
                    
                    <div class="col-xl-8">
                      <div class="my-5">
                        <h3 class="text-dark font-weight-bold mb-10">카페 정보</h3>
                        <input class="form-control" type="hidden" value="${cafeVO.cafe_idx}"
                               name="cafe_idx"
                               required/>
                        
                        <div class="form-group row">
                          <label class="col-3">카페이름</label>
                          <div class="col-9">
                            <input class="form-control" type="text" value="${cafeVO.cafe_name}"
                                   name="cafe_name"
                                   required/>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">사업자번호</label>
                          <div class="col-9">
                            <input class="form-control" type="number"
                                   value="${cafeVO.business_number}"
                                   name="business_number" placeholder="only number" required/>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">대표이름</label>
                          <div class="col-9">
                            <input class="form-control" type="text" value="${cafeVO.boss_name}"
                                   name="boss_name"
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
                              <input type="text" class="form-control"
                                     value="${cafeVO.cafe_telephone_number}"
                                     name="cafe_telephone_number"
                                     placeholder="02-123-1234" required/>
                            </div>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">오픈시간</label>
                          <div class="col-9">
                            <input class="form-control" type="number"
                                   value="${cafeVO.cafe_open_time}"
                                   placeholder="only number" name="cafe_open_time"
                                   required/>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">마감시간</label>
                          <div class="col-9">
                            <input class="form-control" type="number"
                                   value="${cafeVO.cafe_close_time}"
                                   placeholder="only number" name="cafe_close_time" required/>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">카페주소</label>
                          <div class="col-9">
                            <input class="form-control" type="text" value="${cafeVO.cafe_location}"
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
                              <input type="email" class="form-control"
                                     value="${cafeVO.cafe_contact_email}"
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
                              <input type="text" class="form-control"
                                     value="${cafeVO.cafe_contact_phone_number}"
                                     name="cafe_contact_phone_number"
                                     placeholder="Only number" required/>
                            </div>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">메인타이틀</label>
                          <div class="col-9">
                            <input class="form-control" type="text"
                                   value="${cafeVO.cafe_main_title}"
                                   name="cafe_main_title"
                                   required/>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3">서브타이틀</label>
                          <div class="col-9">
                            <input class="form-control" type="text" value="${cafeVO.cafe_sub_title}"
                                   name="cafe_sub_title"
                                   required/>
                          </div>
                        </div>
                        
                        
                        <div class="form-group row">
                          <label class="col-3" for="cafe_details">홍보글 내용</label>
                          <div class="col-9">
                              <textarea class="form-control form-control-lg form-control-solid"
                                        id="cafe_details" rows="6" name="cafe_details"
                                        placeholder="요청사항을 입력해주세요."> ${cafeVO.cafe_details} </textarea>
                          </div>
                        </div>
                        
                        <%--                        --%>
                        <div class="form-group row">
                          <label class="col-3">대표사진(*3)</label>
                          <div class="col-9">
                            <input class="form-control" type="file" name="cafeFile"
                                   value="${cafeVO.cafe_image_1},
                                          ${cafeVO.cafe_image_2},
                                          ${cafeVO.cafe_image_3}"
                                   accept="image/*" multiple required/>
                          </div>
                        </div>
                      
                      </div>
                      
                      
                      <!-- 룸 시작 (기본 셋팅 하나만 하고 나머지 버튼 -> 동적생성) -->
                      
                      ${roomVOList[0].room_idx}
                    </div>
                    
                    <div class="separator separator-dashed my-10"></div>
                    
                    <div class="card-body room"> <!-- //TODO 여기 축소하면 좀.. 무리지어서 다녔으면..;  -->
                      
                      <h3 class="text-dark font-weight-bold mb-10">세부 룸 정보</h3>
                      <c:forEach var="item" items="${roomVOList}">
                        
                        <div class="room form-group row">
                          
                          <label class="col-form-label text-lg-right">인원수</label>
                          <div class>
                            <input type="number" class="room form-control"
                                   placeholder="사용가능한"
                                   name="max_people" value="${item.max_people}" required/>
                          </div>
                          
                          <label class="col-form-label text-lg-right">보유개수</label>
                          <div class>
                            <input type="number" class="room form-control"
                                   placeholder="Only number" name="total_room_number"
                                   value="${item.total_room_number}" required/>
                          </div>
                          
                          <label class="col-form-label text-lg-right">시간당 요금</label>
                          <div class>
                            <input type="number" class="room form-control"
                                   placeholder="Only number"
                                   name="amount_hour" value="${item.amount_hour}" required/>
                          </div>
                          
                          <label class="col-form-label text-lg-right">첨부파일</label>
                          <div class>
                            <input type="file" class="room form-control"
                                   placeholder="click" name="roomFile" value="${item.room_image}"
                                   accept="image/*" required/>
                          </div>
                          <button class="add btn btn-light btn-hover-warning font-weight-bold"
                                  value="add">+
                          </button>
                          <button class="delete btn btn-light btn-hover-success font-weight-bold"
                                  value="delete">
                            -
                          </button>
                        </div>
                      
                      
                      </c:forEach>
                    
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

  htmlSet();

  function htmlSet() {
    const html = `
    <div class="room form-group row">
      
      <label class="col-form-label text-lg-right">인원수</label>
      <div class>
        <input type="number" class="room form-control"
               placeholder="사용가능한"
               name="max_people" value="" required/>
      </div>
      
      <label class="col-form-label text-lg-right">보유개수</label>
      <div class>
        <input type="number" class="room form-control"
               placeholder="Only number" name="total_room_number"
               value="" required/>
      </div>
      
      <label class="col-form-label text-lg-right">시간당 요금</label>
      <div class>
        <input type="number" class="room form-control"
               placeholder="Only name"
               name="amount_hour" value="" required/>
      </div>
      
      <label class="col-form-label text-lg-right">첨부파일</label>
      <div class>
        <input type="file" class="room form-control"
               placeholder="click" name="roomFile" value=""
               accept="image/*" required/>
      </div>
      <button class="add btn btn-light btn-hover-warning font-weight-bold" value="add">+
      </button>
      <button class="delete btn btn-light btn-hover-success font-weight-bold" value="delete">
        -
      </button>
    </div>
`

    // 버튼 클릭을 통해 세부 룸정보 add, delete
    $(document).on('click', "button[class^='delete']", function () {

      console.log("delete cc: " + $(`.card-body.room`).children().length);
      // 첫번째를 삭제하려고 하면
      if ($(`.card-body.room`).children().length <= 2) {
        alert("한개 이상의 룸은 필수로 존재해야합니다.")

        // 클릭한 row의 value 내용 비워줌
        $(this).parent().contents().find("input[class^='room']").val('');

        return; // 삭제 event 실행 x
      } // if

      // 클릭한 룸정보 로우 삭제
      $(this).parent().remove();

    })

    $(document).on('click', "button[class^='add']", function () {

      console.log("add cc");
      $('.card-body.room').append(html);

    })

    function chk_file_type(obj) {

      var file_kind = obj.value.lastIndexOf('.');

      var file_name = obj.value.substring(file_kind + 1, obj.length);

      var file_type = file_name.toLowerCase();

      var check_file_type = new Array();

      check_file_type = ['jpg', 'gif', 'png', 'jpeg', 'bmp', 'tif'];

      if (check_file_type.indexOf(file_type) == -1) {

        alert('Only image file can be uploaded.');

        var parent_Obj = obj.parentNode;

        var node = parent_Obj.replaceChild(obj.cloneNode(true), obj);

        document.getElementById("wfb-field-219958876").value = "";    //초기화를 위한 추가 코드

        document.getElementById("wfb-field-219958876").select();        //초기화를 위한 추가 코드

        document.selection.clear();                                                //일부 브라우저 미지원

        return false;

      }

    }

    // TODO 이미지 확장자 확인
    $(document).on('change', "input[type='file']", function () {

      let files = $(this)[0].files;
      console.log("files: " + files);

      var check_file_type = new Array();

      check_file_type = ['jpg', 'gif', 'png', 'jpeg', 'bmp', 'tif'];

      let checker = new Array();
      for (let i = 0; i < files.length; i++) {

        console.log(files[i].val() + "d왜 꼽줘??")
        // let fileType = files[i].value.substring(lastIndexOf('.')+1,files[i].value.length).toLowerCase();
        //
        // if(check_file_type.indexOf(fileType) == -1){
        //ㄴ
        //   Swal.fire({
        //               icon : 'warning', // Alert 타입
        //               title: '입력오류', // Alert 제목
        //               text : '이미지 파일만 첨부 가능합니다.', // Alert 내용
        //             });
        //
        //   files.value = "";
        //   files.select();
        //
        //   return;
        //
        // }

      }

    })
  }

  // 버튼 누르면 ROOM 정보 추가해서 submit
  function goRegister() {

    // 카페 사진 유효 확인
    let files = $('input[name="cafeFile"]')[0].files;

    if (files.length < 3) {

      Swal.fire({
                  icon : 'warning', // Alert 타입
                  title: '입력오류', // Alert 제목
                  text : '카페 사진은 3장 선택해야합니다.', // Alert 내용
                });
      return;
    } // if

    let rooms = [];
    let data = {};

    let inputs = $(`input[class^='room']`);

    // room의 이미지 사진을 배열에 담음
    for (let i = 0; i < inputs.length; i++) {

      const name = inputs[i].name;
      const value = inputs[i].value;

      console.log(name);
      console.log(value);

      // 파일일 경우는 담지 않음
      if (name !== 'roomFile') {
        data[name] = value;
      } // if

      // 마지막 input단위로 잘라 객체로 존재하게끔
      if (name === 'amount_hour') {
        rooms.push(data);
        data = {};
      } // if
    } // for

    console.log(rooms);

    // 위의 객체 배열을 input 태그에 담아
    let $rooms = $('<input>', {
      type: "text",
      name: "rooms",
      // value: formData
      value: JSON.stringify(rooms)
    })

    console.log("$rooms");

    // form에 추가해서 보냄 고고
    $('#formObj').append($rooms);

    $('#formObj').submit();

  } // goRegiset


</script>


</html>