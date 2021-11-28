<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>src/main/webapp/WEB-INF/views/member/myPage.jsp</title>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/commons/footer.jsp"></jsp:include>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/commons/head.jsp"></jsp:include>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/commons/header.jsp"></jsp:include>
    <script src="${pageContext.request.contextPath}/resources/assets/js/member/myPage.js"></script>


    <style>
        .image-input-outline {

            margin-left: 10px;
        }
        .d-flex1 {
            margin-left: 500px;
        }

         ul{
             list-style:none;
         }
        .logo-to-sort li {
            float: left;
            margin: 0.75rem;
            list-style: none;
        }
    </style>

</head>
<body>
<form class="form">

    <div class="card card-custom gutter-b">
        <div class="card-body">
            <!--begin::Details-->
            <div class="d-flex mb-9">
                <!--begin: Pic-->
                <div class="flex-shrink-0 mr-7 mt-lg-0 mt-3">
                    <div class="symbol symbol-50 symbol-lg-120">
                        <div class="image-input image-input-empty image-input-outline" id="kt_image_5"
                             style="background-image: url(${pageContext.request.contextPath}/resources/assets/media/users/blank.png)">
                            <div class="image-input-wrapper"></div>

                            <label class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow"
                                   data-action="change" data-toggle="tooltip" title=""
                                   data-original-title="Change avatar">

                                <i class="fa fa-pen icon-sm text-muted"></i>
                                <input type="file" name="profile_avatar" accept=".png, .jpg, .jpeg"/>
                                <input type="hidden" name="profile_avatar_remove"/>
                            </label>

                            <span class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow"
                                  data-action="cancel" data-toggle="tooltip" title="Cancel avatar">
  <i class="ki ki-bold-close icon-xs text-muted"></i>
 </span>

                            <span class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow"
                                  data-action="remove" data-toggle="tooltip" title="Remove avatar">
  <i class="ki ki-bold-close icon-xs text-muted"></i>
 </span>
                        </div>
                    </div>
                    <div class="symbol symbol-50 symbol-lg-120 symbol-primary d-none">
                        <span class="font-size-h3 symbol-label font-weight-boldest">JM</span>
                    </div>
                </div>
                <!--end::Pic-->
                <!--begin::Info-->
                <div class="flex-grow-1">
                    <!--begin::Title-->
                    <div class="d-flex justify-content-between flex-wrap mt-1">
                        <div class="d-flex mr-3">
                            <a href="#" class="text-dark-75 text-hover-primary font-size-h5 font-weight-bold mr-3">${member.member_name}님</a>
                            <a href="#">
                                <i class="flaticon2-correct text-success font-size-h5"></i>
                            </a>
                        </div>

                    </div>
                    <!--end::Title-->
                    <!--begin::Content-->
                    <div class="d-flex flex-wrap justify-content-between mt-1">
                        <div class="d-flex flex-column flex-grow-1 pr-8">
                            <div class="d-flex flex-wrap mb-4">
                                <a href="#"
                                   class="text-dark-50 text-hover-primary font-weight-bold mr-lg-8 mr-5 mb-lg-0 mb-2">
                                    <i class="flaticon2-new-email mr-2 font-size-lg"></i>${member.member_id}</a>
                                <a href="#"
                                   class="text-dark-50 text-hover-primary font-weight-bold mr-lg-8 mr-5 mb-lg-0 mb-2">
                                    <i class="flaticon2-calendar-3 mr-2 font-size-lg"></i>${member.member_no}</a>

                            </div>
                            <span class="font-weight-bold text-dark-50">여기는 자기소개(introduce)</span>
                        </div>
                        <div class="d-flex1 align-items-center w-70 flex-fill float-right mt-lg-12 mt-8" >
                            <button type="button" id= "modifyMember" onclick="fn_modify();" class="btn btn-primary font-weight-bolder font-size-h5 pl-9 pr-9 py-4 my-5 ">정보수정</button>
                            <button type="button" id="findPJ" onclick="fn_findPJ();" class="btn btn-primary font-weight-bolder font-size-h5 pl-8 pr-7 py-4 my-5 ">프로젝트찾기</button>

                        </div>
                    </div>
                    <!--end::Content-->
                </div>
                <!--end::Info-->
            </div>
            <!--end::Details-->
            <div class="separator separator-solid"></div>
            <!--begin::Items-->

                <!--begin::Item-->

                        <div class="studylist-nav d-inline-block w-100 mt-4 mb-4 pt-4 rounded-xl shadow">
                            <!--스터디리스트 중간 로고 박힌 네비 부분-->
                            <ul class="logo-to-sort d-flex flex-wrap justify-content-center">
                                <li><img src="${pageContext.request.contextPath}/resources/assets/images/logos/language/javascript.png" width="50px" onclick="logoClicked('javascript')" id="logo_javascript"></li>
                                <li><img src="${pageContext.request.contextPath}/resources/assets/images/logos/language/typescript.png" width="50px" onclick="logoClicked('typescript')" id="logo_typescript" class=""></li>
                                <li><img src="${pageContext.request.contextPath}/resources/assets/images/logos/language/react.png" width="50px" onclick="logoClicked('react')" id="logo_react" class=""></li>
                                <li><img src="${pageContext.request.contextPath}/resources/assets/images/logos/language/vue.png" width="50px" onclick="logoClicked('vue')" id="logo_vue" class=""></li>
                                <li><img src="${pageContext.request.contextPath}/resources/assets/images/logos/language/node_js.png" width="50px" onclick="logoClicked('node_js')" id="logo_node_js"></li>
                                <li><img src="${pageContext.request.contextPath}/resources/assets/images/logos/language/java.png" width="50px" onclick="logoClicked('java')" id="logo_java"></li>
                                <li><img src="${pageContext.request.contextPath}/resources/assets/images/logos/language/spring.png" width="50px" onclick="logoClicked('spring')" id="logo_spring"></li>
                                <li><img src="${pageContext.request.contextPath}/resources/assets/images/logos/language/kotlin.png" width="50px" onclick="logoClicked('kotlin')" id="logo_kotlin"></li>
                                <li><img src="${pageContext.request.contextPath}/resources/assets/images/logos/language/c++.png" width="50px" onclick="logoClicked('c++')" id="logo_c++"></li>
                                <li><img src="${pageContext.request.contextPath}/resources/assets/images/logos/language/go.png" width="50px" onclick="logoClicked('go')" id="logo_go"></li>
                                <li><img src="${pageContext.request.contextPath}/resources/assets/images/logos/language/python.png" width="50px" onclick="logoClicked('python')" id="logo_python"></li>
                                <li><img src="${pageContext.request.contextPath}/resources/assets/images/logos/language/django.png" width="50px" onclick="logoClicked('django')" id="logo_django"></li>
                                <li><img src="${pageContext.request.contextPath}/resources/assets/images/logos/language/flutter.png" width="50px" onclick="logoClicked('flutter')" id="logo_flutter"></li>
                                <li><img src="${pageContext.request.contextPath}/resources/assets/images/logos/language/swift.png" width="50px" onclick="logoClicked('swift')" id="logo_swift"></li>
                            </ul>
                        </div>
                    </ul>

                </div>
                <!--end::Item-->

            <!--begin::Items-->
        </div>
    </div>
</form>
</body>
</html>
<script type="text/javascript">
    function fn_modify(){
        $.ajax({
            url : "/member/modify",  // 켈린더로 가는 링크
        })
    }


    function fn_findPJ(){
    $.ajax({
    url : "/member/",  // 켈린더로 가는 링크
    })
    }
</script>