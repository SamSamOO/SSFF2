package kr.or.ssff.calendar.controller;

import kr.or.ssff.calendar.service.CalendarService;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/*

 */
@Log4j2
@NoArgsConstructor

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {

    @Autowired
    private CalendarService service;


    /*일정 생성페이지로 이동합니다
     * 파라메터 :
     * 반환 : 일정 생성페이지
     * */
    @GetMapping("/addGo")
    public String insertCalGo() {
        log.info("insertCalGo() is invoked");

        return "calendar/add";
    }

    /*일정 생성페이지에서 정보입력후 일정을 등록합니다
     * 파라메터 :
     * 반환 : //TODO 예솔
     * */
    @PostMapping("/add")
    public String insertCal() {
        log.info("insertCal() is invoked");

        return "";
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

























