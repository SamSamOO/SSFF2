package kr.or.ssff.payment.model;


import com.fasterxml.jackson.annotation.JsonProperty;


import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("pAcnt")
public class PaymentAcntDTO {

  private String id;

  @JsonProperty(value = "fintech_use_num")
  private String fintechUseNum;

  @JsonProperty(value = "account_alias")
  private String accountAlias;

  @JsonProperty(value = "bank_code_std")
  private String bankCodeStd;

  @JsonProperty(value = "bank_code_sub")
  private String bankCodeSub;

  @JsonProperty(value = "bank_name")
  private String bankName;

  @JsonProperty(value = "account_num")
  private String accountNum;

  @JsonProperty(value = "account_num_masked")
  private String accountNumMasked;

  @JsonProperty(value = "account_holder_name")
  private String accountHolderName;

  @JsonProperty(value = "account_holder_type")
  private String accountHolderType;

  @JsonProperty(value = "acount_type")
  private String acountType;

  @JsonProperty(value = "inquiry_agree_yn")
  private String inquiryAgreeYn;

  @JsonProperty(value = "inquiry_agree_dtime")
  private String inquiryAgreeDtime;

}
