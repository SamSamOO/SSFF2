package kr.or.ssff.payment.service;

import java.util.List;

import kr.or.ssff.cafe.domain.CafeListVO;
import kr.or.ssff.payment.domain.PaymentAcntDTO;
import kr.or.ssff.payment.domain.PaymentAuthDTO;
import kr.or.ssff.payment.domain.PaymentWithdrawDTO;

/*

 */
public interface PaymentService {

  public abstract List<PaymentAcntDTO> getAcntList(String id);

  public abstract void connectAuth(String code, String id);


  // ------------- DB 사용 없이 API 조회 ------------- //
	PaymentAuthDTO getAuth(String code, String id);

  List<PaymentAcntDTO> getAcnt(PaymentAuthDTO auth);

  PaymentWithdrawDTO getWithdrawDto(List<PaymentAcntDTO> acnt,  PaymentAuthDTO auth);
//	OpenbankBalanceVO getBalance(String id, String fintechUseNum);
//
//
//	List<OpenbankAcntVO> getAcntInfo(String id);
//	List<OpenbankBalanceVO> getBalanceInfo(String id);

} // end interface

























