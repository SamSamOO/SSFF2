package kr.or.ssff.payment.model;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("pDeposit")
public class PaymentDepositDTO {

  private String id;

//  @JsonProperty(value = "api_tran_id")
//  private String apiTranId;
//
//  @JsonProperty(value = "rsp_code")
//  private String rspCode;
//
//  @JsonProperty(value = "rsp_message")
//  private String rspMessage;
//
//  @JsonProperty(value = "api_tran_dtm")
//  private String apiTranDtm;
//
//  @JsonProperty(value = "dps_bank_code_std")
//  private String dpsBankCodeStd;
//
//  @JsonProperty(value = "dps_bank_code_sub")
//  private String dpsBankCodeSub;
//
//  @JsonProperty(value = "dps_bank_name")
//  private String dpsBankName;
//
//  @JsonProperty(value = "dps_account_num_masked")
//  private String dpsAccountNumMasked;
//
//  @JsonProperty(value = "dps_print_content")
//  private String dpsPrintContent;
//
//  @JsonProperty(value = "dps_account_holder_name")
//  private String dpsAccountHolderName;

  @JsonProperty(value = "tran_no")
  private String tranNo;

  @JsonProperty(value = "bank_tran_id")
  private String bankTranId;

  @JsonProperty(value = "bank_tran_date")
  private String bankTranDate;

  @JsonProperty(value = "bank_code_tran")
  private String bankCodeTran;

  @JsonProperty(value = "bank_rsp_code")
  private String bankRspCode;

  @JsonProperty(value = "bank_rsp_message")
  private String bankRspMessage;

  @JsonProperty(value = "fintech_use_num")
  private String fintechUseNum;

  @JsonProperty(value = "account_alias")
  private String accountAlias;

  @JsonProperty(value = "bank_code_std")
  private String bandCodeStd;

  @JsonProperty(value = "bank_code_sub")
  private String bandCodeSub;

  @JsonProperty(value = "bank_name")
  private String bandName;

  @JsonProperty(value = "account_num_masked")
  private String accountNumMasked;

  @JsonProperty(value = "print_content")
  private String printContent;

  @JsonProperty(value = "tran_amt")
  private String tranAmt;

  @JsonProperty(value = "cms_num")
  private String cmsNum;

  @JsonProperty(value = "savings_bank_name")
  private String savingsBankName;

}
