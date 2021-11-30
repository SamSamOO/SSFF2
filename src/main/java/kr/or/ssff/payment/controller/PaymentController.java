package kr.or.ssff.payment.controller;

/*

 */

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import kr.or.ssff.applyMember.service.ApplyMemberService;
import kr.or.ssff.payment.model.PaymentDTO;
import kr.or.ssff.payment.service.PaymentService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Log4j2
@NoArgsConstructor

@RequestMapping("/payment")
@Controller
public class PaymentController {


  @Autowired
  private PaymentService service;

  @Autowired
  private ApplyMemberService applyMemberService;






  /*
   * 거래내역 리스트를 조회
   * 매개변수: 회원 닉네임
   * 반환: 거래내역 리스트 뷰단
   * */
  @GetMapping("/transactionList")
  public String selectTransactionList(String nickName){


    return "payment/transactionList";
  } // selectTransactionList


  /*
   * 챌린지시작시 결제 페이지 팝업(안에 금액 등 데이터 담아서 팝업)
   * 매개변수: 회원 닉네임, 챌린지ID, PaymentDTO(등록할 결제 정보를 담을 객체)
   * 반환: 챌린지정보에 결제정보를 변경(담을) 수 있는 페이지(이름 정해야해//TODO)
   * */
  @GetMapping("/challenge")
//  public St selectCafeList(String nickName){
  public String challenge(){

    return "payment/challenge";

  } // insertChallenge

  /*
   * 챌린지 종료시 환급페이지 팝업(안에 금액 등 데이터 담아서 팝업)
   * 매개변수: 회원 닉네임, 챌린지ID, PaymentDTO(등록할 결제 정보를 담을 객체)
   * 반환: 챌린지정보에 결제정보를 변경(담을) 수 있는 페이지(이름 정해야해//TODO)
   * */
  @GetMapping("/challengeRefund")
//  public St selectCafeList(String nickName){
  public String challengeRefund(String nickName, String challengeId, PaymentDTO paymentDTO){

    return "payment/challengeRefund";
  } // challengeRefund



}

























