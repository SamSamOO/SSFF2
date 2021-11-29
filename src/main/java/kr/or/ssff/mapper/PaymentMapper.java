package kr.or.ssff.mapper;

import java.util.List;
import kr.or.ssff.payment.model.PaymentAcntDTO;
import kr.or.ssff.payment.model.PaymentAuthDTO;
import kr.or.ssff.payment.model.TransactionDTO;
//import kr.or.ssff.payment.domain.PaymentBalanceDTO;


/*
 * 최초 작성자: 신지혜
 * 목적: Payment DAO (Data Access Object) : 지정된 테이블을 목록 조회, CRUD할 수 있는 메소드를 선언
 */


public interface PaymentMapper {

	void insertAuth(PaymentAuthDTO paymentAuthDTO);

	PaymentAuthDTO selectAuth(String id);


	int checkBeforeInsertAuth(PaymentAuthDTO vo);


	void insertACNT(PaymentAcntDTO vo);


//	void insertBalance(PaymentBalanceDTO vo);


	void mergeACNT(List<PaymentAcntDTO> list);

  boolean insertTrnsc(TransactionDTO transactionDTO);
//	void mergeBalance(List<PaymentBalanceDTO> list);


	
} // end interface
