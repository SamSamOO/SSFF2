package kr.or.ssff.applyMember.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ssff.applyMember.domain.ApplyMemberListVO;
import kr.or.ssff.applyMember.service.ApplyMemberService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

/*
 * 최초 작성자: 신지혜
 * 목적: applyMember controll
 */



@Log4j2
@NoArgsConstructor

@RequestMapping("/applyMember")
@Controller
public class ApplyMemberController {

    @Setter(onMethod_= { @Autowired })
    private ApplyMemberService service;

  

    /* 참여신청자, 멤버목록 
     * 매개변수:
     * 반환: 스터디목록 뷰
     * 작성자: 신지혜
//     * */
    @GetMapping("/studyModalTest")
    public void studyModalTest(String r_idx, Model model){

    } // studyModalTest

    
    /* 스터디 카페 예약내역 페이지로 이동합니다
     * 파라메터 : nickname
     * 스터디 카페 예약내역 페이지
     * */
    @GetMapping("/reservationList")
    public String selectReservationList(String nickname) {
        log.debug("selectReservationList({}) is invoked", "nickname = " + nickname);

        return "/member/reservationList";
    } // reservationList








} // end class

























