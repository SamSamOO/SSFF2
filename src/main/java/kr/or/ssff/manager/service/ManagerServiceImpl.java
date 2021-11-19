package kr.or.ssff.manager.service;

import kr.or.ssff.mapper.ManagerMapper;
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

























