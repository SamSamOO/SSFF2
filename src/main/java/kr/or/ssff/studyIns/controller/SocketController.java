package kr.or.ssff.studyIns.controller;

import java.util.ArrayList;
import java.util.List;
import kr.or.ssff.applyMember.domain.MemberDTO;
import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.message.SimpleMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

/*

 */
@Controller
@Log4j2
public class SocketController {

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    @MessageMapping("/user/{name}")
    @SendTo("/topic/users")
    public List<MemberDTO> showUsers(@DestinationVariable String name) {

        log.info("showUsers({}) is invoked", "name = " + name);

        List<MemberDTO> users = new ArrayList<MemberDTO>();
        log.info("users = {}", users);

        if (name != null) {
            MemberDTO user = new MemberDTO();
            user.setMember_name(name);
            users.add(user);
            log.info("user = {}", user);
            //클라이언트 부분을 써야합니다.
        }
        log.info("users = {}", users);

        return users;
        // now every
    }
}

























