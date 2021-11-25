package kr.or.ssff.cafe.domain;

/*
 cafe List view단 출력을 위해
 CAFE & ROOM table 조인 관리를 위한 class
 작성자 : 신지혜
 */

import lombok.Value;


@Value
public class CafeListVO {

  private String cafe_main_title;
  private String cafe_sub_title;
  private String cafe_image_1;
  private String cafe_image_2;
  private String cafe_image_3;
  private String cafe_location;
  private String cafe_idx;
  private Integer max_people;
  private Integer amount_hour;
  private String room_list;


} // end class

























