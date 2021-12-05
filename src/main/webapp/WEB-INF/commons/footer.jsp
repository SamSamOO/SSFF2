<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2021-11-05
  Time: 오후 3:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!------------------푸터 시작------------------>
<div class="footer py-4 d-flex flex-lg-column" id="kt_footer">
    
    
    <!--begin::Container-->
    <div class="container d-flex flex-column flex-md-row align-items-center justify-content-between">
        <!--begin::Copyright-->
        <div class="text-dark order-2 order-md-1">
            <span class="text-muted font-weight-bold mr-2">2020©</span>
            <a href="http://keenthemes.com/metronic" target="_blank" class="text-light-warning text-hover-ssff-orange">Keenthemes</a>
        </div>
        <!--end::Copyright-->
        <!--begin::Nav-->
        <div class="nav nav-dark order-1 order-md-2">
            <a href="http://keenthemes.com/metronic" target="_blank" class="nav-link pr-3 pl-0 text-muted text-hover-primary">About</a>
            <a href="http://keenthemes.com/metronic" target="_blank" class="nav-link px-3 text-muted text-hover-primary">Team</a>
            <a href="http://keenthemes.com/metronic" target="_blank" class="nav-link pl-3 pr-0 text-muted text-hover-primary">Contact</a>
        </div>
        <!--end::Nav-->
    </div>
    <!--end::Container-->
</div>
<!------------------푸터 종료------------------>
</div>
<!--end::Wrapper-->
</div>
<!----------------페이지 종료----------------------->
</div>
<!----------------메인 종료----------------------->

<!--begin::Scrolltop-->
<div id="kt_scrolltop" class="scrolltop">
    <span class="svg-icon">
<!--begin::Svg Icon | path:/resources/assets/media/svg/icons/Navigation/Up-2.svg-->
<svg xmlns="http://www.w3.org/2000/svg" width="24px"
     height="24px" viewBox="0 0 24 24" version="1.1">
<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
    <polygon points="0 0 24 0 24 24 0 24"/>
    <rect fill="#000000" opacity="0.3" x="11" y="10" width="2" height="10" rx="1"/>
    <path
      d="M6.70710678,12.7071068 C6.31658249,13.0976311 5.68341751,13.0976311 5.29289322,12.7071068 C4.90236893,12.3165825 4.90236893,11.6834175 5.29289322,11.2928932 L11.2928932,5.29289322 C11.6714722,4.91431428 12.2810586,4.90106866 12.6757246,5.26284586 L18.6757246,10.7628459 C19.0828436,11.1360383 19.1103465,11.7686056 18.7371541,12.1757246 C18.3639617,12.5828436 17.7313944,12.6103465 17.3242754,12.2371541 L12.0300757,7.38413782 L6.70710678,12.7071068 Z"
      fill="#000000" fill-rule="nonzero"/>
</g>
</svg>
        <!--end::Svg Icon-->
</span>
</div>
<!--end::Scrolltop-->


<script>
    var HOST_URL = "https://preview.keenthemes.com/metronic/theme/html/tools/preview";
</script>
<!--begin::Global Config(global config for global JS scripts)-->

<%--<!-- 헤더부분 스크롤 -->--%>
<%--<script>--%>
<%--    function progressBarHorizonal() {--%>
<%--        var scrollTop = $(window).scrollTop();--%>
<%--        var footer = $('.footer');--%>
<%--        var footerPosition = footer.length > 0 ? footer.offset().top : 0;--%>
<%--        var currentPosition = scrollTop / (footerPosition - $(window).innerHeight());--%>
<%--        var $pbv = $('.progress-bar-horizonal');--%>
<%--        --%>
<%--        $pbv.css('width', (currentPosition * 100) + '%');--%>
<%--        $pbv.css('left', $('.content-wrap').offset().left + 'px');--%>
<%--        $pbv.css('opacity', 0.7 - (0.5 * currentPosition));--%>
<%--    }--%>
<%--    $(window).on('scroll', function () {--%>
<%--        progressBarHorizonal();--%>
<%--    })--%>
<%--</script>--%>

<%--메뉴 바꾸기--%>
<script>
    $(document).ready(function(){
        menuActive();
    });
</script>

<script>
    <!-- Channel Plugin Scripts -->
    (function() {
        var w = window;
        if (w.ChannelIO) {
            return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
        }
        var ch = function() {
            ch.c(arguments);
        };
        ch.q = [];
        ch.c = function(args) {
            ch.q.push(args);
        };
        w.ChannelIO = ch;
        function l() {
            if (w.ChannelIOInitialized) {
                return;
            }
            w.ChannelIOInitialized = true;
            var s = document.createElement('script');
            s.type = 'text/javascript';
            s.async = true;
            s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
            s.charset = 'UTF-8';
            var x = document.getElementsByTagName('script')[0];
            x.parentNode.insertBefore(s, x);
        }
        if (document.readyState === 'complete') {
            l();
        } else if (window.attachEvent) {
            window.attachEvent('onload', l);
        } else {
            window.addEventListener('DOMContentLoaded', l, false);
            window.addEventListener('load', l, false);
        }
    })();
    ChannelIO('boot', {
        "pluginKey": "c6ed140b-1c53-4f0b-953f-271a53cee6ed"
    });
    
    var KTAppSettings = {
        "breakpoints": {
            "sm": 576,
            "md": 768,
            "lg": 992,
            "xl": 1200,
            "xxl": 1200
        },
        "colors": {
            "theme": {
                "base": {
                    "white": "#ffffff",
                    "primary": "#6b984f",
                    "secondary": "#E5EAEE",
                    "success": "#1BC5BD",
                    "info": "#6993FF",
                    "warning": "#FFA800",
                    "danger": "#F64E60",
                    "light": "#F3F6F9",
                    "dark": "#212121"
                },
                "light": {
                    "white": "#ffffff",
                    "primary": "#EEE5FF",
                    "secondary": "#ECF0F3",
                    "success": "#C9F7F5",
                    "info": "#E1E9FF",
                    "warning": "#FFF4DE",
                    "danger": "#FFE2E5",
                    "light": "#F3F6F9",
                    "dark": "#D6D6E0"
                },
                "inverse": {
                    "white": "#ffffff",
                    "primary": "#ffffff",
                    "secondary": "#212121",
                    "success": "#ffffff",
                    "info": "#ffffff",
                    "warning": "#ffffff",
                    "danger": "#ffffff",
                    "light": "#464E5F",
                    "dark": "#ffffff"
                }
            },
            "gray": {
                "gray-100": "#F3F6F9",
                "gray-200": "#ECF0F3",
                "gray-300": "#E5EAEE",
                "gray-400": "#D6D6E0",
                "gray-500": "#B5B5C3",
                "gray-600": "#80808F",
                "gray-700": "#464E5F",
                "gray-800": "#1B283F",
                "gray-900": "#212121"
            }
        },
        "font-family": "Poppins"
    };
</script>
<!--end::Global Config-->

<!--begin::Global Theme Bundle(used by all pages)-->
<script src="/resources/assets/plugins/global/plugins.bundle.js"></script>
<script src="/resources/assets/plugins/custom/prismjs/prismjs.bundle.js"></script>
<script src="/resources/assets/js/scripts.bundle.js"></script>
<!--end::Global Theme Bundle-->
<!--begin::Page Vendors(used by this page)-->
<!--<script src="/resources/assets/plugins/custom/fullcalendar/fullcalendar.bundle.js"></script>예솔이 막아놓음-->
<!--end::Page Vendors-->
<!--begin::Page Scripts(used by this page)-->
<!--<script src="/resources/assets/js/pages/widgets.js"></script>예솔이 막아놓음-->
<!--end::Page Scripts-->