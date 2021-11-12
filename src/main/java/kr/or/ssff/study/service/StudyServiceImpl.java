package kr.or.ssff.study.service;

import kr.or.ssff.mapper.StudyMapper;
import kr.or.ssff.study.domain.LangVO;
import kr.or.ssff.study.domain.RecruitBoardVO;
import kr.or.ssff.mapper.StudyMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

/*
일단 이거 임시로 만들어놓은 거임. 동작 안하니까 꼭 고쳐야 함
 */
@Log4j2
@AllArgsConstructor

@Service("studyService")
public class StudyServiceImpl implements StudyService {

    private StudyMapper mapper;

    @Override
    public boolean register(RecruitBoardVO vo) {

        int affectedRows = mapper.insert(vo);

        log.info("\t + affectedRows:{}", affectedRows);

        return affectedRows == 1;
    }//register (글 등록)

    @Override
    public boolean modify() {
        return false;
    }

    @Override
    public boolean remove() {
        return false;
    }

    @Override
    public String get() {
        return null;
    }

    @Override
    public List<RecruitBoardVO> getList(String type) {
        List<RecruitBoardVO> allBoard = this.mapper.getList(type);

        return allBoard;
    }//getList(글반환)

    @Override
    public List<RecruitBoardVO> getListPerPage() {
        return null;
    }

    @Override
    public Integer getTotal() {
        return null;
    }

    @Override
    public boolean registerLangTag(Integer r_idx,String tag) {
        int affectedRows = mapper.insertTag(r_idx,tag);

        return affectedRows == 1;

    }//registerLangTag(프로젝트 - 언어태그 삽입)

    @Override
    public Integer getCurrentR_idx() {

        int currentR_idx = this.mapper.getCurrentR_idx();

        return currentR_idx;
    }//getCurrentR_idx가장 마지막에 쓴 게시글 번호 가져오기(프로젝트)

    @Override
    public List<LangVO> getLangList() {

        List<LangVO> langlist = this.mapper.getLangList();

        return langlist;
    }//getLangList lang list 전체 가져오기


}//end class



























