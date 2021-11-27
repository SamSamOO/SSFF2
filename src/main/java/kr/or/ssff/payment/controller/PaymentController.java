package kr.or.ssff.payment.controller;

/*

 */

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;


@Log4j2
@NoArgsConstructor

@RequestMapping("/payment")
@Controller
public class PaymentController {


  @Autowired
  private PaymentService service;



//  @RequestMapping(
//      value  = "/authIn",
//      method = {RequestMethod.POST,RequestMethod.GET},
//      produces="application/json;charset=utf-8")
//  @ResponseBody
@GetMapping("/authIn")

//  public St selectCafeList(String nickName){
  public void testAuthResult(HttpServletRequest request){

//    return "payment/test";
  } // challengeRefund


  /*
   * 결제 인증 Test
   * 매개변수: 회원 닉네임
   * 반환:
   * */
  @GetMapping("/auth")
//  public St selectCafeList(String nickName){
  public void testAuth(){

//    return "payment/test";
  } // challengeRefund

  /*
   * 결제 인증 TestResult
   * 매개변수: 회원 닉네임
   * 반환:
   * */

//
//  @RequestMapping(
//      value  = "/authIn",
//      method = {RequestMethod.POST,RequestMethod.GET},
//      produces="application/json;charset=utf-8")
//  @ResponseBody
////  public St selectCafeList(String nickName){
//  public void testAuthResult(HttpServletRequest request){
//
////    return "payment/test";
//  } // challengeRefund



  /*
   * 결제 인증 TestResult
   * 매개변수: 회원 닉네임
   * 반환:
   * */
//  @PostMapping("/authtoken")
////  public St selectCafeList(String nickName){
//  public void testAuthTokenResult(){
//
////    return "payment/test";
//  } // challengeRefund






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
   * 결제시 예약릴레이션에 결제정보를 추가
   * 매개변수: 회원 닉네임, 챌린지ID, PaymentDTO(등록할 결제 정보를 담을 객체)
   * 반환: 거래내역 리스트 뷰단
   *
  @PostMapping("/")
//  public St selectCafeList(String nickName){
  public String s(String nickName, String challengeId, PaymentDTO paymentDTO){
      String a = "a";


    return "foward:" + a;
  } // selectTransactionList
*/

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

  /*
   * 스터디카페 결제 페이지 팝업(안에 금액 등 데이터 담아서 팝업)
   * 매개변수: 회원 닉네임, 예약정보ID, PaymentDTO(등록할 결제 정보를 담을 객체)
   * 반환: 예약정보에 결제정보를 변경(담을) 수 있는 페이지(이름 정해야해//TODO)
   * */
  @PostMapping("/cafeReservation")
//  public St selectCafeList(String nickName){
  public String cafeReservation(String nickName, String reservationId, PaymentDTO paymentDTO){




    return "payment/cafeReservation";
  } // insertChallenge


}

























