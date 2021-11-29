package kr.or.ssff.studyIns.service;


import java.util.HashMap;
import java.util.List;

import kr.or.ssff.studyIns.model.ChatMsgDTO;

public interface ChattingService {

    public Integer insertMsg(HashMap<String, Object> params);

    public List<ChatMsgDTO> selectBySendTime(Integer r_Idx);

    public Integer checkYouInStudy(HashMap<String,Object> map);
    
    public Object getStudyInfo(Integer r_idx);
    
}
