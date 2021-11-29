package kr.or.ssff.applyMember.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import kr.or.ssff.applyMember.domain.ApplyMemberListVO;
import kr.or.ssff.applyMember.service.ApplyMemberService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/*
 * 최초 작성자: 신지혜
 * 목적: applyMember controll
 */


@Log4j2
@NoArgsConstructor

@RequestMapping("/applyMemberRest/*")
@RestController
public class ApplyMemberRestController {

    @Setter(onMethod_ = {@Autowired})
    private ApplyMemberService service;


    /* 참여신청자, 멤버목록
     * 매개변수:
     * 반환: 스터디목록 뷰
     * 작성자: 신지혜
     * */
    @RequestMapping(value = "/applyList", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public JSONObject studyModalTest(
        @RequestBody HashMap<String, String> filterJSON,
        String r_idx, Model model){
        r_idx = "9003"; //TODO 추후 클릭하는 스터디 정보로 변경
        log.debug("studyModalTest() is invoked");

        List<ApplyMemberListVO> applyMemberList = this.service.getApplyMemberList(filterJSON);
        log.info("\t + >>>>>>>>>>>>>>>>applyMemberList:{}", applyMemberList);
        log.info("\t+ list size: {}", applyMemberList.size());

        JSONObject jsonObject = new JSONObject();

        jsonObject.put("list", applyMemberList);
        model.addAttribute("applyMemberList", applyMemberList);

        return jsonObject;
    } // studyModalTest


    /* 스터디 가입상태 변경처리 (승인, 거절, 탈퇴, 취소)
     * 매개변수: 참여번호와 액션 정보
     * 반환:
     * 작성자: 신지혜
     * */
    @RequestMapping(value = "/apply_action", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public String applyAction(
        @RequestBody HashMap<String, String> filterJSON,
        HttpServletResponse response,
        ModelMap model) throws Exception {
        log.debug("studyModalTest({},{},{}) is invoked", filterJSON, response, model);

        String result = "";
        try {
            log.info("\t refusal_action_try");
            log.info("\t filterJSON: " + filterJSON);
            log.info("\t response: " + response);
            log.info("\t model: " + model);

            //   ObjectMapper mapper = new ObjectMapper();

            // HashMap<String, String> aMember = mapper.readValue(filterJSON, new HashMap<String, String>().getClass());

            HashMap<String, String> aMember = new HashMap<>();

            log.info("\t+ aMember.study_type: {}", filterJSON.get("study_type"));
            log.info("\t+ aMember.apply_idx: {}", filterJSON.get("apply_idx"));
            log.info("\t+ aMember.action: {}", filterJSON.get("action"));

            aMember.put("study_type", filterJSON.get("study_type"));
            aMember.put("apply_idx", filterJSON.get("apply_idx"));
            aMember.put("action", filterJSON.get("action"));

            boolean row = this.service.applyAction(aMember);

            if (row) {
                result = "done";
            }

        } catch (Exception e) {

        }
        response.setContentType("text/html; charset=UTF-8");

        log.info("\t result:{}", result);
        return result;
    } // applyAction


    /* 스터디 가입신청처리
     * 매개변수: 참여번호와 닉네임
     * 반환:
     * 작성자: 신지혜
     * */
    @RequestMapping(value = "/insert", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public String insertApplyMember(
        @RequestBody HashMap<String, Object> filterJSON,
        HttpServletResponse response,
        ModelMap model) throws Exception {
        log.debug("insertApplyMember({},{},{}) is invoked", filterJSON, response, model);
        String aMemberName = "";
        try {
            log.info("\t refusal_action_try");
            log.info("\t filterJSON: " + filterJSON);
            log.info("\t response: " + response);
            log.info("\t model: " + model);

            HashMap<String, Object> aMember = new HashMap<>();

            aMember.put("boss", filterJSON.get("boss"));
            aMember.put("r_idx", filterJSON.get("r_idx"));
            aMember.put("member_name", filterJSON.get("member_name"));

//            ObjectMapper mapper = new ObjectMapper();
//
//            HashMap<String, String> aMember = mapper.readValue(filterJSON, new HashMap<String, String>().getClass());

            log.info("\t+ aMember.boss: {}", aMember.get("boss"));
            log.info("\t+ aMember.r_idx: {}", aMember.get("r_idx"));
            log.info("\t+ aMember.member_name: {}", aMember.get("member_name"));

            aMemberName = this.service.registerApply(aMember);
            log.info("\t aMemberName: " + aMemberName);
        } catch (Exception e) {

        }
        response.setContentType("text/html; charset=UTF-8");

        return aMemberName;
    } // applyAction




} // end class

























