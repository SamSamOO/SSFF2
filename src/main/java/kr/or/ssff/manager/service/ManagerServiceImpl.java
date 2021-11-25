package kr.or.ssff.manager.service;

import java.util.HashMap;
import java.util.Objects;
import kr.or.ssff.manager.domain.ManagerMemberVO;
import kr.or.ssff.manager.domain.ManagerStudyListByBossYVO;
import kr.or.ssff.mapper.ManagerMapper;
import kr.or.ssff.studyIns.model.Criteria;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*

 */
@Log4j2
@AllArgsConstructor

@Service("managerService")
public class ManagerServiceImpl implements ManagerService, InitializingBean, DisposableBean {


    @Autowired
    private ManagerMapper mapper;


    @Override
    public Integer countStudyCount(HashMap<String, Object> map) {
        log.info("countStudyCount({}) is invoked", "map = " + map);

        Objects.requireNonNull(mapper);
        Integer count = this.mapper.countStudyCount(map);

        log.info("count = {}", count);

        return count;
    }

    @Override
    public List<ManagerStudyListByBossYVO> getStudyListPerPaging(Criteria criteria, HashMap<String,Object> map) {

        log.info("getStudyListPerPaging({}) is invoked", "criteria = " + criteria + ", map = " + map);

        Objects.requireNonNull(mapper);

        List<ManagerStudyListByBossYVO> list = this.mapper.getStudyListPerPaging(map );

        log.info("list = {}", list);
        return list;
    }

    @Override
    public Integer countMemberCountBy(String keyword) {
        log.info("countMemberCountBy({}) is invoked", "keyword = " + keyword);

        Objects.requireNonNull(mapper);

        Integer count = this.mapper.countMemberCountBy(keyword);

        return count;
    }

    @Override
    public List<ManagerMemberVO> getSearchMemberPerPaging(Criteria criteria,String keyword) {
        log.info("getSearchMemberPerPaging({}) is invoked", "criteria = " + criteria);

        Objects.requireNonNull(mapper);
        log.info("mapper = {}", this.mapper.getSearchMemberPerPaging(criteria.getPageNum(), criteria.getAmount(),keyword));

        List<ManagerMemberVO> list = this.mapper.getSearchMemberPerPaging(criteria.getPageNum(), criteria.getAmount(),keyword);


        return list;
    }
    @Override
    public List<ManagerMemberVO> getMemberListPerPaging(Criteria criteria) {
        log.debug("getMemberListPerPaging() invoked");

        Objects.requireNonNull(mapper);
        log.info("mapper = {}", this.mapper.getMemberListPerPaging(criteria.getPageNum(), criteria.getAmount()));

        List<ManagerMemberVO> list = this.mapper.getMemberListPerPaging(criteria.getPageNum(), criteria.getAmount());

        return list;
    } // getMemberListPerPaging
    @Override
    public Integer countMemberCount() {
        log.info("countMemberCount() is invoked");

        Integer count = this.mapper.countMemberCount();

        return count;
    }

    @Override
    public boolean register() {
        return false;
    } // register

    @Override
    public boolean modify() {
        return false;
    } // modify

    @Override
    public boolean remove() {
        return false;
    } // remove

    @Override
    public String get() {
        return null;
    } // get

    @Override
    public List<String> getList() {
        return null;
    } // getList

    @Override
    public List<String> getListPerPage() {
        return null;
    } // getListPerPage



//===============================================================================================

    @Override
    public void destroy() throws Exception {
        log.info("destroy() is invoked");
    } // destroy

    @Override
    public void afterPropertiesSet() throws Exception {
        log.info("afterPropertiesSet() is invoked");
    } // afterPropertiesSet

}// end class