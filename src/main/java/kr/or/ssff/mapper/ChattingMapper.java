package kr.or.ssff.mapper;

import java.util.HashMap;
import java.util.List;
import kr.or.ssff.studyIns.model.ChatMsgDTO;
import org.apache.ibatis.annotations.Param;

public interface ChattingMapper {

    public abstract Integer insertMsg(HashMap<String, Object> params);

    public abstract List<ChatMsgDTO> selectBySendTime(Integer r_Idx);

    public abstract Integer checkYouInStudy(@Param("map") HashMap<String, Object> map);
    
    public abstract String getStudyInfo(@Param("r_Idx") Integer r_Idx);
    
}
