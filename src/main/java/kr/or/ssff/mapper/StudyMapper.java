package kr.or.ssff.mapper;

import java.util.HashMap;
import java.util.List;
import kr.or.ssff.applyMember.domain.ApplyMemberDTO;
import kr.or.ssff.study.domain.LangVO;
import kr.or.ssff.study.domain.RecruitBoardJoinReplyVO;
import kr.or.ssff.study.domain.RecruitBoardVO;
import kr.or.ssff.study.domain.ReplyCountVO;
import kr.or.ssff.study.domain.ReplyVO;
import org.apache.ibatis.annotations.Param;


public interface StudyMapper{
    //글등록하기
    public abstract Integer insert(RecruitBoardVO vo);
    
    //글수정하기
    public abstract Integer update(RecruitBoardVO vo);
    
    //글리스트 전체 반환(쓰지 않음)
    public abstract List<RecruitBoardVO> getList(@Param("type") String type, @Param("page") Integer Page);
    
    //5-1 글목록 페이징 + 댓글 조인 + 최신순 + 마감제외없음
    public abstract List<RecruitBoardJoinReplyVO> getListWithJoinReply(@Param("type") String type, @Param("page") Integer Page);
    
    //5-1-1 글목록 페이징 + 댓글 조인 + 최신순 + 마감제외없음 + 검색기능
    public abstract List<RecruitBoardJoinReplyVO> getListWithJoinReplyAddSearch(@Param("type") String type, @Param("page") Integer Page, @Param("text") String text);
    
    //5-1-2.(프로젝트) 글목록 페이징 + 댓글 조인 + 최신순 + 마감제외없음 + 로고조회기능
    public abstract List<RecruitBoardJoinReplyVO> getListWithJoinReplyAddLogo(@Param("type") String type, @Param("page") Integer Page, @Param("arr") String[] arr);
    
    //5-2 글목록 페이징 + 댓글 조인+ 인기순 + 마감제외없음
    public abstract List<RecruitBoardJoinReplyVO> getListWithJoinReplyOrderByHit(@Param("type") String type, @Param("page") Integer Page);
    
    //5-3 글목록 페이징 + 댓글 조인 + 최신순 + 마감제외
    public abstract List<RecruitBoardJoinReplyVO> getListWithJoinReplyExceptClosed(@Param("type") String type, @Param("page") Integer Page);
    
    //5-4 글목록 페이징 + 댓글 조인+ 인기순 + 마감제외
    public abstract List<RecruitBoardJoinReplyVO> getListWithJoinReplyOrderByHitExceptClosed(@Param("type") String type, @Param("page") Integer Page);
    
    //가장 최근의 글번호 가져오기(P스터디 언어 등록용)
    public abstract Integer getCurrentR_idx();
    
    //글번호로 언어태그 등록하기
    public abstract Integer insertTag(@Param("r_idx") Integer r_idx, @Param("tag") String tag);
    
    //lang list 전체 가져오기
    public abstract List<LangVO> getLangList();
    
    //글 하나 가져오기
    public abstract RecruitBoardVO get(@Param("r_idx") Integer r_idx);
    
    //글번호에 해당하는 언어태그 리스트 가져오기
    public abstract List<LangVO> getLangTags(@Param("r_idx") Integer r_idx);
    
    //글 작성과 동시에 어플라이단에 추가하기
    public abstract Integer insertApply(@Param("r_idx") Integer r_idx, @Param("member_name") String member_name);
    
    //태그들 지우기
    public abstract Integer deleteTag(@Param("r_idx") Integer r_idx);
    
    //조회수 1업
    public abstract Integer hitUp(@Param("r_idx") Integer r_idx);
    
    //댓글달기
    public abstract Integer insertReply(ReplyVO vo);
    
    //글번호로 댓글 전부 가져오기
    public abstract List<ReplyVO> getReplyList(@Param("r_idx") Integer r_idx);
    
    //글삭제하기
    public abstract Integer delete(@Param("r_idx") Integer r_idx);
    
    //댓글삭제하기
    public abstract Integer replyDelete(@Param("no") Integer no);
    
    //댓글 수정하기
    public abstract Integer replyUpdate(@Param("no") Integer no, @Param("c_cont") String c_cont);
    
    //글 총갯수 구하기(타입 받음)
    public abstract Integer getPostCount(@Param("type") String type);
    
    //글 총갯수 구하기(타입 받음)+마감 제외
    public abstract Integer getPostCountExceptClosed(@Param("type") String type);
    
    //글 총갯수 구하기(타입 받음)+검색어
    public abstract Integer getPostCountAddSearch(@Param("type") String type, @Param("text") String searchText);
    
    //글 총갯수 구하기(타입 받음)+로고선택
    public abstract Integer getPostCountAddLogo(@Param("type") String type, @Param("arr") String[] arr);
    
    //댓글 수 구하기
    public abstract List<ReplyCountVO> replyCount();
    
    //글번호에 해당하는 댓글 수 구하기
    public abstract Integer replyCountByR_idx(@Param("r_idx") Integer r_idx);

    //출석 테이블에 언제 출석한지 기록하는 함수 입니다 : 박상준
    public abstract Integer updateAttendance(@Param("map") HashMap<String, Object> map);
    
    //어플라이 멤버안의 총 누적 출석일수를 +1하는 함수입니다 : 박상준
    public abstract Integer updateTotalAttendance(@Param("map") HashMap<String, Object> map);
    
    //이미 출석한 경우 막아야합니다  : r_Idx와 member_name 활용 : 박상준
    public abstract Integer attendanceOkOneByOne(@Param("map") HashMap<String, Object> map);

    //가입했는지 체크
    public abstract List<ApplyMemberDTO> getMemberByR_idx(@Param("r_idx")Integer r_idx);

    // 스터디 id로 스터디 하나의 정보를 온전히 조회
    public abstract ApplyMemberDTO getTeamName(@Param("r_Idx") Integer r_idx);

    //atd 반환 : 박상준
    public abstract Integer getAtd(@Param("map") HashMap<String, Object> map);
    
}//end interface

