package kr.or.ssff.member.controller;

import com.fasterxml.jackson.databind.JsonNode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ssff.applyMember.domain.ApplyMemberVO;
import kr.or.ssff.member.domain.MemberDTO;
import kr.or.ssff.member.service.KaKaoService;
import kr.or.ssff.member.service.MemberService;
import kr.or.ssff.study.domain.RecruitBoardVO;
import kr.or.ssff.studyIns.model.Criteria;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import kr.or.ssff.member.domain.MemberDTO;


import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Random;
import java.util.HashMap;
import java.util.List;

/*

 */


@Log4j2
@NoArgsConstructor

@RequestMapping("/member")
@Controller
public class MemberController {

    KaKaoService kaKaoService;

    @Autowired //@Setter(onMethod_= { @Autowired })로 바꾸고 serviceimp 변경
    private MemberService service;

    // 장순형  시큐리티 암호화
    @Setter(onMethod_ = {@Autowired})
    private BCryptPasswordEncoder passwordEncoder;

    /* 회원가입 페이지 이동 --순형
     * 파라메터  : 없음
     * 회원가입 페이지
     * */
    @GetMapping("/joinGo")
    public String memberJoinGo() {
        log.debug("memberJoinGo() is invoked");

        return "member/join";
    } // memberJoinGo

    /* 회원가입 기능 수행 -- 순형
     * memberVO member -- 멤버정보가 전달됩니다.
     * 메인페이지로 이동합니다.
     * */
    @PostMapping("/join")
    public String memberJoin(MemberDTO memberDTO, Model model) throws Exception {
        log.debug("join({}) is invoked", "memberDTO = " + memberDTO);

        String rawPw = "";            // 인코딩 전 비밀번호
        String encodePw = "";        // 인코딩 후 비밀번호

        // 이메일 중복여부 확인 (사용가능하면 0)
        int result = service.idChk(memberDTO);

        // 닉네임 중복여부 확인 (사용가능하면 0)
        int result2 = service.nameChk(memberDTO);

        try {
            // 닉네임 또는 이메일 중복일 때
            if (result == 1 || result2 == 1) {

                model.addAttribute("message", "fail");
                model.addAttribute("refreshUrl", "2;url=member/joinGo");

                // 닉네임과 이메일이 중복이 아닐 때
            } else if (result == 0 && result2 == 0) {

                rawPw = memberDTO.getMember_pwd();            // 비밀번호 데이터 얻음
                encodePw = passwordEncoder.encode(rawPw);        // 비밀번호 인코딩
                memberDTO.setMember_pwd(encodePw);
                // 인코딩된 비밀번호 member객체에 다시 저장
                this.service.insertMember(memberDTO);

                model.addAttribute("result", "ok");
                model.addAttribute("refreshUrl", "2;url=../member/loginGo");
            }// try-resources

        } catch (Exception e) {
          e.printStackTrace(
          );
        }//catch


        return "/member/registerWait";
    } // memberJoin


    // 이메일 인증 확인하면 나오는 경로
    @GetMapping("/emailConfirm")
    public String emailConfirm(String member_id, Model model) throws Exception {
        // authstatus 권한 상태 1로 변경
        service.updateAuthstatus(member_id);
        log.info("updateAuthstatus ({})", member_id);

        // jsp에서 쓰기위해 model에 담음
        model.addAttribute("member_id", member_id);

        return "member/emailConfirm";
    }

    //아이디 중복체크
    @ResponseBody
    @PostMapping("/idChk")
    public int idChk(MemberDTO memberDTO) throws Exception {
        int result = service.idChk(memberDTO);
        return result;
    }

    //닉네임 중복체크
    @ResponseBody
    @PostMapping("/nameChk")
    public int nameChk(MemberDTO memberDTO) throws Exception {
        int result = service.nameChk(memberDTO);
        return result;
    }




    /* 로그인 페이지 이동
     * 파라메터 : 없음
     * 로그인 페이지
     * */

    @GetMapping("/main")
    public String memberMainGo() {
        log.debug("memberMainGo() is invoked");

        return "/main";
    } // memberMainGo

//    @GetMapping("/loginGo")
//    public String memberLoginGo() {
//        log.debug("loginGo() is invoked");
//
//
//        return "member/login";
//    } // memberLoginGo

    //카카오 로그인 버튼 클릭
    @RequestMapping(value = "/loginGo", method = RequestMethod.GET)
    public ModelAndView memberLoginForm(HttpSession session,HttpServletRequest request,Model model) {
        ModelAndView mav = new ModelAndView(); /* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
        String kakaoUrl = kaKaoService.getAuthorizationUrl(session); /* 생성한 인증 URL을 View로 전달 */
        mav.setViewName("member/login");
        String referer = request.getHeader("Referer");
        mav.addObject("referer", referer);
        // 카카오 로그인
        mav.addObject("kakao_url", kakaoUrl);

        mav.addObject("referer", referer);

        return mav;
    }// end memberLoginForm()


    /* 로그인 기능 수행
     * 파라메터 :  email , password
     * 메인페이지로 이동합니다.
     * /kakaoLogin
     * */
    @RequestMapping(value = "/KaKaoLogin", produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView KaKaoLogin(@RequestParam("code") String code, HttpServletRequest request,
                                   HttpServletResponse response, HttpSession session) throws Exception {

        ModelAndView mav = new ModelAndView();


        JsonNode node = kaKaoService.getAccessToken(code);
        JsonNode accessToken = node.get("access_token");

        JsonNode userInfo = kaKaoService.getKakaoUserInfo(accessToken);

        String kemail = null;
        String kname = null;
        String kimage = null;

        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");

        kemail = kakao_account.path("email").asText();
        kname = properties.path("nickname").asText();
        kimage = properties.path("profile_image").asText();



        session.setAttribute("kemail", kemail);
        session.setAttribute("kname", kname);
        session.setAttribute("kimage", kimage);

        mav.setViewName("/main");


        return mav;

    }

    @RequestMapping(value= "/login.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String memberLogin(@RequestParam("referer") String referer,
            MemberDTO memberDTO,
            HttpServletRequest request,
            RedirectAttributes rttr) {
        log.debug("login({}{}{}) is invoked" , memberDTO, request, rttr);
        request.getSession().setAttribute("redirectURI", referer);

        HttpSession session = request.getSession();
        log.debug(session);

        String rawPw = "";
        String encodePw = "";

        MemberDTO mVO = this.service.Login(memberDTO);
        log.debug(mVO);

        if (mVO != null) {                                // 일치하는 아이디 존재시
            log.debug("0not ilchi");
            rawPw = memberDTO.getMember_pwd(); // 사용자가 제출한 비밀번호
            log.debug("rawPW({})",rawPw);
            encodePw = mVO.getMember_pwd(); // 데이터베이스에 저장한 인코딩된 비밀번호
            log.debug("encodePw({})",encodePw);

            if (passwordEncoder.matches(rawPw, encodePw)) {        // 비밀번호 일치여부 판단
                log.debug("pw match");
                mVO.setMember_pwd("");  // 인코딩된 비밀번호 정보 지움
                session.setAttribute("member", mVO);     // session에 사용자의 정보 저장

                log.info("request = {}", request.getRequestURI());

                if (referer.equals(request.getRequestURL().toString().replace(request.getRequestURI(), "") + request.getContextPath() + "/member/loginGo")) {

                    referer = "/";
                    log.info("referer = {}", referer);
                }
                log.info("referer = {}", referer);

                return "redirect:"+referer;        // 메인페이지 이동


            } else {                    // 비밀번호가 일치하지 않을 시 (로그인 실패)
                log.debug("pw not match");
                rttr.addFlashAttribute("result", 0);

                return "redirect:/member/loginGo";

            } // memberLogin
        }
        return "redirect:/member/myPage";
    }



    @GetMapping("/registerWaitGo")
    public String registerWaitGo() {
        log.debug("registerWaitGo() is invoked");

        return "/registerWait";
    } // memberMainGo






        //로그아웃.
        @RequestMapping(value= "/logout", method = {RequestMethod.GET, RequestMethod.POST})
        public String memberLogout (HttpSession session){
            log.debug("memberLogout() is invoked");
            session.invalidate();

            return "/member/login";
        }

        /* 마이 페이지 이동
         * 파라메터 : nickname
         * 마이 페이지로 이동합니다.
         * */
        @GetMapping("/myPage")
        public String myPageGo (String nickname){
            log.debug("myPageGo({}) is invoked", "nickname = " + nickname);

            return "/member/myPage";
        } // myPageGo


        /* 가입한 스터디 목록 페이지로 이동
         * 파라메터 : nickname
         * 스터디 목록 페이지
         * */
// 21.12.02 @param memberName-> member_name으로 수정
    @GetMapping("/studyList")
    public String selectStudyList(String member_name, Criteria criteria, Model model){
        log.info("selectStudyList({}) is invoked", "memberName = " + member_name + ", criteria = " + criteria + ", model = " + model);


        HashMap<String, Object> map = new HashMap<>();
        map.put("member_name", member_name);
        map.put("pageNum", criteria.getPageNum());
        map.put("amount", criteria.getAmount());


        log.info("map = {}", map);
        List<RecruitBoardVO> myStudyList = this.service.getMyStudyList(map);

        log.info("myStudyList = {}", myStudyList);

        model.addAttribute("myStudyList", myStudyList);
        model.addAttribute("map", map);

        return "/member/studyList";
    } // studyListGo




        /* 아이디/ 비밀번호 찾기 페이지 이동
         * 파라메터 : String nickname
         * 아이디 / 비밀번호 찾기 페이지
         * */
        @GetMapping("/idPwFindGo")
        public String idPwFindGo (){
            log.debug("idPwFindGo({}) is invoked" );

            return "/member/idPwFind";
        }

    @GetMapping("/modifyGo")
    public String modifyGo (){
        log.debug("modifyGo({}) is invoked");

        return "/member/modify";
    }

} // end class
























