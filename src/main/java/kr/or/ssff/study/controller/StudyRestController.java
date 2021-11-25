package kr.or.ssff.study.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import kr.or.ssff.study.domain.LangVO;
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
    public @ResponseBody List<RecruitBoardJoinReplyVO> getChallengeListByPageNum(@RequestBody Map<String, String> jsonData) {
        log.info("getChallengeListByPageNum({}) is invoked",jsonData);
        //String orderRule = jsonData.get("orderRule"); 안됨
        List<RecruitBoardJoinReplyVO> list = new ArrayList<RecruitBoardJoinReplyVO>();
        //if(orderRule.equals("최신순")){
            list= this.service.getListWithJoinReply("C",Integer.parseInt(jsonData.get("pageNum")));
        //}else{
        //    list= this.service.getListWithJoinReplyOrderByHit("C",Integer.parseInt(jsonData.get("pageNum")));
        //}
        //1. 해당 페이지에 속하는 데이터만 뿌리기


        return list;
    }//getChallengeListByPageNum


    @PostMapping("/project/list")
    public @ResponseBody List<Map<String, Object>> getProjectListByPageNum(@RequestBody Map<String, Integer> jsonData) {
        //1. 해당 페이지에 속하는 데이터만 뿌리기
        List<RecruitBoardJoinReplyVO> list= this.service.getListWithJoinReply("P",jsonData.get("pageNum"));
        List<LangVO> langList = this.service.getLangList();

        List<Map<String, Object>> listMap = this.service.getRecruitBoardMap(list, langList);
        return listMap;
    }//getChallengeListByPageNum




}//end- class
