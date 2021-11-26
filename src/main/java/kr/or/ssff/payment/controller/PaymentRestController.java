package kr.or.ssff.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.ssff.cafe.domain.CafeVO;
import kr.or.ssff.payment.domain.PaymentAcntDTO;
import kr.or.ssff.payment.domain.PaymentAuthDTO;
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

//     service.connectAuth(code, id); // db에 저장할지말지 결정해서 auth 저장

    PaymentAuthDTO paymentAuthDTO = service.getAuth(code, id);
    log.info("paymentAuthDTO({}): ", paymentAuthDTO);
//		return "<script>opener.location.reload();window.close();</script>";
    List<PaymentAcntDTO> acntList = service.getAcnt(paymentAuthDTO);
    log.info("acntList({}): ", acntList);

    // userMe(paymentAuthDTO.getTokenType(), paymentAuthDTO.getAccessToken(), paymentAuthDTO.getUserSeqNo());

    return "<script>window.close();</script>";
  } // getManagerCafeList



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


} // end class

























