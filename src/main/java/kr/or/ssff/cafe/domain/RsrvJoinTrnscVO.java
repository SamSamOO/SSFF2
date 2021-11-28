package kr.or.ssff.cafe.domain;

/*
예약정보&거래내역&카페 클래스
예약정보 리스트 출력을 위한 정보만을
작성자 : 신지혜
 */

/*
RSRV_IDX	NVARCHAR2(25 CHAR)	No		1	예약번호
ROOM_IDX	NVARCHAR2(25 CHAR)	No		2	룸번호
MEMBER_NAME	NVARCHAR2(20 CHAR)	Yes		3	닉네임
USE_DATE	DATE	No	to_char(sysdate, 'YYYY/MM/DD') 	4	방문예정일자
USE_START_TIME	NUMBER	No		5	이용시작시간
USE_END_TIME	NUMBER	No		6	이용종료시간
RSRV_STATUS_YNZ	CHAR(1 BYTE)	No	'n' 	7	예약상태
RSRV_NAME	NVARCHAR2(20 CHAR)	No		8	  예약자명
RSRV_PHONE_NUMBER	NUMBER	No		9	  예약자휴대폰
RSRV_EMAIL	VARCHAR2(50 BYTE)	No		10	 예약자이메일
RSRV_MESSAGE	NVARCHAR2(200 CHAR)	Yes		11	요청사항
RSRV_AMOUNT	NUMBER	Yes		12	결제금액

* */

import java.util.Date;
import lombok.Value;


@Value
public class RsrvJoinTrnscVO {

  private String cafe_name;
  private Integer max_people;

  private String rsrv_idx;
  private String room_idx;
  private String member_name;
  private String use_date;
  private Integer use_start_time;
  private Integer  use_end_time;
  private Character  rsrv_status_ynz;
  private String rsrv_name;
  private Integer rsrv_phone_number;
  private String rsrv_email;
  private String rsrv_message;
  private Integer rsrv_amount;


  private String trnsc_idx;
  private String transaction_date; // DB에서 tochar (yyyy--)해서 string 타입으로 받음
  private String transaction_categories;
  private String transaction_categorie;
  private Integer transaction_amount;
  private String client_account_number;
  private Integer client_bank_code;
  private String client_name;
  private Integer amount_to_be_paid;
  private Character payment_completed_yn;



} // end class


























