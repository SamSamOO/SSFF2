package kr.or.ssff.mapper;

import java.util.HashMap;
import java.util.List;
import kr.or.ssff.studyIns.model.ChatMsgDTO;

public interface ChattingMapper {

    public abstract Integer insertMsg(HashMap<String, Object> params);


    public abstract List<ChatMsgDTO> selectBySendTime(Integer r_Idx);


    public abstract Integer checkYouInStudy(HashMap<String, Object> map);
}
