package kr.or.ssff.study.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kr.or.ssff.study.domain.LangVO;
import kr.or.ssff.study.domain.RecruitBoardJoinReplyVO;
import kr.or.ssff.study.domain.ReplyVO;
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

    /*---------------------------------------------------------------*/
    //비동기 댓글 컨트롤러
    //작업자 : 제예솔
    /*---------------------------------------------------------------*/
    @RequestMapping(value="/comment/get",method = RequestMethod.POST)
    public @ResponseBody
    List<ReplyVO> getComment(@RequestBody Map<String, Integer> jsonData) {
        log.debug("getComment({}) invoked.", jsonData);

        List<ReplyVO> list = this.service.getReplyList(jsonData.get("r_idx"));

        return list;
    } // getComment

    /*댓글 작성 기능 수행
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

    }//insertComment

    /*댓글 수정 기능 수행
     * */
    @PostMapping("/comment/modify")
    public @ResponseBody boolean updateComment(@RequestBody Map<String, String> jsonData) {
        log.info("updateComment({}) is invoked",jsonData);

        boolean result = this.service.replyModify(Integer.parseInt(jsonData.get("no")),jsonData.get("c_cont"));
        return true;

    }//updateComment

    /*댓글삭제 기능 수행
     * */
    @PostMapping("/comment/remove")
    public @ResponseBody boolean deleteComment(@RequestBody Map<String, Integer> jsonData) {
        log.info("deleteComment({}) is invoked",jsonData);

        boolean result = this.service.replyRemove(jsonData.get("no"));
        return true;

    }//deleteComment

    /*---------------------------------------------------------------*/
    //비동기 paging&sorting 컨트롤러
    //작업자 : 제예솔
    /*---------------------------------------------------------------*/
    
    /*챌린지 리스트 paging&sorting
    * */
    @PostMapping("/challenge/list")
    public @ResponseBody Map<String, Object> getChallengeListByPageNum(@RequestBody Map<String, String> jsonData) {
        log.info("getChallengeListByPageNum({}) is invoked",jsonData);

        String orderRule = jsonData.get("orderRule"); // latest or popularity
        String closed = jsonData.get("closed"); //true(마감 제외) or false(전부)
        String searchText = jsonData.get("searchText");//검색(null or "")
        String searchTextqueryForm = "%" + searchText+"%";

        List<RecruitBoardJoinReplyVO> list = new ArrayList<RecruitBoardJoinReplyVO>();
        Integer boardTotal = 0;

        if(searchText !=null && !searchText.equals("")){

            list = this.service.getListWithJoinReplyAddSearch("C", Integer.parseInt(jsonData.get("pageNum")),searchTextqueryForm);
            boardTotal = this.service.getTotalAddSearch("C",searchTextqueryForm);

        }else {

            if (orderRule.equals("latest") && closed.equals("false")) {
                list = this.service.getListWithJoinReply("C", Integer.parseInt(jsonData.get("pageNum")));
                boardTotal = this.service.getTotal("C");
            } else if (orderRule.equals("popularity") && closed.equals("false")) {
                list = this.service.getListWithJoinReplyOrderByHit("C", Integer.parseInt(jsonData.get("pageNum")));
                boardTotal = this.service.getTotal("C");
            } else if (orderRule.equals("latest") && closed.equals("true")) {
                list = this.service.getListWithJoinReplyExceptClosed("C", Integer.parseInt(jsonData.get("pageNum")));
                boardTotal = this.service.getTotalExceptClosed("C");
            } else if (orderRule.equals("popularity") && closed.equals("true")) {
                list = this.service.getListWithJoinReplyOrderByHitExceptClosed("C", Integer.parseInt(jsonData.get("pageNum")));
                boardTotal = this.service.getTotalExceptClosed("C");
            }

        }
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("boardList", list);
        data.put("boardTotal", boardTotal);
        return data;
    }//getChallengeListByPageNum

    /*프로젝트 리스트 paging&sorting
     * */
    @PostMapping("/project/list")
    public @ResponseBody Map<String, Object> getProjectListByPageNum(@RequestBody Map<String, String> jsonData) {
        log.info("getProjectListByPageNum({}) is invoked",jsonData);

        String orderRule =  jsonData.get("orderRule");
        String closed =  jsonData.get("closed"); //true(마감 제외) or false(전부)
        String selectedLogoSet = jsonData.get("selectedLogoSet"); //typescript,java

        List<RecruitBoardJoinReplyVO> list = new ArrayList<RecruitBoardJoinReplyVO>();
        Integer boardTotal = 0;

        if(!selectedLogoSet.equals("")){
            list = this.service.getListWithJoinReplyAddLogo("P", Integer.parseInt(jsonData.get("pageNum")),selectedLogoSet);
            boardTotal = this.service.getTotalAddLogo("P",selectedLogoSet);

        }else {

            if (orderRule.equals("latest") && closed.equals("false")) {
                list = this.service.getListWithJoinReply("P", Integer.parseInt(jsonData.get("pageNum")));
                boardTotal = this.service.getTotal("P");
            } else if (orderRule.equals("popularity") && closed.equals("false")) {
                list = this.service.getListWithJoinReplyOrderByHit("P", Integer.parseInt(jsonData.get("pageNum")));
                boardTotal = this.service.getTotal("P");
            } else if (orderRule.equals("latest") && closed.equals("true")) {
                list = this.service.getListWithJoinReplyExceptClosed("P", Integer.parseInt(jsonData.get("pageNum")));
                boardTotal = this.service.getTotalExceptClosed("P");
            } else if (orderRule.equals("popularity") && closed.equals("true")) {
                list = this.service.getListWithJoinReplyOrderByHitExceptClosed("P", Integer.parseInt(jsonData.get("pageNum")));
                boardTotal = this.service.getTotalExceptClosed("P");
            }
        }
        List<LangVO> langList = this.service.getLangList();

        List<Map<String, Object>> listMap = this.service.getRecruitBoardMap(list, langList);

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("boardList", listMap);
        data.put("boardTotal", boardTotal);
        return data;
        
    }//getChallengeListByPageNum

    /*---------------------------------------------------------------*/
    //스터디 출석 컨트롤러
    //작업자 : 박상준
    /*---------------------------------------------------------------*/

    /* 스터디 메인에서 출석버튼 클릭시 >> swal 확인 >> 출석됩니다 >> 출석하지 않는 경우 뭐 본인이 불이익이기에.. 별도로 처리하지 않는 걸로 하는 것이 옳다고 생각합니다
    >> 출석일자의 +1 만 해주면 됩니다. /studyRest/updateAttendance
 * 매개변수: 스터디 번호 R_IDX, Member_Name,  study_Join_arciwf가  i 여야 합니다.
 * 반환: INTEGER  .
 * 작성자: 박상준
 * */
    @RequestMapping(value = "/updateAttendance", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public Boolean updateAttendance(@RequestBody HashMap<String, Object> filterJSON) {
        log.info("updateAttendance({}) is invoked", "filterJSON = " + filterJSON);

        HashMap<String, Object> map = new HashMap<>();
        map.put("r_Idx", filterJSON.get("r_Idx"));
        map.put("member_name", filterJSON.get("member_Name"));

        log.info("map = {}", map);

//        int affectedRow = this.service.updateAttendance()
    
        Boolean bl = this.service.updateAttendance(map);
        log.info("bl = {}", bl);
        return bl;
    }


}//end- class
