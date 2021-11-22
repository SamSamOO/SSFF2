package kr.or.ssff.cafe.model;

import java.io.File;
import java.util.List;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

/*
ROOM_IDX        	NVARCHAR2(25 CHAR)	No		1	룸번호
CAFE_IDX        	NVARCHAR2(25 CHAR)	No		2	카페번호
MAX_PEOPLE	      NUMBER            	No		3	최대수용인원
AMOUNT_HOUR	      NUMBER            	No		4	시간당이용금액
TOTAL_ROOM_NUMBER	NUMBER            	No		5	보유개수
ROOM_IMAGE      	NVARCHAR2(200 CHAR)	No		6	대표이미지
*/
@Data
public class RoomDTO {

  private String room_idx;
  private String cafe_idx;
  private Integer max_people;

  private Integer amount_hour;
  private Integer total_room_number;

  private String room_image;


} // end class
























