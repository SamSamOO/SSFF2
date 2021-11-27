package kr.or.ssff.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.ssff.cafe.domain.CafeVO;
import kr.or.ssff.cafe.domain.ReservationVO;
import kr.or.ssff.payment.domain.PaymentAcntDTO;
import kr.or.ssff.payment.domain.PaymentAuthDTO;
import kr.or.ssff.payment.domain.PaymentDepositDTO;
import kr.or.ssff.payment.domain.PaymentWithdrawDTO;
import kr.or.ssff.payment.model.TransactionDTO;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/*

 */

import kr.or.ssff.payment.service.PaymentService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;


@Log4j2
@NoArgsConstructor

@RequestMapping("/payment/rest")
@RestController
public class PaymentRestController {


  @Setter(onMethod_ = {@Autowired})
  private PaymentService service;


  /**
   * callback
   */
  @RequestMapping("/callback")
      public String callback(
      @RequestParam("code") String code,
      @RequestParam("state") String state,
      Authentication authentication,
      HttpServletResponse response) {
    log.debug("callback({},{},{}) is invoked",
        code, state, authentication);

    //TODO 세션 회원이름 받아오기 - 순형 !
//    UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//    String id = userDetails.getUsername();
String id = "testJihye";
    String action = "callback";
//     service.connectAuth(code, id); // db에 저장할지말지 결정해서 auth 저장

    PaymentAuthDTO paymentAuthDTO = service.getAuth(code, id, action); // 토큰 받기
    log.info("paymentAuthDTO({}): ", paymentAuthDTO);
//		return "<script>opener.location.reload();window.close();</script>";
    List<PaymentAcntDTO> acntList = service.getAcnt(paymentAuthDTO); // 핀테크 받기
    log.info("acntList({}): ", acntList);



    // userMe(paymentAuthDTO.getTokenType(), paymentAuthDTO.getAccessToken(), paymentAuthDTO.getUserSeqNo());

    return "<script>window.close();</script>";
  } // callback



  public void userMe(String token_type, String access_token, String user_seq_no) {
    log.debug("userMe({},{},{}) is invoked",
        token_type, access_token, user_seq_no);

    RestTemplate restTemplate = new RestTemplate();
    // 2. 사용자 계좌 조회
    String userMeUrl = "https://testapi.openbanking.or.kr/v2.0/user/me";

    HttpHeaders userMeheaders = new HttpHeaders();

    userMeheaders.add("Authorization",
        token_type + " " + access_token);
    log.info("userMeheaders {}: " , userMeheaders);
    System.out.println(token_type + " " + access_token);

    HttpEntity entity = new HttpEntity(userMeheaders);
    log.info("entity {}: " , entity);
    UriComponentsBuilder uriBuilder =
        UriComponentsBuilder.fromHttpUrl(userMeUrl)
        .queryParam("user_seq_no", user_seq_no);

    ResponseEntity<String> userMeResponse =
        restTemplate.exchange(uriBuilder.toUriString(),
        HttpMethod.GET, entity, String.class);

    log.info("userMeResponse {}: " , userMeResponse);

//		ObjectMapper mapper = new ObjectMapper();
//		JsonNode root;
//		List<OpenbankAccountVO> list = new ArrayList<OpenbankAccountVO>();
//
//		root = mapper.readTree(response2.getBody());
//		System.out.println("root : " + root);
//
//		JsonNode node = root.path("res_list");
//
//		OpenbankAccountVO vo = mapper.readValue(node.toPrettyString(), OpenbankAccountVO.class);
//
//		System.out.println(vo);

  } // userMe



  /**
   * withdraw
   */
  @RequestMapping("/withdraw")
  public String withdraw(
      @RequestParam("code") String code,
      @RequestParam("state") String state,
      Authentication authentication,
      HttpServletResponse response) {
    log.debug("withdraw({},{},{}) is invoked",
        code, state, authentication);

    //TODO 세션 회원이름 받아오기 - 순형 !
//    UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//    String id = userDetails.getUsername();
    String id = "testJihye";
    String action = "withdraw";
//     service.connectAuth(code, id); // db에 저장할지말지 결정해서 auth 저장

    PaymentAuthDTO paymentAuthDTO = service.getAuth(code, id, action); // 토큰 받기
    log.info("paymentAuthDTO({}): ", paymentAuthDTO);
//		return "<script>opener.location.reload();window.close();</script>";
    List<PaymentAcntDTO> acntList = service.getAcnt(paymentAuthDTO); // 핀테크 받기
    log.info("acntList({}): ", acntList);


    PaymentWithdrawDTO paymentWithdrawDTO = service.getWithdrawDto(acntList,paymentAuthDTO ); // 핀테크 받기
    log.info("paymentWithdrawDTO({}): ", paymentWithdrawDTO);


    // 현재 임시저장된 상태의 예약정보 idx 호출

    ReservationVO reservationVO = service.getTempRsrv();
    String tempRsrvIdx = reservationVO.getRsrv_idx();
    log.info("service.getTempRsrv({}): ", tempRsrvIdx);

    TransactionDTO transactionDTO = new TransactionDTO();
    transactionDTO.setTrnsc_idx(paymentWithdrawDTO.getApiTranId());
    transactionDTO.setApply_idx(null);
    transactionDTO.setRsrv_idx(tempRsrvIdx);
    transactionDTO.setMember_name(reservationVO.getMember_name());
    transactionDTO.setTransaction_date(paymentWithdrawDTO.getApiTranDtm());
    transactionDTO.setTransaction_categories("출금");
    transactionDTO.setTransaction_categorie("스터디카페예약");
//    transactionDTO.setTransaction_amount(Integer.valueOf(paymentWithdrawDTO.getTranAmt()));
//    transactionDTO.setAmount_to_be_paid(Integer.valueOf(paymentWithdrawDTO.getTranAmt()));
    transactionDTO.setTransaction_amount(reservationVO.getRsrv_amount());
    transactionDTO.setClient_account_number(paymentWithdrawDTO.getAccountNumMasked());
    transactionDTO.setClient_bank_code(Integer.valueOf(paymentWithdrawDTO.getBandCodeStd()));
    transactionDTO.setClient_name(paymentWithdrawDTO.getAccountHolderName());
    transactionDTO.setAmount_to_be_paid(reservationVO.getRsrv_amount());
    transactionDTO.setPayment_completed_yn('y');

    // 거래정보 insert
    boolean result = service.registerTrnsc(transactionDTO);
    log.info("service.registerTrnsc(transactionDTO)({}): ", result);



    Integer deleteRsrvRow ;
    Integer setRsrvRow ;


    if(!result){  // insert 실패했다면 (== 거래실패) 예약내역도 삭제
      deleteRsrvRow= service.deleteRsrv(tempRsrvIdx);
      log.info("service.deleteRsrv({}): ", deleteRsrvRow);
    } else { // 거래정보 insert 성공시 예약내역에 상태 정보 정상으로 업데이트
      setRsrvRow= service.setReservation(tempRsrvIdx);
      log.info("service.setReservation({}): ", setRsrvRow);
    }

    // userMe(paymentAuthDTO.getTokenType(), paymentAuthDTO.getAccessToken(), paymentAuthDTO.getUserSeqNo());

    //TODO row값 따라서 view 변경해주기 - 실패시 실패 알럿, 성공시 예약내역리스트 ㄱ
//    return "<script>window.close();</script>";
    return "제발 돼라";
  } // withdraw


  /* 사용 x */
  @RequestMapping("/diposit")
  public String diposit(
      @RequestParam("code") String code,
      @RequestParam("state") String state,
      Authentication authentication,
      HttpServletResponse response) {
    log.debug("diposit({},{},{}) is invoked",
        code, state, authentication);

    //TODO 세션 회원이름 받아오기 - 순형 !
//    UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//    String id = userDetails.getUsername();
    String id = "testDiposit";
    String action = "diposit";
//     service.connectAuth(code, id); // db에 저장할지말지 결정해서 auth 저장

    PaymentAuthDTO paymentAuthDTO = service.getAuth(code, id, action); // 토큰 받기
    log.info("paymentAuthDTO({}): ", paymentAuthDTO);
//		return "<script>opener.location.reload();window.close();</script>";
    List<PaymentAcntDTO> acntList = service.getAcnt(paymentAuthDTO); // 핀테크 받기
    log.info("acntList({}): ", acntList);


    PaymentDepositDTO paymentDepositDTO = service.getDipositDto(acntList,paymentAuthDTO ); // 핀테크 받기
    log.info("paymentDepositDTO({}): ", paymentDepositDTO);

    // userMe(paymentAuthDTO.getTokenType(), paymentAuthDTO.getAccessToken(), paymentAuthDTO.getUserSeqNo());

    return "<script></script>";
  } // withdraw

} // end class

























