package kr.or.ssff.studyIns.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import kr.or.ssff.studyIns.model.Room;
import kr.or.ssff.studyIns.service.ChattingService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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

    @RequestMapping(value= "/chat/insert", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public JSONObject insertChatting(@RequestBody HashMap<String, Object> params) {
        log.info("insertChatting({}) is invoked", "params = " + params);

        Objects.requireNonNull(service);



        return new JSONObject(params);
    }

}

























