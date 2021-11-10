package kr.or.ssff.member.service;

import java.util.HashMap;
import kr.or.ssff.member.domain.ApplyMemberDTO;
import kr.or.ssff.member.domain.MemberVO;

import java.util.List;

/*

 */
public interface MemberService {
    // 1. 새로운 게시물 등록
    public abstract boolean register();

    // 2. 기존 게시글 수정(변경)
    public abstract boolean modify();

    // 3. 기존 게시글 삭제
    public abstract boolean remove();

    // 4. 특정 게시글 상세조회
    public abstract String get();

    // 5. 전체 회원 목록 조회 : 신지혜
    public abstract List<MemberVO> getMemberList();

    //5. 목록조회 with paging
    public abstract List<String> getListPerPage();

    //
    public abstract Integer getTotal();

    // 1. 특정 스터디의 멤버 조회 : 신지혜
    public abstract List<ApplyMemberDTO> getApplyMemberList(String r_idx);

    // 스터디 가입 상태 변경
    public abstract void applyAction(HashMap<String, String> aMember);

}// end interface


















