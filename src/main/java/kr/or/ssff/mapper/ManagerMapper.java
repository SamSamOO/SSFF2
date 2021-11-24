package kr.or.ssff.mapper;

import java.util.List;
import kr.or.ssff.manager.domain.ManagerMemberVO;
import org.apache.ibatis.annotations.Param;

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

}// end interface