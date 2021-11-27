package kr.or.ssff.calendar.service;

/*

 */
public interface CalendarService {

    // 1. 새로운 일정 추가
    public abstract boolean register(String cal_id, String calendarData);

    // 2. 기존 게시글 수정
    public abstract boolean modify(String cal_id, String calendarData);

    // 3. 기존 게시글 삭제
    public abstract boolean remove(String str);

    // 4.cal_id로 json 데이터 다 찾아오기
    public abstract String getCalendarByCal_id(String cal_id);
}

























