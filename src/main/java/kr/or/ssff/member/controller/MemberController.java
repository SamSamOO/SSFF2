package kr.or.ssff.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ssff.member.domain.MemberVO;
import kr.or.ssff.member.service.MemberService;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

/*

 */



@Log4j2
@NoArgsConstructor

@RequestMapping("/member")
@Controller
public class MemberController {

    @Autowired //@Setter(onMethod_= { @Autowired })로 바꾸고 serviceimp 변경
    private MemberService service;

    // 장순형 스피릉 시큐리티 암호화
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
    public String memberJoin(MemberVO member, RedirectAttributes rttr, Model model)  {
        log.debug("join({}) is invoked", "memberDTO = " + member);
        service.insertMember(member);
        rttr.addFlashAttribute("result",member.getMember_id());
        System.out.println("가입이 완료되었습니다.");

        return "redirect:/main";
    } // memberJoin

    /* 로그인 페이지 이동
     * 파라메터 : 없음
     * 로그인 페이지
     * */
    @GetMapping("/loginGo")
    public String memberLoginGo() {
        log.debug("loginGo() is invoked");

        return "member/login";
    } // memberLoginGo

    /* 로그인 기능 수행
     * 파라메터 :  email , password
     * 메인페이지로 이동합니다.
     * */
    @PostMapping("/login")
    public String memberLogin(String email, String password) {
        log.debug("login() is invoked");

        return "redirect:/main";
    } // memberLogin

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

























