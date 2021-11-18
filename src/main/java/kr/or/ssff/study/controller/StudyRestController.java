package kr.or.ssff.study.controller;

import java.util.List;
import java.util.Map;
import kr.or.ssff.study.domain.RecruitBoardJoinReplyVO;
import kr.or.ssff.study.domain.ReplyVO;
import kr.or.ssff.study.domain.StudyCriteria;
import kr.or.ssff.study.service.StudyService;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/studyRest")
@Log4j2

@NoArgsConstructor
@RestController
public class StudyRestController {
    @Autowired
    public StudyService service;
    public String jsonData;


    @RequestMapping(value="/comment/get",method = RequestMethod.POST)
    public @ResponseBody
    List<ReplyVO> getComment(@RequestBody Map<String, Integer> jsonData) {
        log.debug("getComment({}) invoked.", jsonData);


       List<ReplyVO> list = this.service.getReplyList(jsonData.get("r_idx"));

        return list;
    } // getComment


    /*댓글 작성 기능 수행
     * 파라메터 :
     * 반환 : //TODO --예솔
     * */
    @PostMapping("/comment/post")
    public @ResponseBody boolean insertComment(@RequestBody Map<String, String> jsonData) {
        log.info("insertComment({}) is invoked",jsonData);

        ReplyVO vo = new ReplyVO(
            null,
            Integer.parseInt(jsonData.get("r_idx")),
            jsonData.get("member_name"),
            jsonData.get("c_cont"),
            null,null
        );

        boolean result = this.service.replyRegister(vo);

        return true;
    }

    /*댓글 수정 기능 수행
     * 파라메터 :
     * 반환 : //TODO --예솔
     * */
    @PostMapping("/comment/modify")
    public @ResponseBody boolean updateComment(@RequestBody Map<String, String> jsonData) {
        log.info("updateComment({}) is invoked",jsonData);

        boolean result = this.service.replyModify(Integer.parseInt(jsonData.get("no")),jsonData.get("c_cont"));
        return true;

    }//updateComment

    /*댓글삭제 기능 수행
     *파라메터 :
     * 반환 :
     * //TODO --예솔
     * */
    @PostMapping("/comment/remove")
    public @ResponseBody boolean deleteComment(@RequestBody Map<String, Integer> jsonData) {
        log.info("deleteComment({}) is invoked",jsonData);

        boolean result = this.service.replyRemove(jsonData.get("no"));

        return true;
    }//deleteComment

    @PostMapping("/challenge/list")
    public @ResponseBody boolean getChallengeListByPageNum(@RequestBody Map<String, Integer> jsonData) {
        //1. 해당 페이지에 속하는 데이터만 뿌리기
        List<RecruitBoardJoinReplyVO> list= this.service.getListWithJoinReply("C",jsonData.get("pageNum"));

        //2. 페이징에 관한 설정
        //2-1. 게시물 갯수 세기
        Integer totalCount = this.service.getTotal("C");

        //Criteria 생성
        StudyCriteria sc= new StudyCriteria();

        //Criteria 채우기(x7)
        sc.setTotalPost(totalCount);
        //postPerPage=15
        sc.setTotalPage((int) Math.ceil(sc.getTotalPost() / 15.0));
        sc.setCurrentPage(1);
        //pagePerBlock=3
        sc.setCurrentBlock(1);
        sc.setTotalBlock((int) Math.ceil((double) (sc.getTotalPage()) / (double) (sc.getPagePerBlock())));

        //sc.setCurrentBlock(1) 에 대한 추가 설정
        if (sc.getCurrentPage() > sc.getPagePerBlock()){
            for (int i = 1; i <= sc.getTotalBlock(); i++){
                if (sc.getCurrentPage() >= i * sc.getPagePerBlock() + 1 && sc.getCurrentPage() <= sc.getPagePerBlock() * (i + 1)){
                    sc.setCurrentBlock(i + 1);
                    i = sc.getTotalBlock() + 1;
                }
            }
        }

        return true;
    }



}//end- class
