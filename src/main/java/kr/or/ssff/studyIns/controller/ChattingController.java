package kr.or.ssff.studyIns.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import javax.servlet.http.HttpSession;
import kr.or.ssff.studyIns.model.Room;
import kr.or.ssff.studyIns.service.ChattingService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/*

 */
@Log4j2
@AllArgsConstructor


@Controller("chattingController")
public class ChattingController implements InitializingBean, DisposableBean {

    List<Room> roomList = new ArrayList<>();
    static int roomNumber = 0;


    @Autowired
    private ChattingService service;


//-------------------------------- 상준 채팅방--------------------------------//

    /*
     * 해당 스터디의 채팅방으로 이동
     * 매개변수: 채팅방 ID
     * 반환: 해당 스터디의 채팅방 뷰단
     * */
    @GetMapping("/chat")
    public String chatRoom(Integer r_Idx, Model model, HttpSession session) { // TODO 매개변수..
        log.info("chatRoom({}) is invoked", "r_Idx = " + r_Idx + ", model = " + model + ", session = " + session);

        return "studyIns/chatRoom/chatRoom";
    } // chatRoom


    /*
     * 해당 스터디의 채팅방의 방을 구분합니다.
     * 매개변수: --
     * 반환: 해당 스터디의 채팅방 구분 목록의 뷰단
     * */
    @GetMapping("/room")
    public String room() {
        log.info("room() is invoked");

        return "studyIns/chatRoom/room";
    }

    @RequestMapping("/createRoom")
    public @ResponseBody
    List<Room> createRoom(@RequestParam HashMap<Object, Object> params) {
        log.info("createRoom({}) is invoked", "params = " + params);

        String roomName = (String) params.get("roomName");
        Objects.requireNonNull(roomName);

        if (roomName != null & !roomName.trim().equals("")) {
            Room room = new Room();
            room.setRoomNumber(++roomNumber);
            room.setRoomName(roomName);
            roomList.add(room);
        }
        log.info("roomList = {}", roomList);
        return roomList;
    }

    /**
     * 방 정보가져오기
     * @param params
     * @return
     */
    @RequestMapping("/getRoom")
    public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params){
        return roomList;
    }

    /**
     * 채팅방
     * @return
     */
    @RequestMapping("/moveChating")
    public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
        ModelAndView mv = new ModelAndView();
        int roomNumber = Integer.parseInt((String) params.get("roomNumber"));

        List<Room> new_list = roomList.stream().filter(o->o.getRoomNumber()==roomNumber).collect(Collectors.toList());
        if(new_list != null && new_list.size() > 0) {
            mv.addObject("roomName", params.get("roomName"));
            mv.addObject("roomNumber", params.get("roomNumber"));
            mv.setViewName("chat");
        }else {
            mv.setViewName("room");
        }
        return mv;
    }

    @Override
    public void destroy() throws Exception {

    }

    @Override
    public void afterPropertiesSet() throws Exception {

    }



}

























