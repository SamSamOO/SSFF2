package kr.or.ssff.payment.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import org.apache.ibatis.type.Alias;


@Data
@Alias("pAuth")
public class PaymentAuthDTO {
  private String id;
  private String scope;

  @JsonProperty(value = "access_token")
  private String accessToken;

  @JsonProperty(value = "refresh_token")
  private String refreshToken;

  @JsonProperty(value = "user_seq_no")
  private String userSeqNo;

  @JsonProperty(value = "expires_in")
  private long expiresIn;

  @JsonProperty(value = "token_type")
  private String tokenType;

} // end class
