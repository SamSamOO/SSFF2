package kr.or.ssff.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ssff.member.domain.MemberDTO;
import kr.or.ssff.member.domain.MemberLangVO;
import kr.or.ssff.member.domain.MemberVO;
import kr.or.ssff.study.domain.LangVO;
import kr.or.ssff.study.domain.RecruitBoardJoinReplyVO;

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

    //-------------멤버 CRUD 민주 ---------------//
    // 전체 언어 리스트 가져오기(전체)
    public abstract List<LangVO> getLangList();

    // 회원 주력언어 등록
    public abstract boolean registerMemberLang(String member_name, String lang);

    // 회원 이름으로 언어태그 가져오기
    public abstract List<MemberLangVO> getLangByMemberName(String member_name);

    // 언어 수정
    public abstract boolean deleteLang(String member_name);

    //getLangList 회원 lang list 전체 가져오기
    List<MemberLangVO> getMemberLangList();

    // 멤버 이름으로 lang 가져오기
    List<MemberLangVO> getLangByMemberByName(String member_name);
    //getLangByMemberByName

    //작성후 apply 등록
    boolean registerApply(String member_name);
    //registerApply

    // lang 지우기
    boolean deletelang(String member_name);
    //deleteTag


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

}// end interface