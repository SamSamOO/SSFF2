package kr.or.ssff.member.Interceptor;

import lombok.extern.log4j.Log4j2;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Log4j2

//세션이 있는 지를 검사하는 인터셉터
@Component
public class SessionInterceptor implements HandlerInterceptor {

    private static final Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

    /**
     * 컨트롤러 수행전에 세션 정보가 있는지 확인하는 처리..
     */
    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler)
            throws Exception {
        logger.info("Interceptor: preHandle");
        boolean  blnRtn = false ;

        String clientIp = request.getRemoteAddr();
        logger.info("ip:{}",clientIp);

        HttpSession httpSession = request.getSession();

        try {

            if( httpSession.getAttributeNames().hasMoreElements()){
                // 세션이 있는 경우
                logger.info("세션 있음:" + httpSession.getAttributeNames());
                blnRtn = true;
            } else {
                // 세션이 없는 경우
                logger.info("세션 없음");
                response.sendRedirect("/main");
                blnRtn = false;
            }
        } catch (Exception e) {
            // TODO: handle exception
        }

        return blnRtn;
    }

    /**
     *
     */
    @Override
    public void postHandle(
            HttpServletRequest  request,
            HttpServletResponse response,
            Object handler,
            ModelAndView modelAndView)
            throws Exception {
        logger.info("Interceptor: postHandle");
    }

    /**
     *
     */
    @Override
    public void afterCompletion(
            HttpServletRequest  request,
            HttpServletResponse response,
            Object handler, Exception ex)
            throws Exception {
        logger.info("Interceptor: afterCompletion");
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }

} // end class
