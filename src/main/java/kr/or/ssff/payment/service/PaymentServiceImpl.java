package kr.or.ssff.payment.service;

/*

 */

//

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.RuntimeJsonMappingException;
import java.util.ArrayList;
import java.util.Arrays;
import kr.or.ssff.mapper.PaymentMapper;
import kr.or.ssff.payment.domain.PaymentAcntDTO;
import kr.or.ssff.payment.domain.PaymentAuthDTO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

import java.util.List;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
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

  private final static String CLIENT_ID = "8492614f-7af7-472e-9c00-f0b61b38ed33";
  private final static String CLIENT_SECRET = "e9366e92-5b66-450e-8299-f1ebbf9473db";
  private final static String GRANK_TYPE = "authorization_code";
  private final static String REDIRECT_URL = "http://localhost:8070/payment/rest/callback";
  private final static String 이용기관코드 = "M202113457U";



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
  public void connectAuth(String code, String id) {
    log.debug("connectAuth({},{}) is invoked", code, id);

    System.out.println(id);

    // api에서 정보 받아오기
    PaymentAuthDTO auth = getAuth(code, id);

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

  @Override
  public PaymentAuthDTO getAuth(String code, String id) {
    log.debug("getAuth({},{}) is invoked", code, id);


    // 1. 액서스 토큰 발급, 사용자 번호 발급
    RestTemplate restTemplate = new RestTemplate();
    String url = "https://testapi.openbanking.or.kr/oauth/2.0/token";

    MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
    parameters.add("code", code);
    parameters.add("client_id", CLIENT_ID);
    parameters.add("client_secret", CLIENT_SECRET);
    parameters.add("grant_type", GRANK_TYPE);
    parameters.add("redirect_uri", REDIRECT_URL);

    PaymentAuthDTO paymentAuthDTO = restTemplate.postForObject(url, parameters, PaymentAuthDTO.class);
    paymentAuthDTO.setId(id);
    log.info("PaymentAuthDTO({}): ", paymentAuthDTO);

    return paymentAuthDTO;

  } // getAuth

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

    ResponseEntity<String> response = restTemplate.exchange(uriBuilder.toUriString(), HttpMethod.GET, entity, String.class);

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













  @Override
  public void destroy() throws Exception {

  }

  @Override
  public void afterPropertiesSet() throws Exception {

  }

}

























