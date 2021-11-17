package kr.or.ssff.mapper;

import java.util.List;
import kr.or.ssff.study.domain.LangVO;
import kr.or.ssff.study.domain.RecruitBoardVO;
import kr.or.ssff.study.domain.ReplyVO;
import org.apache.ibatis.annotations.Lang;
import org.apache.ibatis.annotations.Param;

public interface StudyMapper {
    //글등록하기
    public abstract Integer insert(RecruitBoardVO vo);
    //글수정하기
    public abstract Integer update(RecruitBoardVO vo);
    //글리스트 반환(페이징 안되는 상태)
    public abstract List<RecruitBoardVO> getList(@Param("type")String type);
    //가장 최근의 글번호 가져오기
    public abstract Integer getCurrentR_idx();
    //글번호로 언어태그 등록하기
    public abstract Integer insertTag(@Param("r_idx")Integer r_idx, @Param("tag") String tag);
    //lang list 전체 가져오기
    public abstract List<LangVO> getLangList();
    //글 하나 가져오기
    public abstract RecruitBoardVO get(@Param("r_idx")Integer r_idx);
    //글번호에 해당하는 언어태그 리스트 가져오기
    public abstract List<LangVO> getLangTags(@Param("r_idx")Integer r_idx);
    //글 작성과 동시에 어플라이단에 추가하기
    public abstract Integer insertApply(@Param("r_idx")Integer r_idx,@Param("member_name")String member_name);
    //태그들 지우기
    public abstract Integer deleteTag(@Param("r_idx")Integer r_idx);
    //조회수 1업
    public abstract Integer hitUp(@Param("r_idx")Integer r_idx);
    //댓글달기
    public abstract Integer insertReply(ReplyVO vo);
    //글번호로 댓글 전부 가져오기
    public abstract List<ReplyVO> getReplyList(@Param("r_idx")Integer r_idx);
    //글삭제하기
    public abstract Integer delete(@Param("r_idx")Integer r_idx);
    //댓글삭제하기
    public abstract Integer replyDelete(@Param("no")Integer no);
    //댓글 수정하기
    public abstract Integer replyUpdate(@Param("no")Integer no,@Param("c_cont")String c_cont);
}
