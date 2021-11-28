package kr.or.ssff.payment.service;

import java.util.List;

import kr.or.ssff.cafe.domain.ReservationVO;
import kr.or.ssff.payment.domain.PaymentAcntDTO;
import kr.or.ssff.payment.domain.PaymentAuthDTO;
import kr.or.ssff.payment.domain.PaymentDepositDTO;
import kr.or.ssff.payment.domain.PaymentWithdrawDTO;
import kr.or.ssff.payment.model.TransactionDTO;

/*

 */
public interface PaymentService {

  ReservationVO getTempRsrv();

  public abstract List<PaymentAcntDTO> getAcntList(String id);

  public abstract void connectAuth(String code, String id, String action);


  // ------------- DB 사용 없이 API 조회 ------------- //
	PaymentAuthDTO getAuth(String code, String id, String action);

  List<PaymentAcntDTO> getAcnt(PaymentAuthDTO auth);

  PaymentWithdrawDTO getWithdrawDto(List<PaymentAcntDTO> acnt,  PaymentAuthDTO auth);

  PaymentDepositDTO getDipositDto(List<PaymentAcntDTO> acnt, PaymentAuthDTO auth);

  // 새로운 거래정보 insert
  boolean registerTrnsc(TransactionDTO transactionDTO);

  // registerTrnsc 실패시 관련 예약정보도 삭제
  Integer deleteRsrv(String tempRsrvIdx);

  // registerTrnsc 성공시 관련 예약정보 상태사항 업데이트
  Integer setReservation(String tempRsrvIdx);

//	OpenbankBalanceVO getBalance(String id, String fintechUseNum);
//
//
//	List<OpenbankAcntVO> getAcntInfo(String id);
//	List<OpenbankBalanceVO> getBalanceInfo(String id);

} // end interface

























