package kr.or.ssff.studyIns.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import kr.or.ssff.studyIns.model.ChatMsgDTO;
import kr.or.ssff.studyIns.model.Room;
import kr.or.ssff.studyIns.service.ChattingService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/*

 */
@Log4j2
@AllArgsConstructor

@RestController
public class ChattingRestController {


    static int roomNumber = 0;
    List<Room> roomList = new ArrayList<Room>();

    @Autowired
    ChattingService service;

    @RequestMapping(value = "/chat/insert", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public JSONObject insertChatting(@RequestBody(required = false) HashMap<String, Object> params) {
        log.info("insertChatting({}) is invoked", "params = " + params);

        Objects.requireNonNull(service);

        Integer affectedRows = service.insertMsg(params);

        return new JSONObject(params);
    }

    @RequestMapping(value = "/chat/getAllChat")
    public HashMap<String,Object> getAllChat(String r_Idx) {
        HashMap<String, Object> map = new HashMap<>();

        log.info("getAllChat({}) is invoked", "r_Idx = " + r_Idx);

        Objects.requireNonNull(service);

        List<ChatMsgDTO> chatMsgDTOS = service.selectBySendTime(r_Idx);
        log.info("chatMsgDTOS = {}", chatMsgDTOS);


        return map;
    }
}

























