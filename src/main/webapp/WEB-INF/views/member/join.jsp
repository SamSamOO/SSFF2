<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link href="${pageContext.request.contextPath}/resources/assets/css/pages/wizard/wizard-5.css" rel="stylesheet" type="text/css" />
    <!--head.html Include-->
    <jsp:include page="/WEB-INF/commons/head.jsp"></jsp:include>
</head>

<body id="kt_body" class="header-fixed subheader-enabled page-loading ">
<!----------------메인 시작----------------------->
<div class="d-flex flex-column flex-root">
    <!----------------페이지 시작----------------------->
    <div class="d-flex flex-row flex-column-fluid page">
        <!--begin::Wrapper-->
        <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
            <!--header.html Include-->
            <jsp:include page="/WEB-INF/commons/header.jsp"></jsp:include>

            <!--컨테이너 시작-->
            <div class="d-flex flex-row flex-column-fluid container">
                <!--contents.html Include-->
                <!--begin::Content Wrapper 내용물 시작-->
                <div class="main d-flex flex-column flex-row-fluid">
                    <!--begin::Subheader 페이지 서브 헤더 시작-->
                    <div class="subheader py-2 py-lg-4" id="kt_subheader">
                        <div class="w-100 d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                            <!--begin::Details-->
                            <!--begin::Page Heading-->
                            <div class="d-flex align-items-baseline flex-wrap mr-5">
                                <!--begin::Page Title-->
                                <h5 class="text-dark font-weight-bolder my-1 mr-5">회원가입</h5>
                                <!--end::Page Title-->
                                <!--begin::Breadcrumb-->
                                <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bolder p-0 my-2 font-size-sm">
                                    <li class="breadcrumb-item">
                                        <a class="text-muted">삼삼오오에 오신걸 환영합니다.</a>
                                    </li>
                                </ul>
                                <!--end::Breadcrumb-->
                            </div>
                            <!--end::Page Heading-->
                            <!--end::Details-->
                        </div>
                    </div>
                    <!--end::Subheader  페이지 서브 헤더 종료-->
                    <div class="content flex-column-fluid" id="kt_content">
                        <!--begin::Card-->
                        <div class="card card-custom">
                            <!--begin::Body 북마크-->
                            <div class="card-body">
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
                                                                <h3 class="wizard-title">회원가입</h3>
                                                                <div class="wizard-desc">이메일, 비밀번호,닉네임을 입력합니다.</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end::Wizard Step 1 Nav-->
                                                    <!--begin::Wizard Step 2 Nav-->
                                                    <div class="wizard-step" data-wizard-type="step" data-wizard-state="pending">
                                                        <div class="wizard-wrapper">
                                                            <div class="wizard-icon">
                                                                <i class="wizard-check ki ki-check"></i>
                                                                <span class="wizard-number">2</span>
                                                            </div>
                                                            <div class="wizard-label">
                                                                <h3 class="wizard-title">이메일 인증</h3>
                                                                <div class="wizard-desc">회원가입 버튼을 누르면 인증메일이 발송됩니다!</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end::Wizard Step 2 Nav-->
                                                    <!--begin::Wizard Step 3 Nav-->
                                                    <div class="wizard-step" data-wizard-type="step" data-wizard-state="pending">
                                                        <div class="wizard-wrapper">
                                                            <div class="wizard-icon">
                                                                <i class="wizard-check ki ki-check"></i>
                                                                <span class="wizard-number">3</span>
                                                            </div>
                                                            <div class="wizard-label">
                                                                <span class="font-size-h3 wizard-title">가입 완료!</span>
                                                                <div class="wizard-desc">인증 후 삼삼오오에 로그인해보세요</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end::Wizard Step 3 Nav-->
                                                </div>
                                                <!--end::Wizard Steps-->
                                            </div>
                                            <!--end: Wizard Nav-->
                                        </div>
                                        <!--end::Aside Top-->
                                        <!--begin::Aside Bottom-->
                                        <div class="d-flex flex-row-auto bgi-no-repeat bgi-position-y-bottom bgi-position-x-center bgi-size-contain pt-2 pt-lg-5 h-350px"
                                             style="background-image: url(/resources/assets/images/logos/ssff/logo-c2.png)"></div>
                                        <!--end::Aside Bottom-->
                                    </div>
                                    <!--begin::Aside-->
                                    <!--begin::Content-->
                                    <div class="wizard-content bg-gray-100 d-flex flex-column flex-row-fluid py-15 px-5 px-lg-10">
                                        <!--begin::Title-->
                                        <%--<div class="text-right mb-lg-30 mb-15 mr-xxl-10">
                                            <span class="font-weight-bolder text-muted font-size-h5">문제가 있나요?</span>

                                            <a href="#" class="font-weight-bolder font-size-h4" id="kt_login_signup">처음으로</a>
                                        </div>--%>
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
                                                            <a href="/member/loginGo" class="font-weight-bolder">로그인하기</a></div>
                                                    </div>
                                                    <!--begin::Title-->
                                                    <!--begin::Form Group-->
                                                    <div class="form-group fv-plugins-icon-container mb-n8">

                                                        <label class="font-size-h6 font-weight-bolder text-dark">이메일</label>
                                                        <div class="email_box">
                                                            <input type="email" class="form-control h-auto p-5 border-0 rounded-lg font-size-h6" id="member_id" name="member_id" placeholder="abcdef@email.com" value="">
                                                            <div class="d-flex justify-content-end">
                                                                <span id="idChked"></span>
                                                                <button type="button" class="btn bg-ssff2 text-hover-ssff-green l-sp-015 m-2" id="idChk" onclick="fn_idChk();">이메일 중복 확인</button>
                                                            </div>
                                                        </div>
                                                        <div class="fv-plugins-message-container"></div>

                                                    </div>

                                                    <!--end::Form Group-->
                                                    <!--begin::Form Group-->

                                                    <div class="form-group fv-plugins-icon-container">
                                                        <label class="font-size-h6 font-weight-bolder text-dark" >비밀번호</label>

                                                        <input type="password" class="form-control h-auto p-5 border-0 rounded-lg font-size-h6" id="member_pwd" name="member_pwd" placeholder="비밀번호를 입력해주세요." value=""/>
                                                        <span id="pwChk"></span>
                                                        <div class="fv-plugins-message-container" ></div>
                                                    </div>
                                                    <!--end::Form Group-->
                                                </div>
                                                <!--end: Wizard Step 1-->
                                                <!--begin: Wizard Step 2-->

                                                <!--end::Title-->
                                                <!--begin::Form Group-->
                                                <div class="form-group fv-plugins-icon-container">
                                                    <label class="font-size-h6 font-weight-bolder text-dark">비밀번호 확인</label>
                                                    <input type="password" class="form-control h-auto p-5 border-0 rounded-lg font-size-h6" id="member_pwd1" name="member_pwd1" placeholder="비밀번호를 한 번 더 입력해주세요." value="">
                                                    <span id="pwChk2"></span>
                                                    <div class="fv-plugins-message-container"></div></div>
                                                <!--begin::Form Group-->
                                                <!--end::Row-->

                                                <!--end::Form Group-->
                                                <div class="form-group fv-plugins-icon-container">
                                                    <label class="font-size-h6 font-weight-bolder text-dark">닉네임</label>
                                                    <input type="text" class="form-control h-auto p-5 border-0 rounded-lg font-size-h6" id="member_name" name="member_name" placeholder="사용할 닉네임을 입력해주세요." value="">
                                                    <div class="d-flex justify-content-end">
                                                        <button type="button" class="btn bg-ssff2 text-hover-ssff-green l-sp-015 m-2" id="nameChk" onclick="fn_nameChk();">닉네임 중복 확인</button>
                                                    </div>
                                                    <div class="fv-plugins-message-container">
                                                    </div>
                                                </div>
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

                                                <div class="d-flex justify-content-between">
                                                    <button type="submit" class="btn bg-ssff1 bg-hover-ssff2 l-sp-015 m-2" id="submit" >회원가입</button>
                                                    <button type="button" class="btn bg-danger bg-hover-ssff2 text-white l-sp-015 m-2" >돌아가기</button>
                                                </div>
                                                <!--end: Wizard Actions-->


                                            </form>
                                        </div>
                                        <!--end::Form-->
                                    </div>
                                    <!--end::Content-->
                                </div>
                                <!--end::Wizard 5-->
                                <!--end::Body-->
                            </div>
                            <!--end::Card-->
                        </div>
                        <!--end::Content-->
                    </div>
                    <!--end::Content Wrapper 내용물 종료-->
                </div>
            </div>
            <!--컨테이너 종료-->
            <!--footer.html Include-->
            <jsp:include page="/WEB-INF/commons/footer.jsp"></jsp:include>
            <!--begin::Page Scripts(used by this page)-->
            <script src="${pageContext.request.contextPath}/resources/assets/js/member/wizard-5.js"></script>
            <!--end::Page Scripts-->
</body>
<!----------------Body 종료----------------------->
<script type="text/javascript">
    $(document).ready(function () {

        $("#submit").on("click", function(){
            if($("#member_id").val()==""){
                alert("이메일을 입력해주세요.");
                $("#member_id").focus();
                return false;
            }
            if($("#member_pwd").val()==""){
                alert("비밀번호를 입력해주세요.");
                $("#member_pwd").focus();
                return false;
            }
            if($("#member_pwd1").val()==""){
                alert("비밀번호를 확인해주세요.");
                $("#member_pwd1").focus();
                return false;
            }
            if($("#member_pwd").val() != $("#member_pwd1").val()){
                alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요.");
                $("#member_pwd").focus();
                return false;
            }
            if ($("#member_pwd").val().length < 8) {
                alert("비밀번호는 8자 이상으로 설정해야 합니다.");
                $("#member_pwd").val("").focus();
                return false;
            }
            if($("#member_name").val()==""){
                alert("닉네임을 입력해주세요.");
                $("#member_name").focus();
                return false;
            }

        });

    });
    $(function() {
        //입력값 검증 정규표현식
        const getIdCheck = RegExp(/^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/);

        //패스워드 입력값 검증.
        $('#member_id').on('keyup', function () {
            if (!getIdCheck.test($("#member_id").val())) {
                $('#idChked').html('<b style="font-size:14px;color:red;">이메일 형식에 맞게 입력해주세요.</b>');
            } else {
                $('#idChked').html('');
            }

        });
    });

        $(function () {
            //입력값 검증 정규표현식
            const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);

            //패스워드 입력값 검증.
            $('#member_pwd').on('keyup', function () {
                if (!getPwCheck.test($("#member_pwd").val()) || $("#member_pwd").val().length < 8) {
                    $('#pwChk').html('<b style="font-size:14px;color:red;">특수문자 포함 8자이상 입력해주세요.</b>');
                } else {
                    $('#pwChk').html('');
                }

            });

            //패스워드 확인란 입력값 검증.
            $('#member_pwd1').on('keyup', function () {
                //비밀번호 확인란 공백 확인
                if ($("#member_pwd").val() != $("#member_pwd1").val()) {
                    $('#pwChk2').html('<b style="font-size:14px;color:red;">비밀번호가 일치하지 않습니다.</b>');
                } else {
                    $('#pwChk2').html('');
                }

            });
        });

        function fn_idChk() {
            $.ajax({
                url: "/member/idChk",
                type: "post",
                dataType: "json",
                data: {"member_id": $("#member_id").val()},
                success: function (data) {
                    if (data == 1) {
                        alert("중복된 이메일입니다.");
                    } else if (data == 0) {
                        $("#idChk").attr("value", "Y");
                        alert("사용 가능한 이메일입니다.");
                    } else {
                        alert("이메일을 입력해주세요.");
                    }
                }
            })
        }

        function fn_nameChk() {
            $.ajax({
                url: "/member/nameChk",
                type: "post",
                dataType: "json",
                data: {"member_name": $("#member_name").val()},
                success: function (data) {
                    if (data == 1) {
                        alert("중복된 닉네임입니다.");
                    } else if (data == 0) {
                        $("#idChk").attr("value", "Y");
                        alert("사용 가능한 닉네임입니다.");
                    } else {
                        alert("닉네임을 입력해주세요.");
                    }
                }
            })
        }



</script>
<style>
    .int_mobile_area {
        position: relative;
    }

</style>
</html>