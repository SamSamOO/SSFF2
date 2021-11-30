package kr.or.ssff.payment.service;

/*

 */

//

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.RuntimeJsonMappingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import kr.or.ssff.Utils.RandomGenerator;
import kr.or.ssff.applyMember.domain.ApplyMemberVO;
import kr.or.ssff.cafe.domain.ReservationVO;
import kr.or.ssff.mapper.ApplyMemberMapper;
import kr.or.ssff.mapper.CafeMapper;
import kr.or.ssff.mapper.PaymentMapper;
import kr.or.ssff.payment.domain.PaymentWithdrawDTO;
import kr.or.ssff.payment.model.PaymentAcntDTO;
import kr.or.ssff.payment.model.PaymentAuthDTO;
import kr.or.ssff.payment.model.PaymentDepositDTO;
import kr.or.ssff.payment.model.TransactionDTO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Log4j2
@AllArgsConstructor

@Service("PaymentService")
public class PaymentServiceImpl
    implements PaymentService, InitializingBean, DisposableBean {

  @Setter(onMethod_ = {@Autowired})
  private PaymentMapper mapper;

  @Setter(onMethod_ = {@Autowired})
  private CafeMapper cafeMapper;

  @Setter(onMethod_ = {@Autowired})
  private ApplyMemberMapper applyMemberMapper;


  private final static String CLIENT_ID = "8492614f-7af7-472e-9c00-f0b61b38ed33";
  private final static String CLIENT_SECRET = "e9366e92-5b66-450e-8299-f1ebbf9473db";
  private final static String GRANK_TYPE = "authorization_code";
  private final static String REDIRECT_URL = "http://localhost:8070/payment/rest/";
  private final static String CLIENT_USE_CODE = "M202113457U";

  private final static String CLIENT_ACCOUNT_NUM = "1067523625001"; // 이용기관 계좌
  private final static String RECV_CLIENT_NAEM = "삼삼오오"; // 이용기관 계좌명
  private final static String RECV_CLIENT_BANK_CODE = "F99"; // 이용기관 은행코드

  // 임시 예약 정보 조회 (거래정보와 비교하기위해)
  @Override
  public ReservationVO getTempRsrv(){

    ReservationVO reservationVO  = cafeMapper.selectTempRsrv();

    return reservationVO;
  }

  // 결제 임시상태 참여회원 정보 조회 (거래정보와 비교하기위해)
  @Override
  public ApplyMemberVO getTempApplyMember(){

    ApplyMemberVO applyMemberVO  = applyMemberMapper.selectTempApplyMember();

    return applyMemberVO;
  }

  @Override
  public List<PaymentAcntDTO> getAcntList(String id) {
    log.debug("getAcntList({}) is invoked",id);
    List<PaymentAcntDTO> acntList = new ArrayList<PaymentAcntDTO>();

    // 1. 접근 정보 불러오기
    PaymentAuthDTO auth = mapper.selectAuth(id);

    if(auth != null ) {

      // 2. 오픈뱅킹 api에서 계좌 json 받아오기 : 사용자 계좌 조회
      RestTemplate restTemplate = new RestTemplate();

      String url = "https://testapi.openbanking.or.kr/v2.0/user/me";

      HttpHeaders headers = new HttpHeaders();
      headers.add("Authorization", auth.getTokenType() + " "+ auth.getAccessToken());
      HttpEntity entity = new HttpEntity(headers);

      UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(url)
          .queryParam("user_seq_no", auth.getUserSeqNo());

      ResponseEntity<String> response = restTemplate.exchange(uriBuilder.toUriString(), HttpMethod.GET, entity, String.class);

      ObjectMapper mapper = new ObjectMapper();
      JsonNode root;

      try {
        root = mapper.readTree(response.getBody());
        JsonNode node = root.path("res_list");

        // 참고 : https://livenow14.tistory.com/68
        try {
          ObjectMapper objectMapper = new ObjectMapper();
          objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
          acntList = Arrays.asList(objectMapper.readValue(node.toPrettyString(), PaymentAcntDTO[].class));

        } catch (JsonProcessingException e) {
          throw new RuntimeJsonMappingException("객체를 매핑할 수 없습니다.");
        } // t-c

      } catch (JsonProcessingException e) {
        e.printStackTrace();
      } // t-c

    } // if

    return acntList;
  } // getAcntList



  /*비즈니스 로직*/
  public void connectAuth(String code, String id, String action) {
    log.debug("connectAuth({},{}) is invoked", code, id);

    System.out.println(id);

    // api에서 정보 받아오기
    PaymentAuthDTO auth = getAuth(code, id, action);

    System.out.println(auth.getId());
    System.out.println(auth.getAccessToken());

    // 중복 내용 있는지 확인하기
    int cnt = mapper.checkBeforeInsertAuth(auth);
    System.out.println(cnt);

    // db에 저장할지말지 결정해서 넣기
    if(cnt < 1) {
      mapper.insertAuth(auth);
    } // fi
  } // connectAuth



  /*--------------------------- DB 연결 없이 api 정보만 받아오는 Service -------------------------------*/

  // code, id로 token 받기
  @Override
  public PaymentAuthDTO getAuth(String code, String id, String action) {
    log.debug("getAuth({},{},{}) is invoked", code, id);


    // 1. 액서스 토큰 발급, 사용자 번호 발급
    RestTemplate restTemplate = new RestTemplate();
    String url = "https://testapi.openbanking.or.kr/oauth/2.0/token";

    MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
    parameters.add("code", code);
    parameters.add("client_id", CLIENT_ID);
    parameters.add("client_secret", CLIENT_SECRET);
    parameters.add("grant_type", GRANK_TYPE);
    parameters.add("redirect_uri", REDIRECT_URL+action);

    PaymentAuthDTO paymentAuthDTO = restTemplate.postForObject(url, parameters, PaymentAuthDTO.class);
    paymentAuthDTO.setId(id);
    log.info("PaymentAuthDTO({}): ", paymentAuthDTO);

    return paymentAuthDTO;

  } // getAuth

  // 받은 token으로 fin-num 조회
  @Override
  public List<PaymentAcntDTO> getAcnt(PaymentAuthDTO auth) {
    log.debug("getAcnt({}) is invoked", auth);


    // 오픈뱅킹 api에서 계좌 json 받아오기 : 사용자 계좌 조회
    RestTemplate restTemplate = new RestTemplate();

    String url = "https://testapi.openbanking.or.kr/v2.0/user/me";

    HttpHeaders headers = new HttpHeaders();
    headers.add("Authorization", auth.getTokenType() + " "+ auth.getAccessToken());

    HttpEntity entity = new HttpEntity(headers);

    UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(url)
        .queryParam("user_seq_no", auth.getUserSeqNo());

    ResponseEntity<String> response =
        restTemplate.exchange(uriBuilder.toUriString(), HttpMethod.GET, entity, String.class);

    ObjectMapper mapper = new ObjectMapper();
    JsonNode root;

    List<PaymentAcntDTO> acntList = new ArrayList<PaymentAcntDTO>();

    try {
      root = mapper.readTree(response.getBody());
      JsonNode node = root.path("res_list");

      // 참고 : https://livenow14.tistory.com/68
      try {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        acntList = Arrays.asList(objectMapper.readValue(node.toPrettyString(), PaymentAcntDTO[].class));

      } catch (JsonProcessingException e) {
        throw new RuntimeJsonMappingException("객체를 매핑할 수 없습니다.");
      } // t-c

    } catch (JsonProcessingException e) {
      e.printStackTrace();
    } // t-c

    return acntList;
  } // getAcnt



  // fin-num으로 출금이체 시도
  @Override
  public PaymentWithdrawDTO getWithdrawDto(List<PaymentAcntDTO> acnt, PaymentAuthDTO auth, String param) {
    log.debug("getWithdrawDto({}) is invoked", acnt);

    // 은행거래고유번호 생성을 위해 난수 생성
    String ran = RandomGenerator.numberGen(9,1);

    Date today = new Date();
    SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMddHHmmss");
    String formatStr = dateformat.format(today);
    // 출금이체
    RestTemplate restTemplate = new RestTemplate();
    String url = "https://testapi.openbanking.or.kr/v2.0/transfer/withdraw/fin_num";

    HttpHeaders headers = new HttpHeaders();
    headers.add("Authorization", auth.getTokenType() + " "+ auth.getAccessToken());
    headers.setContentType(MediaType.APPLICATION_JSON);


    JSONObject jsonObject = new JSONObject();
    jsonObject.put("bank_tran_id","M202113457U" + ran);
    jsonObject.put("cntr_account_type", "N");
    jsonObject.put("cntr_account_num", CLIENT_ACCOUNT_NUM);
    jsonObject.put("dps_print_content", param);
    jsonObject.put("fintech_use_num", acnt.get(0).getFintechUseNum());
    jsonObject.put("tran_amt", "10000");
    jsonObject.put("wd_print_content", param);
    jsonObject.put("tran_dtime",formatStr);
    jsonObject.put("req_client_name", "신지혜");
    jsonObject.put("req_client_num", "SHINJIHYE0223");
    jsonObject.put("transfer_purpose", "ST");
    jsonObject.put( "req_client_fintech_use_num", acnt.get(0).getFintechUseNum());
    jsonObject.put("recv_client_name", RECV_CLIENT_NAEM);
    jsonObject.put("recv_client_bank_code", RECV_CLIENT_BANK_CODE);
    jsonObject.put("recv_client_account_num", CLIENT_ACCOUNT_NUM);
    log.info("jsonObject({}) is :: ", jsonObject);

    HttpEntity entity = new HttpEntity(jsonObject.toString(), headers);
    log.info("entity({}) is :: ", entity);

    ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
    log.info("response({}) is :: ", response);

    ObjectMapper mapper = new ObjectMapper();
    JsonNode root;

//    List<PaymentAcntDTO> acntList = new ArrayList<PaymentAcntDTO>();
    PaymentWithdrawDTO paymentWithdrawDTO = new PaymentWithdrawDTO();

    try {
      root = mapper.readTree(response.getBody());
      log.info("root({}) is :: ", root);
      JsonNode node = root;

      try {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        log.info("objectMapper({}) is :: ", objectMapper);
        paymentWithdrawDTO= objectMapper.treeToValue(root, PaymentWithdrawDTO.class);
        log.info("paymentWithdrawDTO({}) is :: ", paymentWithdrawDTO);

      } catch (JsonProcessingException e) {
        throw new RuntimeJsonMappingException("객체를 매핑할 수 없습니다.");
      } // t-c

    } catch (JsonProcessingException e) {
      e.printStackTrace();
      log.info("오류 세번째 캐치캐치미 :: ");
    } // t-c

    log.info("paymentWithdrawDTO({}) is :: ", paymentWithdrawDTO);




    return paymentWithdrawDTO;
  } // getWithdrawDto




  // 받은 token으로 Diposit
  @Override
  public PaymentDepositDTO getDipositDto(List<PaymentAcntDTO> acnt, PaymentAuthDTO auth) {
    log.debug("getAcnt({}) is invoked", auth);

    // 은행거래고유번호 생성을 위해 난수 생성
    String ran = RandomGenerator.numberGen(9,1);

    Date today = new Date();
    SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMddHHmmss");
    String formatStr = dateformat.format(today);


    RestTemplate restTemplate = new RestTemplate();

    String url = "https://testapi.openbanking.or.kr/v2.0/transfer/deposit/fin_num";

    HttpHeaders headers = new HttpHeaders();
    headers.add("Authorization", auth.getTokenType() + " "+ auth.getAccessToken());
    headers.setContentType(MediaType.APPLICATION_JSON);

    JSONObject req_list = new JSONObject();
    req_list.put("tran_no","11");
    req_list.put("bank_tran_id","M202113457U" + ran);
    req_list.put("fintech_use_num", acnt.get(0).getFintechUseNum());
    req_list.put("print_content", "카페예약취소");
    req_list.put("tran_amt","4100");
    req_list.put("req_client_name", "박상준"); // 요청자 이름
    req_list.put("req_client_fintech_use_num", acnt.get(0).getFintechUseNum());
    req_list.put("req_client_num","Shinjihye"); // 회원 아이디
    req_list.put("transfer_purpose", "ST");

    JSONArray array = new JSONArray();
    array.add(0,req_list);

    log.info("jsonObject({}) is :: ", req_list);


    JSONObject jsonObject = new JSONObject();
    jsonObject.put("cntr_account_type","N");
    jsonObject.put("cntr_account_num", CLIENT_ACCOUNT_NUM);
    jsonObject.put("wd_pass_phrase", "NONE");
    jsonObject.put("wd_print_content", "카페예약취소");
    jsonObject.put("name_check_option", "off");
    jsonObject.put("tran_dtime", formatStr);
    jsonObject.put("req_cnt","1");
    jsonObject.put("req_list", array);

    log.info("jsonObject({}) is :: ", jsonObject);

    HttpEntity entity = new HttpEntity(jsonObject.toString(), headers);
    log.info("entity({}) is :: ", entity);

    ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
    log.info("response({}) is :: ", response);


    ObjectMapper mapper = new ObjectMapper();
    JsonNode root;

    PaymentDepositDTO paymentDepositDTO = new PaymentDepositDTO();

    try {
      root = mapper.readTree(response.getBody());
      JsonNode node = root.path("res_list");

      // 참고 : https://livenow14.tistory.com/68
      try {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        paymentDepositDTO = objectMapper.readValue(node.toPrettyString(), PaymentDepositDTO.class);

        log.info("paymentDepositDTO({}) is :: ", paymentDepositDTO);
      } catch (JsonProcessingException e) {
        throw new RuntimeJsonMappingException("객체를 매핑할 수 없습니다.");
      } // t-c

    } catch (JsonProcessingException e) {
      e.printStackTrace();
    } // t-c

    return paymentDepositDTO;
  } // getDipositDto




  /*--------------------------- DB 연결 ㅇㅇ -------------------------------*/

  // 새 거래내역 insert
  @Override
  public boolean registerTrnsc(TransactionDTO transactionDTO) {
    log.debug("registerTrnsc({}) is invoked", transactionDTO);

    boolean result = this.mapper.insertTrnsc(transactionDTO);
    return result;
  } // registerTrnsc

  // 거래정보 등록실패시 관련 예약정보 삭제
  @Override
  public Integer deleteRsrv(String tempRsrvIdx) {
    log.debug("deleteRsrv({}) is invoked", tempRsrvIdx);

    Integer result = cafeMapper.deleteReservation(tempRsrvIdx);

    return result;
  } // deleteRsrv

  // 거래정보 등록 성공시 예약정보 업데이트
  @Override
  public Integer setReservation(String tempRsrvIdx) {
    log.debug("setReservation({}) is invoked", tempRsrvIdx);

    Integer result = cafeMapper.setReservation(tempRsrvIdx);
    return result;
  } // setReservation




  @Override
  public void destroy() throws Exception {

  }

  @Override
  public void afterPropertiesSet() throws Exception {

  }

}

























