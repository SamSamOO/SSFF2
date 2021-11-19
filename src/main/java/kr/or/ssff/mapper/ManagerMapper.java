package kr.or.ssff.mapper;

import kr.or.ssff.member.domain.MemberVO;

import java.util.List;

/*

 */
public interface ManagerMapper {

    // 전체 회원 목록 조회
    public abstract List<MemberVO> getMemberList();


}// end interface