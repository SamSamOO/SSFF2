package kr.or.ssff.member.service;

import kr.or.ssff.member.domain.ApplyMemberDTO;
import kr.or.ssff.member.domain.MemberDTO;
import kr.or.ssff.member.domain.MemberVO;

import java.util.List;

/*

 */
public interface MemberService {
    //-------------멤버 CRUD 순형 ---------------//
    //1.화원가입
    public abstract boolean insertMember(MemberDTO memberDTO) throws Exception;
    // 2. 로그인
    public abstract boolean Login(String member_id, String member_pwd);
    // authstatus 1로 변경
    public void updateAuthstatus(String member_id) throws Exception;






    //-------------멤버 CRUD 순형 ---------------//
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
    public abstract List<ApplyMemberDTO> getApplyMemberList(Integer r_idx);

}// end interface


















