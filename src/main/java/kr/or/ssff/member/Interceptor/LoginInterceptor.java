package kr.or.ssff.member.Interceptor;

import kr.or.ssff.member.domain.MemberDTO;
import kr.or.ssff.member.service.MemberService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;


@Log4j2
@Component
public class LoginInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        log.debug("preHandle invoked{()}", request, response);

        return true;
    }



    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response,
                           Object handler,
                           ModelAndView modelAndView) throws Exception {

        HttpSession session = request.getSession();
        MemberDTO member = (MemberDTO) session.getAttribute("member");

        log.info("member invoked.({},{})", member, session);

//        세션아이디가 null 이면
        if (member == null || member.getAuthStatus() == 0) {
            log.info("member invoked.({},{})", session, member);
            log.debug("실패타냐");
            log.info("member = {}", member.getAuthStatus());
            
//             로그인페이지로 이동
            modelAndView.setViewName("/member/login");

            // 아이디가 null 이면 컨트롤러 실행 x

        }else if(member.getMember_no()==329){


            log.debug("여기타야함 관리자");
            modelAndView.setViewName("/manager/study/list");
        }else {
            log.debug("성공타냐>");
            modelAndView.setViewName("/main");
        }
    }
}
