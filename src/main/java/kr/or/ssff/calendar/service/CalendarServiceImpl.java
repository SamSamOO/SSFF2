package kr.or.ssff.calendar.service;

import java.util.List;
import kr.or.ssff.applyMember.domain.ApplyMemberDTO;
import kr.or.ssff.mapper.CalendarMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Log4j2
@AllArgsConstructor

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {

    private CalendarMapper mapper;

    @Override
    public boolean register(String cal_id, String calendarData) {
        String type = "study";
        Integer result = this.mapper.insert(cal_id,calendarData,type);
        return result==1;
    }//register

    @Override
    public boolean modify(String cal_id, String calendarData) {
        Integer result = this.mapper.update(cal_id,calendarData);
        return result==1;
    }//modify

    @Override
    public String getCalendarByCal_id(String cal_id) {
        String calendarData = this.mapper.getCalendarByCal_id(cal_id);
        System.out.println(calendarData);
        return calendarData;
    }//getCalendarByCal_id

    @Override
    public List<ApplyMemberDTO> getR_idxByMember_name(String cal_id) {
        List<ApplyMemberDTO> applyList = this.mapper.getR_idxByMember_name(cal_id);
        return applyList;
    }//getR_idxByMember_name

}//end-class

























