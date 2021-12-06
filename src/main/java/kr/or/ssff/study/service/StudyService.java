package kr.or.ssff.study.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kr.or.ssff.applyMember.domain.ApplyMemberDTO;
import kr.or.ssff.study.domain.LangVO;
import kr.or.ssff.study.domain.RecruitBoardJoinReplyVO;
import kr.or.ssff.study.domain.RecruitBoardVO;
import kr.or.ssff.study.domain.ReplyCountVO;
import kr.or.ssff.study.domain.ReplyVO;

/**************************************/
//study service
//작업자 : 제예솔
//협업의 경우, 함수 옆에 작업자 이름 별도 기재
/**************************************/

public interface StudyService {
    // 1. 새로운 게시물 등록
    public abstract boolean register(RecruitBoardVO vo);

    // 2. 기존 게시글 수정
    public abstract boolean modify(RecruitBoardVO vo);

    // 3. 기존 게시글 삭제
    public abstract boolean remove(Integer r_idx);

    // 4. 특정 게시글 상세조회 + 조회수 1업
    public abstract RecruitBoardVO get(Integer r_idx);

    // 5. 전체 목록 조회 (쓰지 않음)
    public abstract List<RecruitBoardVO> getList(String type, Integer page);

    //5-1 글목록 페이징 + 댓글 조인 + 최신순 + 마감제외없음
    public abstract List<RecruitBoardJoinReplyVO> getListWithJoinReply(String type, Integer page);

    //5-1-1(챌린지) 글목록 페이징 + 댓글 조인 + 최신순 + 마감제외없음 + 검색기능
    public abstract List<RecruitBoardJoinReplyVO> getListWithJoinReplyAddSearch(String type, Integer page,String text);

    //5-1-2.(프로젝트) 글목록 페이징 + 댓글 조인 + 최신순 + 마감제외없음 + 로고조회기능
    public abstract List<RecruitBoardJoinReplyVO> getListWithJoinReplyAddLogo(String type, Integer page,String text);

    //5-2 글목록 페이징 + 댓글 조인+ 인기순 + 마감제외없음
    public abstract List<RecruitBoardJoinReplyVO> getListWithJoinReplyOrderByHit(String type, Integer page);

    //5-3 글목록 페이징 + 댓글 조인 + 최신순 + 마감제외
    public abstract List<RecruitBoardJoinReplyVO> getListWithJoinReplyExceptClosed(String type, Integer page);

    //5-4 글목록 페이징 + 댓글 조인+ 인기순 + 마감제외
    public abstract List<RecruitBoardJoinReplyVO> getListWithJoinReplyOrderByHitExceptClosed(String type, Integer page);

    //6. 게시글 총개수 구하기
    public abstract Integer getTotal(String type);

    //6-1. 게시글 총개수 구하기(마감 제외)
    public abstract Integer getTotalExceptClosed(String type);

    //6-1. 게시글 총개수 구하기(검색어필터)
    public abstract Integer getTotalAddSearch(String type,String searchText);

    //6-2. 게시글 총개수 구하기(로고선택필터)
    public abstract Integer getTotalAddLogo(String type,String selectedLogoSet);

    //7. 태그 입력하기
    public abstract boolean registerLangTag(Integer r_idx,String tag);

    //8. P에서 최근에 등록한 글 번호 가져오기
    public abstract Integer getCurrentR_idx();

    //9. p에서 lang list 가져오기(전체)
    public abstract List<LangVO> getLangList();

    //10. list에 억지로 언어태그 넣기
    public abstract List<Map<String, Object>> getRecruitBoardMap(List<RecruitBoardJoinReplyVO> list, List<LangVO> langList);

    //11. p에서 번호로 언어태그 가져오기
    public abstract List<LangVO> getLangTagByR_idx(Integer r_idx);

    //12. 방장이 글씀과 동시에 apply table 에 들어가기
    public abstract boolean registerApply(Integer r_idx, String member_name);

    //13. P에서 글수정시 새태그 등록을 위해 기존 태그 버리기
    public abstract boolean deleteTag(Integer r_idx);

    //14. 댓글 달기
    public abstract boolean replyRegister(ReplyVO vo);

    //15. 글번호로 댓글 다 가져오기
    public abstract List<ReplyVO>getReplyList(Integer r_idx);

    //16. 댓글 삭제하기
    public abstract boolean replyRemove(Integer no);

    //17. 댓글 수정하기
    public abstract boolean replyModify(Integer no, String c_cont);

    //18. 댓글 개수 가져오기
    public abstract List<ReplyCountVO> getReplyCount();

    //19. 게시물번호에 해당하는 댓글 수 가져오기
    public abstract Integer getReplyCountByR_idx(Integer r_idx);

    //20. 출석테이블에 언제 출석한지 기록하는 함수--박상준
    public abstract boolean updateAttendance(HashMap<String, Object> map);

    //21. 가입했는지 체크
    public abstract List<ApplyMemberDTO> getMemberByR_idx(Integer r_idx);

    //22. 스터디 번호로 팀네임 가져오기--박상준
    public abstract ApplyMemberDTO getTeamName(Integer r_idx);

    //23. atd 반환--박상준
    public abstract Integer getAtd(HashMap<String, Object> map);
    
}//end interface






























