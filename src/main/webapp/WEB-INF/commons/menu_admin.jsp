<%--
 Created by IntelliJ IDEA.
 User: 전민주
 Date: 2021-11-05
 Time: 오후 3:23
 To change this template use File | Settings | File Templates.
 관리자 페이지용 메뉴nav파일
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!------------------메인 메뉴 시작------------------>
<div class="header-menu-wrapper header-menu-wrapper-left" id="kt_header_menu_wrapper">
    <div class="container">
        <!--begin::Header Menu-->
        <div id="kt_header_menu" class="header-menu header-menu-left header-menu-mobile header-menu-layout-default header-menu-root-arrow">
            <!--begin::Header Nav-->
            <ul class="menu-nav">
                <!------------------첫번째 탭 시작------------------>
                <li id="admin_menu_member"
                    class="menu-item menu-item-rel menu-item-open menu-item-here"
                    data-menu-toggle="click" aria-haspopup="true">
                    <a href="/manager/member/list" class="menu-link">
                        <span class="menu-text">회원 관리</span>
                    </a>
                </li>
                <!------------------첫번째 탭 종료------------------>
                <!------------------두번째 탭 시작------------------>
                <li id="admin_menu_study"
                    class="menu-item menu-item-rel"
                    data-menu-toggle="click" aria-haspopup="true">
                    <a href="/manager/study/list" class="menu-link">
                        <span class="menu-text">스터디 관리</span>
                    </a>
                </li>
                <!------------------두번째 탭 종료------------------>
                <!------------------세번째 탭 시작------------------>
                <li id="admin_menu_cafe"
                    class="menu-item  menu-item-rel  menu-item-submenu"
                    data-menu-toggle="click">
                    <a href="javascript:;" class="menu-link menu-toggle">
                        <span class="menu-text">스터디 카페 관리</span>
                        <span class="menu-desc"></span>
                        <i class="menu-arrow"></i>
                    </a>
                    <!--서브 메뉴 시작-->
                    <div class="menu-submenu menu-submenu-classic menu-submenu-left">
                        <!--1차 서브 메뉴 시작-->
                        <ul class="menu-subnav">
                            <li class="menu-item menu-item-submenu"
                                data-menu-toggle="hover" aria-haspopup="true">
                                <a href="/manager/cafe/list" class="menu-link">
                                    <i class="menu-bullet menu-bullet-dot">
                                        <span></span>
                                    </i>
                                    <span class="menu-text">스터디 카페 리스트</span>
                                </a>
                            </li>
                            
                            <li class="menu-item menu-item-submenu"
                                data-menu-toggle="hover" aria-haspopup="true">
                                <a href="/cafe/reservationList" class="menu-link">
                                    <i class="menu-bullet menu-bullet-dot">
                                        <span></span>
                                    </i>
                                    <span class="menu-text">예약 내역 조회</span>
                                </a>
                            </li>
                            <!------------------세번째 탭 종료------------------>
                            <!------------------네번째 탭 시작------------------>
                            <!--<li class="menu-item menu-item-submenu menu-item-rel"
                                data-menu-toggle="click" aria-haspopup="true">
                                <a href="https://trello.com/b/vb3ivabk/3355" class="menu-link">
                                    <span class="menu-text">거래 내역 관리</span>
                                </a>
                            </li>-->
                            <!------------------네번째 탭 종료------------------>
                        
                        </ul>
                    </div>
                </li>
                <!--end::Header Nav-->
        </div>
        <!--end::Header Menu-->
    </div>
</div>
<!------------------메인 메뉴 종료------------------>


