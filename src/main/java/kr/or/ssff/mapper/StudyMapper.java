package kr.or.ssff.mapper;

import java.util.List;
import kr.or.ssff.study.domain.RecruitBoardVO;
import org.apache.ibatis.annotations.Param;

public interface StudyMapper {
    //글등록하기
    public abstract Integer insert(RecruitBoardVO vo);
    //글리스트 반환(페이징 없이)
    public abstract List<RecruitBoardVO> getList();
    //가장 최근의 글번호 가져오기
    public abstract Integer getCurrentR_idx();
    //글번호로 언어태그 등록하기
    public abstract Integer insertTag(@Param("r_idx")Integer r_idx, @Param("tag") String tag);
}
