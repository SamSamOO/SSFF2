package kr.or.ssff.mapper;

import java.util.List;
import java.util.Map;
import kr.or.ssff.study.domain.RecruitBoardVO;
import org.apache.ibatis.annotations.Param;

public interface CalendarMapper {
    //글등록하기
    public abstract Integer insert(@Param("cal_id")String str, @Param("cal_events")String calendarData,@Param("type")String type);
}
