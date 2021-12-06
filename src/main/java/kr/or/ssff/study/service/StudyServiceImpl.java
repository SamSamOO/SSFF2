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


    // 1. 새로운 게시물 등록
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

    // 2. 기존 게시글 수정
    @Override
    public boolean modify(RecruitBoardVO vo) {
        int affectedRows = mapper.update(vo);
        log.info("\t + affectedRows:{}", affectedRows);
        return affectedRows == 1;
    }//modify

    // 3. 기존 게시글 삭제
    @Override
    public boolean remove(Integer r_idx) {
        int affectedRows = mapper.delete(r_idx);
        return affectedRows == 1;
    }//remove

    // 4. 특정 게시글 상세조회 + 조회수 1업
    @Override
    public RecruitBoardVO get(Integer r_idx) {
        Integer hitup = this.mapper.hitUp(r_idx);
        RecruitBoardVO vo = this.mapper.get(r_idx);

        return vo;

    }; //get

    // 5. 전체 목록 조회 (쓰지 않음)
    @Override
    public List<RecruitBoardVO> getList(String type,Integer page) {

        List<RecruitBoardVO> allBoard = this.mapper.getList(type,page);

        return allBoard;
    }//getList(글 전체반환)

    //5-1 글목록 페이징 + 댓글 조인 + 최신순 + 마감제외없음
    @Override
    public List<RecruitBoardJoinReplyVO> getListWithJoinReply(String type, Integer page) {
        List<RecruitBoardJoinReplyVO> allBoard = this.mapper.getListWithJoinReply(type,page);
        return allBoard;
    }//getListWithJoinReply

    //5-1-1(챌린지) 글목록 페이징 + 댓글 조인 + 최신순 + 마감제외없음 + 검색기능
    @Override
    public List<RecruitBoardJoinReplyVO> getListWithJoinReplyAddSearch(String type, Integer page,String text) {
        List<RecruitBoardJoinReplyVO> allBoard = this.mapper.getListWithJoinReplyAddSearch(type,page,text);
        return allBoard;
    }//getListWithJoinReplyAddSearch

    //5-1-2.(프로젝트) 글목록 페이징 + 댓글 조인 + 최신순 + 마감제외없음 + 로고조회기능
    @Override
    public List<RecruitBoardJoinReplyVO> getListWithJoinReplyAddLogo(String type, Integer page,
        String text) {
        String[] arr = text.split(",");
        List<RecruitBoardJoinReplyVO> allBoard = this.mapper.getListWithJoinReplyAddLogo(type,page,arr);
        return allBoard;
    }//getListWithJoinReplyAddLogo

    //5-2 글목록 페이징 + 댓글 조인+ 인기순 + 마감제외없음
    @Override
    public List<RecruitBoardJoinReplyVO> getListWithJoinReplyOrderByHit(String type, Integer page) {
        List<RecruitBoardJoinReplyVO> allBoard = this.mapper.getListWithJoinReplyOrderByHit(type,page);
        return allBoard;
    }//getListWithJoinReplyOrderByHit

    //5-3 글목록 페이징 + 댓글 조인 + 최신순 + 마감제외
    @Override
    public List<RecruitBoardJoinReplyVO> getListWithJoinReplyExceptClosed(String type,
        Integer page) {
        List<RecruitBoardJoinReplyVO> allBoard = this.mapper.getListWithJoinReplyExceptClosed(type,page);
        return allBoard;
    }//getListWithJoinReplyExceptClosed

    //5-4 글목록 페이징 + 댓글 조인+ 인기순 + 마감제외
    @Override
    public List<RecruitBoardJoinReplyVO> getListWithJoinReplyOrderByHitExceptClosed(String type,
        Integer page) {
        List<RecruitBoardJoinReplyVO> allBoard = this.mapper.getListWithJoinReplyOrderByHitExceptClosed(type,page);
        return allBoard;
    }//getListWithJoinReplyOrderByHitExceptClosed

    //6. 게시글 총개수 구하기
    @Override
    public Integer getTotal(String type) {
        int totalCount = mapper.getPostCount(type);
        return totalCount;
    }//getTotal

    //6-1. 게시글 총개수 구하기(마감 제외)
    @Override
    public Integer getTotalExceptClosed(String type) {
        int totalCount = mapper.getPostCountExceptClosed(type);
        return totalCount;
    }//getTotalExceptClosed

    //6-1. 게시글 총개수 구하기(검색어필터)
    @Override
    public Integer getTotalAddSearch(String type, String searchText) {
        int totalCount = mapper.getPostCountAddSearch(type,searchText);
        return totalCount;
    }//getTotalAddSearch

    //6-2. 게시글 총개수 구하기(로고선택필터)
    @Override
    public Integer getTotalAddLogo(String type, String selectedLogoSet) {
        String[] arr = selectedLogoSet.split(",");
        int totalCount = mapper.getPostCountAddLogo(type,arr);
        return totalCount;
    }//getTotalAddLogo

    //7. 태그 입력하기
    @Override
    public boolean registerLangTag(Integer r_idx,String tag) {
        int affectedRows = mapper.insertTag(r_idx,tag);

        return affectedRows == 1;

    }//registerLangTag(프로젝트 - 언어태그 삽입)

    //8. P에서 최근에 등록한 글 번호 가져오기
    @Override
    public Integer getCurrentR_idx() {

        int currentR_idx = this.mapper.getCurrentR_idx();

        return currentR_idx;
    }//getCurrentR_idx(가장 마지막에 쓴 게시글 번호 가져오기(프로젝트))

    //9. p에서 lang list 가져오기(전체)
    @Override
    public List<LangVO> getLangList() {

        List<LangVO> langlist = this.mapper.getLangList();

        return langlist;
    }//getLangList lang list 전체 가져오기

    //10. list에 억지로 언어태그 넣기
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

    //11. p에서 번호로 언어태그 가져오기
    @Override
    public List<LangVO> getLangTagByR_idx(Integer r_idx) {
        List<LangVO> langTagList = new ArrayList<LangVO>();
        langTagList = this.mapper.getLangTags(r_idx);
        return langTagList;
    }//getLangTagByR_idx

    //12. 방장이 글씀과 동시에 apply table 에 들어가기
    @Override
    public boolean registerApply(Integer r_idx, String member_name) {
        int affectedRows = mapper.insertApply(r_idx,member_name);

        log.info("\t + affectedRows:{}", affectedRows);

        return affectedRows == 1;
    }//registerApply

    //13. P에서 글수정시 새태그 등록을 위해 기존 태그 버리기
    @Override
    public boolean deleteTag(Integer r_idx) {
        int affectedRows = mapper.deleteTag(r_idx);
        return affectedRows !=0;
    }//deleteTag

    //14. 댓글 달기
    @Override
    public boolean replyRegister(ReplyVO vo) {
        int affectedRows = mapper.insertReply(vo);
        return affectedRows == 1;
    }//replyPost

    //15. 글번호로 댓글 다 가져오기
    @Override
    public List<ReplyVO> getReplyList(Integer r_idx) {
        List<ReplyVO> allBoard = this.mapper.getReplyList(r_idx);
        return allBoard;
    }//getReplyList

    //16. 댓글 삭제하기
    @Override
    public boolean replyRemove(Integer no) {
        int affectedRows = mapper.replyDelete(no);
        return affectedRows == 1;
    }//replyRemove

    //17. 댓글 수정하기
    @Override
    public boolean replyModify(Integer no, String c_cont) {
        int affectedRows = mapper.replyUpdate(no,c_cont);
        return affectedRows == 1;
    }//replyModify

    //18. 댓글 개수 가져오기
    @Override
    public List<ReplyCountVO> getReplyCount() {
        List<ReplyCountVO> replyCount = mapper.replyCount();
        return replyCount;
    }//getReplyCount

    //19. 게시물번호에 해당하는 댓글 수 가져오기
    @Override
    public Integer getReplyCountByR_idx(Integer r_idx) {
        Integer reply = mapper.replyCountByR_idx(r_idx);
        return reply;
    }//getReplyCountByR_idx

    //20. 출석테이블에 언제 출석한지 기록하는 함수
    @Override
    public boolean updateAttendance(HashMap<String, Object> map) {
        log.info("updateAttendance({}) is invoked", "map = " + map);
        Integer affectedRows = 0;
        Integer result = 0;
        Integer afrow;
    
        Objects.requireNonNull(mapper);
        log.info("중간확인 ");
        
        affectedRows = this.mapper.attendanceOkOneByOne(map);
        log.info("affectedRows = {}", affectedRows);
        if(affectedRows==0){
            result = this.mapper.updateAttendance(map);
            afrow = this.mapper.updateTotalAttendance(map);
            log.info("afrow = {}", afrow);
    
            log.info("affectedRows = {}", affectedRows);
        }

        log.info("affectedRows = {}", affectedRows);
    
        
        return result==0?false:true;
    } // updateAttendance

    //21. 가입했는지 체크
    @Override
    public List<ApplyMemberDTO> getMemberByR_idx(Integer r_idx) {

        List<ApplyMemberDTO> applyList = this.mapper.getMemberByR_idx(r_idx);

        return applyList;
    }//getMemberByR_idx

    //22. 스터디 번호로 팀네임 가져오기
    @Override
    public ApplyMemberDTO getTeamName(Integer r_idx){
    
        return this.mapper.getTeamName(r_idx);
    }//getTeamName

    //23. atd 반환
    @Override
    public Integer getAtd(HashMap<String, Object> map){
        log.info("getAtd({}) is invoked", "map = " + map);

        Objects.requireNonNull(mapper);
        return mapper.getAtd(map);
    }//getAtd
}//end class

































