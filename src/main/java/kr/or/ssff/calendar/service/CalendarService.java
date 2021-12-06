package kr.or.ssff.calendar.service;

import java.util.List;
import kr.or.ssff.applyMember.domain.ApplyMemberDTO;

/*

 */
public interface CalendarService {

    // 1. 새로운 일정 추가
    public abstract boolean register(String cal_id, String calendarData);

    // 2. 기존 게시글 수정
    public abstract boolean modify(String cal_id, String calendarData);

    // 3. cal_id로 json 데이터 다 찾아오기
    public abstract String getCalendarByCal_id(String cal_id);

    // 4. member_id로 내가 속한 스터디 그룹 찾아오기
    public abstract List<ApplyMemberDTO>getR_idxByMember_name(String cal_id);
}

























