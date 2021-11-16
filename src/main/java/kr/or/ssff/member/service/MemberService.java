package kr.or.ssff.member.service;

import java.util.List;

import kr.or.ssff.member.domain.MemberVO;

/*

 */
public interface MemberService {
    //-------------멤버 CRUD 순형 ---------------//
    //1.화원가입
    public void insertMember(MemberVO memberVO);



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


















