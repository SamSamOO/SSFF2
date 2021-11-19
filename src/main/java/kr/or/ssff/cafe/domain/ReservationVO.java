package kr.or.ssff.cafe.domain;

/*

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


* */
public class ReservationVO {

}

























