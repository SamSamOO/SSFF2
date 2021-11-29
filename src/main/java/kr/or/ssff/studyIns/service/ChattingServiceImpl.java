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
    public Object getStudyInfo(Integer r_idx){
        log.info("getStudyInfo({}) is invoked", "r_idx = " + r_idx);
    
        
        return this.mapper.getStudyInfo(r_idx);
    }
    
    @Override
    public Integer checkYouInStudy(HashMap<String,Object>map) {
        log.info("checkYouInStudy({}) is invoked", "map = " + map);
    
        int result = 0;
    
        Objects.requireNonNull(mapper);
        
        if (this.mapper.checkYouInStudy(map) != null) {
            result = 1;
        }
        
        return result;
    }

    @Override
    public Integer insertMsg(HashMap<String, Object> params) {
        log.info("insertMsg({}) is invoked", "params = " + params);

        Objects.requireNonNull(mapper);



        return this.mapper.insertMsg(params);
    }

    @Override
    public List<ChatMsgDTO> selectBySendTime(Integer r_Idx) {
        log.info("selectBySendTime() is invoked");

        Objects.requireNonNull(mapper);
        log.info("r_Idx = {}", r_Idx);
        List<ChatMsgDTO> list = this.mapper.selectBySendTime(r_Idx);

        log.info("list = {}", list);
        return list;
    }


    @Override
    public void destroy() throws Exception {

    }

    @Override
    public void afterPropertiesSet() throws Exception {

    }
}

























