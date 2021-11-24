package kr.or.ssff.manager.service;

import kr.or.ssff.manager.domain.ManagerMemberVO;

import java.util.List;
import kr.or.ssff.studyIns.model.Criteria;
import org.apache.ibatis.annotations.Param;

/*

 */
public interface ManagerService {
    // 1. 새로운 게시물 등록
    public abstract boolean register();

    // 2. 기존 게시글 수정(변경)
    public abstract boolean modify();

    // 3. 기존 게시글 삭제
    public abstract boolean remove();

    // 4. 특정 게시글 상세조회
    public abstract String get();

    // 5. 전체 목록 조회
    public abstract List<String> getList();

    // 6. 목록조회 with paging
    public abstract List<String> getListPerPage();

    // 7. 회원 전체 목록 조회
    public abstract List<ManagerMemberVO> getMemberListPerPaging(Criteria criteria);

    // 8. 회원 명수 카운트
    public abstract Integer countMemberCount();

    // 9 . 회원 검색
    public abstract List<ManagerMemberVO> getSearchMemberPerPaging(Criteria criteria,String keyword);

    // 9-1 . 회원 명수 카운트(검색 기준)
    public abstract Integer countMemberCountBy(String keyword);

}