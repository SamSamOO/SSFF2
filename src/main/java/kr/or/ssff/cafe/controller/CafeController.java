package kr.or.ssff.cafe.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import kr.or.ssff.cafe.domain.CafeInfoVO;
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
import oracle.jdbc.proxy.annotation.Post;
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
   * 스터디 카페 단일 상세화면을 조회
   * 매개변수: 스터디카페ID
   * 반환: 스터디 카페 단일 상세화면 뷰단
   * */
  @PostMapping("/reserve")
  public void selectCafe(String cafeId, Model model) {
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
