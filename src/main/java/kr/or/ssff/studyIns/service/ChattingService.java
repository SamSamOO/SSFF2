package kr.or.ssff.studyIns.service;


import java.util.HashMap;
import java.util.List;
import kr.or.ssff.studyIns.model.ChatMsgDTO;

public interface ChattingService {

    public Integer insertMsg(HashMap<String, Object> params);

    public List<ChatMsgDTO> selectBySendTime(String r_Idx);

}
