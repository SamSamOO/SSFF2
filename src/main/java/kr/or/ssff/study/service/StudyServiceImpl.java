package kr.or.ssff.study.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import kr.or.ssff.applyMember.domain.ApplyMemberDTO;
import kr.or.ssff.mapper.ApplyMemberMapper;
import kr.or.ssff.mapper.StudyMapper;
import kr.or.ssff.study.domain.LangVO;
import kr.or.ssff.study.domain.RecruitBoardDTO;
import kr.or.ssff.study.domain.RecruitBoardJoinReplyVO;
import kr.or.ssff.study.domain.RecruitBoardVO;
import kr.or.ssff.study.domain.ReplyCountVO;
import kr.or.ssff.study.domain.ReplyVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Log4j2
@AllArgsConstructor

@Service("studyService")
public class StudyServiceImpl implements StudyService {

    private StudyMapper mapper;
    private ApplyMemberMapper applyMemberMapper;
    
    @Override
    public Integer getAtd(HashMap<String, Object> map){
        log.info("getAtd({}) is invoked", "map = " + map);
    
        Objects.requireNonNull(mapper);
        return mapper.getAtd(map);
    }

    @Transactional // 21.12.01 지혜 추가 : 개설자 글 insert시 a_mem insert
    @Override
    public boolean register(RecruitBoardVO vo) {
        int affectedRows = mapper.insert(vo);
        log.info("\t + affectedRows:{}", affectedRows);

        // 21.12.01 지혜 추가 : 개설자 글 insert시 a_mem insert
        log.info("register>>>>>>>>" + vo.getR_idx()); // 방금 insert된 r_idx 가져와서
        HashMap<String, Object> param = new HashMap<>();

        param.put("boss","y"); // applymem insert할 정보 채움
        param.put("r_idx", vo.getR_idx());
        param.put("member_name",vo.getMember_name());

        Integer num = this.applyMemberMapper.insertApply(param);
        log.info("\t + insertApply({}) ", num);

        return (affectedRows == 1 && num ==1);
    }//register

    @Override
    public boolean modify(RecruitBoardVO vo) {
        int affectedRows = mapper.update(vo);
        log.info("\t + affectedRows:{}", affectedRows);
        return affectedRows == 1;
    }//modify

    @Override
    public boolean remove(Integer r_idx) {
        int affectedRows = mapper.delete(r_idx);
        return affectedRows == 1;
    }//remove

    @Override
    public RecruitBoardVO get(Integer r_idx) {
        Integer hitup = this.mapper.hitUp(r_idx);
        RecruitBoardVO vo = this.mapper.get(r_idx);

        return vo;

    }; //get

    @Override
    public List<RecruitBoardVO> getList(String type,Integer page) {

        List<RecruitBoardVO> allBoard = this.mapper.getList(type,page);

        return allBoard;
    }//getList(글 전체반환)

    @Override
    public List<RecruitBoardJoinReplyVO> getListWithJoinReply(String type, Integer page) {
        List<RecruitBoardJoinReplyVO> allBoard = this.mapper.getListWithJoinReply(type,page);
        return allBoard;
    }//getListWithJoinReply

    @Override
    public List<RecruitBoardJoinReplyVO> getListWithJoinReplyAddSearch(String type, Integer page,String text) {
        List<RecruitBoardJoinReplyVO> allBoard = this.mapper.getListWithJoinReplyAddSearch(type,page,text);
        return allBoard;
    }//getListWithJoinReplyAddSearch

    @Override
    public List<RecruitBoardJoinReplyVO> getListWithJoinReplyAddLogo(String type, Integer page,
        String text) {
        String[] arr = text.split(",");
        List<RecruitBoardJoinReplyVO> allBoard = this.mapper.getListWithJoinReplyAddLogo(type,page,arr);
        return allBoard;
    }//getListWithJoinReplyAddLogo

    @Override
    public List<RecruitBoardJoinReplyVO> getListWithJoinReplyOrderByHit(String type, Integer page) {
        List<RecruitBoardJoinReplyVO> allBoard = this.mapper.getListWithJoinReplyOrderByHit(type,page);
        return allBoard;
    }//getListWithJoinReplyOrderByHit

    @Override
    public List<RecruitBoardJoinReplyVO> getListWithJoinReplyExceptClosed(String type,
        Integer page) {
        List<RecruitBoardJoinReplyVO> allBoard = this.mapper.getListWithJoinReplyExceptClosed(type,page);
        return allBoard;
    }//getListWithJoinReplyExceptClosed

    @Override
    public List<RecruitBoardJoinReplyVO> getListWithJoinReplyOrderByHitExceptClosed(String type,
        Integer page) {
        List<RecruitBoardJoinReplyVO> allBoard = this.mapper.getListWithJoinReplyOrderByHitExceptClosed(type,page);
        return allBoard;
    }//getListWithJoinReplyOrderByHitExceptClosed

    @Override
    public List<RecruitBoardVO> getListPerPage() {
        return null;
    }

    @Override
    public Integer getTotal(String type) {
        int totalCount = mapper.getPostCount(type);
        return totalCount;
    }//getTotal

    @Override
    public Integer getTotalExceptClosed(String type) {
        int totalCount = mapper.getPostCountExceptClosed(type);
        return totalCount;
    }//getTotalExceptClosed

    @Override
    public Integer getTotalAddSearch(String type, String searchText) {
        int totalCount = mapper.getPostCountAddSearch(type,searchText);
        return totalCount;
    }//getTotalAddSearch

    @Override //작업중
    public Integer getTotalAddLogo(String type, String selectedLogoSet) {
        String[] arr = selectedLogoSet.split(",");
        int totalCount = mapper.getPostCountAddLogo(type,arr);
        return totalCount;
    }//getTotalAddLogo
    @Override
    public boolean registerLangTag(Integer r_idx,String tag) {
        int affectedRows = mapper.insertTag(r_idx,tag);

        return affectedRows == 1;

    }//registerLangTag(프로젝트 - 언어태그 삽입)

    @Override
    public Integer getCurrentR_idx() {

        int currentR_idx = this.mapper.getCurrentR_idx();

        return currentR_idx;
    }//getCurrentR_idx(가장 마지막에 쓴 게시글 번호 가져오기(프로젝트))

    @Override
    public List<LangVO> getLangList() {

        List<LangVO> langlist = this.mapper.getLangList();

        return langlist;
    }//getLangList lang list 전체 가져오기

    @Override
    public List<Map<String, Object>> getRecruitBoardMap(List<RecruitBoardJoinReplyVO> list, List<LangVO> langList) {
        List<Map<String, Object>> rcBoardList = new ArrayList<Map<String, Object>>();
        /*
        list.forEach(rcBoard -> {
            List<String> langNameList = new ArrayList<String>();
            langList.forEach(lvo -> {
                if (rcBoard.getR_idx().equals(lvo.getR_idx())) {
                    langNameList.add(lvo.getLang_name());
                }
            });
            // ObjectMapper
            ObjectMapper objectMapper = new ObjectMapper();
            Map rcBoardMap = objectMapper.convertValue(rcBoard, Map.class);
            rcBoardMap.put("langs", langNameList);
            rcBoardList.add(rcBoardMap);
        });
        */
        for (int i=0; i<list.size(); i++) {
            List<String> langNameList = new ArrayList<String>();
            for (int j=0; j<langList.size(); j++) {
                if (list.get(i).getR_idx().equals(langList.get(j).getR_idx()) ) {
                    langNameList.add(langList.get(j).getLang_name());
                }
            }
            // ObjectMapper
            ObjectMapper objectMapper = new ObjectMapper();
            Map rcBoardMap = objectMapper.convertValue(list.get(i), Map.class);
            rcBoardMap.put("langs", langNameList);
            rcBoardList.add(rcBoardMap);
        }
        return rcBoardList;
    }//getRecruitBoardMap

    @Override
    public List<LangVO> getLangTagByR_idx(Integer r_idx) {
        List<LangVO> langTagList = new ArrayList<LangVO>();
        langTagList = this.mapper.getLangTags(r_idx);
        return langTagList;
    }//getLangTagByR_idx

    @Override
    public boolean registerApply(Integer r_idx, String member_name) {
        int affectedRows = mapper.insertApply(r_idx,member_name);

        log.info("\t + affectedRows:{}", affectedRows);

        return affectedRows == 1;
    }//registerApply

    @Override
    public boolean deleteTag(Integer r_idx) {
        int affectedRows = mapper.deleteTag(r_idx);
        return affectedRows !=0;
    }//deleteTag

    @Override
    public boolean replyRegister(ReplyVO vo) {
        int affectedRows = mapper.insertReply(vo);
        return affectedRows == 1;
    }//replyPost

    @Override
    public List<ReplyVO> getReplyList(Integer r_idx) {
        List<ReplyVO> allBoard = this.mapper.getReplyList(r_idx);
        return allBoard;
    }//getReplyList

    @Override
    public boolean replyRemove(Integer no) {
        int affectedRows = mapper.replyDelete(no);
        return affectedRows == 1;
    }//replyRemove

    @Override
    public boolean replyModify(Integer no, String c_cont) {
        int affectedRows = mapper.replyUpdate(no,c_cont);
        return affectedRows == 1;
    }//replyModify

    @Override
    public List<ReplyCountVO> getReplyCount() {
        List<ReplyCountVO> replyCount = mapper.replyCount();
        return replyCount;
    }//getReplyCount

    @Override
    public Integer getReplyCountByR_idx(Integer r_idx) {
        Integer reply = mapper.replyCountByR_idx(r_idx);
        return reply;
    }//getReplyCountByR_idx

    /*@Override(안되는 코드 일단 냅둘것)
    public ArrayList<Integer> getR_idxListUsingLogoset(String selectedLogoSet) {
        String str = selectedLogoSet;
        String[] arr = str.split(",");

        ArrayList<Integer> r_idxList = mapper.getR_idxListUsingLogoset(arr);

        return r_idxList;
    }*/

    @Override
    public boolean updateAttendance(HashMap<String, Object> map) {
        log.info("updateAttendance({}) is invoked", "map = " + map);
        Integer affectedRows = 0;
        Integer afrow;
    
        Objects.requireNonNull(mapper);
        log.info("중간확인 ");
        
        affectedRows = this.mapper.attendanceOkOneByOne(map);
        log.info("affectedRows = {}", affectedRows);
        if(affectedRows==0){
            affectedRows = this.mapper.updateAttendance(map);
            afrow = this.mapper.updateTotalAttendance(map);
            log.info("afrow = {}", afrow);
    
            log.info("affectedRows = {}", affectedRows);
        }

        log.info("affectedRows = {}", affectedRows);
    
        
        return affectedRows==1? false:true;
    } // updateAttendance

    @Override
    public List<ApplyMemberDTO> getMemberByR_idx(Integer r_idx) {

        List<ApplyMemberDTO> applyList = this.mapper.getMemberByR_idx(r_idx);

        return applyList;
    }//getMemberByR_idx
    
    @Override
    public ApplyMemberDTO getTeamName(Integer r_idx){
    
        return this.mapper.getTeamName(r_idx);
    }
    
}//end class

































