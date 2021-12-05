package kr.or.ssff.member.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ssff.applyMember.domain.ApplyMemberVO;
import kr.or.ssff.member.domain.MemberDTO;
import kr.or.ssff.member.domain.MemberVO;
import kr.or.ssff.study.domain.RecruitBoardVO;

import javax.servlet.http.HttpServletResponse;

/*

 */
public interface MemberService {
    //-------------멤버 CRUD 순형 ---------------//
    //1.화원가입
    public void insertMember(MemberDTO memberDTO) throws Exception;
    // 2. 로그인
    public MemberDTO Login(MemberDTO memberDTO);
    // authstatus 1로 변경
    public void updateAuthstatus(String member_id) throws Exception;
    // 이메일 중복체크
    public int idChk( MemberDTO memberDTO) throws Exception;
    // 닉네임 중복체크
    public int nameChk( MemberDTO memberDTO) throws Exception;
    // 프로필 이미지 등록
    public void upload(MemberDTO memberDTO) throws Exception;



    // 1. 새로운 게시물 등록
    public abstract boolean register();


    // 2. 기존 게시글 수정(변경)
    public abstract boolean modify();

    // 3. 기존 게시글 삭제
    public abstract boolean remove();

    // 4. 특정 게시글 상세조회
    public abstract String get();


    //5. 목록조회 with paging
    public abstract List<String> getListPerPage();
    
    //6. 내 스터디 목록 조회~
    List<RecruitBoardVO> getMyStudyList(HashMap<String, Object> map);
    
}// end interface


















