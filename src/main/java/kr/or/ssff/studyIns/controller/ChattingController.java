package kr.or.ssff.studyIns.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import kr.or.ssff.studyIns.model.Room;
import kr.or.ssff.studyIns.service.ChattingService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/*

 */
@Log4j2
@AllArgsConstructor

@Controller
public class ChattingController {

//-------------------------------- 상준 채팅방--------------------------------//

    List<Room> roomList = new ArrayList<Room>();
    static int roomNumber = 0;

    @RequestMapping("/chat")
    public ModelAndView chat() {
        log.info("chat() is invoked");

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/studyIns/chatRoom/room");
        return mv;
    }

    /**
     * 방 페이지
     * @return
     */
    @RequestMapping("/room")
    public ModelAndView room() {
        log.info("room() is invoked");

        ModelAndView mv = new ModelAndView();

        mv.setViewName("/studyIns/chatRoom/chatRoom");

        return mv;
    }

    /**
     * 방 생성하기
     * @param params
     * @return
     */
    @RequestMapping("/createRoom")
    public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> params){
        log.info("createRoom() is invoked");

        String roomName = (String) params.get("roomName");
        log.info("roomName = {}", roomName);

        if(roomName != null && !roomName.trim().equals("")) {
            Room room = new Room();
            room.setRoomNumber(++roomNumber);
            room.setRoomName(roomName);
            roomList.add(room);
        }
        log.info("roomName = {}", roomName);
        return roomList;
    }

    /**
     * 방 정보가져오기
     * @param params
     * @return
     */
    @RequestMapping("/getRoom")
    public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params){
        log.info("getRoom() is invoked");
        log.info("룸아이디"+roomList);

        return roomList;
    }

    /**
     * 채팅방
     *
     * @return
     */
    @RequestMapping("/moveChating")
    public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
        log.info("chating() is invoked");

        ModelAndView mv = new ModelAndView();

        int roomNumber = Integer.parseInt((String) params.get("roomNumber"));
        log.info("roomNumber = {}", roomNumber);

        List<Room> new_list = roomList.stream().filter(o -> o.getRoomNumber() == roomNumber).collect(Collectors.toList());
        if (new_list != null && new_list.size() > 0) {
            mv.addObject("roomName", params.get("roomName"));
            mv.addObject("roomNumber", params.get("roomNumber"));
            mv.setViewName("/studyIns/chatRoom/room");
        } else {
            mv.setViewName("/studyIns/chatRoom/chatRoom");
        }
        return mv;
    }



}

























