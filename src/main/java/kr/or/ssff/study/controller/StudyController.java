package kr.or.ssff.study.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import javax.servlet.http.HttpServletRequest;
import kr.or.ssff.applyMember.domain.ApplyMemberDTO;
import kr.or.ssff.applyMember.domain.ApplyMemberVO;
import kr.or.ssff.study.domain.LangVO;
import kr.or.ssff.study.domain.RecruitBoardDTO;
import kr.or.ssff.study.domain.RecruitBoardVO;
import kr.or.ssff.study.domain.StudyCriteria;
import kr.or.ssff.study.service.StudyService;
import kr.or.ssff.studyIns.domain.StudyInsVO;
import kr.or.ssff.studyIns.model.Criteria;
import kr.or.ssff.studyIns.service.StudyInsService;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.AnnotationAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/*

 */
@RequestMapping("/study")
@Log4j2

@NoArgsConstructor
@Controller
public class StudyController {

    @Autowired
    private StudyService service;
    @Autowired
    private StudyInsService serviceOfStudyIns;
    
    private String jsonData;






    /*챌린지형 스터디 리스트 조회
     * 파라메터 :
     * 반환 : 챌린지형 스터디 리스트 페이지
     * ToDo 매핑 O , DB O , paging X
     * */
    @GetMapping("/challenge/list") //첫화면 기준으로 세팅
    public String selectChallengeListGo(Model model) {
        log.info("challengeListGo({}) is invoked.", model);

        //1. 해당 페이지에 속하는 데이터만 뿌리기(비동기 작업중으로 막아놓음)
        //List<RecruitBoardJoinReplyVO> list= this.service.getListWithJoinReply("C",page);

        //2. 페이징에 관한 설정
        //2-1. 게시물 갯수 세기
        Integer totalCount = this.service.getTotal("C");

        //Criteria 생성
        StudyCriteria sc = new StudyCriteria();

        //Criteria 채우기(x7)
        sc.setTotalPost(totalCount);
        //postPerPage=15
        sc.setTotalPage((int) Math.ceil(sc.getTotalPost() / 15.0));
        sc.setCurrentPage(1);
        //pagePerBlock=3
        sc.setCurrentBlock(1);
        sc.setTotalBlock((int) Math.ceil((double) (sc.getTotalPage()) / (double) (sc.getPagePerBlock())));

        //sc.setCurrentBlock(1) 에 대한 추가 설정
        if (sc.getCurrentPage() > sc.getPagePerBlock()) {
            for (int i = 1; i <= sc.getTotalBlock(); i++) {
                if (sc.getCurrentPage() >= i * sc.getPagePerBlock() + 1 && sc.getCurrentPage() <= sc.getPagePerBlock() * (i + 1)) {
                    sc.setCurrentBlock(i + 1);
                    i = sc.getTotalBlock() + 1;
                }
            }
        }

        //모델에다 전달해주기
        model.addAttribute("studyCriteria", sc);//비동기 처리로 쓸모없음

        return "study/challenge/list";
    } //  selectChallengeListGo


    /*챌린지형 스터디 게시물 상세 +
     * 파라메터 :
     * 반환 : 챌린지형 스터디 게시물 상세보기 페이지
     * */
    @GetMapping("/challenge/detail")
    public void selectChallengeDetailGo(Integer r_idx, Model model) {
        log.info("challengeDetailGo() is invoked");

        RecruitBoardVO board = this.service.get(r_idx);

        Integer replyCount = this.service.getReplyCountByR_idx(r_idx);

        List<ApplyMemberDTO> applylist = this.service.getMemberByR_idx(r_idx);

        if (replyCount == null) {
            model.addAttribute("replyCount", 0);
        } else {
            model.addAttribute("replyCount", replyCount);
        }
        model.addAttribute("board", board);
        model.addAttribute("applylist", applylist);
    } // selectChallengeDetailGo


    /*챌린지형 게시글 등록 페이지로 이동합니다
     * 파라메터 :
     * 반환 : 챌린지형 스터디 게시글 등록 페이지
     * //ToDo 완성
     * */
    @GetMapping("/challenge/postGo")
    public String insertChallengeDetailGo() {

        log.info("insertChallengeDetailGo() is invoked");

        return "study/challenge/post";
    } // insertChallengeDetailGo


    /*챌린지형 게시글 등록 기능을 수행합니다
     * 파라메터 :
     * 반환 : 등록한 게시글 페이지로 이동합니다
     * //ToDo 글등록 가능하며 로그인 연동이 필요합니다.
     * */
    @PostMapping("/challenge/post")
    public String insertChallengeDetail(RecruitBoardDTO dto, RedirectAttributes rttrs) {
        log.info("insertChallengeDetail() is invoked");

        RecruitBoardVO vo =
            new RecruitBoardVO(
                null, dto.getMember_name(), 'C',
                dto.getTitle(),
                dto.getTeamname(),
                dto.getCont(),
                null,
                null,
                dto.getSido(),
                dto.getCh_pattern(),
                dto.getCh_start(),
                dto.getCh_end(),
                null, null, null
            );

        boolean result = this.service.register(vo);
        //방금쓴 게시물 댓글번호 가져오기
        //Integer currentR_idx = this.service.getCurrentR_idx();
        //스터디번호와 닉네임을 넣어서 applymember 테이블 데이터 추가하기(지혜 로직 나오는대로)
        //boolean result2 = this.service.registerApply(currentR_idx, "nickname55");

        return "redirect:/study/challenge/list";
    } // insertChallengeDetail


    /*챌린지형 게시글 수정 페이지로 이동합니다.
     * 파라메터 :
     * 반환 : 챌린지형 게시글 수정 페이지.
     * */
    @GetMapping("/challenge/modifyGo")
    public void updateChallengeDetailGo(Integer r_idx, Model model) {
        
        log.info("updateChallengeDetailGo() is invoked");
        RecruitBoardVO board = this.service.get(r_idx);
        model.addAttribute("board", board);
        
    }


    /*챌린지형 게시글 수정 기능을 수행합니다.
     * 파라메터 :
     * 반환 : 수정한 게시글 페이지로 이동합니다.
     * //TODO 파라미터??
     * */
    @PostMapping("/challenge/modify")
    public String updateChallengeDetail(RecruitBoardDTO dto, RedirectAttributes rttrs) {

        RecruitBoardVO vo =
            new RecruitBoardVO(
                dto.getR_idx(), "nickname55", 'C',
                dto.getTitle(),
                dto.getTeamname(),
                dto.getCont(),
                null,
                null,
                dto.getSido(),
                dto.getCh_pattern(),
                dto.getCh_start(),
                dto.getCh_end(),
                null, dto.getClosed_ok(), null
            );

        boolean result = this.service.modify(vo);
        rttrs.addAttribute("result", result);
        return "redirect:/study/challenge/list";
    } // updateChallengeDetail


    /*챌린지형 게시글을 삭제합니다
     * 파라메터 :
     * 반환 : 챌린지형 리스트 페이지
     * */
    @GetMapping("/challenge/remove")
    public String removeChallengeDetail(Integer r_idx, RedirectAttributes rttrs) {
        log.info("removeChallengeDetail() is invoked");
        boolean result = this.service.remove(r_idx);

        return "redirect:/study/challenge/list";
    } // deleteChallengeDetail



    /*---------------------------------------------------------------*/
    /*----------------------------프로젝트형-------------------------*/
    /*---------------------------------------------------------------*/

    /*프로젝트형 스터디 리스트 조회
     * 파라메터 :
     * 반환 : 프로젝트형 스터디 리스트 페이지
     * */
    /*프로젝트형 스터디 리스트 조회
     * 파라메터 :
     * 반환 : 프로젝트형 스터디 리스트 페이지
     * */
    @GetMapping("/project/list")
    public String selectProjectListGo(Model model) {
        log.info("selectProjectListGo() is invoked");

        //2. 페이징에 관한 설정
        //2-1. 게시물 갯수 세기
        Integer totalCount = this.service.getTotal("P");
        //Criteria 생성
        StudyCriteria sc = new StudyCriteria();
        //Criteria 채우기(x7)
        sc.setTotalPost(totalCount);
        //postPerPage=15
        sc.setTotalPage((int) Math.ceil(sc.getTotalPost() / 15.0));
        sc.setCurrentPage(1);
        //pagePerBlock=3
        sc.setCurrentBlock(1);
        sc.setTotalBlock((int) Math.ceil((double) (sc.getTotalPage()) / (double) (sc.getPagePerBlock())));

        //sc.setCurrentBlock(1) 에 대한 추가 설정
        if (sc.getCurrentPage() > sc.getPagePerBlock()) {
            for (int i = 1; i <= sc.getTotalBlock(); i++) {
                if (sc.getCurrentPage() >= i * sc.getPagePerBlock() + 1 && sc.getCurrentPage() <= sc.getPagePerBlock() * (i + 1)) {
                    sc.setCurrentBlock(i + 1);
                    i = sc.getTotalBlock() + 1;
                }
            }
        }

        //model.addAttribute("list", listMap);
        model.addAttribute("studyCriteria", sc);//비동기 처리로 쓸모없음

        return "study/project/list";

    } // selectProjectListGo


    /*프로젝트형 스터디 게시물 상세 +
     * 파라메터 :
     * 반환 : 프로젝트형 스터디 게시물 상세보기 페이지
     * */
    @GetMapping("/project/detail")
    public void selectProjectDetailGo(Integer r_idx, Model model) {
        log.info("selectProjectDetailGo() is invoked");

        RecruitBoardVO board = this.service.get(r_idx);
        List<LangVO> langList = this.service.getLangTagByR_idx(r_idx);

        Integer replyCount = this.service.getReplyCountByR_idx(r_idx);
        List<ApplyMemberDTO> applylist = this.service.getMemberByR_idx(r_idx);
        if (replyCount == null) {
            model.addAttribute("replyCount", 0);
        } else {
            model.addAttribute("replyCount", replyCount);
        }
        model.addAttribute("applylist", applylist);
        model.addAttribute("board", board);
        model.addAttribute("langList", langList);
    } // selectProjectDetailGo


    /*프로젝트형 게시글 등록 페이지로 이동합니다
     * 파라메터 :
     * 반환 : 프로젝트형 스터디 게시글 등록 페이지
     * */
    @GetMapping("/project/postGo")
    public String insertProjectDetailGo() {

        log.info("insertProjectDetailGo() is invoked");

        return "study/project/post";
    } // insertProjectDetailGo

    /*프로젝트형 게시글 등록 기능을 수행합니다
     * 파라메터 :
     * 반환 : 등록한 게시글 페이지로 이동합니다
     * //TODO 해당 작성한 게시글의 게시물번호를 파라메터로 전송해야합니다.
     * */
    @PostMapping("/project/post")
    public String insertProjectDetail(RecruitBoardDTO dto, RedirectAttributes rttrs, HttpServletRequest request) {
        log.info("insertProjectDetail() is invoked");

        //선택한 태그 array 로 전달
        String[] taglist = request.getParameterValues("tag");

        RecruitBoardVO vo =
            new RecruitBoardVO(
                null, dto.getMember_name(), 'P',
                dto.getTitle(),
                dto.getTeamname(),
                dto.getCont(),
                null, null, null,
                null, null, null,
                null, null, null
            );
        //새글 등록하기
        boolean result = this.service.register(vo);

        //새글에 해당하는 글번호 찾아오기
        Integer currentR_idx = this.service.getCurrentR_idx();

        //그 글번호로 언어 태그 등록하기
        if (taglist != null) {
            for (int i = 0; i < taglist.length; i++) {
                boolean tagResult = this.service.registerLangTag(currentR_idx, taglist[i]);
            }
        }

        return "redirect:/study/project/list";
    } // insertProjectDetail


    /*프로젝트형 게시글 수정 페이지로 이동합니다.
     * 파라메터 :
     * 반환 : 프로젝트형 게시글 수정 페이지.
     * */
    @GetMapping("/project/modifyGo")
    public void updateProjectDetailGo(Integer r_idx, Model model) {
        log.info("updateProjectDetailGo({}) is invoked", "r_idx = " + r_idx + ", model = " + model);

        RecruitBoardVO board = this.service.get(r_idx);
        List<LangVO> langList = this.service.getLangTagByR_idx(r_idx);

        model.addAttribute("langList", langList);
        model.addAttribute("board", board);
    } // updateProjectDetailGo

    /*프로젝트형 게시글 수정 기능을 수행합니다.
     * 파라메터 :
     * 반환 : 수정한 게시글 페이지로 이동합니다.
     * //TODO 파라미터??
     * */
    @PostMapping("/project/modify")
    public String updateProjectDetail(RecruitBoardDTO dto, RedirectAttributes rttrs, HttpServletRequest request) {
        log.info("updateProjectDetail() is invoked");

        String[] taglist = request.getParameterValues("tag");

        RecruitBoardVO vo =
            new RecruitBoardVO(
                dto.getR_idx(), "nickname55", 'P',
                dto.getTitle(),
                dto.getTeamname(),
                dto.getCont(),
                null, null, null,
                null, null, null,
                null, dto.getClosed_ok(), null
            );

        boolean result = this.service.modify(vo);
        rttrs.addAttribute("result", result);

        //기존에 있는 태그들 삭제
        boolean deleteTagResult = this.service.deleteTag(dto.getR_idx());

        //새로 태그들 입력
        for (int i = 0; i < taglist.length; i++) {
            boolean tagResult = this.service.registerLangTag(dto.getR_idx(), taglist[i]);
        }

        return "redirect:/study/project/list";
    } // updateProjectDetail


    /*프로젝트형 게시글을 삭제합니다
     * 파라메터 :
     * 반환 : 챌린지형 리스트 페이지
     * */
    @GetMapping("/project/remove")
    public String removeProjectDetail(Integer r_idx, RedirectAttributes rttrs) {
        log.info("removeProjectDetail() is invoked");
        boolean result = this.service.remove(r_idx);

        return "redirect:/study/challenge/list";
    } // removeProjectDetail

    /*프로젝트형 게시글 수정 페이지로 이동합니다.
     * 파라메터 :
     * 반환 : 프로젝트형 게시글 수정 페이지.
     * */
    @GetMapping("/project/main") //아이디와 게시글
    public String projectMainGo(@RequestParam(value = "r_Idx") Integer r_Idx,Criteria criteria, Model model) throws Exception{
        log.info("projectMainGo({}) is invoked", "r_Idx = " + r_Idx + ", criteria = " + criteria + ", model = " + model);
        HashMap<String, Object> map = new HashMap<>();
    
        map.put("r_Idx", r_Idx);
        map.put("pageNum", criteria.getPageNum());
        map.put("amount", criteria.getAmount());
        map.put("category", "전체");
        Objects.requireNonNull(service);
    
        ApplyMemberDTO dto = this.service.getTeamName(r_Idx);
        
        log.info("dto={}", dto);
    
        List<StudyInsVO> list = this.serviceOfStudyIns.getList(map);
        log.info("list = {}", list);
        List<StudyInsVO> listOfNotice = this.serviceOfStudyIns.showNotice(map);
        log.info("listOfNotice = {}", listOfNotice);
    
        model.addAttribute("dto", dto);
        model.addAttribute("map", map);
        model.addAttribute("list", list);
        model.addAttribute("notice", listOfNotice);
        
        return "study/project/main";
    } // updateProjectDetailGo
    
    /*---------------------------------------------------------------*/
    /*-----------------------------챌린지형--------------------------*/
    /*---------------------------------------------------------------*/
    /*챌린지형 메인으로 이동
     * 파라메터 :
     * 반환 : 챌린지형 스터디 메인 페이지
     * */
    @GetMapping("/challenge/main")
    public String challengeMainGo(@RequestParam(value = "r_Idx") Integer r_Idx, Criteria criteria, Model model) throws Exception{
        log.info("challengeMainGo({}) is invoked", "r_Idx = " + r_Idx + ", criteria = " + criteria + ", model = " + model);
    
        HashMap<String, Object> map = new HashMap<>();
    
        map.put("r_Idx", r_Idx);
        map.put("pageNum", criteria.getPageNum());
        map.put("amount", criteria.getAmount());
        map.put("category", "전체");
        Objects.requireNonNull(service);
    
        ApplyMemberDTO dto = this.service.getTeamName(r_Idx);
    
        log.info("dto={}", dto);
    
        List<StudyInsVO> list = this.serviceOfStudyIns.getList(map);
        log.info("list = {}", list);
        List<StudyInsVO> listOfNotice = this.serviceOfStudyIns.showNotice(map);
        log.info("listOfNotice = {}", listOfNotice);
    
        model.addAttribute("dto", dto);
        model.addAttribute("map", map);
        model.addAttribute("list", list);
        model.addAttribute("notice", listOfNotice);
        
        return "/study/challenge/main";
    }

} // end class

























