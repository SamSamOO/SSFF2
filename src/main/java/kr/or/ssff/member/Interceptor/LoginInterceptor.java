package kr.or.ssff.member.Interceptor;




import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Component
public class LoginInterceptor implements HandlerInterceptor {
    private static final String LOGIN = "login";
    private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);


    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        HttpSession session = request.getSession();

        if(session.getAttribute(LOGIN) != null) {

            // 기존 HttpSession에 남아있는 정보가 있는 경우 이를 삭제
            logger.info("clear login data before");
            session.removeAttribute(LOGIN);
        }

        return true;
    }

    @Override
    public void postHandle (HttpServletRequest request,
                            HttpServletResponse response,
                            Object handler,
                            ModelAndView modelAndView) throws Exception {

        HttpSession session = request.getSession();
        ModelMap modelMap = modelAndView.getModelMap();
        Object memberVo = modelMap.get("MemberVO");

        if(memberVo != null) {

            // 로그인 성공시 Session에 저장후, 초기 화면 이동
            logger.info("new login success");
            session.setAttribute(LOGIN, memberVo);
            response.sendRedirect("/member/main");
        }
    }


}
