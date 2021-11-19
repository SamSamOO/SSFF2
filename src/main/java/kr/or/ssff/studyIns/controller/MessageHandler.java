package kr.or.ssff.studyIns.controller;

import java.util.ArrayList;
import java.util.List;
import kr.or.ssff.studyIns.model.ChatMsgDTO;
import kr.or.ssff.studyIns.model.HelloMessage;
import kr.or.ssff.studyIns.model.Message;
import lombok.extern.log4j.Log4j2;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.util.HtmlUtils;

/*

 */
@Controller
@Log4j2
public class MessageHandler {

    //@MessageMapping 어노텡션에 의해 /hello 라는 api로 매핑이 되어 있습니다.
    //클라이언트에서 "../hello"라는 api로 메세제를 보내면  broadcasting 이라는 메서드가 호출됩니다

    @MessageMapping("/hello")
    @SendTo("/topic/chat")
    public Message broadcasting( HelloMessage message) throws Exception {
        return new Message(HtmlUtils.htmlEscape(message.getName()));
    }
}

























