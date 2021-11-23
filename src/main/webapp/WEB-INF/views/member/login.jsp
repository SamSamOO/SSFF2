<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>src/main/webapp/WEB-INF/views/member/myPage.jsp</title>
    <meta name="description" content="Login page example" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="canonical" href="https://keenthemes.com/metronic" />
    <!--begin::Fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
    <!--end::Fonts-->
    <!--begin::Page Custom Styles(used by this page)-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/pages/login/classic/login-4.css" rel="stylesheet" type="text/css" />
    <!--end::Page Custom Styles-->
    <!--begin::Global Theme Styles(used by all pages)-->
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/custom/prismjs/prismjs.bundle.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <style>
        .kakoLogin-btn{
            margin-top: 40px;
        }
        
    </style>
</head>



<body id="kt_body" class="header-fixed subheader-enabled page-loading">
<!--begin::Main-->
<div class="d-flex flex-column flex-root">
    <!--begin::Login-->
    <div class="login login-4 login-signin-on d-flex flex-row-fluid" id="kt_login">
        <div class="d-flex flex-center flex-row-fluid bgi-size-cover bgi-position-top bgi-no-repeat">
            <div class="login-form text-center p-7 position-relative overflow-hidden">
                <!--begin::Login Header-->
                <div class="d-flex flex-center mb-15">

                    <a href="#">    <!-- 로고누르면 메인으로 가는기능 만들기 까먹지말고 -->

                        <img src="${pageContext.request.contextPath}/resources/assets/images/logos/ssff/logo-c2.png" class="max-h-75px" alt="" />
                    </a>
                </div>
                <!--end::Login Header-->
                <!--begin::Login Sign in form-->
                <div class="login-signin">
                    <div class="mb-20">
                        <h3>SamSamOO</h3>
                        <div class="text-muted font-weight-bold">함께할 프로젝트원을 모집해보세요:p</div>
                    </div>
                    <form action="/member/login" method="post" class="form" id="kt_login_signin_form">
                        <div class="form-group mb-5">
                            <input class="form-control h-auto form-control-solid py-4 px-8" type="text" placeholder="Email"  id="member_id" name="member_id" autocomplete="off" />
                        </div>
                        <div class="form-group mb-5">
                            <input class="form-control h-auto form-control-solid py-4 px-8" type="password" placeholder="Password" id="member_pwd" name="member_pwd" />
                        </div>
                        <div class="form-group d-flex flex-wrap justify-content-between align-items-center">
                            <div class="checkbox-inline">
                                <label class="checkbox m-0 text-muted">
                                    <input type="checkbox" name="remember" />
                                    <span></span>Remember me</label>
                            </div>
                            <a href="/member/idPwFindGo" id="kt_login_forgot" class="text-muted text-hover-primary">비밀번호를 잊으셧나요?</a>
                        </div>
                        <button type="submit" id="kt_login_signin_submit" class="btn btn-primary font-weight-bold px-9 py-4 my-3 mx-4">로그인</button>

                    </form>

                    <div class="kakoLogin-btn">
                   <a href="${kakao_url}">
                       <img src="${pageContext.request.contextPath}/resources/assets/images/button/kakao_login_medium_narrow.png">
                    </a>
                    </div>
                    <div class="mt-10">
                        <span class="opacity-70 mr-4">아직 계정이 없으신가요?</span>
                        <a href="/member/joinGo" id="kt_login_signup" class="text-muted text-hover-primary font-weight-bold">가입하러가기</a>
                    </div>
                </div>

</div>
        </div>
    </div>
</div>


<!--end::Main-->
<script>var HOST_URL = "https://preview.keenthemes.com/metronic/theme/html/tools/preview";</script>
<!--begin::Global Config(global config for global JS scripts)-->
<script>var KTAppSettings = { "breakpoints": { "sm": 576, "md": 768, "lg": 992, "xl": 1200, "xxl": 1200 }, "colors": { "theme": { "base": { "white": "#ffffff", "primary": "#8950FC", "secondary": "#E5EAEE", "success": "#1BC5BD", "info": "#6993FF", "warning": "#FFA800", "danger": "#F64E60", "light": "#F3F6F9", "dark": "#212121" }, "light": { "white": "#ffffff", "primary": "#EEE5FF", "secondary": "#ECF0F3", "success": "#C9F7F5", "info": "#E1E9FF", "warning": "#FFF4DE", "danger": "#FFE2E5", "light": "#F3F6F9", "dark": "#D6D6E0" }, "inverse": { "white": "#ffffff", "primary": "#ffffff", "secondary": "#212121", "success": "#ffffff", "info": "#ffffff", "warning": "#ffffff", "danger": "#ffffff", "light": "#464E5F", "dark": "#ffffff" } }, "gray": { "gray-100": "#F3F6F9", "gray-200": "#ECF0F3", "gray-300": "#E5EAEE", "gray-400": "#D6D6E0", "gray-500": "#B5B5C3", "gray-600": "#80808F", "gray-700": "#464E5F", "gray-800": "#1B283F", "gray-900": "#212121" } }, "font-family": "Poppins" };</script>
<!--end::Global Config-->
<!--begin::Global Theme Bundle(used by all pages)-->
<script src="${pageContext.request.contextPath}/resources/assets/plugins/global/plugins.bundle.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/custom/prismjs/prismjs.bundle.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/scripts.bundle.js"></script>
<!--end::Global Theme Bundle-->
<!--begin::Page Scripts(used by this page)-->
<%--<script src="${pageContext.request.contextPath}/resources/assets/js/pages/custom/login/login-general.js"></script>--%>
<!--end::Page Scripts-->
</body>
<!--end::Body-->
</html>