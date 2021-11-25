<%--
  Created by IntelliJ IDEA.
  User: 전민주
  Date: 2021-11-05
  Time: 오후 3:23
  To change this template use File | Settings | File Templates.
  관리자 페이지용 메뉴nav파일
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
                    <a href="/manager/member/list" class="menu-link">
                        <span class="menu-text">회원 관리</span>
                    </a>
                </li>
                <!------------------첫번째 탭 종료------------------>
                <!------------------두번째 탭 시작------------------>
                <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="click" aria-haspopup="true">
                    <a href="/manager/study/list" class="menu-link">
                        <span class="menu-text">스터디 관리</span>
                    </a>
                </li>
                <!------------------두번째 탭 종료------------------>
                <!------------------세번째 탭 시작------------------>
                <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="click" aria-haspopup="true">
                    <a href="https://trello.com/b/vb3ivabk/3355" class="menu-link">
                        <span class="menu-text">스터디 카페 관리</span>
                    </a>
                </li>
                <!------------------세번째 탭 종료------------------>
                <!------------------네번째 탭 시작------------------>
                <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="click" aria-haspopup="true">
                    <a href="https://trello.com/b/vb3ivabk/3355" class="menu-link">
                        <span class="menu-text">거래 내역 관리</span>
                    </a>
                </li>
                <!------------------네번째 탭 종료------------------>

            </ul>
            <!--end::Header Nav-->
        </div>
        <!--end::Header Menu-->
    </div>
</div>
<!------------------메인 메뉴 종료------------------>