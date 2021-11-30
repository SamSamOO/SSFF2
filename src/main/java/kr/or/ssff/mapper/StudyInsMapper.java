package kr.or.ssff.mapper;

import java.util.HashMap;
import java.util.List;
import kr.or.ssff.studyIns.domain.StudyInsFileVO;
import kr.or.ssff.studyIns.domain.StudyInsVO;
import kr.or.ssff.studyIns.model.ChatMsgDTO;
import kr.or.ssff.studyIns.model.Criteria;
import kr.or.ssff.studyIns.model.StudyInsDTO;
import kr.or.ssff.studyIns.model.StudyInsFileDTO;
import org.apache.ibatis.annotations.Param;


/*
 * 최초 작성자: 박상준
 * 목적: StudyIns DAO (Data Access Object) : 지정된 테이블을 목록 조회, CRUD할 수 있는 메소드를 선언
 */
public interface StudyInsMapper {
    
    //게시글의 전체 목록 조회
    public List<StudyInsVO> getList(Integer start , Integer end , String searchOption , String keyword);
    
    //페이징 적용 및 카테고리 적용 리스트 출력
    public List<StudyInsVO> getListWithPaging(@Param("map") HashMap<String,Object> map);
    
    public StudyInsVO read(Integer cont_No);
    
    public Boolean remove(Integer cont_No);
    
    public Integer update(StudyInsDTO studyInsDTO);
    
    public void insert(StudyInsDTO studyInsDTO);
    
    public void delete(String uuid);
    
    public List<StudyInsDTO> findByCont_No(Integer cont_No);
    
    //게시물 생성 .. 파일 보드..
    public Integer insertBoard(StudyInsDTO studyInsDTO);
    
    //게시물에 파일 업로드 .. 파일 보드..
    public Integer insertFiles(List<StudyInsFileDTO> list);
    
    //cont_No가 가장 높은 게시물 번호 들고옴
    public Integer findMaxContNo();
    
    //이미지 정보 불러오기 !! !! ㅅㅂ --필요없을지도..?
    public List<StudyInsFileVO> getFileList(Integer cont_No);
    
    //수정 파일 삭제하는 로직입니다. >> 수정때만 유효합니다. (삭제는 일단 살려둬야함)
    public Integer deleteFiles(StudyInsDTO studyInsDTO);
    
    //removedOk 가 n인 게시물의 갯수를 리턴합니다.
    public Integer countArticle(@Param("map") HashMap<String,Object>map);
    
    public List<StudyInsVO> getListByCategory(Criteria criteria, String category);
    
    //조회수 증가 쿼리입니다.
    public Integer updateHit(Integer cont_No);
    
    //공지만 들고옵니다
    public List<StudyInsVO> showNotice(@Param("map") HashMap<String, Object> map);
    
    //채팅 리스트 불러오기
    public List<ChatMsgDTO> getChatList(Integer r_idx);
    
    //조회수 순으로 리스트 불러오기
    public List<StudyInsVO> getListByHit(@Param("map") HashMap<String,Object> map);
}
