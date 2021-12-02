package kr.or.ssff.cafe.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import kr.or.ssff.cafe.domain.CafeListVO;
import kr.or.ssff.cafe.domain.CafeVO;
import kr.or.ssff.cafe.domain.ReservationDTO;
import kr.or.ssff.cafe.domain.RoomRsrvVO;
import kr.or.ssff.cafe.domain.RsrvJoinTrnscVO;
import kr.or.ssff.cafe.service.CafeService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@Log4j2
@NoArgsConstructor

@RequestMapping("/cafeRest")
@RestController
public class CafeRestController {

  @Setter(onMethod_ = {@Autowired})
  private CafeService service;


  /*
   * 스터디 카페 리스트를 비동기 조회
   * 매니저 단에서 활용
   * 매개변수: ajax로 전송받은 검색키워드
   * 반환: 스터디 카페 리스트 정보를 담은 JSON객체
   * */
  @RequestMapping(value= "/manager/listData",
      method = RequestMethod.POST,
      produces = "application/json; charset=UTF-8")
  //없으면 AJAX 통신 안됨
  public  JSONObject getManagerCafeList(
      @RequestBody HashMap<String, String> filterJSON
  ) throws Exception {
    log.debug("getManagerCafeList({}) is invoked", filterJSON);
    log.info("ajax 요청 도착!");

    // Cafe 모든 정보 담아내기
    List<CafeVO> cafeList = this.service.getManagerCafeList(filterJSON);

    //최종 완성될 JSONObject 선언(전체)
    JSONObject jsonObject = new JSONObject();

    jsonObject.put("cafeList", cafeList);


    return jsonObject;
  } // getManagerCafeList


  /*
   * 스터디 카페 비동기 insert
   * 매니저 단에서 활용
   * 매개변수: ajax로 전송받은 검색키워드
   * 반환: 스터디 카페 리스트 정보를 담은 JSON객체
   * */
//  @RequestMapping(value= "/reserve/insert",
//      method = RequestMethod.POST,
//      produces = "application/json; charset=UTF-8")
//  //없으면 AJAX 통신 안됨
//  public  JSONObject insertReservation(
//      @RequestBody HashMap<String, Object> filterJSON
//  ) throws Exception {
//    log.debug("insertReservation({}) is invoked", filterJSON);
//    log.info("ajax 요청 도착!");
//
//
//    ReservationDTO reservationDTO = new ReservationDTO();
//
//    reservationDTO.setMember_name((String) filterJSON.get("member_name"));
//    reservationDTO.setRoom_idx((String) filterJSON.get("room_idx"));
//    reservationDTO.setUse_date((Date) filterJSON.get("use_date"));
//    reservationDTO.setUse_start_time((Integer) filterJSON.get("use_start_time"));
//    reservationDTO.setUse_end_time((Integer) filterJSON.get("use_end_time"));
//    reservationDTO.setRsrv_idx((String) filterJSON.get("rsrv_name"));
//
//    reservationDTO.setRsrv_phone_number((String) filterJSON.get("rsrv_phone_number"));
//    reservationDTO.setRsrv_email((String) filterJSON.get("rsrv_email"));
//    reservationDTO.setRsrv_amount((Integer) filterJSON.get("rsrv_amount"));
//    reservationDTO.setRsrv_message((String) filterJSON.get("rsrv_message"));
//
//    log.info("reservationDTO({})!",reservationDTO );
//
//    JSONObject jsonObject = new JSONObject();
//    if (service.registerReservation(reservationDTO)) {
//      jsonObject.put("key", "true");
//    } // insertReservation
//
//    return jsonObject;
//  } // insertReservation

  /*
   * 스터디 카페 리스트를 비동기 조회
   * 사용자용 카페 리스트 화면에서 활용
   * 매개변수: ajax로 전송받은 JSON객체
   * 반환: 스터디 카페 리스트 정보를 담은 JSON객체
   * */
  @RequestMapping(value= "/listData", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
  //없으면 AJAX 통신 안됨
  public  JSONObject getCafeList(
      @RequestBody HashMap<String, Integer> filterJSON
  ) throws Exception {
    log.debug("getCafeList({}) is invoked", filterJSON);
    log.info("ajax 요청 도착!");

    // join상태의 모든 정보 담아내기 (중복정보 있는 상태)
    List<CafeListVO> list = this.service.getCafeList();

    //최종 완성될 JSONObject 선언(전체)
    JSONObject jsonObject = new JSONObject();
    //cafeInfo JSON정보를 담을 Array 선언
    JSONArray arr = new JSONArray();
    //cafe 하나의 정보가 들어갈 JSONObject 선언
    JSONObject cafeInfo = new JSONObject();
    //img를 모을 JSONObject 선언
    JSONObject roomImgs = new JSONObject();

    try {

      // filterJSON을 확인하기 위해 ObjectMapper 불러옴
      ObjectMapper mapper = new ObjectMapper();

      // page에 json에 담겨온 리스트 정보를
//      HashMap<String, Integer> page = mapper.readValue(filterJSON,
  //        new HashMap<String, Integer>().getClass());

      // 나눠서 담아주고
      int cp = filterJSON.get("curPage"); // 요청온 페이지 1
      int ps = filterJSON.get("pageListSize"); // 18개씩 보여주자

      log.info("\t+ cp: {}", cp); // 시작
      log.info("\t+ ps: {}", ps); // 18개 잘 왔니?

      log.info("\t list: " + list);

      // 총 list수만큼 조회해서 json 배열에 차곡차곡 담아주기
      for (int i = 0; i < list.size(); i++) {

        cafeInfo.put("cafe_idx", list.get(i).getCafe_idx());
        cafeInfo.put("cafe_location", list.get(i).getCafe_location());
        cafeInfo.put("amount_hour", list.get(i).getAmount_hour());
        cafeInfo.put("cafe_main_title", list.get(i).getCafe_main_title());
        cafeInfo.put("cafe_sub_title", list.get(i).getCafe_sub_title());
        cafeInfo.put("max_people", list.get(i).getMax_people());

        // 사진은 배열로 담기
        List<String> imgList = new ArrayList<>();
        imgList.add(list.get(i).getCafe_image_1());
        imgList.add(list.get(i).getCafe_image_2());
        imgList.add(list.get(i).getCafe_image_3());

        // 세부 룸 이미지는 한 컬럼에 모았기때문에 : 기준으로 잘 찢어서
        String[] rImgs = list.get(i).getRoom_list().split(":");

        // 찢은 길이만큼(=존재하는 row수만큼) 반복하며 차곡차곡 담아준다.
        for (int j = 0; j < rImgs.length; j++) {
          imgList.add(rImgs[j]);
        }

        // 카페이미지와 세부 룸 이미지를 모아 JSON에 배열로 추가
        cafeInfo.put("roomImgs", imgList);

        // 카페 하나의 정보와 이미지를 배열에 담습니다.
        arr.add(cafeInfo);

      }

      // 요청온 카드 수 만큼만 잘라서 제이슨 객체에 담아 가져가세요
      jsonObject.put("cafeList", arr.subList(((cp-1)*ps),((cp*ps)-1)));
      log.info("(cp-1)*ps ="+ ((cp-1)*ps));
      log.info(" end ="+ ((cp*ps)-1));

    } catch (Exception e) { ;; }

    // log.info("jsonObject {} =", jsonObject);

    // 페이지 처리한 JSON객체를 요청온 AJAX 보내주기 (list단)
    return jsonObject;
  } // getCafeList


  /*
   * 특정일자, 특정 room 예약정보만 비동기 조회
   * 매개변수: ajax로 전송받은 JSON객체(룸번호, 조회날짜)
   * 반환: 특정일자, 특정룸의 예약정보를 담은 JSON객체
   * */
  @RequestMapping(value= "/roomRsrvList", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
  //없으면 AJAX 통신 안됨
  public  JSONObject getRoomRsrvList(
      @RequestBody HashMap<String, String> filterJSON
  )  {
    log.debug("getRoomRsrvList({}) is invoked", filterJSON);
    log.info("ajax 요청 도착!");

    String SearchDate = filterJSON.get("date");
    String SearchRoom = filterJSON.get("room");

    log.info("SearchDate({}) is ", SearchDate);
    log.info("SearchRoom({}) is ", SearchRoom);
    // join상태의 모든 정보 담아내기 (중복정보 있는 상태)
    List<RoomRsrvVO> list = this.service.getRoomRsrvList(SearchRoom, SearchDate);
   //  log.debug("list({}) is ", list);
    //최종 완성될 JSONObject 선언(전체)
    JSONObject jsonObject = new JSONObject();

    jsonObject.put("roomRsrvList", list);

    // log.info("jsonObject({}) is ", jsonObject);

    return jsonObject;
  } // getCafeList



//---------------------------예약-----------

  /*
   * 예약내역 리스트를 비동기 조회
   * 매개변수: ajax로 전송받은 JSON객체
   * 반환: 스터디 카페 리스트 정보를 담은 JSON객체
   * */
  @RequestMapping(value= "/reservationList", method = RequestMethod.POST,
                  produces = "application/json; charset=UTF-8")
  //없으면 AJAX 통신 안됨
  public  JSONObject getReservationList(
      @RequestBody HashMap<String, String> searchKey
  ) throws Exception {
    log.debug("getReservationList({}) is invoked", searchKey);
    log.info("ajax 요청 도착!");

    // 예약 내역 가져오깅 `~
    List<RsrvJoinTrnscVO> list = this.service.getRsrvJoinTrnscList(searchKey);

    //최종 완성될 JSONObject 선언(전체)
    JSONObject jsonObject = new JSONObject();
    //cafeInfo JSON정보를 담을 Array 선언
    JSONArray arr = new JSONArray();

    jsonObject.put("reservationList", list);
    log.info("list({}) is >>>>>>>>>", list);
    // log.info("jsonObject {} =", jsonObject);

    // 페이지 처리한 JSON객체를 요청온 AJAX 보내주기 (list단)
    return jsonObject;
  } // getReservationList



  /*
   * 스터디 카페  예약을 취소
   * 매개변수: ajax로 전송받은 JSON객체(예약ID)
   * 반환:
   * */
  @RequestMapping(value= "/reservation/cancel", method = RequestMethod.POST,
      produces = "application/json; charset=UTF-8")
  //없으면 AJAX 통신 안됨
  public  JSONObject cancelReservation(
      @RequestBody HashMap<String, String> searchKey
  ) throws Exception {
    log.debug("removeReservation({}) is invoked", searchKey);
    log.info("ajax 요청 도착!");

    //최종 완성될 JSONObject 선언
    JSONObject jsonObject = new JSONObject();

    boolean result = this.service.cancelReservation(searchKey);

    if(result){
      jsonObject.put("result", result);
    }else {
      jsonObject = null;
    }

    log.info("jsonObject {} =", jsonObject);

    // 페이지 처리한 JSON객체를 요청온 AJAX 보내주기 (list단)
    return jsonObject;
  } // removeReservation












}
