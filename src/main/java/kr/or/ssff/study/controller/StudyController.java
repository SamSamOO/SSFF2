package kr.or.ssff.study.controller;

import kr.or.ssff.study.service.StudyService;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
     * */
    @GetMapping("/challenge/list")
    public String selectChallengeListGo() {

        log.info("challengeListGo() is invoked");

        return "study/challenge/list";//매핑O , DB X , paging X
    } //  selectChallengeListGo

    /*챌린지형 스터디 게시물 상세 +
     * 파라메터 :
     * 반환 : 챌린지형 스터디 게시물 상세보기 페이지
     * */
    @GetMapping("/challenge/detail")
    public String selectChallengeDetailGo() {

        log.info("challengeDetailGo() is invoked");

        return "study/challenge/detail";
    } // selectChallengeDetailGo


    /*챌린지형 게시글 등록 페이지로 이동합니다
     * 파라메터 :
     * 반환 : 챌린지형 스터디 게시글 등록 페이지
     * */
    @GetMapping("/challenge/postGo")
    public String insertChallengeDetailGo() {

        log.info("insertChallengeDetailGo() is invoked");

        return "study/challenge/post";
    } // insertChallengeDetailGo

    /*챌린지형 게시글 등록 기능을 수행합니다
     * 파라메터 :
     * 반환 : 등록한 게시글 페이지로 이동합니다
     * //TODO 해당 작성한 게시글의 게시물번호를 파라메터로 전송해야합니다.
     * */
    @PostMapping("/challenge/list/post")
    public String insertChellengeDetail() {

        log.info("insertChellengeDetail() is invoked");

        return "redirect:/study/challenge/list/detail";
    } // insertChellengeDetail

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

    /*챌린지형 스터디 리스트 조회
     * 파라메터 :
     * 반환 : 챌린지형 스터디 리스트 페이지
     * */
    @GetMapping("/project/list")
    public String selectProjectListGo() {

        log.info("selectProjectListGo() is invoked");

        return "study/project/list"; //매핑O , DB X , paging X
    } // selectProjectListGo

    /*챌린지형 스터디 게시물 상세 +
     * 파라메터 :
     * 반환 : 챌린지형 스터디 게시물 상세보기 페이지
     * */
    @GetMapping("/project/detail")
    public String selectProjectDetailGo() {

        log.info("selectProjectDetailGo() is invoked");

        return "study/project/detail";
    } // selectProjectDetailGo


    /*챌린지형 게시글 등록 페이지로 이동합니다
     * 파라메터 :
     * 반환 : 챌린지형 스터디 게시글 등록 페이지
     * */
    @GetMapping("/project/postGo")
    public String insertProjectDetailGo() {

        log.info("insertProjectDetailGo() is invoked");

        return "study/project/post";
    } // insertProjectDetailGo

    /*챌린지형 게시글 등록 기능을 수행합니다
     * 파라메터 :
     * 반환 : 등록한 게시글 페이지로 이동합니다
     * //TODO 해당 작성한 게시글의 게시물번호를 파라메터로 전송해야합니다.
     * */
    @PostMapping("/project/list/post")
    public String insertProjectDetail() {

        log.info("insertProjectDetail() is invoked");

        return "redirect:/study/project/list/detail";
    } // insertProjectDetail

    /*챌린지형 게시글 수정 페이지로 이동합니다.
     * 파라메터 :
     * 반환 : 챌린지형 게시글 수정 페이지.
     * */
    @GetMapping("/project/detail/modifyGo")
    public String updateProjectDetailGo() {

        log.info("updateProjectDetailGo() is invoked");

        return "/study/project/list/detail/modify";
    } // updateProjectDetailGo

    /*챌린지형 게시글 수정 기능을 수행합니다.
     * 파라메터 :
     * 반환 : 수정한 게시글 페이지로 이동합니다.
     * //TODO 파라미터??
     * */
    @PostMapping("/project/detail/modify")
    public String updateProjectDetail() {

        log.info("updateProjectDetail() is invoked");

        return "redirect:/study/project/list/detail";
    } // updateProjectDetail

    /*챌린지형 게시글을 삭제합니다
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

























