package kr.or.ssff.applyMember.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ssff.applyMember.domain.ApplyMemberListVO;
import kr.or.ssff.applyMember.domain.ApplyMemberVO;
import kr.or.ssff.member.domain.MemberVO;

/*

 */
public interface ApplyMemberService {
   

    // 전체 회원 목록 조회 : 신지혜
    public abstract List<MemberVO> getMemberList();

    // 특정 스터디의 멤버 조회 : 신지혜
    public abstract List<ApplyMemberListVO> getApplyMemberList(HashMap<String, String> param);

    // 스터디 가입 상태 변경 : 신지혜
    public abstract boolean applyAction(HashMap<String, String> aMember);

    // 스터디 가입 신청 : 신지혜
    public abstract String registerApply(HashMap<String, Object> aMember);

    public abstract ApplyMemberVO getApplyMember(HashMap<String, Object> aMember);
    
}// end interface


















