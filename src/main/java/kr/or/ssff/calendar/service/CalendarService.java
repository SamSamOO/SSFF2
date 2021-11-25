package kr.or.ssff.calendar.service;

import java.util.List;
import java.util.Map;
import kr.or.ssff.study.domain.RecruitBoardVO;

/*

 */
public interface CalendarService {
    //0. 프론트 -> 백 날짜폼 고치기
    public abstract String transformDate(String str);

    // 1. 새로운 게시물 등록
    public abstract boolean register(String str, String callendarData);

    // 2. 기존 게시글 수정
    public abstract boolean modify(String str);

    // 3. 기존 게시글 삭제
    public abstract boolean remove(String str);
}

























