package kr.or.ssff.study.service;

import java.util.List;
import java.util.Map;
import kr.or.ssff.study.domain.LangVO;
import kr.or.ssff.study.domain.RecruitBoardVO;

/*
    일단 이거 임시로 만들어놓은 거임. 동작 안하니까 꼭 고쳐야 함
 */
public interface StudyService {
    // 1. 새로운 게시물 등록 - 정상동작중!
    public abstract boolean register(RecruitBoardVO vo);

    // 2. 기존 게시글 수정
    public abstract boolean modify(RecruitBoardVO vo);

    // 3. 기존 게시글 삭제
    public abstract boolean remove();

    // 4. 특정 게시글 상세조회
    public abstract RecruitBoardVO get(Integer r_idx);

    // 5. 전체 목록 조회 - 정상동작중!
    public abstract List<RecruitBoardVO> getList(String type);

    //5. 목록조회 with paging
    public abstract List<RecruitBoardVO> getListPerPage();

    //6. 게시글 총개수 구하기
    public abstract Integer getTotal();

    //7. 태그 입력하기
    public abstract boolean registerLangTag(Integer r_idx,String tag);

    //8. P에서 최근에 등록한 글 번호 가져오기
    public abstract Integer getCurrentR_idx();

    //9. p에서 lang list 가져오기(전체)
    public abstract List<LangVO> getLangList();

    //10. list에 억지로 언어태그 넣기
    public abstract List<Map<String, Object>> getRecruitBoardMap(List<RecruitBoardVO> list, List<LangVO> langList);

    //11. p에서 번호로 언어태그 가져오기
    public abstract List<LangVO> getLangTagByR_idx(Integer r_idx);

    //12.
    public abstract boolean registerApply(Integer r_idx, String member_name);
}

























