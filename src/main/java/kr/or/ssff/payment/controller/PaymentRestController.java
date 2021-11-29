package kr.or.ssff.payment.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import kr.or.ssff.cafe.domain.ReservationVO;
import kr.or.ssff.payment.model.PaymentAcntDTO;
import kr.or.ssff.payment.model.PaymentAuthDTO;
import kr.or.ssff.payment.domain.PaymentWithdrawDTO;
import kr.or.ssff.payment.model.TransactionDTO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
   * 카페 예약시 실시간 출금
   * withdraw
   */
  @RequestMapping("/withdraw") //TODO /withdraw/cafeRsrv로 변경
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
    transactionDTO.setTrnsc_idx(paymentWithdrawDTO.getApiTranId()); // 거래번호
    transactionDTO.setApply_idx(null); // 스터디 참여 번호
    transactionDTO.setRsrv_idx(tempRsrvIdx); // 카페 예약번호
    transactionDTO.setMember_name(reservationVO.getMember_name()); // 닉네임
    transactionDTO.setTransaction_date(paymentWithdrawDTO.getApiTranDtm()); // 거래일자
    transactionDTO.setTransaction_categories("출금"); // 거래 대분류
    transactionDTO.setTransaction_categorie("스터디카페예약"); // 거래 소분류
//    transactionDTO.setTransaction_amount(Integer.valueOf(paymentWithdrawDTO.getTranAmt()));
//    transactionDTO.setAmount_to_be_paid(Integer.valueOf(paymentWithdrawDTO.getTranAmt()));
    transactionDTO.setTransaction_amount(reservationVO.getRsrv_amount()); // 거래금액 (현재 임의 예약금액으로 set)
    transactionDTO.setClient_account_number(paymentWithdrawDTO.getAccountNumMasked()); // 출금한 계좌번호
    transactionDTO.setClient_bank_code(Integer.valueOf(paymentWithdrawDTO.getBandCodeStd())); // 출금 계좌의 은행코드
    transactionDTO.setClient_name(paymentWithdrawDTO.getAccountHolderName()); // 예금주명
    transactionDTO.setAmount_to_be_paid(reservationVO.getRsrv_amount()); // 거래 완료금액 (현재 임의 예약금액으로 set)
    transactionDTO.setPayment_completed_yn('y'); // 거래완료여부

    // 거래정보 insert
    boolean result = service.registerTrnsc(transactionDTO); // 거래 정보 insert
    log.info("service.registerTrnsc(transactionDTO)({}): ", result);



    Integer deleteRsrvRow ;
    Integer setRsrvRow ;

    String resultHtml = "";

    if(!result){  // insert 실패했다면 (== 거래실패) 예약내역도 삭제
      deleteRsrvRow= service.deleteRsrv(tempRsrvIdx);
      log.info("service.deleteRsrv({}): ", deleteRsrvRow);

      resultHtml = "     Swal.fire({\n"
          + "                  icon : 'warning', \n"
          + "                  title: '예약실패', \n"
          + "                  text : '다시 시도해주세요.', \n"
          + "                });";
    } else { // 거래정보 insert 성공시 예약내역에 상태 정보 정상으로 업데이트
      setRsrvRow= service.setReservation(tempRsrvIdx);
      log.info("service.setReservation({}): ", setRsrvRow);
    }

    // userMe(paymentAuthDTO.getTokenType(), paymentAuthDTO.getAccessToken(), paymentAuthDTO.getUserSeqNo());

    //TODO row값 따라서 view 변경해주기 - 실패시 실패 알럿, 성공시 예약내역리스트 ㄱ
//    return "<script>window.close();</script>";

    		return "<script>opener.location.replace('/cafe/list');window.close();"+resultHtml+"</script>";

  } // withdraw




  /**
   * 챌린지 참여시
   * withdraw/challenge
   */
  @RequestMapping("/withdraw/challenge")
  public String withdrawChallenge(
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
    transactionDTO.setTrnsc_idx(paymentWithdrawDTO.getApiTranId()); // 거래번호
    transactionDTO.setApply_idx(null); // 스터디 참여 번호
    transactionDTO.setRsrv_idx(tempRsrvIdx); // 카페 예약번호
    transactionDTO.setMember_name(reservationVO.getMember_name()); // 닉네임
    transactionDTO.setTransaction_date(paymentWithdrawDTO.getApiTranDtm()); // 거래일자
    transactionDTO.setTransaction_categories("출금"); // 거래 대분류
    transactionDTO.setTransaction_categorie("스터디카페예약"); // 거래 소분류
//    transactionDTO.setTransaction_amount(Integer.valueOf(paymentWithdrawDTO.getTranAmt()));
//    transactionDTO.setAmount_to_be_paid(Integer.valueOf(paymentWithdrawDTO.getTranAmt()));
    transactionDTO.setTransaction_amount(reservationVO.getRsrv_amount()); // 거래금액 (현재 임의 예약금액으로 set)
    transactionDTO.setClient_account_number(paymentWithdrawDTO.getAccountNumMasked()); // 출금한 계좌번호
    transactionDTO.setClient_bank_code(Integer.valueOf(paymentWithdrawDTO.getBandCodeStd())); // 출금 계좌의 은행코드
    transactionDTO.setClient_name(paymentWithdrawDTO.getAccountHolderName()); // 예금주명
    transactionDTO.setAmount_to_be_paid(reservationVO.getRsrv_amount()); // 거래 완료금액 (현재 임의 예약금액으로 set)
    transactionDTO.setPayment_completed_yn('y'); // 거래완료여부

    // 거래정보 insert
    boolean result = service.registerTrnsc(transactionDTO); // 거래 정보 insert
    log.info("service.registerTrnsc(transactionDTO)({}): ", result);



    Integer deleteRsrvRow ;
    Integer setRsrvRow ;

    String resultHtml = "";

    if(!result){  // insert 실패했다면 (== 거래실패) 예약내역도 삭제
      deleteRsrvRow= service.deleteRsrv(tempRsrvIdx);
      log.info("service.deleteRsrv({}): ", deleteRsrvRow);

      resultHtml = "     Swal.fire({\n"
          + "                  icon : 'warning', \n"
          + "                  title: '예약실패', \n"
          + "                  text : '다시 시도해주세요.', \n"
          + "                });";
    } else { // 거래정보 insert 성공시 예약내역에 상태 정보 정상으로 업데이트
      setRsrvRow= service.setReservation(tempRsrvIdx);
      log.info("service.setReservation({}): ", setRsrvRow);
    }

    // userMe(paymentAuthDTO.getTokenType(), paymentAuthDTO.getAccessToken(), paymentAuthDTO.getUserSeqNo());

    //TODO row값 따라서 view 변경해주기 - 실패시 실패 알럿, 성공시 예약내역리스트 ㄱ
//    return "<script>window.close();</script>";

    return "<script>opener.location.replace('/cafe/list');window.close();"+resultHtml+"</script>";

  } // withdraw


  /* 사용 x */
  /*@RequestMapping("/diposit")
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
*/


  /* //TODO 미구현
   * 거래내역 리스트를 비동기 조회
   * 매개변수: 매니저/회원단 동시 활용하기에 sessionName
   * 반환: 거래내역 리스트 정보를 담은 JSON객체
   * */
  @RequestMapping(value= "/transactionList/Data", method = RequestMethod.POST,
      produces = "application/json; charset=UTF-8")
  //없으면 AJAX 통신 안됨
  public  JSONObject getTransactionList(
      @RequestBody HashMap<String, String> searchKey
  ) throws Exception {
    log.debug("getReservationList({}) is invoked", searchKey);
    log.info("ajax 요청 도착!");

//    searchKey = new HashMap<>();
    String member_name = "";
    // jReservationVO 모든 정보 담아내기 (중복정보 있는 상태)
//    List<RsrvJoinTrnscVO> list = this.service.getRsrvJoinTrnscList(searchKey);

    //최종 완성될 JSONObject 선언(전체)
    JSONObject jsonObject = new JSONObject();
    //cafeInfo JSON정보를 담을 Array 선언
    JSONArray arr = new JSONArray();


    // log.info("jsonObject {} =", jsonObject);

    // 페이지 처리한 JSON객체를 요청온 AJAX 보내주기 (list단)
    return jsonObject;
  } // getReservationList

} // end class

























