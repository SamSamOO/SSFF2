package kr.or.ssff.studyIns.service;

import kr.or.ssff.mapper.ChattingMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import oracle.jdbc.logging.annotations.DisableTrace;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*

 */
@AllArgsConstructor
@Log4j2

@Service("chattingService")
public class ChattingServiceImpl  implements ChattingService, InitializingBean, DisposableBean {

    @Autowired
    private ChattingMapper mapper;

    @Override
    public void destroy() throws Exception {

    }

    @Override
    public void afterPropertiesSet() throws Exception {

    }
}
























