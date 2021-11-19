package kr.or.ssff.studyIns.controller;

import java.util.ArrayList;
import java.util.List;
import kr.or.ssff.studyIns.model.ChatMsgDTO;
import lombok.extern.log4j.Log4j2;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

/*

 */
@Controller
@Log4j2
public class SocketController {


    @MessageMapping("/user/{name}")
    @SendTo("/topic/users")
    public List<ChatMsgDTO> showUsers(@DestinationVariable String name, String msg_Cont) {

        log.info("showUsers({}) is invoked", "name = " + name + ", msg_Cont = " + msg_Cont);

        List<ChatMsgDTO> users = new ArrayList<ChatMsgDTO>();

        log.info("users = {}", users);

        if (name != null) {
            ChatMsgDTO chat = new ChatMsgDTO();
            chat.setMember_Name(name);
            chat.setR_Idx(9002);
            chat.setMsg_Cont(msg_Cont);
            users.add(chat);
            //클라이언트 부분을 써야합니다.
        }

        log.info("users = {}", users);

        return users;
        // now every
    }
}

























