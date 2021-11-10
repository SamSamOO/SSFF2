package kr.or.ssff.study.service;

import kr.or.ssff.mapper.StudyMapper;
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
    }//register

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
    public List<String> getList() {
        return null;
    }

    @Override
    public List<String> getListPerPage() {
        return null;
    }

    @Override
    public Integer getTotal() {
        return null;
    }
}

























