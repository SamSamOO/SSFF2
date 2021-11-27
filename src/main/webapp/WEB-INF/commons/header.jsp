<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2021-11-05
  Time: 오후 3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!------------------모바일 헤더 시작------------------>
<div id="kt_header_mobile" class="header-mobile">
    <!--로고 시작-->
    <a href="/">
        <img alt="Logo" src="${pageContext.request.contextPath}/resources/assets/images/logos/ssff/SamSamOOLOGO.png" class="max-h-30px" />
    </a>
    <!--로고 종료-->
    <!--툴바 시작-->
    <div class="d-flex align-items-center">
        <button class="btn p-0 burger-icon burger-icon-left ml-4 mr-4" id="kt_header_mobile_toggle">
            <span></span>
        </button>

        <!--begin::User 헤더 메뉴 시작-->
        <div class="dropdown dropdown-inline">
            <!--begin::Toggle-->
            <div class="topbar-item" data-toggle="dropdown" data-offset="0px,0px">
                <div class="btn btn-dropdown top-memu">
                    <!--유저 프로필 사진-->
                    <div class="symbol symbol-30 symbol-lg-40 symbol-circle mr-3">
                        <img alt="Profile Pic" src="/resources/assets/media/users/300_21.jpg"/>
                    </div>
                    <i class="text-dark fas fa-angle-down"></i>
                </div>

            </div>
            <!--end::Toggle-->
            <!--begin::Dropdown 헤더 메뉴 드롭다운 시작-->
            <div class="dropdown-menu p-0 m-0 dropdown-menu-right dropdown-menu-anim-up p-0">
                <!--begin::Nav 헤더 메뉴 네비 시작-->
                <div class="navi align-items-center p-3 rounded-top">
                    <!--begin::Item-->
                    <a href="/member/loginGo" class="navi-item">
                        <div class="navi-link">

                            <div class="navi-text login">
                                <div class="font-weight-bold">로그인 </div>
                            </div>
                        </div>
                    </a>
                    <!--end::Item-->
                    <!--begin::Item-->
                    <a href="/custom/apps/user/profile-1/personal-information.html" class="navi-item">
                        <div class="navi-link">

                            <div class="navi-text">
                                <div class="font-weight-bold">프로젝트</div>
                            </div>
                        </div>
                    </a>
                    <!--end::Item-->
                    <!--begin::Item-->
                    <a href="/custom/apps/user/profile-3.html" class="navi-item">
                        <div class="navi-link">
                            <div class="navi-text">
                                <div class="font-weight-bold">챌린지</div>
                            </div>
                        </div>
                    </a>
                    <!--end::Item-->
                    <!--begin::Item-->
                    <a href="/cafe/list" class="navi-item">
                        <div class="navi-link">

                            <div class="navi-text">
                                <div class="font-weight-bold">스터디 카페</div>
                            </div>
                        </div>
                    </a>
                    <!--end::Item-->
                    <!--begin::Item-->
                    <a href="/member/myPage" class="navi-item">
                        <div class="navi-link">
                            <div class="navi-text">
                                <div class="font-weight-bold">마이 페이지</div>
                            </div>
                        </div>
                    </a>
                    <!--end::Item-->
                    <!--begin::Item-->
                    <a href="/custom/apps/user/profile-1/personal-information.html" class="navi-item">
                        <div class="navi-link">

                            <div class="navi-text logout">
                                <div class="font-weight-bold">로그아웃</div>
                            </div>
                        </div>
                    </a>
                    <!--end::Item-->
                </div>
                <!--end::Nav 헤더 메뉴 네비 종료-->
            </div>
            <!--end::Dropdown 헤더 메뉴 드롭다운 종료-->
        </div>
        <!--end::User 헤더 메뉴 종료-->

    </div>
    <!--툴바 종료-->
</div>
<!------------------모바일 헤더 종료------------------>
<!------------------헤더 시작------------------>
<div id="kt_header" class="header header-fixed">
    <!--컨테이너 시작-->
    <div class="container">
        <!--왼쪽 로고 파트 시작-->
        <div class="d-none d-lg-flex align-items-center mr-3">
            <!--begin::Logo-->
            <a href="#" class="mr-20">
                <img alt="Logo" src="${pageContext.request.contextPath}/resources/assets/images/logos/ssff/SamSamOOLOGO.png" class="logo-default max-h-35px" />
            </a>
            <!--end::Logo-->
        </div>
        <!--왼쪽 로고 파트 종료-->
        <!--begin::Topbar 우측 메뉴 파트 시작-->
        <div class="topbar topbar-minimize">
            <!--begin::User 헤더 메뉴 시작-->
            <div class="dropdown">
                <!--begin::Toggle-->
                <div class="topbar-item" data-toggle="dropdown" data-offset="0px,0px">
                    <div class="btn btn-dropdown top-memu">
                        <!--유저 프로필 사진-->
                        <div class="symbol symbol-30 symbol-lg-40 symbol-circle mr-3">
                            <img alt="Profile Pic" src="/resources/assets/media/users/300_21.jpg"/>
                        </div>
                        <!--유저 닉네임(비로그인시 숨김)-->

                        <c:if test = "${member == null }">
                            <div class="text-dark m-0 flex-grow-1 mr-3 font-size-h5"></div>
                            <i class="text-dark fas fa-angle-down"></i>
                        </c:if>

                        <c:if test="${ member != null }">
                            <div class="text-dark m-0 flex-grow-1 mr-3 font-size-h5"> ${member.member_name}</div>
                            <i class="text-dark fas fa-angle-down"></i>
                        </c:if>
                    </div>

                </div>
                <!--end::Toggle-->
                <!--begin::Dropdown 헤더 메뉴 드롭다운 시작-->
                <div class="dropdown-menu p-0 m-0 dropdown-menu-right dropdown-menu-anim-up p-0">
                    <!--begin::Nav 헤더 메뉴 네비 시작-->
                    <div class="navi align-items-center p-3 rounded-top">
                        <!--begin::Item-->
                        <a href="/member/loginGo" class="navi-item">
                            <div class="navi-link">

                                <div class="navi-text login">
                                    <c:if test = "${member == null }">
                                        <div class="font-weight-bold">로그인</div>
                                    </c:if>

                                    <c:if test="${ member != null }">
                                        <div class="font-weight-bold"></div>
                                    </c:if>
                                </div>
                            </div>
                        </a>
                        <!--end::Item-->
                        <!--begin::Item-->
                        <a href="custom/apps/user/profile-1/personal-information.html" class="navi-item">
                            <div class="navi-link">

                                <div class="navi-text">
                                    <div class="font-weight-bold">프로젝트 리스트</div>
                                </div>
                            </div>
                        </a>
                        <!--end::Item-->
                        <!--begin::Item-->
                        <a href="custom/apps/user/profile-3.html" class="navi-item">
                            <div class="navi-link">
                                <div class="navi-text">
                                    <div class="font-weight-bold">챌린지 리스트</div>
                                </div>
                            </div>
                        </a>
                        <!--end::Item-->
                        <!--begin::Item-->
                        <a href="/cafe/list" class="navi-item">
                            <div class="navi-link">

                                <div class="navi-text">
                                    <div class="font-weight-bold">스터디 카페 예약</div>
                                </div>
                            </div>
                        </a>
                        <!--end::Item-->
                        <!--begin::Item-->
                        <a href="/member/myPage" class="navi-item">
                            <div class="navi-link">

                                <div class="navi-text">
                                    <div class="font-weight-bold">마이 페이지</div>
                                </div>
                            </div>
                        </a>
                        <!--end::Item-->
                        <!--begin::Item-->
                        <a href="/member/logout" class="navi-item">
                            <div class="navi-link">

                                <div class="navi-text logout">
                                    <div class="font-weight-bold">로그아웃</div>
                                </div>
                            </div>
                        </a>
                        <!--end::Item-->
                    </div>
                    <!--end::Nav 헤더 메뉴 네비 종료-->
                </div>
                <!--end::Dropdown 헤더 메뉴 드롭다운 종료-->
            </div>
            <!--end::User 헤더 메뉴 종료-->
        </div>
        <!--end::Topbar 우측 메뉴 파트 종료-->
    </div>
    <!--컨테이너 종료-->
</div>
<!------------------헤더 종료------------------>