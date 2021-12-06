package kr.or.ssff.mapper;

import java.util.List;
import kr.or.ssff.applyMember.domain.ApplyMemberDTO;
import org.apache.ibatis.annotations.Param;

public interface CalendarMapper {
    //일정 등록하기
    public abstract Integer insert(@Param("cal_id")String cal_id, @Param("cal_events")String calendarData,@Param("type")String type);

    //일정 수정하기
    public abstract Integer update(@Param("cal_id")String cal_id, @Param("cal_events")String calendarData);

    //cal_id 로 json 데이터 가져오기
    public abstract String getCalendarByCal_id(@Param("cal_id")String cal_id);

    //멤버가 가입한 스터디 전부 가져오기
    public abstract List<ApplyMemberDTO> getR_idxByMember_name(@Param("cal_id")String cal_id);
}
