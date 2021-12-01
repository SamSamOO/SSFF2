/*function cateColorChangeCSS(){
    $(".color-생활습관.스터디").css("backgroundColor", "rgb(255,51,153)");
    $(".color-취업.스터디").css("backgroundColor", "rgb(204,204,0)");
    $(".color-시험준비.스터디").css("backgroundColor", "rgb(24,114,0)");
    $(".color-어학.스터디").css("backgroundColor", "rgb(51,204,204)");
    $(".color-기타").css("backgroundColor", "rgb(153,102,255)");
}//cateColorChangeCSS*/

<!-- 선택 메뉴 하이라이트 -->
<!-- 1. menu_main.jsp -->
var pageSubmitFn = function (menu) {
    if (menu === "projectlist") {
        location.href = "/study/project/list";
    } else if (menu === "challengelist") {
        location.href = "/study/challenge/list";
    } else if (menu === "cafelist") {
        location.href = "/cafe/list";
    }
}

var menuActive  = function (){
    var GetURI = window.location.href;
    var locat_main_menu_projct =
    var locat_main_menu_challenge =
    var locat_main_menu_cafe =

    // 마이 페이지--------------------
    //멤버페이지와 결제내역 조회
    if(GetURI.includes("/member/") == true || GetURI.includes("/applyMember/reservationList") == true){



        // 메인 메뉴 -------------
        // 프로젝트
    } else if(GetURI.includes("/study/project/list") == true || GetURI.includes("/study/project/detail") == true){


        // 챌린지
    } else if(GetURI.includes("/study/challenge/list") == true || GetURI.includes("/study/challenge/detail") == true){


        // 카페
    } else if(GetURI.includes("/cafe/list") == true || GetURI.includes("/cafe/detail") == true || GetURI.includes("/cafe/reserve") == true){


        // 관리자 메뉴 -------------
        // 프로젝트
    } else if(GetURI.includes("/study/cafe/list") == true || GetURI.includes("/study/cafe/list") == true ){

    } else if(GetURI.includes("/study/cafe/list") == true){

    }
}