package kr.or.ssff.cafe.domain;

/*
 CAFE table 관리를 위한 class
 작성자 : 신지혜
 */

import lombok.Value;

/*
CAFE_IDX	                NVARCHAR2(25 CHAR)	No		1	카페번호
CAFE_NAME               	NVARCHAR2(50 CHAR)	No		2	카페명
CAFE_TELEPHONE_NUMBER   	NVARCHAR2(15 CHAR)	Yes		3	대표번호
CAFE_LOCATION	            NVARCHAR2(50 CHAR)	No		4	카페위치
CAFE_OPEN_TIME	          NUMBER              No		5	영업시작시간
CAFE_CLOSE_TIME           NUMBER              No		6	영업종료시간
CAFE_CONTACT_PHONE_NUMBER	NVARCHAR2(15 CHAR)	No		7	담당자연락처
CAFE_CONTACT_EMAIL	      NVARCHAR2(50 CHAR)	No		8	담당자이메일
CAFE_MAIN_TITLE	          NVARCHAR2(50 CHAR)	No		9	홍보글제목
CAFE_SUB_TITLE          	NVARCHAR2(50 CHAR)	No		10	홍보글부제목
CAFE_DETAILS             	NVARCHAR2(1000 CHAR)	Yes		11	홍보글내용
CAFE_REMOVE_YN          	CHAR(1 BYTE)      	No	'n' 	12	삭제여부
CAFE_image_1        	NVARCHAR2(200 CHAR)	No		13	이미지1
CAFE_image_2	        NVARCHAR2(200 CHAR)	No		14	이미지2
CAFE_image_3	        NVARCHAR2(200 CHAR)	No		15	이미지3

BOSS_NAME	                NVARCHAR2(20 CHAR)	No		16  대표이름
BUSINESS_NUMBER           NUMBER	            No		17  사업자번호
*/

@Value
public class CafeVO {

  private String cafe_idx;
  private String cafe_name;
  private String cafe_telephone_number;
  private String cafe_location;
  private Integer cafe_open_time;
  private Integer cafe_close_time;
  private String cafe_contact_phone_number;
  private String cafe_contact_email;
  private String cafe_main_title;
  private String cafe_sub_title;
  private String cafe_details;
  private Character cafe_remove_yn;
  private String cafe_image_1;
  private String cafe_image_2;
  private String cafe_image_3;
  private String boss_name;
  private Integer business_number;

} // end class

























