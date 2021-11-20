package kr.or.ssff.cafe.domain;

/*
 예약화면으로 갈 때 예약 정보 담아들고가기 위한 class
 작성자 : 신지혜
 */

import java.util.Date;
import lombok.Data;
import lombok.Value;


@Data
public class RoomRsrvInfoDTO {

  private String room_idx;
  private String use_date;
  private Integer use_start_time;
  private Integer use_end_time;
  private String max_people;
  private Integer total_amount;

  private String cafe_idx;
  private String nickName;

} // end class

























