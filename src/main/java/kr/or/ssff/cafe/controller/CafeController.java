package kr.or.ssff.cafe.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import kr.or.ssff.cafe.domain.CafeListVO;
import kr.or.ssff.cafe.domain.CafeVO;
import kr.or.ssff.cafe.model.CafeDTO;
import kr.or.ssff.cafe.model.ReservationDTO;
import kr.or.ssff.cafe.service.CafeService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



@Log4j2
@NoArgsConstructor

@RequestMapping("/cafe")
@Controller
public class CafeController {

    @Setter(onMethod_ = {@Autowired})
    private CafeService service;


    /*
     * 스터디 카페 리스트를 조회
     * 매개변수:
     * 반환: 스터디 카페 리스트 뷰단
     * */
    @GetMapping("/list")
    public void selectCafeList(Model model) {
        log.info("selectCafeList() is invoked");

        List<CafeListVO> cafeList = this.service.getCafeList();

        model.addAttribute("cafeList", cafeList);
    } // selectCafeList


    /*
     * 스터디 카페 리스트를 비동기 조회
     * 매개변수: ajax로 전송받은 JSON객체
     * 반환: 스터디 카페 리스트 정보를 담은 JSON객체
     * */
    @RequestMapping(value = "/listData", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    @ResponseBody   //없으면 AJAX 통신 안됨
    public JSONObject getCafeList(
        @RequestBody String filterJSON
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
            HashMap<String, Integer> page = mapper.readValue(filterJSON,
                new HashMap<String, Integer>().getClass());

            // 나눠서 담아주고
            int cp = page.get("curPage"); // 요청온 페이지 1
            int ps = page.get("pageListSize"); // 18개씩 보여주자

            log.info("\t+ cp: {}", cp); // 시작
            log.info("\t+ ps: {}", ps); // 18개 잘 왔니?

            log.info("\t list: " + list);

            // 총 list수만큼 조회해서 json 배열에 차곡차곡 남아주기
            for (int i = 0; i < list.size(); i++) {

                cafeInfo.put("cafe_idx", list.get(i).getCafe_idx());
                cafeInfo.put("cafe_location", list.get(i).getCafe_location());
                cafeInfo.put("amount_hour", list.get(i).getAmount_hour());
                cafeInfo.put("cafe_main_title", list.get(i).getCafe_main_title());
                cafeInfo.put("cafe_sub_title", list.get(i).getCafe_sub_title());
                cafeInfo.put("max_people", list.get(i).getMax_people());

                // 사진은 배열로 담기
                List<String> imgList = new ArrayList<>();
                imgList.add(list.get(i).getCafe_image_first());
                imgList.add(list.get(i).getCafe_image_second());
                imgList.add(list.get(i).getCafe_image_third());

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

                log.info("1. arr {}: " + arr);
            }
            log.info("2. arrsubList {}: " + arr.subList(((cp - 1) * ps), ((cp * ps) - 1)));

            // 요청온 카드 수 만큼만 잘라서 제이슨 객체에 담아 가져가세요
            jsonObject.put("cafeList", arr.subList(((cp - 1) * ps), ((cp * ps) - 1)));
            log.info("(cp-1)*ps =" + ((cp - 1) * ps));
            log.info(" end =" + ((cp * ps) - 1));

        } catch (Exception e) {
            ;
            ;
        }


        // 카페이미지와 세부 룸 이미지를 모아 JSON에 배열로 추가
        cafeInfo.put("roomImgs", imgList);

        // 카페 하나의 정보와 이미지를 배열에 담습니다.
        arr.add(cafeInfo);

        log.info("1. arr {}: "+ arr);
      }
      log.info("2. arrsubList {}: "+ arr.subList(((cp-1)*ps),((cp*ps)-1)));

      // 요청온 카드 수 만큼만 잘라서 제이슨 객체에 담아 가져가세요
      jsonObject.put("cafeList", arr.subList(((cp-1)*ps),((cp*ps)-1)));
      log.info("(cp-1)*ps ="+ ((cp-1)*ps));
      log.info(" end ="+ ((cp*ps)-1));

    } catch (Exception e) { ;; }

    log.info("jsonObject {} =", jsonObject);

    // 페이지 처리한 JSON객체를 요청온 AJAX 보내주기 (list단)
    return jsonObject;
  } // getCafeList



  /*
   * 스터디 카페 단일 상세화면을 조회
   * 매개변수: 스터디카페ID
   * 반환: 스터디 카페 단일 상세화면 뷰단
   * */
  @GetMapping("/detail")
  public void selectCafe(@RequestParam("cafe_idx") String cafeId, Model model) {
    log.info("selectCafe({}) is invoked", "cafeId = " + cafeId);

    List<CafeInfoVO> cafeInfo = service.getCafe(cafeId);
    log.info("cafeInfo{} : " ,cafeInfo);
    
    model.addAttribute("cafeInfo", cafeInfo);   
  } // selectCafe


  /*
   * 스터디 카페 예약 처리
   * 매개변수: ReservationDTO (예약정보를 담은 DTO)
   * 반환: 결제화면(결제정상 처리여부 확인후 update
   * */
  @PostMapping("/reservation")
  public String insertReservation(ReservationDTO reservationDTO) {

    return "redirect:결제화면(시도)->정상: update결제id, 비정상: delete예약정보";

  } // insertReservation

  /*
   * 스터디 카페 예약 내역 리스트를 조회 (회원==admin->all)
   * 매개변수: 회원닉네임
   * 반환: 스터디 카페 예약 내역 리스트 뷰단
   * */
  @GetMapping("/reservationList")
  public String selectReservationList(String nickName) {
    log.info("selectReservationList({}) is invoked", "nickName = " + nickName);

    return "cafe/reservationList";
  } // selectReservationList

  //-------------------------------- 지혜 카페 CRUD--------------------------------//

  /*
   * 스터디 카페 등록 화면
   * 매개변수:
   * 반환: 스터디 카페 등록 화면 뷰단
   * */
  @GetMapping("/registerView")
  public String insertCafeView() {
    log.info("insertCafeView() is invoked");

    return "cafe/registerView";
  } // insertCafeView

  /*
   * 스터디 카페 등록
   * 매개변수: 카페DTO (등록할 카페 정보를 담은 객체)
   * 반환: 스터디 카페 상세보기
   * */
  @PostMapping("/register")
  public String insertCafe(CafeDTO cafeDTO) {
    log.info("insertCafe({}) is invoked", "cafeDTO = " + cafeDTO);

    return "redirect:cafe/detail";
  } // insertCafe

  /*
   * 스터디 카페 수정 화면
   * 매개변수: 카페VO (수정할 카페 정보를 뿌려줄 객체)
   * 반환: 스터디 카페 수정 화면 뷰단
   * */
  @GetMapping("/modifyView")
  public String updateCafeView(CafeVO cafeVO) {
    log.info("updateCafeView({}) is invoked", "cafeVO = " + cafeVO);

    return "cafe/modifyView";
  } // updateCafeView

  /*
   * 스터디 카페 수정
   * 매개변수:카페DTO (수정할 카페 정보를 담은 객체)
   * 반환: 스터디 카페 상세보기
   * */
  @PostMapping("/modify")
  public String updateCafe(CafeDTO cafeDTO) {
    log.info("updateCafe({}) is invoked", "cafeDTO = " + cafeDTO);

    return "redirect:cafe/detail";
  } // updateCafe

  /*
   * 스터디 게시물 삭제
   * 매개변수: 카페ID
   * 반환: 카페 리스트 페이지로 이동
   * */
  @PostMapping("/remove")
  public String deleteCafe(String cafeId) {
    log.info("deleteCafe({}) is invoked", "cafeId = " + cafeId);

    return "redirect:cafe/list";
  } // deleteCafe

      


}

























