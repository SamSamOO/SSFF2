package kr.or.ssff.mapper;

import org.apache.ibatis.annotations.Param;

public interface CalendarMapper {
    //글등록하기
    public abstract Integer insert(@Param("cal_id")String cal_id, @Param("cal_events")String calendarData,@Param("type")String type);

    //글수정하기
    public abstract Integer update(@Param("cal_id")String cal_id, @Param("cal_events")String calendarData);

    //cal_id 로 json 데이터 가져오기
    public abstract String getCalendarByCal_id(@Param("cal_id")String cal_id);
}
