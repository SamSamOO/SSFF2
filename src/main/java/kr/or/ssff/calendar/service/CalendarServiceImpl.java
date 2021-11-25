package kr.or.ssff.calendar.service;

import java.util.List;
import java.util.Map;
import kr.or.ssff.mapper.CalendarMapper;
import kr.or.ssff.mapper.StudyMapper;
import kr.or.ssff.study.domain.RecruitBoardVO;
import kr.or.ssff.study.service.StudyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Log4j2
@AllArgsConstructor

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {

    private CalendarMapper mapper;

    @Override
    public String transformDate(String str) {
        //2021-11-07T12:00:00.000Z to 2021-11-07 12:00:00
        String trans = str.replace("T", " ");

        trans.substring(0, 16);
        return trans;
    }

    @Override
    public boolean register(String str, String calendarData) {
        String type = "study";
        Integer result = this.mapper.insert(str,calendarData,type);
        return result==1;
    }

    @Override
    public boolean modify(String str) {
        return false;
    }

    @Override
    public boolean remove(String str) {
        return false;
    }
}

























