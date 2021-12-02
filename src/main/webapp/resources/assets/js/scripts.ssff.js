/*function cateColorChangeCSS(){
    $(".color-생활습관.스터디").css("backgroundColor", "rgb(255,51,153)");
    $(".color-취업.스터디").css("backgroundColor", "rgb(204,204,0)");
    $(".color-시험준비.스터디").css("backgroundColor", "rgb(24,114,0)");
    $(".color-어학.스터디").css("backgroundColor", "rgb(51,204,204)");
    $(".color-기타").css("backgroundColor", "rgb(153,102,255)");
}//cateColorChangeCSS*/

<!-- 선택 메뉴 하이라이트 -->
<!-- 1. menu_main.jsp -->
/*var pageSubmitFn = function (menu) {
    if (menu === "projectlist") {
        location.href = "/study/project/list";
    } else if (menu === "challengelist") {
        location.href = "/study/challenge/list";
    } else if (menu === "cafelist") {
        location.href = "/cafe/list";
    }
}*/

function menuActive(){
    var GetURI = window.location.href;
    var locat_kt_header_menu = document.getElementById("kt_header_menu");
    var locat_main_menu_project = document.getElementById("main_menu_project");
    var locat_main_menu_challenge = document.getElementById("main_menu_challenge");
    var locat_main_menu_cafe = document.getElementById("main_menu_cafe");

    var locat_admin_menu_member = document.getElementById("admin_menu_member");
    var locat_admin_menu_study = document.getElementById("admin_menu_study");
    var locat_admin_menu_cafe = document.getElementById("admin_menu_cafe");


    // 관리자 메뉴 -------------
    //회원관리
    if(GetURI.includes("/manager/member/list") == true){
        locat_admin_menu_member.classList.add('menu-item-here');
        locat_admin_menu_study.classList.remove('menu-item-here');
        locat_admin_menu_cafe.classList.remove('menu-item-here');


        // 스터디 관리
    } else if(GetURI.includes("/manager/study/list") == true ){
        locat_admin_menu_member.classList.remove('menu-item-here');
        locat_admin_menu_study.classList.add('menu-item-here');
        locat_admin_menu_cafe.classList.remove('menu-item-here');



        //카페 리스트
    } else if(GetURI.includes("/manager/cafe/list") == true ){
        locat_admin_menu_member.classList.remove('menu-item-here');
        locat_admin_menu_study.classList.remove('menu-item-here');
        locat_admin_menu_cafe.classList.add('menu-item-here');


        // 메인 메뉴 -------------
        // 프로젝트
    } else if(GetURI.includes("/study/project/") == true){
        locat_main_menu_challenge.classList.remove('menu-item-here');
        locat_main_menu_cafe.classList.remove('menu-item-here');
        locat_main_menu_project.classList.add('menu-item-here');


        // 챌린지
    } else if(GetURI.includes("/study/challenge/") == true){
        locat_main_menu_project.classList.remove('menu-item-here');
        locat_main_menu_challenge.classList.add('menu-item-here');
        locat_main_menu_cafe.classList.remove('menu-item-here');


        // 카페
    } else if(GetURI.includes("/cafe/list") == true || GetURI.includes("/cafe/detail") == true || GetURI.includes("/cafe/reserve") == true){
        locat_main_menu_project.classList.remove('menu-item-here');
        locat_main_menu_challenge.classList.remove('menu-item-here');
        locat_main_menu_cafe.classList.add('menu-item-here');


        // 마이 페이지--------------------
        //멤버페이지와 결제내역 조회
    } else if(GetURI.includes("/member/") == true || GetURI.includes("/applyMember/reservationList") == true ){

    } else{
        return null;
    }
}