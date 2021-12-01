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
        alert("프로젝트")
        location.href = "/study/project/list";
    } else if (menu === "challengelist") {
        alert("챌린지")
        location.href = "/study/challenge/list";
    } else if (menu === "cafelist") {
        alert("스터디카페")
        location.href = "/cafe/list";
    }
}