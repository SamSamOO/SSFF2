package kr.or.ssff.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import kr.or.ssff.manager.domain.ManagerMemberVO;
import kr.or.ssff.manager.domain.ManagerStudyListByBossYVO;
import kr.or.ssff.manager.service.ManagerService;
import kr.or.ssff.member.domain.MemberVO;
import kr.or.ssff.member.model.MemberDTO;
import kr.or.ssff.studyIns.model.Criteria;
import kr.or.ssff.studyIns.model.PageDTO;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/*

 */
@NoArgsConstructor
@Log4j2

@RestController
//@RequestMapping("/manager")
public class ManagerRestController {

    @Autowired
    private ManagerService service;


} // end class