package kr.or.ssff.member.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import kr.or.ssff.member.domain.ApplyMemberDTO;
import kr.or.ssff.member.domain.ApplyMemberVO;
import kr.or.ssff.member.domain.MemberVO;
import kr.or.ssff.member.service.MemberService;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/*

 */






@Log4j2
@NoArgsConstructor

@RequestMapping("/member")
@Controller
public class MemberController {

	@Autowired
    private MemberService service;

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
    public String memberJoin(MemberVO member)  {
        log.debug("join({}) is invoked", "member = " + member);

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

    /* 참여신청자, 멤버목록 모달 민주랑 합치기 전에 여기서 먼저 작업 
     * 매개변수:
     * 반환: 스터디목록 뷰
     * 작성자: 신지혜 
     * */
    @GetMapping("/studyModalTest")
    public void studyModalTest(String r_idx, Model model){
    	r_idx = "9003"; //TODO 추후 클릭하는 스터디 정보로 변경
      log.debug("studyModalTest() is invoked");
      
		List<ApplyMemberDTO> applyMemberList = this.service.getApplyMemberList(r_idx); 
		log.info("\t + >>>>>>>>>>>>>>>>applyMemberList:{}", applyMemberList);
		log.info("\t+ list size: {}", applyMemberList.size()); 
		
		model.addAttribute("applyMemberList", applyMemberList);
    } // studyModalTest

    /* 스터디 가입상태 변경처리 (승인, 거절, 탈퇴)
     * 매개변수:
     * 반환: ??
     * 작성자: 신지혜
     * */
    @PostMapping("/refusal_action") //TODO 다녀와서 승인버튼 클릭시 로직 구현 시작!
    @ResponseBody
    public String applyAction(
        @RequestBody String filterJSON,
        HttpServletResponse response,
        ModelMap model ) throws Exception {
        log.debug("studyModalTest({},{},{}) is invoked",filterJSON, response, model );
        try{
            log.info("\t refusal_action_try");
            log.info("\t filterJSON: "+filterJSON);
            log.info("\t response: "+response);
            log.info("\t model: "+model);

            ObjectMapper mapper = new ObjectMapper();

            HashMap<String, String> aMember = mapper.readValue(filterJSON, new HashMap<String, String>().getClass());

            String searchIdx = String.valueOf(aMember.get("apply_idx"));
            String searchAction = String.valueOf(aMember.get("action"));


            log.info("\t+ searchAction: {}", searchAction);
            log.info("\t+ searchIdx: {}", searchIdx);


            this.service.applyAction(searchIdx);

        }catch(Exception e){

        }
        response.setContentType("text/html; charset=UTF-8");

        return "done";
    } // applyAction


    /* 스터디 카페 예약내역 페이지로 이동합니다
     * 파라메터 : nickname
     * 스터디 카페 예약내역 페이지
     * */
    @GetMapping("/reservationList")
    public String selectReservationList(String nickname) {
        log.debug("selectReservationList({}) is invoked", "nickname = " + nickname);

        return "/member/reservationList";
    } // reservationList

    /* 결제 내역 페이지로 이동합니다.
     * 파라메터 :String nickname
     * 결제 내역 페이지
     * */
    @GetMapping("/paymentList")
    public String selectPaymentList(String nickname) {
        log.debug("selectPaymentList({}) is invoked", "nickname = " + nickname);

        return "/member/paymentList";
    } // paymentList

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

    /* 거래 내역 조회 페이지로 이동합니다.
     * 파라메터 : String nickname
     * 거래 내역 조회 페이지
     * */
    @GetMapping("/transactionList")
    public String selectTransactionList(String nickname) {
        log.debug("selectTransactionList({}) is invoked", "nickname = " + nickname);

        return "/member/transactionList";
    }

    //TODO 해당 코드의 파라메터에 대한 내용을 추가해야합니다. -- 상준
    //TODO 해당 코드의 반환페이지에 대한 내용을 추가해야합니다.-- 상준
    /*회원간 송금 기능을 수행합니다.
     * 파라메터 : ???
     * 반환 페이지 : ???
     */
    @PostMapping("/remit")
    public String remit() {
        log.debug("remit() is invoked");

        return null;
    }


} // end class

























