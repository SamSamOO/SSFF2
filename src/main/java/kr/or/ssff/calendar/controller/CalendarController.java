package kr.or.ssff.calendar.controller;

import java.util.List;
import java.util.Map;
import kr.or.ssff.applyMember.domain.ApplyMemberDTO;
import kr.or.ssff.calendar.service.CalendarService;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
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

    /*일정 생성페이지에서 가져온 정보를 DB에 입력합니다.
     *이때, 최초작성일 경우 insert , 추가작성일경우 update를 수행합니다.
     */
    @PostMapping("/add")
    public  @ResponseBody boolean insertCal(@RequestBody Map<String, String> jsonData) {
        log.info("insertCal({}) is invoked", jsonData);

        String cal_id = (String) jsonData.get("cal_id");
        String calendarData = jsonData.get("calendarData");

        boolean result=false;
        if(this.service.getCalendarByCal_id(cal_id) == null){
            result = this.service.register(cal_id,calendarData);//insert 문
        }else{
            result = this.service.modify(cal_id,calendarData);//update문
        }
        return result;
    }//insertCal

    /*cal_id에 해당하는 일정 정보를 던져줍니다.
     */
    @GetMapping("/get")
    public @ResponseBody
    JSONArray selectCalendar(String cal_id) throws ParseException {
        log.info("selectCalendar({}) is invoked");

        String calendarData = this.service.getCalendarByCal_id(cal_id);

        JSONParser parser = new JSONParser();
        Object obj = parser.parse(calendarData);
        JSONArray jsonArray = (JSONArray)obj;

        return jsonArray;
    }//selectCalendar

    /*마이페이지에서 세션 이름으로 내가 속한 스터디의 일정 전부 뿌려줍니다
     */
    @GetMapping("/getAll")
    public @ResponseBody JSONArray selectCalendarAll(String cal_id) throws ParseException{
        log.info("selectCalendarAll({}) is invoked", "cal_id = " + cal_id);

        JSONArray jsonArrayTotal = new JSONArray();
        log.info("jsonArrayTotal = {}", jsonArrayTotal);
        
        //처음 불러오는 경우 아이디를 cal_id 로 갖는 json data 최초 생성
        List<ApplyMemberDTO> applylist = this.service.getR_idxByMember_name(cal_id);
        log.info("applylist = {}", applylist);
        
        for(int i=0;i<applylist.size();i++) {
            String calendarEventsData = this.service.getCalendarByCal_id(
                    (applylist.get(i).getR_idx()) + "");
            log.info("calendarEventsData = {}", calendarEventsData);
            
            if(calendarEventsData ==null){
                continue;
            }
            JSONParser parser = new JSONParser();
            log.info("parser = {}", parser);
            JSONArray jsonArray = (JSONArray) parser.parse(calendarEventsData);
            log.info("jsonArray = {}", jsonArray);
            if (jsonArrayTotal.isEmpty()) {
                jsonArrayTotal = jsonArray;
            } else {
                for (int j = 0; j < jsonArray.size(); j++) {
                    jsonArrayTotal.add(jsonArray.get(j));
                }
            }
        }
        return jsonArrayTotal;
    }//selectCalendarAll
} //end class

























