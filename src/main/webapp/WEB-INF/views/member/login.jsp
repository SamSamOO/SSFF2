<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/commons/head.jsp"></jsp:include>

</head>



<body id="kt_body" class="header-fixed subheader-enabled page-loading">
<!--begin::Main-->
<div class="d-flex flex-column flex-root">
    <!--begin::Login-->
    <div class="login login-4 login-signin-on d-flex flex-row-fluid" id="kt_login">
        <div class="d-flex flex-center flex-row-fluid bgi-size-cover bgi-position-top bgi-no-repeat flex-column">
            <div class="login-form text-center p-7 position-relative overflow-hidden">
                <!--begin::Login Header-->
                <div class="d-flex flex-center mb-15">

                    <a href="/">    <!-- 로고누르면 메인으로 가는기능 만들기 까먹지말고 -->

                        <img src="${pageContext.request.contextPath}/resources/assets/images/logos/ssff/logo-c1.png" class="max-h-75px" alt="" />
                    </a>
                </div>
                <!--end::Login Header-->
                <!--begin::Login Sign in form-->
                <div class="login-signin">
                    <div class="mb-20">
                        <span class="font-size-h3 font-weight-bolder">SamSamOO</span>
                        <div class="text-muted">함께할 프로젝트원을 모집해보세요:p</div>
                    </div>
                    <form action="/member/login.do" method="POST" class="form" id="kt_login_signin_form">
                        <input hidden name="referer" value="${referer}"/>
                        <div class="form-group mb-5">
                            <input class="form-control h-auto form-control-solid py-4 px-8" type="text" placeholder="Email" id="member_id" name="member_id" autocomplete="off" />
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
                            <a class="nav-link" href="#" data-toggle="modal" data-target="#find">/비밀번호 찾기</a>
<%--                            <div class="modal" id="find">--%>
<%--                                <div class="modal-dialog">--%>
<%--                                    <div class="modal-content">--%>

<%--                                        <!-- Modal Header -->--%>
<%--                                        <div class="modal-header">--%>
<%--                                            <h4 class="modal-title">비밀번호찾기</h4>--%>
<%--                                            아이디를 입력하세요--%>
<%--                                        </div>--%>

<%--                                        <!-- Modal body -->--%>
<%--                                        <div class="modal-body">--%>
<%--                                            <input class="form-control h-auto form-control-solid py-4 px-8" type="text" placeholder="Email" id="member_id" name="member_id" autocomplete="off" />--%>
<%--                                        </div>--%>

<%--                                        <!-- Modal footer -->--%>
<%--                                        <div class="modal-footer">--%>
<%--                                            <button type="button" class="btn btn-danger" data-dismiss="modal">전송하기</button>--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </div>
                        <button type="submit" id="kt_login_signin_submit" class="btn bg-ssff1 bg-hover-ssff2 font-size-lg font-weight-bolder px-9 py-4 my-3 mx-4">로그인</button>
                    </form>
                    <div class="kakoLogin-btn">
                        <a href="${kakao_url}">
                            <img src="${pageContext.request.contextPath}/resources/assets/images/button/kakao_login_medium_narrow.png">
                        </a>
                    </div>
                    <div class="mt-10">
                        <span class="opacity-70 mr-4">아직 계정이 없으신가요?</span>
                        <a href="/member/joinGo" id="kt_login_signup" class="text-muted text-hover-primary font-weight-bolder">가입하러가기</a>
                    </div>
                </div>

            </div>
            <jsp:include page="${pageContext.request.contextPath}/WEB-INF/commons/footer.jsp"></jsp:include>


            <!--end::Main-->
            <!--begin::Global Theme Bundle(used by all pages)-->
            <script src="${pageContext.request.contextPath}/resources/assets/js/scripts.bundle.js"></script>
            <!--end::Global Theme Bundle-->
            <!--begin::Page Scripts(used by this page)-->
            <%--<script src="${pageContext.request.contextPath}/resources/assets/js/pages/custom/login/login-general.js"></script>--%>
            <!--end::Page Scripts-->
</body>
<!--end::Body-->
</html>