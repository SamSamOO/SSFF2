package kr.or.ssff.cafe.domain;

/*
 룸 예약 정보 조회만 위한 class
 작성자 : 신지혜
 */

import java.util.Date;
import lombok.Value;

/*
TOTAL_ROOM_NUMBER	NUMBER            	No		5	보유개수

ROOM_IDX	        NVARCHAR2(25 CHAR)	No		2	룸번호
USE_DATE          DATE       	No	to_char(sysdate, 'YYYY/MM/DD') 	4	방문예정일자
USE_START_TIME	  NUMBER              No		5	이용시작시간
USE_END_TIME	    NUMBER	            No		6	이용종료시간

* */

@Value
public class RoomRsrvVO {

  private String room_idx;
  private Date use_date;
  private Integer use_start_time;
  private Integer use_end_time;

  private Integer total_room_number;

} // end class

























