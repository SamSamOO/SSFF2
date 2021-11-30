package kr.or.ssff.member.Interceptor;

import kr.or.ssff.member.domain.MemberDTO;
import org.springframework.stereotype.Component;

import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;


@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        HttpSession session = request.getSession();


//        세션아이디가 null 이면
        if (session.getAttribute("member") == null)   {

//             로그인페이지로 이동
            response.sendRedirect(request.getContextPath() + "/member/loginGo");

            // 아이디가 null 이면 컨트롤러 실행 x
            return false;
        } else {
            // null 이아니면 컨트롤러 실행

            return true;

        }

    }

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response,
                           Object handler,
                           ModelAndView modelAndView) throws Exception {


    }
}
