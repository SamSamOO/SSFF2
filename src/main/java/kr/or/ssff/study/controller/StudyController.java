package kr.or.ssff.study.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import kr.or.ssff.study.domain.LangVO;
import kr.or.ssff.study.domain.RecruitBoardDTO;
import kr.or.ssff.study.domain.RecruitBoardVO;
import kr.or.ssff.study.service.StudyService;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

    /*---------------------------------------------------------------*/
    /*-----------------------------챌린지형--------------------------*/
    /*---------------------------------------------------------------*/


    /*챌린지형 스터디 리스트 조회
     * 파라메터 :
     * 반환 : 챌린지형 스터디 리스트 페이지
     * ToDo 매핑 O , DB O , paging X
     * */
    @GetMapping("/challenge/list")
    public String selectChallengeListGo(Model model) {
        log.info("challengeListGo() is invoked");

        List<RecruitBoardVO> list= this.service.getList("C");

        model.addAttribute("list", list);

        return "study/challenge/list";
    } //  selectChallengeListGo


    /*챌린지형 스터디 게시물 상세 +
     * 파라메터 :
     * 반환 : 챌린지형 스터디 게시물 상세보기 페이지
     * */
    @GetMapping("/challenge/detail")
    public void selectChallengeDetailGo(Integer r_idx ,Model model) {
        log.info("challengeDetailGo() is invoked");

        RecruitBoardVO board = this.service.get(r_idx);
        model.addAttribute("board",board);
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
        System.out.println("\t+ dto: " + dto);
        log.info("\t+ dto: " + dto);

        RecruitBoardVO vo =
            new RecruitBoardVO(
                null, "nickname55",'C',
                dto.getTitle(),
                dto.getTeamname(),
                dto.getCont(),
                null,
                null,
                dto.getSido(),
                dto.getCh_pattern(),
                dto.getCh_start(),
                dto.getCh_end(),
                null,null,null
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
    @GetMapping("/challenge/detail/modifyGo")
    public String updateChallengeDetailGo() {

        log.info("modifyChallengeDetailGo() is invoked");

        return "/study/challenge/list/detail/modify";
    } // updateChallengeDetailGo


    /*챌린지형 게시글 수정 기능을 수행합니다.
     * 파라메터 :
     * 반환 : 수정한 게시글 페이지로 이동합니다.
     * //TODO 파라미터??
     * */
    @PostMapping("/challenge/detail/modify")
    public String updateChallengeDetail() {

        log.info("modifyChallengeDetail() is invoked");

        return "redirect:/study/challenge/list/detail";
    } // updateChallengeDetail


    /*챌린지형 게시글을 삭제합니다
     * 파라메터 :
     * 반환 : 챌린지형 리스트 페이지
     * */
    @PostMapping("/challenge/detail/remove")
    public String deleteChallengeDetail() {

        log.info("removeChallengeDetail() is invoked");

        return "redirect:/study/challenge/list";
    } // deleteChallengeDetail



    /*---------------------------------------------------------------*/
    /*----------------------------프로젝트형-------------------------*/
    /*---------------------------------------------------------------*/

    /*프로젝트형 스터디 리스트 조회
     * 파라메터 :
     * 반환 : 프로젝트형 스터디 리스트 페이지
     * */
    @GetMapping("/project/list")
    public String selectProjectListGo(Model model) {
        log.info("selectProjectListGo() is invoked");

        List<RecruitBoardVO> list= this.service.getList("P");

        List<LangVO> langList = this.service.getLangList();

//        model.addAttribute("list", list);
 //       model.addAttribute("langList",langList);

        List<Map<String, Object>> liste = this.service.getRecruitBoardMap(list, langList);
        model.addAttribute("list", liste);

        return "study/project/list";

    } // selectProjectListGo


    /*프로젝트형 스터디 게시물 상세 +
     * 파라메터 :
     * 반환 : 프로젝트형 스터디 게시물 상세보기 페이지
     * */
    @GetMapping("/project/detail")
    public void selectProjectDetailGo(Integer r_idx ,Model model) {
        log.info("selectProjectDetailGo() is invoked");

        RecruitBoardVO board = this.service.get(r_idx);
        List<LangVO>langList = this.service.getLangTagByR_idx(r_idx);

        model.addAttribute("board",board);
        model.addAttribute("langList",langList);
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
                null, "nickname55",'P',
                dto.getTitle(),
                dto.getTeamname(),
                dto.getCont(),
                null, null, null,
                null, null, null,
                null, null,null
            );
        //새글 등록하기
        boolean result = this.service.register(vo);

        //새글에 해당하는 글번호 찾아오기
        Integer currentR_idx = this.service.getCurrentR_idx();

        //그 글번호로 언어 태그 등록하기
        for(int i=0;i< taglist.length;i++){
            boolean tagResult = this.service.registerLangTag(currentR_idx,taglist[i]);
        }

        return "redirect:/study/project/list";
    } // insertProjectDetail


    /*프로젝트형 게시글 수정 페이지로 이동합니다.
     * 파라메터 :
     * 반환 : 프로젝트형 게시글 수정 페이지.
     * */
    @GetMapping("/project/detail/modifyGo")
    public String updateProjectDetailGo() {

        log.info("updateProjectDetailGo() is invoked");

        return "/study/project/list/detail/modify";
    } // updateProjectDetailGo

    /*프로젝트형 게시글 수정 기능을 수행합니다.
     * 파라메터 :
     * 반환 : 수정한 게시글 페이지로 이동합니다.
     * //TODO 파라미터??
     * */
    @PostMapping("/project/detail/modify")
    public String updateProjectDetail() {

        log.info("updateProjectDetail() is invoked");

        return "redirect:/study/project/list/detail";
    } // updateProjectDetail

    /*프로젝트형 게시글을 삭제합니다
     * 파라메터 :
     * 반환 : 챌린지형 리스트 페이지
     * */
    @PostMapping("/project/detail/remove")
    public String deleteProjectDetail() {

        log.info("deleteProjectDetail() is invoked");

        return "redirect:/study/project/list";
    } // deleteProjectDetail

    /*댓글 작성 기능 수행
     * 파라메터 :
     * 반환 : //TODO --예솔
     * */
    @PostMapping("/comment/post")
    public String insertComment() {
        log.info("insertComment() is invoked");

        return "";
    }

    /*댓글 수정 기능 수행
     * 파라메터 :
     * 반환 : //TODO --예솔
     * */
    @PostMapping("/comment/modify")
    public String updateComment() {
        log.info("updateComment() is invoked");

        return "";
    }

    /*댓글삭제 기능 수행
     *파라메터 :
     * 반환 :
     * //TODO --예솔
     * */
    @PostMapping("/comment/remove")
    public String deleteComment() {

        log.info("deleteComment() is invoked");

        return "";

    }


} // end class

























