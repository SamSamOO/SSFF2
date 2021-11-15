package kr.or.ssff.applyMember.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ssff.applyMember.domain.ApplyMemberListVO;
import kr.or.ssff.member.domain.MemberVO;

/*

 */
public interface ApplyMemberService {
   

    // 전체 회원 목록 조회 : 신지혜
    public abstract List<MemberVO> getMemberList();

    // 특정 스터디의 멤버 조회 : 신지혜
    public abstract List<ApplyMemberListVO> getApplyMemberList(String r_idx);

    // 스터디 가입 상태 변경 : 신지혜
    public abstract void applyAction(HashMap<String, String> aMember);

    // 스터디 가입 신청 : 신지혜
    public abstract String registerApply(HashMap<String, String> aMember);

    
}// end interface


















