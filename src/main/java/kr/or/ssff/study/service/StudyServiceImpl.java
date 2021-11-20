package kr.or.ssff.study.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.Map;
import kr.or.ssff.mapper.StudyMapper;
import kr.or.ssff.study.domain.LangVO;
import kr.or.ssff.study.domain.RecruitBoardJoinReplyVO;
import kr.or.ssff.study.domain.RecruitBoardVO;
import kr.or.ssff.mapper.StudyMapper;
import kr.or.ssff.study.domain.ReplyCountVO;
import kr.or.ssff.study.domain.ReplyVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

/*
일단 이거 임시로 만들어놓은 거임. 동작 안하니까 꼭 고쳐야 함
 */
@Log4j2
@AllArgsConstructor

@Service("studyService")
public class StudyServiceImpl implements StudyService {

    private StudyMapper mapper;

    @Override
    public boolean register(RecruitBoardVO vo) {
        int affectedRows = mapper.insert(vo);
        log.info("\t + affectedRows:{}", affectedRows);
        return affectedRows == 1;
    }//register (글 등록)

    @Override
    public boolean modify(RecruitBoardVO vo) {
        int affectedRows = mapper.update(vo);
        log.info("\t + affectedRows:{}", affectedRows);
        return affectedRows == 1;
    }

    @Override
    public boolean remove(Integer r_idx) {
        int affectedRows = mapper.delete(r_idx);
        return affectedRows == 1;
    }

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
    }

    @Override
    public List<RecruitBoardJoinReplyVO> getListWithJoinReplyOrderByHit(String type, Integer page) {
        List<RecruitBoardJoinReplyVO> allBoard = this.mapper.getListWithJoinReplyOrderByHit(type,page);
        return allBoard;
    }

    @Override
    public List<RecruitBoardVO> getListPerPage() {
        return null;
    }

    @Override
    public Integer getTotal(String type) {
        int totalCount = mapper.getPostCount(type);
        return totalCount;
    }

    @Override
    public boolean registerLangTag(Integer r_idx,String tag) {
        int affectedRows = mapper.insertTag(r_idx,tag);

        return affectedRows == 1;

    }//registerLangTag(프로젝트 - 언어태그 삽입)

    @Override
    public Integer getCurrentR_idx() {

        int currentR_idx = this.mapper.getCurrentR_idx();

        return currentR_idx;
    }//getCurrentR_idx가장 마지막에 쓴 게시글 번호 가져오기(프로젝트)

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
    }

    @Override
    public boolean replyRemove(Integer no) {
        int affectedRows = mapper.replyDelete(no);
        return affectedRows == 1;
    }

    @Override
    public boolean replyModify(Integer no, String c_cont) {
        int affectedRows = mapper.replyUpdate(no,c_cont);
        return affectedRows == 1;
    }

    @Override
    public List<ReplyCountVO> getReplyCount() {

        List<ReplyCountVO> replyCount = mapper.replyCount();
        return replyCount;
    }

    @Override
    public Integer getReplyCountByR_idx(Integer r_idx) {
        Integer reply = mapper.replyCountByR_idx(r_idx);
        return reply;
    }

}//end class



























