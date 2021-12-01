/*function cateColorChangeCSS(){
    $(".color-생활습관.스터디").css("backgroundColor", "rgb(255,51,153)");
    $(".color-취업.스터디").css("backgroundColor", "rgb(204,204,0)");
    $(".color-시험준비.스터디").css("backgroundColor", "rgb(24,114,0)");
    $(".color-어학.스터디").css("backgroundColor", "rgb(51,204,204)");
    $(".color-기타").css("backgroundColor", "rgb(153,102,255)");
}//cateColorChangeCSS*/

<!-- 헤더 요소 추가 -->
$(window).ready(function () {
    var getclass = document.getElementById('kt_header');
    var getprogressbar = $('.progress-bar-horizonal');

    if (body.hasAttribute('data-scrolltop') === true) {
        getclass.classList.add('header_bg_white');
        getprogressbar.classList.add('d-none');
        alert('추가 반영');

    } else {
        if (body.hasAttribute('data-scrolltop') === false) {
            getclass.classList.remove('header_bg_white');
            getprogressbar.classList.remove('d-none');
            alert('제거 반영');
        }
    }
})();