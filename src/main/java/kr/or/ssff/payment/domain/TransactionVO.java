package kr.or.ssff.payment.domain;

import lombok.Value;

/*
 * 최초 작성자: 신지혜
 * 목적: trnsc table 관리
 */

/* trnsc table 구조
TRNSC_IDX								NVARCHAR2(25 CHAR)	No		1	거래번호
RSRV_IDX								NVARCHAR2(25 CHAR)	Yes		2	예약번호
APPLY_IDX								NVARCHAR2(25 CHAR)	Yes		3	참여번호
MEMBER_NAME							NVARCHAR2(20 CHAR)	No		4	닉네임
TRANSACTION_DATE				DATE								No	to_char(sysdate, 'YYYY/MM/DD') 	5	거래일자
TRANSACTION_CATEGORIES	NVARCHAR2(2 CHAR)		No		6	거래대분류
TRANSACTION_CATEGORIE		NVARCHAR2(10 CHAR)	No		7	거래소분류
TRANSACTION_AMOUNT			NUMBER							No		8	거래시도금액
CLIENT_ACCOUNT_NUMBER		NUMBER							No		9	계좌번호
CLIENT_BANK_CODE				NUMBER							No		10	은행코드
CLIENT_NAME							NVARCHAR2(25 CHAR)	No		11	예금주명
AMOUNT_TO_BE_PAID				NUMBER							Yes		12	거래완료금액
PAYMENT_COMPLETED_YN		CHAR(1 BYTE)				No	'n' 	13	거래완료여부

 */

@Value
public class TransactionVO {

	private String trnsc_idx;
	private String rsrv_idx;
	private String apply_idx;
	private String transaction_date;
	private String transaction_categories;
	private String transaction_categorie;
	private Integer transaction_amount;
	private String client_account_number;
	private Integer client_bank_code;
	private String client_name;
	private Integer amount_to_be_paid;
	private Character payment_completed_yn;

} // end class 

























