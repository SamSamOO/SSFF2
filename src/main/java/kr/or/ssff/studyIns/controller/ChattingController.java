package kr.or.ssff.studyIns.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import javax.servlet.http.HttpSession;
import kr.or.ssff.member.domain.MemberDTO;
import kr.or.ssff.studyIns.model.Room;
import kr.or.ssff.studyIns.service.ChattingService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    static int roomNumber = 0;
    HttpSession session;
    //-------------------------------- 상준 채팅방--------------------------------//
    @Autowired
    ChattingService service;


    List<Room> roomList = new ArrayList<Room>();


    @RequestMapping("/chat")
    public ModelAndView chat() {
        log.info("chat() is invoked");

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/studyIns/chatRoom/room");
        return mv;
    }

    /**
     * 방 페이지
     *
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
     *
     * @param params
     * @return
     */
    @RequestMapping("/createRoom")
    public @ResponseBody
    List<Room> createRoom(@RequestParam HashMap<Object, Object> params) {
        log.info("createRoom() is invoked");

        String roomName = (String) params.get("roomName");
        log.info("roomName = {}", roomName);

        if (roomName != null && !roomName.trim().equals("")) {
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
     *
     * @param params
     * @return
     */
    @RequestMapping("/getRoom")
    public @ResponseBody
    List<Room> getRoom(@RequestParam HashMap<Object, Object> params) {
        log.info("getRoom() is invoked");
        log.info("룸아이디" + roomList);

        return roomList;
    }

    /**
     * 채팅방 이동
     *
     * @return url
     */
    @RequestMapping("/moveChating")
    public String chating(@RequestParam("r_Idx") Integer r_Idx, Model model, HttpSession session) {
        
        MemberDTO dto = (MemberDTO) session.getAttribute("member");
    
        service.getStudyInfo(r_Idx);
        
        HashMap<String, Object> map = new HashMap<>();
        map.put("member", dto);
        map.put("r_Idx", r_Idx);
        map.put("teamName", service.getStudyInfo(r_Idx));
    
        log.info("map = {}", map);
        
        log.info("session = {}", session.getAttribute("member"));
        log.info("chating({}) is invoked", "r_Idx = " + r_Idx + ", model = " + model);
        
        log.info("dto = {}", dto);
        log.info("roomNumber = {}", roomNumber);

        Objects.requireNonNull(service);

        Integer insStudy = this.service.checkYouInStudy(map);
        log.info("insStudy = {}", insStudy);

        List<Room> new_list = roomList.stream().filter(o -> o.getRoomNumber() == roomNumber).collect(Collectors.toList());
        
        model.addAttribute("inStudy", insStudy);
        model.addAttribute("r_Idx", r_Idx);
        model.addAttribute("map", map);
        
        log.info("new_list = {}", new_list);

        return "/studyIns/chatRoom/room";
    }

}

























