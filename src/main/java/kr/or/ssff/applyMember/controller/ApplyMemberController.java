package kr.or.ssff.applyMember.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ssff.applyMember.domain.ApplyMemberListVO;
import kr.or.ssff.applyMember.service.ApplyMemberService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

/*
 * 최초 작성자: 신지혜
 * 목적: applyMember controll
 */



@Log4j2
@NoArgsConstructor

@RequestMapping("/applyMember")
@Controller
public class ApplyMemberController {

    @Setter(onMethod_= { @Autowired })
    private ApplyMemberService service;

  

    /* 참여신청자, 멤버목록 
     * 매개변수:
     * 반환: 스터디목록 뷰
     * 작성자: 신지혜
//     * */
    @GetMapping("/studyModalTest")
    public void studyModalTest(String r_idx, Model model){

    } // studyModalTest

    
   
    /* 스터디 가입상태 변경처리 (승인, 거절, 탈퇴, 취소)
     * 매개변수: 참여번호와 액션 정보 
     * 반환: 
     * 작성자: 신지혜
     * */
  /*  @PostMapping("/apply_action")
    @ResponseBody
    public String applyAction(
        @RequestBody String filterJSON,
        HttpServletResponse response,
        ModelMap model ) throws Exception {
        log.debug("studyModalTest({},{},{}) is invoked",filterJSON, response, model );

        String result = "";
        try{
            log.info("\t refusal_action_try");
            log.info("\t filterJSON: "+filterJSON);
            log.info("\t response: "+response);
            log.info("\t model: "+model);

            ObjectMapper mapper = new ObjectMapper();

            HashMap<String, String> aMember = mapper.readValue(filterJSON, new HashMap<String, String>().getClass());

            log.info("\t+ aMember.study_type: {}",aMember.get("study_type"));
            log.info("\t+ aMember.apply_idx: {}",aMember.get("apply_idx"));
            log.info("\t+ aMember.action: {}",aMember.get("action"));

            this.service.applyAction(aMember);

            result="done";
        }catch(Exception e){

        }
        response.setContentType("text/html; charset=UTF-8");

        return result;
    } // applyAction
*/
    
//    /* 스터디 가입신청처리
//     * 매개변수: 참여번호와 닉네임
//     * 반환:
//     * 작성자: 신지혜
//     * */
//    @PostMapping("/insert")
//    @ResponseBody
//    public String insertApplyMember(
//        @RequestBody String filterJSON,
//        HttpServletResponse response,
//        ModelMap model ) throws Exception {
//        log.debug("insertApplyMember({},{},{}) is invoked",filterJSON, response, model );
//        String aMemberName = "";
//        try{
//            log.info("\t refusal_action_try");
//            log.info("\t filterJSON: "+filterJSON);
//            log.info("\t response: "+response);
//            log.info("\t model: "+model);
//
//            ObjectMapper mapper = new ObjectMapper();
//
//            HashMap<String, String> aMember = mapper.readValue(filterJSON, new HashMap<String, String>().getClass());
//
//            log.info("\t+ aMember.boss: {}",aMember.get("boss"));
//            log.info("\t+ aMember.r_idx: {}",aMember.get("r_idx"));
//            log.info("\t+ aMember.member_name: {}",aMember.get("member_name"));
//
//            aMemberName = this.service.registerApply(aMember);
//            log.info("\t aMemberName: "+aMemberName);
//        }catch(Exception e){
//
//        }
//        response.setContentType("text/html; charset=UTF-8");
//
//        return aMemberName;
//    } // applyAction
    
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

























