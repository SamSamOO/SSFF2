package kr.or.ssff.manager.controller;

import java.util.List;
import java.util.Objects;
import kr.or.ssff.applyMember.domain.ApplyMemberListVO;
import kr.or.ssff.manager.domain.ManagerMemberVO;
import kr.or.ssff.manager.domain.ManagerStudyListByBossYVO;
import kr.or.ssff.manager.domain.ManagerStudyVO;
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

/*

 */
@NoArgsConstructor
@Log4j2

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    private ManagerService service;

    /*모든 멤버리스트를 조회합니다.
     * 파라메터 : MemberVO 타입의 List --allMemberList
     * 반환 : 멤버리스트 조회페이지
     * */

//    @GetMapping("/member/list")
//    public String selectMemberList(List<MemberVO> allMemberList) {
//        log.info("selectMemberList({}) is invoked", "allMemberList = " + allMemberList);
//
//        return "manager/member/list";
//    } // selectMemberList

    @GetMapping("/member/list")
    public String allMemberList(Criteria criteria, Model model) {
        log.info("allMemberList({}) is invoked", "criteria = " + criteria + ", model = " + model);

        List<ManagerMemberVO> memberList = this.service.getMemberListPerPaging(criteria);

        model.addAttribute("memberList", memberList);
        model.addAttribute("pageMaker", new PageDTO(criteria, service.countMemberCount()));

        log.info("memberList = {}", memberList);

        return "manager/member/list";
    } // allMemberList

    @GetMapping("/member/search")
    public String searchMemberList(Criteria criteria,String keyword, Model model) {
        log.info("searchMemberList({}) is invoked", "criteria = " + criteria + ", model = " + model);

        List<ManagerMemberVO> memberList = this.service.getSearchMemberPerPaging(criteria,keyword);

        model.addAttribute("memberList", memberList);
        model.addAttribute("pageMaker", new PageDTO(criteria, service.countMemberCountBy(keyword)));

        log.info("memberList = {}", memberList);

        return "manager/member/list";
    }

//    @GetMapping("/member/list")
//    public String MemberListGo() {
//        log.info("selectMemberList() is invoked");
//
//        return "manager/member/list";
//    } // MemberListGo

    //TODO 상세정보 페이지에는 어떤 파라메터를 던져줘야하는지??
    //TODO
    /*회원의 상세정보를 조회합니다.
     * 파라메터 : MemberVO --member-- ???
     * 반환 : 멤버 상세정보 페이지
     * */
    @GetMapping("/member/info")
    public String selectMemberDetail(MemberVO member) {

        log.info("selectMemberDetail({}) is invoked", "member = " + member);

        return "manager/member/info/list";
    } // selectMemberDetail

    /*회원별 상세 정보 수정 페이지 이동
     * 파라메터 : MemberVo --member --??
     *  반환 : 멤버 상세정보 수정 페이지
     * */
    @GetMapping("/member/info/modifyGo")
    public String updateMemberGo(MemberDTO member) {

        log.info("updateMemberGo({}) is invoked", "member = " + member);

        return "manager/member/info/modify";
    } // updateMemberGo

    //TODO 이게맞는지?
    /*회원별 상세 정보 수정 기능 수행
     * 파라메터 : MemberVo --member
     * 반환 : 상세 정보 수정 페이지로 포워드
     * */
    @PostMapping("/member/info/modify")
    public String updateMember(MemberVO member) {
        log.info("updateMember({}) is invoked", "member = " + member);

        return "forward:/manager/member/info/modifyGo";
    } // updateMember

    //TODO 민주누나 이거 활동 내역이라는게 어떤걸 조회하는거지??
    /*회원별 활동 내역 조회
     * 파라메터 : List -- <Member>
     * 반환 : 회원별 활동 내역 조회 페이지
     * */
    @GetMapping("/member/archive/list")
    public String selectMemberArchiveList(List<MemberVO> memberList) {
        log.info("selectMemberArchiveList({}) is invoked", "memberList = " + memberList);

        return "manager/member/archive/list";
    } // selectMemberArchiveList

    /*회원별 소속 스터디
     * 파라메터 : List -- <MemberVO>
     * 반환 : 회원별 소속 스터디 내역 페이지
     * */
    @GetMapping("/member/archive/study")
    public String selectMemberStudyList(List<MemberVO> memberList) {
        log.info("selectMemberStudyList({}) is invoked", "memberList = " + memberList);

        return "manager/member/archive/study";
    } // selectMemberStudyList

    /* 카페 예약 내역
     * 파라메터 : List <MemberVO>
     *반환 : 회원별 카페 예약 내역페이지
     * */
//    @GetMapping("/member/archive/reservation")
//    public String selectReservationList(List<MemberVO> memberList) {
//        log.info("selectReservationList({}) is invoked", "memberList = " + memberList);
//
//        return "manager/member/archive/reservation";
//    } // selectReservationList

    /* 카페 리스트
     * 파라메터 : List <StudyInsVO>
     *반환 : 회원별 카페 예약 내역페이지
     * */
    @GetMapping("/manager/studyIns/list")
    public String allStudyInsList() {
        log.info("allStudyInsList() is invoked");

        return "manager/studyIns/list";
    } // allStudyInsList

    /*회원별 결제 내역
     * 파라메터 : List<MemberVo >
     * 반환 : 회원별 결제 내역 리스트 페이지
     * */
    @GetMapping("/member/archive/payment")
    public String selectTransactionList(List<MemberVO> memberList) {
        log.info("selectTransactionList({}) is invoked", "memberList = " + memberList);

        return "manager/member/archive/payment";
    } // selectTransactionList

    /*스터디 목록 조회 (회원의 모든 스터디 목록을 확인 할 수 있습니다)
     * 파라메터 :
     *반환 :
     * */
    @GetMapping("/study/list")
    public String selectStudyList(Criteria criteria,Model model) {
        log.info("selectStudyList({}) is invoked", "criteria = " + criteria + ", model = " + model);

        Objects.requireNonNull(service);

        List<ManagerStudyListByBossYVO> list = this.service.getStudyListPerPaging(criteria);

        log.info("list = {}", list);

        model.addAttribute("list", list);
        model.addAttribute("pageMaker", new PageDTO(criteria, service.countStudyCount()));

        return "manager/study/list";
    }

    /*스터디별 상세 정보 조회 (회원의 스터디 목록중 하나에 대한 상세 정보를 조회합니다)
     * 파라메터 :
     * 반환 :
     * */
    @GetMapping("/study/info")
    public String selectStudyMain() {
        log.info("selectStudyMain() is invoked");

        return "manager/study/info";
    }

    /**/
} // end class