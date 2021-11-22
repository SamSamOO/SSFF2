package kr.or.ssff.cafe.model;

import java.util.ArrayList;
import java.util.HashMap;
import lombok.Data;

/*
ROOM_IDX        	NVARCHAR2(25 CHAR)	No		1	룸번호
CAFE_IDX        	NVARCHAR2(25 CHAR)	No		2	카페번호
MAX_PEOPLE	      NUMBER            	No		3	최대수용인원
AMOUNT_HOUR	      NUMBER            	No		4	시간당이용금액
TOTAL_ROOM_NUMBER	NUMBER            	No		5	보유개수
ROOM_IMAGE      	NVARCHAR2(200 CHAR)	No		6	대표이미지
*/
@Data
public class Rooms {

  private ArrayList<HashMap<String, String>> rooms;

} // end class
























