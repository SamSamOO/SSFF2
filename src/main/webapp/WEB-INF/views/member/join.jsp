<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <!--head.html Include-->
    <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>

    <script type="text/javascript">




    </script>
    <style>
        .email_box{
            display: flex;
            flex-direction: row;

        }

        #member_id{
            padding-right: 10px;
            margin-right: 10px;
        }

    </style>

</head>

<body>

<div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
    <!------------------header.html Include------------------>
    <jsp:include page="/WEB-INF/commons/header.jsp"></jsp:include>
</div>
<div class="main d-flex flex-column flex-row-fluid">
    <!--begin::Subheader-->
    <div class="subheader py-2 py-lg-6" id="kt_subheader">
        <div class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
            <!--begin::Info-->
            <div class="d-flex align-items-center flex-wrap mr-1">
                <!--begin::Page Heading-->
                <div class="d-flex align-items-baseline flex-wrap mr-5">
                    <!--begin::Page Title-->
                    <h5 class="text-dark font-weight-bold my-1 mr-5">회원가입</h5>
                    <!--end::Page Title-->
                    <!--begin::Breadcrumb-->
                    <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                        <li class="breadcrumb-item">
                            <a class="text-muted">삼삼오오에 오신걸 환엽합니다.</a>
                        </li>
                    </ul>
                    <!--end::Breadcrumb-->
                </div>
                <!--end::Page Heading-->
            </div>
            <!--end::Info-->
            <!--begin::Toolbar-->
            <div class="d-flex align-items-center">
                <!--begin::Daterange-->
                <a href="#" class="btn btn-light-primary btn-sm font-weight-bold mr-2" id="kt_dashboard_daterangepicker" data-toggle="tooltip" title="" data-placement="left" data-original-title="Select dashboard daterange">
                    <span class="opacity-60 font-weight-bold mr-2" id="kt_dashboard_daterangepicker_title">Today</span>
                    <span class="font-weight-bold" id="kt_dashboard_daterangepicker_date">Aug 16</span>

                    <div class="dropdown-menu dropdown-menu-md dropdown-menu-right p-0 m-0">
                        <!--begin::Navigation-->
                        <ul class="navi navi-hover">
                            <li class="navi-header font-weight-bold py-4">
                                <span class="font-size-lg">Choose Label:</span>
                                <i class="flaticon2-information icon-md text-muted" data-toggle="tooltip" data-placement="right" title="" data-original-title="Click to learn more..."></i>

                            <li class="navi-separator mt-3 opacity-70"></li>
                            <li class="navi-footer py-4">
                                <a class="btn btn-clean font-weight-bold btn-sm" href="#">
                                    <i class="ki ki-plus icon-sm"></i>Add new</a>
                            </li>
                        </ul>
                    </div>
                </a>
                        <!--end::Navigation-->
                    </div>

                </div>
                <!--end::Dropdown-->
            </div>
            <!--end::Toolbar-->
        </div>
    </div>
    <!--end::Subheader-->
    <div class="content flex-column-fluid" id="kt_content">
        <!--begin::Card-->
        <div class="card card-custom">
            <!--begin::Card Body-->
            <div class="card-body p-0">
                <!--begin::Wizard 5-->
                <div class="wizard wizard-5 d-flex flex-column flex-lg-row flex-row-fluid" id="kt_wizard" data-wizard-state="first">
                    <!--begin::Aside-->
                    <div class="wizard-aside bg-white d-flex flex-column flex-row-auto w-100 w-lg-300px w-xl-400px w-xxl-500px">
                        <!--begin::Aside Top-->
                        <div class="d-flex flex-column-fluid flex-column px-xxl-30 px-10">
                            <!--begin: Wizard Nav-->
                            <div class="wizard-nav d-flex d-flex justify-content-center pt-10 pt-lg-20 pb-5">
                                <!--begin::Wizard Steps-->
                                <div class="wizard-steps">
                                    <!--begin::Wizard Step 1 Nav-->
                                    <div class="wizard-step" data-wizard-type="step" data-wizard-state="current">
                                        <div class="wizard-wrapper">
                                            <div class="wizard-icon">
                                                <i class="wizard-check ki ki-check"></i>
                                                <span class="wizard-number">1</span>
                                            </div>
                                            <div class="wizard-label">
                                                <h3 class="wizard-title">Account Settings</h3>
                                                <div class="wizard-desc">Setup Your Account Details</div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <!--end::Wizard Steps-->
                            </div>
                            <!--end: Wizard Nav-->
                        </div>
                        <!--end::Aside Top-->
                        <!--begin::Aside Bottom-->
                        <div class="d-flex flex-row-auto bgi-no-repeat bgi-position-y-bottom bgi-position-x-center bgi-size-contain pt-2 pt-lg-5 h-350px" ></div>
                        <!--end::Aside Bottom-->
                    </div>
                    <!--begin::Aside-->
                    <!--begin::Content-->
                    <div class="wizard-content bg-gray-100 d-flex flex-column flex-row-fluid py-15 px-5 px-lg-10">
                        <!--begin::Title-->
                        <div class="text-right mb-lg-30 mb-15 mr-xxl-10">
                            <span class="font-weight-bold text-muted font-size-h5">문제가 있나요?</span>
                            <a href="#" class="font-weight-bolder text-primary font-size-h4" id="kt_login_signup">처음으로</a>
                        </div>
                        <!--end::Title-->
                        <!--begin::Form-->
                        <div class="d-flex justify-content-center flex-row-fluid">
                            <form method="POST" action="/member/join" class="pb-5 w-100 w-md-450px w-lg-500px fv-plugins-bootstrap fv-plugins-framework" novalidate="novalidate" id="kt_form">
                                <!--begin: Wizard Step 1-->
                                <div class="pb-5" data-wizard-type="step-content" data-wizard-state="current">
                                    <!--begin::Title-->
                                    <div class="pb-10 pb-lg-15">
                                        <h3 class="font-weight-bolder text-dark font-size-h2"></h3>
                                        <div class="text-muted font-weight-bold font-size-h5">이미 계정이 있으신가요 ?
                                            <a href="/member/loginGo" class="text-primary font-weight-bolder">Sign In</a></div>
                                    </div>
                                    <!--begin::Title-->
                                    <!--begin::Form Group-->
                                    <div class="form-group fv-plugins-icon-container">

                                        <label class="font-size-h6 font-weight-bolder text-dark">E-Mail</label>
                                        <div class="email_box">
                                        <input type="text" class="form-control h-auto p-4 border-0 rounded-lg font-size-h6" id="member_id" name="member_id" placeholder="E-Mail" value="">
                                         <input type="button" value="인증" class="btn btn-primary font-weight-bolder font-size-h6 pl-8 pr-7 py-4 my-3 " />
                                        </div>
                                            <div class="fv-plugins-message-container"></div>

                                    </div>

                                    <!--end::Form Group-->
                                    <!--begin::Form Group-->

                                    <div class="form-group fv-plugins-icon-container">
                                        <label class="font-size-h6 font-weight-bolder text-dark" >PassWord</label>
                                        <input type="password" class="form-control h-auto p-6 border-0 rounded-lg font-size-h6" id="member_pwd" name="member_pwd" placeholder="PassWord" value=""/>
                                        <div class="fv-plugins-message-container" ></div>
                                    </div>
                                    <!--end::Form Group-->
                                </div>
                                <!--end: Wizard Step 1-->
                                <!--begin: Wizard Step 2-->

                                    <!--end::Title-->
                                    <!--begin::Form Group-->
                                    <div class="form-group fv-plugins-icon-container">
                                        <label class="font-size-h6 font-weight-bolder text-dark">PassWordCheck</label>
                                        <input type="password" class="form-control h-auto p-5 border-0 rounded-lg font-size-h6" id="member_pwd1" name="member_pwd" placeholder="PassWordCheck" value="">
                                        <div class="fv-plugins-message-container"></div></div>
                                    <!--begin::Form Group-->
                                    <!--end::Row-->

                                            <!--end::Form Group-->
                                            <div class="form-group fv-plugins-icon-container">
                                                <label class="font-size-h6 font-weight-bolder text-dark">NickName</label>
                                                <input type="text" class="form-control h-auto p-5 border-0 rounded-lg font-size-h6" id="member_name" name="member_name" placeholder="NickName" value="">
                                                <div class="fv-plugins-message-container"></div></div>
                                            <!--begin::Form Group-->



                                <!--end: Wizard Step 2-->
                                <!--begin: Wizard Step 3-->
                                <div class="pb-5" data-wizard-type="step-content">
                                    <!--begin::Title-->
                                    <div class="pb-10 pb-lg-15">
                                        <h3 class="font-weight-bolder text-dark font-size-h2">Complete</h3>
                                        <div class="text-muted font-weight-bold font-size-h4">Complete Your Signup And Become A Member!</div>
                                    </div>
                                    <!--end::Title-->

                                </div>

                                <div class="d-flex justify-content-between pt-3">
                                    <div>
                                        <button type="submit" class="btn btn-primary font-weight-bolder font-size-h6 pl-8 pr-7 py-4 my-3 text-align:center" >submit</button>

                                        <button type="button" class="btn btn-primary font-weight-bolder font-size-h6 pl-8 pr-7 py-4 my-3" >돌아가기</button>
                                    </div>
                                </div>
                                <!--end: Wizard Actions-->
                                <div></div><div></div>

                            </form>
                        </div>
                        <!--end::Form-->
                    </div>
                    <!--end::Content-->
                </div>
                <!--end::Wizard 5-->
            </div>
            <!--end::Card Body-->
        </div>
        <!--end::Card-->
    </div>
    <!--end::Content-->
</div>

<jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>

<!--begin::Page Scripts(used by this page)-->
<script src="${pageContext.request.contextPath}/resources/assets/js/member/wizard-5.js"></script>
<!--end::Page Scripts-->

</body>
<style>
    .int_mobile_area{
        position:relative;
    }

</style>
</html>