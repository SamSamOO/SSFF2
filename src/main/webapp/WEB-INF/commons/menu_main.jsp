<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2021-11-05
  Time: 오후 3:22
  To change this template use File | Settings | File Templates.
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
        <li id="main_menu_project"
            class="menu-item menu-item-rel menu-item-open menu-item-here">
          <a href="/study/project/list" class="menu-link">
            <span class="menu-text">프로젝트</span>
          </a>
        </li>
        <!------------------첫번째 탭 종료------------------>
        <!------------------두번째 탭 시작------------------>
        <li id="main_menu_challenge"
            class="menu-item  menu-item-rel ">
          <a href="/study/challenge/list" class="menu-link">
            
            <span class="menu-text">챌린지</span>
          </a>
        </li>
        <!------------------두번째 탭 종료------------------>
        <!------------------세번째 탭 시작------------------>
        <c:choose>
          <c:when test="${member != null || kmember != null}">
            <li id="main_menu_cafe"
                class="menu-item menu-item-rel menu-item-submenu "
                data-menu-toggle="click">
              <a href="javascript:;" class="menu-link menu-toggle">
                <span class="menu-text">스터디 카페</span>
                <span class="menu-desc"></span>
                <i class="menu-arrow"></i>
              </a>
              <!--서브 메뉴 시작-->
              <div class="menu-submenu menu-submenu-classic menu-submenu-left">
                <!--1차 서브 메뉴 시작-->
                <ul class="menu-subnav">
                  <li class="menu-item menu-item-submenu">
                    <a href="/cafe/list" class="menu-link">
                      <i class="menu-bullet menu-bullet-dot">
                        <span></span>
                      </i>
                      <span class="menu-text">스터디 카페 리스트</span>
                    </a>
                  </li>
                  
                  <li class="menu-item menu-item-submenu">
                    <a href="/cafe/reservationList?member=${member.member_name}" class="menu-link">
                      <i class="menu-bullet menu-bullet-dot">
                        <span></span>
                      </i>
                      <span class="menu-text">예약 내역 조회</span>
                    </a>
                  </li>
                </ul>
                <!--1차 서브 메뉴 종료-->
              </div>
              <!--서브 메뉴 종료-->
            </li>
          </c:when>
          <c:otherwise>
            <li id="main_menu_cafe"
                class="menu-item menu-item-sub menu-item-rel">
              <a href="/cafe/list" class="menu-link">
                <span class="menu-text">스터디 카페</span>
              </a>
            </li>
          </c:otherwise>
        </c:choose>
        <!------------------세번째 탭 종료------------------>
      </ul>
      <!--end::Header Nav-->
    </div>
    <!--end::Header Menu-->
  </div>
</div>
<!------------------메인 메뉴 종료------------------>