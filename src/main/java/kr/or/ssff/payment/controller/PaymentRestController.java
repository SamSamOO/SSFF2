package kr.or.ssff.payment.controller;

/*

 */

import kr.or.ssff.payment.service.PaymentService;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@Log4j2
@NoArgsConstructor

@RequestMapping("/paymentRest")
@RestController
public class PaymentRestController {


  @Autowired
  private PaymentService service;








  /*
   * 결제 인증 tokenResult
   * 매개변수:
   * 반환:
//   * */
//  @RequestMapping(value= "/authtoken",
//      method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
////  public St selectCafeList(String nickName){
//  public void testAuthTokenResult(
//      @RequestBody HashMap<String, String> filterJSON,
//      HttpServletResponse response
//  ){
//    log.debug("testAuthTokenResult({},{}) is invoked",filterJSON, response);
////    return "payment/test";
//  } // testAuthTokenResult







}

























