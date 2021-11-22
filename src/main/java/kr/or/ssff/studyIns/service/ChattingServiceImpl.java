package kr.or.ssff.studyIns.service;

import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import kr.or.ssff.mapper.ChattingMapper;
import kr.or.ssff.studyIns.model.ChatMsgDTO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@AllArgsConstructor
@Log4j2

@Service("chattingService")
public class ChattingServiceImpl  implements ChattingService, InitializingBean, DisposableBean {

    @Autowired
    private ChattingMapper mapper;

    @Override
    public Integer insertMsg(HashMap<String, Object> params) {
        log.info("insertMsg({}) is invoked", "params = " + params);

        Objects.requireNonNull(mapper);



        return this.mapper.insertMsg(params);
    }

    @Override
    public List<ChatMsgDTO> selectBySendTime() {
        log.info("selectBySendTime() is invoked");

        Objects.requireNonNull(mapper);

        return this.mapper.selectBySendTime();
    }

    @Override
    public void destroy() throws Exception {

    }

    @Override
    public void afterPropertiesSet() throws Exception {

    }
}

























