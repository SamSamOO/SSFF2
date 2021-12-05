<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
<!----------------Head 시작----------------------->

<head>
    <title>게시물 상세 페이지입니다</title>
      
      
      <!--head.html Include-->
    <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>
    <script>
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
    </script>
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
            <jsp:include page="/WEB-INF/commons/header.jsp"></jsp:include>
            <!------------------Header Wrapper : 메뉴 탭 시작------------------>
            <!--menu.html Include-->
            <jsp:include page="/WEB-INF/commons/menu_main.jsp"></jsp:include>
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
                            <!--카드 바디 시작-->
                            <div class="card-header border-0 pt-5 card-body mt-5">
                                <div class="d-flex flex-row flex-column-fluid container">
                                    <form action="/studyIns/board/detail/modify" method="post" id="formObj" style="width: 100%" enctype="multipart/form-data">
                                        <input type="hidden" name="cont_No" value="${detail.cont_No}">
                                        <input type="hidden" name="r_Idx" value="${detail.r_Idx}"/>

                                        <table style="width: 100%">

                                            <tr>
                                                <td colspan="3">
                                                    <input id="title" required placeholder="제목을 입력해 주세요" maxlength="50" value="${detail.title}" name="title"
                                                           style="height: 40px; width: 100%; border:none; border-bottom: 1px solid #ced4da; border-radius: 4px; font-size: 30px; font-weight: bold; text-align: center; margin: 20px ">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="1">
                                                    <c:set var="category" value="${detail.category}"/>
                                                    <select name="category" class="selectpicker" required>
                                                        <c:choose>
                                                            <c:when test="${category eq '인증'}">
                                                                <option value="인증" selected>인증</option>
                                                                <option value="잡담">잡담</option>
                                                                <option value="QnA">QnA</option>
                                                                <option value="기타">기타</option>
                                                            </c:when>
                                                            <c:when test="${category eq '잡담'}">
                                                                <option value="인증">인증</option>
                                                                <option value="잡담" selected>잡담</option>
                                                                <option value="QnA">QnA</option>
                                                                <option value="기타">기타</option>
                                                            </c:when>
                                                            <c:when test="${category eq 'QnA'}">
                                                                <option value="인증">인증</option>
                                                                <option value="잡담">잡담</option>
                                                                <option value="QnA" selected>QnA</option>
                                                                <option value="기타">기타</option>
                                                            </c:when>
                                                            <c:when test="${category eq '기타'}">
                                                                <option value="인증">인증</option>
                                                                <option value="잡담">잡담</option>
                                                                <option value="QnA">QnA</option>
                                                                <option value="기타" selected>기타</option>
                                                            </c:when>
                                                        </c:choose>
                                                    </select>


                                                </td>
                                                <td align="right" colspan="2">

                                                    <input id="member_Name" maxlength="20" value="${detail.member_Name}"
                                                           name="member_Name">
                                                </td>
                                            </tr>


                                            <tr>
                                                <td colspan="3" style="width: 100%;">
                                                    <div class="card card-custom">

                                                        <div class="card-body">
                                                            <div id="kt_quil_2" style="height: 325px">
                                                                  ${detail.cont}
                                                            </div>
                                                            <textarea required name="cont" style="display:none" id="cont"></textarea>
                                                        </div>
                                                    </div>
                                                </td>

                                            </tr>

                                            <tr>
                                                <td>&nbsp;</td>
                                            </tr>

                                            <tr>
                                                <td colspan="4" align="right">
                                                    <button type="submit" id="submitBtn" class="btn btn-light-primary font-weight-bold mr-2" style="color:#8950FC ">수정하기</button>
                                                    <button type="button" id="listBtn" class="btn btn-light-primary font-weight-bold mr-2" style="color:#8950FC ">목록으로</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="uploadDiv">

                                                        <input type="file" name="uploadFile" id="uploadFile" multiple class="btn btn-secondary"/>
<%--                                                        <label for="uploadFile" class="btn btn-secondary" >업로드 -- 이미지만 업로드할 수 있습니다.</label>--%>
                                                        <div id="fileList">
                                                            <c:forEach items="${listOfFiles}" var="file">
                                                                <p>${file.file_Name}</p>
                                                            </c:forEach>
                                                        </div>

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
                </div>
            </div>
            <%--컨테이너 종료--%>

            <!--footer.html Include-->
            <jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
</body>
<!----------------Body 종료----------------------->
<script>
    let regex = new RegExp(`(.*?).(jpg|jpeg|png|gif|bmp)$`, `i`);
    let maxSize = 5242880; //5MB

    $(function() {
         console.clear();
         console.debug("제이쿼리 시작");
         <%--for (let i = 0; i <${listOfFiles.length}; i++) {--%>
         <%--    $(`#uploadFile`).val()--%>
     
         $(`#listBtn`).on(`click`, function(e) {
          
              console.log('목록버튼이 클릭됨!');
          
              const formElement = $("#formObj");
          
              formElement.attr("action", "/studyIns/board/list");
              formElement.attr("method", "get");
          
              formElement.submit();
          
         });
         //TODO 파일이 없는 경우 파일업로드를 안하게 해줘야합니다.
         $(`#cont`).val($(`.ql-editor`).html());
     
         $(`#uploadFile`).val()
         $(`#uploadFile`).on('click', function() {
              $(`#fileList`).children("p").remove();
         });
         $(`#uploadFile`).on('change', function(e) {
          
              let formData = new FormData();
              let inputFile = $("input[name='uploadFile']");
              let files = inputFile[0].files;
              let str = '';
          
              console.log(files);
              for (let i = 0; i < files.length; i++) {
                   console.log(files.length);
                   str = `<p>` + files[i].name + `</p>`;
                   if (!checkExtensionName((files[i].name))) {
                        console.log((files[i].name).toLowerCase());
                    
                        //파일 업로드 부분 초기화
                        console.log('확장자 에러입니다.');
                    
                        $(`#uploadFile`).val('');
                        str = '';
                    
                   } else if (!checkExtensionSize(files[i].size)) {
                    
                        console.log(files[i].size);
                    
                        $(`#uploadFile`).val(``);
                        str = '';
                    
                   } else {
                        console.log(`append 완료`);
                        $(`#fileList`).append(str);
                   }
               
                   formData.append("uploadFile", files[i]);
               
                   console.log(formData);
              }
              // $.ajax({
              //      url: '/studyIns/board/detail/modifyGo',
              //      processData: false,
              //      contentType: false,
              //      data: formData,
              //      type: 'POST',
              //      dataType: 'json'
              // });
          
         });
     
    });

    // Class definition
    var KTQuilDemos = function() {
         // Private functions
         var demo2 = function() {
              var Delta = Quill.import('delta');
              var quill = new Quill('#kt_quil_2', {
                   modules: {
                        toolbar: true
                   },
                   placeholder: 'Type your text here...',
                   theme: 'snow'
              });
              // Store accumulated changes
              var change = new Delta();
              let content = quill.getContents();
              console.log("content : " + content);
              $(`#cont`).val($(`#kt_quil_2`).children('div').html())
              quill.on('text-change', function(delta) {
                   change = change.compose(delta);
                   console.log($(`#cont`).val($(`#kt_quil_2`).children('div').html()));
               
              });
          
              // Save periodically
              setInterval(function() {
                   if (change.length() > 0) {
                        console.log('Saving changes', change);
                         /*
                          Send partial changes
                          $.post('/your-endpoint', {
                          partial: JSON.stringify(change)
                          });
                          Send entire document
                          $.post('/your-endpoint', {
                          doc: JSON.stringify(quill.getContents())
                          });
                          */
                        change = new Delta();
                   }
              }, 5 * 1000);
              // Check for unsaved data
              window.onbeforeunload = function() {
                   if (change.length() > 0) {
                        return 'There are unsaved changes. Are you sure you want to leave?';
                   }
              }
         };
         return {
              // public functions
              init: function() {
                   demo2();
              }
         };
    }();

    jQuery(document).ready(function() {
         KTQuilDemos.init();
    });

    function checkExtensionName(fileName) {
     
         if (!regex.test(fileName)) { //이미지 확장자가 아닌경우
              alert('이미지만 가능합니다.');
              console.log(fileName);
          
              return false; //이미지 확장자가 아니라면 .. false 리턴합니다.
         }
         return true;
    }

    function checkExtensionSize(fileSize) {
     
         if (fileSize >= maxSize) {
              alert('파일 사이즈 초과');
              console.log('......파일 사이즈')
              return false; //사이즈 초과시 false 리턴합니다.
         }
         return true;
     
    }

    function showUploadImage(uploadResultArr) {
          /*전달 받은 데이터 검증*/
         if (!uploadResultArr || uploadResultArr.length == 0) {
              return
         }
     
         let uploadResut = $('')
    }

    // $(document).ready(function () {
    //     $("#uploadBtn").on("click", function (e) {
    //         e.preventDefault();
    //         $(`#formObj`).attr('onsubmit','return false');
    //
    //         let formData = new FormData();
    //
    //         console.log(formData);
    //         let inputFile = $("input[name='uploadFile']");
    //         let files = inputFile[0].files;
    //         console.log(files);
    //
    //         //add File Data to formData
    //         for (let i = 0; i < files.length; i++) {
    //             formData.append("uploadFile", files[i]);
    //         }
    //
    //         $.ajax({
    //             url: '/board/post',
    //             processData: false,
    //             contentType: false,
    //             data: formData,
    //             type: 'POST',
    //             success: function (result) {
    //                 alert("Uploaded");
    //             },
    //             error: function (result) {
    //                 console.log(result);
    //             }
    //         }); // $ajax
    //
    //     });
    // });
</script>

</html>