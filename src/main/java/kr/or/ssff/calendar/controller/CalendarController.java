package kr.or.ssff.calendar.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import kr.or.ssff.calendar.domain.CalendarVO;
import kr.or.ssff.calendar.service.CalendarService;
import kr.or.ssff.study.domain.ReplyVO;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/*

 */
@Log4j2
@NoArgsConstructor

@RestController
@RequestMapping("/calendar")
public class CalendarController {

    @Autowired
    private CalendarService service;


    /*일정 생성페이지에서 정보입력후 일정을 등록합니다
     * 파라메터 :
     * 반환 : //TODO 예솔
     * */
    @PostMapping("/add")
    public  @ResponseBody boolean insertCal(@RequestBody Map<String, String> jsonData) {
        log.info("insertCal({}) is invoked", jsonData);



        String studyNum = (String) jsonData.get("studyNum");
//        List<Map<String, String>> calendarData = (ArrayList<Map<String, String>>) jsonData.get("callendarData");
        String calendarData = jsonData.get("callendarData");
        boolean result = this.service.register(studyNum,calendarData);







//        SimpleDateFormat transDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");

//        String str1 = this.service.transformDate(jsonData.get("start"));
//        String str2 = this.service.transformDate(jsonData.get("end"));
//        String str3 = jsonData.get("allday_ok");
//
//        Date cal_start = null;
//        Date cal_end = null;
//        Character allday_ok = str3.charAt(0);
//
//        try {
//            cal_start = transDate.parse(str1);
//            cal_end = transDate.parse(str2);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//
//        CalendarVO vo = new CalendarVO(
//            null,
//            Integer.parseInt(jsonData.get("r_idx")),
//            jsonData.get("member_name"),
//            jsonData.get("cal_title"),
//            jsonData.get("cal_cont"),
//            cal_start,
//            cal_end,
//            allday_ok,
//            null,
//            null,
//            null
//        );
//
//        boolean result = this.service.register("vo");

        return false;
    }

    /*일정 상세보기 페이지로 이동합니다 (조회)
     * 파라메터 :
     * 반환 : 일정 상세보기 페이지
     * */
    @GetMapping("/detail")
    public String selectDetailGo() {
        log.info("selectDetailGo() is invoked");

        return " calendar/detail";
    }

    /*일정 수정 페이지 이동합니다( update)
     * 파라메터 :
     * 반환 :일정 수정 페이지
     * */
    @GetMapping("/modifyGo")
    public String updateCalGo() {
        log.info("updateCalGo() is invoked");

        return "calendar/modify";
    }

    /*일정 수정 기능을 수행합니다 (update)
     *파라메터 :
     *반환 : //TODO 모르겠습니다 --상준
     * */
    @PostMapping("/modify")
    public String updateCal() {
        log.info("updateCal() is invoked");

        return "";
    }

    /*일정 삭제 기능을 수행합니다 (delete)
    * 파라메터 :
    * 반환 : //TODO 모르겠습니다 --상준
    * */
    @PostMapping("/remove")
    public String deleteCal() {
        log.info("removeCal() is invoked");

        return "";
    }
} //end class

























