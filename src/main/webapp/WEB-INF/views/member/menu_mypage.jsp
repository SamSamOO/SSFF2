<%--
  Created by IntelliJ IDEA.
  User: 전민주
  Date: 2021-11-05
  Time: 오후 3:23
  To change this template use File | Settings | File Templates.
  마이페이지용 메뉴nav 파일
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!------------------메인 메뉴 시작------------------>
<div class="header-menu-wrapper header-menu-wrapper-left" id="kt_header_menu_wrapper">
    <div class="container">
        <!--begin::Header Menu-->
        <div id="kt_header_menu" class="header-menu header-menu-left header-menu-mobile header-menu-layout-default header-menu-root-arrow">
            <!--begin::Header Nav-->
            <ul class="menu-nav">
                <!------------------첫번째 탭 시작------------------>
                <li class="menu-item menu-item-submenu menu-item-rel menu-item-open menu-item-here" data-menu-toggle="click" aria-haspopup="true">
                    <a href="javascript:;" class="menu-link menu-toggle">
                        <span class="menu-text">회원 정보</span>
                        <span class="menu-desc"></span>
                        <i class="menu-arrow"></i>
                    </a>
                    <!--서브 메뉴 시작-->
                    <div class="menu-submenu menu-submenu-classic menu-submenu-left">
                        <!--1차 서브 메뉴 시작-->
                        <ul class="menu-subnav">
                            <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                <a href="/member/myPage?memberName=${member.member_name}" class="menu-link">
                                    <i class="menu-bullet menu-bullet-dot">
                                        <span></span>
                                    </i>
                                    <span class="menu-text">내 정보</span>
                                </a>
                            </li>
                            <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                <a href="/member/studyList?memberName=${member.member_name}" class="menu-link">
                                    <i class="menu-bullet menu-bullet-dot">
                                        <span></span>
                                    </i>
                                    <span class="menu-text">내가 가입한 스터디</span>
                                </a>
                            </li>
                            <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                <a href="/applyMember/reservationList?memberName=${member.member_name}" class="menu-link">
                                    <i class="menu-bullet menu-bullet-dot">
                                        <span></span>
                                    </i>
                                    <span class="menu-text">내가 예약한 스터디 카페</span>
                                </a>
                            </li>
                            
                        </ul>
                        <!--1차 서브 메뉴 종료-->
                    </div>
                    <!--서브 메뉴 종료-->
                </li>
                <!------------------첫번째 탭 종료------------------>
                <!------------------두번째 탭 시작------------------>
                <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="click" aria-haspopup="true">
                    <a href="https://trello.com/b/vb3ivabk/3355" class="menu-link">
                        <span class="menu-text">스터디1</span>
                    </a>

                </li>
                <!------------------두번째 탭 종료------------------>
                <!------------------세번째 탭 시작------------------>
                <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="click" aria-haspopup="true">
                    <a href="https://trello.com/b/vb3ivabk/3355" class="menu-link">
                        <span class="menu-text">스터디2</span>
                    </a>
                </li>
                <!------------------세번째 탭 종료------------------>
                <!------------------네번째 탭 시작------------------>
                <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="click" aria-haspopup="true">
                    <a href="https://trello.com/b/vb3ivabk/3355" class="menu-link">
                        <span class="menu-text">스터디3</span>
                    </a>
                </li>
                <!------------------네번째 탭 종료------------------>
                <!------------------다섯번째 탭 시작------------------>
                <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="click" aria-haspopup="true">
                    <a href="https://trello.com/b/vb3ivabk/3355" class="menu-link">
                        <span class="menu-text">스터디4</span>
                    </a>
                </li>
                <!------------------다섯번째 탭 종료------------------>
                <!------------------여섯번째 탭 시작------------------>
                <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="click" aria-haspopup="true">
                    <a href="https://trello.com/b/vb3ivabk/3355" class="menu-link">
                        <span class="menu-text">스터디5</span>
                    </a>
                </li>
                <!------------------여섯번째 탭 종료------------------>

            </ul>
            <!--end::Header Nav-->
        </div>
        <!--end::Header Menu-->
    </div>
</div>
<!------------------메인 메뉴 종료------------------>