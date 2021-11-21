package kr.or.ssff.member.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.HashMap;

import java.util.List;


import kr.or.ssff.member.service.KaKaoService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletResponse;

import kr.or.ssff.member.domain.MemberDTO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import kr.or.ssff.member.domain.MemberVO;

import kr.or.ssff.member.service.MemberService;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
//    @Setter(onMethod_= {@Autowired} )
//    private BCryptPasswordEncoder bCryptPasswordEncoder;


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
    public String memberJoin(MemberDTO memberDTO, RedirectAttributes rttr, Model model) throws Exception {
        log.debug("join({}) is invoked", "memberDTO = " + memberDTO);
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

                this.service.insertMember(memberDTO);
                model.addAttribute("result", "ok");
                model.addAttribute("refreshUrl", "2;url=../member/loginGo");
            }// try-resources

        } catch (Exception e) {
            throw new RuntimeException();
        }//catch


        return "redirect:/member/registerWait";
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
    public ModelAndView memberLoginForm(HttpSession session) {
        ModelAndView mav = new ModelAndView(); /* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */

        String kakaoUrl = kaKaoService.getAuthorizationUrl(session); /* 생성한 인증 URL을 View로 전달 */
        mav.setViewName("member/login");

        // 카카오 로그인
        mav.addObject("kakao_url", kakaoUrl);

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


        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");
        kemail = kakao_account.path("email").asText();
        kname = properties.path("nickname").asText();
        session.setAttribute("kemail", kemail);
        session.setAttribute("kname", kname);
        mav.setViewName("/main");


        return mav;
    }

    @PostMapping("/login")
    public String memberLogin(
            @RequestParam("member_id") String member_id,
            @RequestParam("member_pwd") String member_pwd) {
        log.debug("login() is invoked" + member_id, member_pwd);


        boolean user = this.service.Login(member_id, member_pwd);
        log.info("\t+ user: {}", user);


        return "redirect:/member/main";
    } // memberLogin

    //로그아웃.
    @PostMapping("/logout")
    public String memberLogout(HttpSession session) {
        log.debug("loginGo() is invoked");
        session.invalidate();

        return "/main";
    }

    /* 마이 페이지 이동
     * 파라메터 : nickname
     * 마이 페이지로 이동합니다.
     * */
    @GetMapping("/myPage")
    public String myPageGo(String nickname) {
        log.debug("myPageGo({}) is invoked", "nickname = " + nickname);

        return "/member/myPage";
    } // myPageGo

    /* 가입한 스터디 목록 페이지로 이동
     * 파라메터 : nickname
     * 스터디 목록 페이지
     * */
    @GetMapping("/studyList")
    public String selectStudyList(String nickname) {
        log.debug("selectStudyList({}) is invoked", "nickname = " + nickname);

        return "/member/studyList";
    } // studyListGo


    /* 회원탈퇴기능을 수행합니다
     * 파라메터 : String nickname
     *탈퇴기능 수행 후 메인페이지
     * */
    @PostMapping("/withdrawal")
    public String withdrawal(String nickname) {
        log.debug("withdrawal({}) is invoked", "nickname = " + nickname);

        return "redirect:/main";
    } // withdrawal

    /* 아이디/ 비밀번호 찾기 페이지 이동
     * 파라메터 : String nickname
     * 아이디 / 비밀번호 찾기 페이지
     * */
    @GetMapping("/idPwFindGo")
    public String idPwFindGo(String nickname) {
        log.debug("idPwFindGo({}) is invoked", "nickname = " + nickname);

        return "/member/idPwFind";
    }


} // end class

























