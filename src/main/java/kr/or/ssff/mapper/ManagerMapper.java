package kr.or.ssff.mapper;

import kr.or.ssff.manager.domain.ManagerMemberVO;

import java.util.List;
import org.apache.ibatis.annotations.Param;

/*

 */
public interface ManagerMapper {

    // 전체 회원 목록 조회
    public abstract List<ManagerMemberVO> getMemberListPerPaging(@Param("pageNum") Integer pageNum,@Param("amount")Integer amount);

    // 멤버 갯수
    public abstract Integer countMemberCount();
}// end interface