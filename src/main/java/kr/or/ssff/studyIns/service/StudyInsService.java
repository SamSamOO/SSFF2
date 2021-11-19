package kr.or.ssff.studyIns.service;

import com.fasterxml.jackson.annotation.ObjectIdGenerators.IntSequenceGenerator;
import javax.swing.plaf.multi.MultiInternalFrameUI;
import kr.or.ssff.studyIns.domain.StudyInsFileVO;
import kr.or.ssff.studyIns.domain.StudyInsVO;
import kr.or.ssff.studyIns.model.ChatMsgDTO;
import kr.or.ssff.studyIns.model.Criteria;
import kr.or.ssff.studyIns.model.StudyInsDTO;

import java.util.List;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/*

 */
public interface StudyInsService {

    //01. 게시글 전체 목록 : 박상준
    public abstract List<StudyInsVO> getList(Criteria criteria, String category) throws Exception;

    //02. 게시물 조회 : 박상준
    public abstract StudyInsVO get(Integer cont_No) throws Exception;

    //03 . 게시물 조회 파일불러오기 : 박상준
    public abstract List<StudyInsFileVO> getFile(Integer cont_No) throws Exception;

    //03. 게시물 삭제 : 박상준
    public abstract boolean remove(Integer cont_no);

    //04. 게시물 수정 : 박상준
    public abstract boolean modify(StudyInsDTO studyIns, @RequestParam(value = "uploadFile") MultipartFile[] uploadFile);

    //05. 게시물 등록 : 박상준
    public abstract boolean register(@RequestParam("cont_No") Integer cont_No, StudyInsDTO studyInsDTO, @RequestParam(value = "uploadFile") MultipartFile[] uploadFile);

    //06. 게시물 번호 최대값 들고옴 : 박상준
    public abstract Integer findMaxContNo();

    //07. removedOk가 n인 게시물의 갯수를 들고옵니다 : 박상준
    public abstract Integer countArticle(String category);

    //08 . 카테고리별 리스트
    public abstract List<StudyInsVO> getListByCategory(Criteria criteria, String filterJSON);

    //09.  조회수 증가
    public abstract Integer updateHit(Integer cont_No) throws Exception;

    //10.  공지글 보이기
    public abstract List<StudyInsVO> showNotice() throws Exception;

    //11. 채팅 리스트 불러오기
    public abstract List<ChatMsgDTO> getChatList(String r_idx);

} // end interface

























