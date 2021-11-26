package kr.or.ssff.mapper;

import java.util.HashMap;
import java.util.List;
import kr.or.ssff.applyMember.domain.ApplyMemberListVO;
import kr.or.ssff.manager.domain.ManagerMemberVO;
import kr.or.ssff.manager.domain.ManagerStudyListByBossYVO;
import kr.or.ssff.manager.domain.ManagerStudyVO;
import kr.or.ssff.studyIns.model.Criteria;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.prepost.PreAuthorize;

/*

 */
public interface ManagerMapper {

    // 전체 회원 목록 조회
    public abstract List<ManagerMemberVO> getMemberListPerPaging(@Param("pageNum") Integer pageNum, @Param("amount") Integer amount);

    // 멤버 갯수
    public abstract Integer countMemberCount();

    // 멤버 서치
    public abstract List<ManagerMemberVO> getSearchMemberPerPaging(@Param("pageNum") Integer pageNum, @Param("amount") Integer amount,@Param("keyword") String keyword);

    //멤버 서치 갯수
    public abstract Integer countMemberCountBy(@Param("keyword") String keyword);

    //스터디 개수
    public abstract Integer countStudyCount(@Param("map") HashMap<String,Object>map);

    //스터디 페이징 .. 리스트 불러오기
    public abstract List<ManagerStudyListByBossYVO> getStudyListPerPaging(@Param("map") HashMap<String,Object> map);

}// end interface