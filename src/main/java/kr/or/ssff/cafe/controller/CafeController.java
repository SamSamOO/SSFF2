package kr.or.ssff.cafe.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/*

 */

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ssff.cafe.domain.CafeListVO;
import kr.or.ssff.cafe.domain.CafeVO;
import kr.or.ssff.cafe.model.CafeDTO;
import kr.or.ssff.cafe.model.ReservationDTO;
import kr.or.ssff.cafe.service.CafeService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/cafe")
@Controller
public class CafeController{

	@Setter(onMethod_= { @Autowired })
  private CafeService service;




  @PostMapping("/listData")
  @ResponseBody   //없으면 AJAX 통신 안됨
  public List<CafeListVO> getCafeList(
      @RequestBody String filterJSON,
      HttpServletResponse response,
      ModelMap model ) throws Exception {
    log.debug("getCafeList({},{},{}) is invoked",filterJSON, response, model );

    List<CafeListVO> allCafeList = this.service.getCafeList();
    List<CafeListVO> cafeList = null;
    try{
      log.info("\t refusal_action_try");
      log.info("\t filterJSON: "+filterJSON);
      log.info("\t response: "+response);
      log.info("\t model: "+model);

      ObjectMapper mapper = new ObjectMapper();

      HashMap<String, Integer> page = mapper.readValue(filterJSON, new HashMap<String, Integer>().getClass());

      int cp = page.get("curPage"); // 요청온 페이지
      int ps = page.get("pageListSize"); // 18개씩 보여주자

      log.info("\t+ cp: {}",cp);
      log.info("\t+ ps: {}",ps);

//      this.service.applyAction(aMember);


      log.info("\t allCafeList: ");
      log.info("\t allCafeList: "+allCafeList);

      cafeList = allCafeList.subList((cp-1)*ps,(cp*ps)-1); // 조회한 리스트에서 요청온 index만큼만 담아주자
      log.info("\t cafeList: "+cafeList);

    }catch(Exception e){

    }
    response.setContentType("text/html; charset=UTF-8");

    return cafeList;
  } // getCafeList



  /*
   * 스터디 카페 리스트를 조회
   * 매개변수:
   * 반환: 스터디 카페 리스트 뷰단
   * */
  @GetMapping("/list")
  public void selectCafeList(Model model){
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
  public String selectCafe(String cafeId){
    log.info("selectCafe({}) is invoked","cafeId = " + cafeId);

    return "cafe/detail";
  } // selectCafe


  /*
   * 스터디 카페 예약 처리
   * 매개변수: ReservationDTO (예약정보를 담은 DTO)
   * 반환: 결제화면(결제정상 처리여부 확인후 update
   * */
  @PostMapping("/reservation")
  public String insertReservation(ReservationDTO reservationDTO){

    return "redirect:결제화면(시도)->정상: update결제id, 비정상: delete예약정보";

  } // insertReservation

  /*
   * 스터디 카페 예약 내역 리스트를 조회 (회원==admin->all)
   * 매개변수: 회원닉네임
   * 반환: 스터디 카페 예약 내역 리스트 뷰단
   * */
  @GetMapping("/reservationList")
  public String selectReservationList(String nickName){
    log.info("selectReservationList({}) is invoked","nickName = " + nickName);

    return "cafe/reservationList";
  } // selectReservationList

  //-------------------------------- 지혜 카페 CRUD--------------------------------//

  /*
   * 스터디 카페 등록 화면
   * 매개변수:
   * 반환: 스터디 카페 등록 화면 뷰단
   * */
  @GetMapping("/registerView")
  public String insertCafeView(){
    log.info("insertCafeView() is invoked");

    return "cafe/registerView";
  } // insertCafeView

  /*
   * 스터디 카페 등록
   * 매개변수: 카페DTO (등록할 카페 정보를 담은 객체)
   * 반환: 스터디 카페 상세보기
   * */
  @PostMapping("/register")
  public String insertCafe(CafeDTO cafeDTO){
    log.info("insertCafe({}) is invoked","cafeDTO = " + cafeDTO);

    return "redirect:cafe/detail";
  } // insertCafe

  /*
   * 스터디 카페 수정 화면
   * 매개변수: 카페VO (수정할 카페 정보를 뿌려줄 객체)
   * 반환: 스터디 카페 수정 화면 뷰단
   * */
  @GetMapping("/modifyView")
  public String updateCafeView(CafeVO cafeVO){
    log.info("updateCafeView({}) is invoked","cafeVO = " + cafeVO);

    return "cafe/modifyView";
  } // updateCafeView

  /*
   * 스터디 카페 수정
   * 매개변수:카페DTO (수정할 카페 정보를 담은 객체)
   * 반환: 스터디 카페 상세보기
   * */
  @PostMapping("/modify")
  public String updateCafe(CafeDTO cafeDTO){
    log.info("updateCafe({}) is invoked","cafeDTO = " + cafeDTO);

    return "redirect:cafe/detail";
  } // updateCafe

  /*
   * 스터디 게시물 삭제
   * 매개변수: 카페ID
   * 반환: 카페 리스트 페이지로 이동
   * */
  @PostMapping("/remove")
  public String deleteCafe(String cafeId){
    log.info("deleteCafe({}) is invoked","cafeId = " + cafeId);

    return "redirect:cafe/list";
  } // deleteCafe
  
  
  

  
}

























