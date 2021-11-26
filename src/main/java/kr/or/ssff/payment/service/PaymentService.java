package kr.or.ssff.payment.service;

import java.util.List;

import kr.or.ssff.cafe.domain.CafeListVO;
import kr.or.ssff.payment.domain.PaymentAcntDTO;
import kr.or.ssff.payment.domain.PaymentAuthDTO;

/*

 */
public interface PaymentService {

  public abstract List<PaymentAcntDTO> getAcntList(String id);

  public abstract void connectAuth(String code, String id);

	PaymentAuthDTO getAuth(String code, String id);
	List<PaymentAcntDTO> getAcnt(PaymentAuthDTO auth);
//	OpenbankBalanceVO getBalance(String id, String fintechUseNum);
//
//
//	List<OpenbankAcntVO> getAcntInfo(String id);
//	List<OpenbankBalanceVO> getBalanceInfo(String id);

} // end interface

























