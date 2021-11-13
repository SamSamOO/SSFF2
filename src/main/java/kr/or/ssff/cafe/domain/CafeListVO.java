package kr.or.ssff.cafe.domain;

/*
 cafe List view단 출력을 위해
 CAFE & ROOM table 조인 관리를 위한 class
 작성자 : 신지혜
 */

import lombok.Value;


@Value
public class CafeListVO {


//  private String cafe_name;
//  private String cafe_telephone_number;

//  private String cafe_open_time;
//  private String cafe_close_time;
//  private String cafe_contact_phone_number;
//  private String cafe_contact_email;

//  private String cafe_details;

//  private String room_idx;
//  private String cafe_idx;

//  private Integer total_room_number;


  private String cafe_main_title;
  private String cafe_sub_title;
  private String cafe_image_first;
  private String cafe_image_second;
  private String cafe_image_third;
  private String cafe_location;
  private Integer max_people;
  private Integer amount_hour;
  private String room_image;
  private Character cafe_remove_yn;
  private String cafe_idx;



} // end class

























