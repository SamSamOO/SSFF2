package kr.or.ssff.cafe.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import kr.or.ssff.cafe.domain.*;
import kr.or.ssff.cafe.model.CafeDTO;
import kr.or.ssff.cafe.model.RoomDTO;
import kr.or.ssff.cafe.service.CafeService;
import kr.or.ssff.studyIns.Utils.UploadFileUtils;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;


@Log4j2
@NoArgsConstructor

@RequestMapping("/cafe")
@Controller
public class CafeController{
    
    @Autowired
    private CafeService service;
    
    
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
    public void selectCafe(@RequestParam("cafe_idx") String cafeId, Model model){
        log.info("selectCafe({}) is invoked", "cafeId = " + cafeId);
        
        List<CafeInfoVO> cafeInfo = service.getCafeJoinRoom(cafeId);
        //log.info("cafeInfo{} : ", cafeInfo);
        
        model.addAttribute("cafeInfo", cafeInfo);
    } // selectCafe
    
    
    //ㅅtest
    @GetMapping("/ttt")
    public void goResiierve(
            @ModelAttribute("roomRsrvInfoDTO") RoomRsrvInfoDTO roomRsrvInfoDTO, Model model
            , HttpServletRequest request
    ){
        log.info("ttt({}) is invoked", roomRsrvInfoDTO);
        
        HttpSession sessionfalse = request.getSession(false);
        log.info("sessionfalse({}) is ", sessionfalse);
        
        
        HttpSession session = request.getSession();
        log.info("session({}) is ", session);
        
        
        // String cafe_idx = roomRsrvInfoDTO.getCafe_idx();
        CafeVO cafeVO = service.getCafe(roomRsrvInfoDTO.getCafe_idx());
        
        model.addAttribute("cafeVO", cafeVO);
        model.addAttribute("roomRsrvInfoDTO", roomRsrvInfoDTO);
        
        log.info("model{}", model);
        
    } // insertReserve
    
    //ㅅtest
    @GetMapping("/sTest")
    public void s(
            
            HttpServletRequest request
    ){
        log.info("sTest({}) is invoked");
        
        HttpSession sessionfalse = request.getSession(false);
        log.info("sessionfalse({}) is ", sessionfalse);
        
        String r_idx = (String) sessionfalse.getAttribute("r_idx");
        
        String a_status = (String) sessionfalse.getAttribute("a_status");
        String sessionId = (String) sessionfalse.getAttribute("sessionId");
        log.info("sessionfalse({},{},{}) is ", r_idx, sessionId, a_status);
        
        //
//
//
        HttpSession session = request.getSession();
        log.info("session({}) is ", session);

//
//
//    // String cafe_idx = roomRsrvInfoDTO.getCafe_idx();
//    CafeVO cafeVO = service.getCafe(roomRsrvInfoDTO.getCafe_idx());
//
//    model.addAttribute("cafeVO", cafeVO);
//    model.addAttribute("roomRsrvInfoDTO", roomRsrvInfoDTO);
//
//    log.info("model{}", model);

  } // insertReserve

  /*
   * 스터디 카페 예약 화면을 조회
   * 매개변수: 예약정보
   * 반환: 스터디 카페 단일 상세화면 뷰단
   * */
  @PostMapping("/reserve")
  public void goReserve(
      @ModelAttribute("roomRsrvInfoDTO") RoomRsrvInfoDTO roomRsrvInfoDTO, Model model
  ) {

    log.info("goReserve({}) is invoked", roomRsrvInfoDTO);

    // String cafe_idx = roomRsrvInfoDTO.getCafe_idx();
    CafeVO cafeVO = service.getCafe(roomRsrvInfoDTO.getCafe_idx());

    model.addAttribute("cafeVO", cafeVO);
    model.addAttribute("roomRsrvInfoDTO", roomRsrvInfoDTO);

    log.info("model{}", model);

  } // insertReserve


  /*
   * 스터디 카페 예약 백단 작업
   * 매개변수: 새로 저장할 예약정보
   * 반환: 우선 카페리스트
   * */
  @PostMapping("/reserve/insert")
  public void insertReservation(RedirectAttributes rttrs,
      @ModelAttribute(" ") ReservationDTO reservationDTO,
      Model model) {

    log.info("insertReservation({}) is invoked", reservationDTO);

//    Integer rsrv_phone_number = reservationDTO.getRsrv_phone_number();
//    reservationDTO.setRsrv_phone_number(rsrv_phone_number); // 형변환 자꾸 오류나서..


//    Objects.requireNonNull(service);
        if (service.registerReservation(reservationDTO)){
            rttrs.addFlashAttribute("result", "success");  // OK : Request Scope 이용
            log.info("rttrs({}) is rttrs", rttrs);
        } // if
        
    } // insertReservation
    
    
    /*
     * 스터디 카페 예약 처리
     * 매개변수: ReservationDTO (예약정보를 담은 DTO)
     * 반환: 결제화면(결제정상 처리여부 확인후 update
     * */
//  @PostMapping("/reservation")
//  public String insertReservation(ReservationDTO reservationDTO) {
//
//    return "redirect:결제화면(시도)->정상: update결제id, 비정상: delete예약정보";
//
//  } // insertReservation
    
    /*
     * 스터디 카페 예약 내역 리스트를 조회 (회원==admin->all)
     * 매개변수: 회원닉네임
     * 반환: 스터디 카페 예약 내역 리스트 뷰단
     * */
    
    @GetMapping("/reservationList")
    public String selectReservationList(String nickName){
        log.info("selectReservationList({}) is invoked", "nickName = " + nickName);
        
        return "cafe/reservationList";
    } // selectReservationList
    
    
    //-------------------------------- 지혜 카페 CRUD--------------------------------//
    
    
    /*
     * 스터디 카페 등록 화면
     * 매개변수:
     * 반환: 스터디 카페 등록 화면 뷰단
     * */
    @GetMapping("/register")
    public void goCafeRegister(){
        log.info("goCafeRegister() is invoked");
        
    } // goCafeRegister
    
    
    /*
     * 스터디 카페 등록
     * 매개변수: 카페DTO (등록할 카페 정보를 담은 객체)
     * 반환: 스터디 카페 상세보기
     * */
    @PostMapping("/register/insert")
    public String cafeRegister(
            @RequestParam String rooms,
            CafeDTO cafeDTO,
            RoomDTO roomDTO,
            MultipartFile[] roomFile,
            MultipartFile[] cafeFile,
            Model model,
            RedirectAttributes rtts) throws ParseException, JsonProcessingException{
        
        log.info("insertCafe({},{},{}, {},) is invoked",
                cafeDTO, roomDTO, roomFile, cafeFile);
        
        // uuid 문자를 담을 공간 (난수 생성을 위해)
        String uuid;
        
        // file 저장을 위해 File 객체 호출
        File saveFile;
        
        // 이미지가 저장될 경로 설정
        String cafeUploadFolder = "C:/temp/upload/cafe/" + cafeDTO.getBusiness_number(); // 카페
        String roomUploadFolder = cafeUploadFolder + "/room"; // 룸
        
        // 폴더 만들기
        File cafeUploadPath = new File(cafeUploadFolder);   // 카페
        File roomUploadPath = new File(roomUploadFolder);   // 룸
        
        log.debug("upload path {},{}: ", cafeUploadPath, roomUploadPath);
        
        // 폴더가 없다면 생성하기
        if (!cafeUploadPath.exists()){ // 카페
            cafeUploadPath.mkdirs();
        } // if
        
        if (!roomUploadPath.exists()){ // 룸
            roomUploadPath.mkdirs();
        } // if
        
        
        // String rooms을 배열화 시키기위해
        ObjectMapper mapper = new ObjectMapper();
        
        // rooms 배열화
        ArrayList<HashMap<String, Object>> arrRoom = mapper.readValue(rooms,
                new ArrayList<HashMap<String, Object>>().getClass());
        
        log.info("arrRoom: {} ", arrRoom.toString());
        
        // input된 room 정보를 담기 위해 선언되는 변수들
        List<RoomDTO> roomDTOList = new ArrayList<>();
        
        // 받아올 때 obj 형태이기때문에 integer 형변환 해줘야해요
        Integer mp = 0;
        Integer trn = 0;
        Integer ah = 0;
        
        
        // Room DTO add
        for (int i = 0; i < arrRoom.size(); i++){
            log.info("--------------------------------------");
            log.info("Upload File Name : " + roomFile[i].getOriginalFilename());
            log.info("Upload File Size : " + roomFile[i].getSize());
            
            // uuid 부여
            uuid = UUID.randomUUID().toString();
            
            // file name에서 공백을 언더바로 치환
            String fileName = roomFile[i].getOriginalFilename().replace(' ', '_');
            
            // IE 접속시 백슬래시를 1로
            fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
            
            // 생성한 uuid와 file name을 결합하여 fileName 부여
            fileName = uuid + "_" + fileName;
            
            // 파일 저장
            saveFile = new File(cafeUploadPath, fileName);
            
            try{
                roomFile[i].transferTo(saveFile);
                
                //check image type file
                if (UploadFileUtils.checkImageType(saveFile)){
                    FileOutputStream thumbnail = new FileOutputStream(
                            new File(cafeUploadPath, "cafe_" + fileName));
                    Thumbnailator.createThumbnail(roomFile[i].getInputStream(), thumbnail, 100, 100);
                    
                    thumbnail.close();
                } // if
            }catch (Exception e){
                log.error(e.getMessage());
                
            } // try catch
            
            // 형변환해서 List에 담아주세요
            mp = Integer.valueOf(String.valueOf(arrRoom.get(i).get("max_people")));
            trn = Integer.valueOf(String.valueOf(arrRoom.get(i).get("total_room_number")));
            ah = Integer.valueOf(String.valueOf(arrRoom.get(i).get("amount_hour")));
            
            RoomDTO rDT = new RoomDTO();
            
            rDT.setMax_people(mp);
            rDT.setTotal_room_number(trn);
            rDT.setAmount_hour(ah);
            rDT.setRoom_image(fileName);
            log.info("\t 이미지 roomDTO 중인 roomDTO: {}", rDT);
            roomDTOList.add(rDT); //
            
            log.info("\t 이미지 삽입 중인 roomDTOList: {}", roomDTOList);
            
        } // for
        
        log.info("\t 이미지 삽입 끝난 roomDTOList: {}", roomDTOList);
        log.info("\t 이것좀 1 roomDTOList: {}", roomDTOList.get(0).getMax_people());
        
        // cafe DOT add
        for (int i = 0; i < cafeFile.length; i++){
            log.info("--------------------------------------");
            log.info("Upload File Name : " + cafeFile[i].getOriginalFilename());
            log.info("Upload File Size : " + cafeFile[i].getSize());
            
            // uuid 부여
            uuid = UUID.randomUUID().toString();
            
            // file name에서 공백을 언더바로 치환
            String fileName = cafeFile[i].getOriginalFilename().replace(' ', '_');
            
            // IE 접속시 백슬래시를 1로
            fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
            
            // 생성한 uuid와 file name을 결합하여 fileName 부여
            fileName = uuid + "_" + fileName;
            
            // 파일 저장
            saveFile = new File(cafeUploadPath, fileName);
            
            try{
                cafeFile[i].transferTo(saveFile);
                
                //check image type file
                if (UploadFileUtils.checkImageType(saveFile)){
                    FileOutputStream thumbnail = new FileOutputStream(
                            new File(cafeUploadPath, "cafe_" + fileName));
                    Thumbnailator.createThumbnail(cafeFile[i].getInputStream(), thumbnail, 100,
                            100); // 오류나서 잠시 막았어용 : 지혜
                    
                    thumbnail.close();
                } // if
            }catch (Exception e){
                log.error(e.getMessage());
                
            } // end catch
            
            if (i == 0){
                cafeDTO.setCafe_image_1(fileName);
                
            }else if (i == 1){
                cafeDTO.setCafe_image_2(fileName);
                
            }else{
                cafeDTO.setCafe_image_3(fileName);
                
            } // if-else-if
            
        } // end for (cafe)
        
        log.info("insertCafe 정보 확인 좀 하겠습니다~! ({},{},{}) ",
                cafeDTO, roomDTO, roomDTOList);
        String cafe_idx = "";
        // 신규 등록이라면 registerCafe로
        if (cafeDTO.getCafe_idx() == null){
            log.info("컨트롤러 - 신규등록하러 갑니다.");
            cafe_idx = service.registerCafe(cafeDTO, roomDTOList);
            log.info("컨트롤러 - 신규등록 잘 했습니다.");
            rtts.addFlashAttribute("result", "success");
            
            // 기존에 있던 정보라면 update문으로
        }else{
            log.info("컨트롤러 - 업데이트하러 갑니다.");
            
            cafe_idx = service.modifyCafe(cafeDTO, roomDTOList);
            log.info("컨트롤러 - 업데이트 잘 했습니다.");
            rtts.addFlashAttribute("result", "success");
        }// if-else
        
        
        rtts.addAttribute("cafe_idx", cafe_idx);
        
        return "redirect:/cafe/modify?"; //TODO 관리자 리스트나 수정정 페이지로
    } // insertCafe
    
    
    /*
     * 스터디 카페 수정 화면
     
     * 매개변수: 카페VO (수정할 카페 정보를 뿌려줄 객체)
     * 반환: 스터디 카페 수정 화면 뷰단
     * */
    @GetMapping("/modify")
    public void goCafeModify(String cafe_idx, Model model){
        log.info("goCafeModify({}) is invoked", cafe_idx);
        
        CafeVO cafeVO = service.getCafe(cafe_idx);
        List<RoomVO> roomVOList = service.getRoom(cafe_idx);
        
        log.info("cafeVO{}, roomVOList{}: ", cafeVO, roomVOList);
        
        model.addAttribute("cafeVO", cafeVO);
        model.addAttribute("roomVOList", roomVOList);
        
    } // goCafeModify
    
    /*
     * 스터디 게시물 삭제
     * 매개변수: 카페ID
     * 반환: 카페 리스트 페이지로 이동
     * */
    @GetMapping("/remove")
    public String removeCafe(String cafe_idx){
        log.info("deleteCafe({}) is invoked", cafe_idx);
        
        service.removeCafe(cafe_idx);
        return "redirect:/manager/cafe/list";
    } // deleteCafe
    
    
}