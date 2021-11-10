package kr.or.ssff.studyIns.service;

import kr.or.ssff.studyIns.domain.StudyInsVO;
import kr.or.ssff.studyIns.model.StudyInsDTO;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

/*

 */
public interface StudyInsService {

    //01. 게시글 전체 목록 : 박상준
    public abstract List<StudyInsVO> getList() throws Exception;

    //02. 게시물 조회 : 박상준
    public abstract StudyInsVO get(Integer cont_No) throws Exception;

    //03. 게시물 삭제 : 박상준
    public abstract boolean remove(Integer cont_no);

    //04. 게시물 수정 : 박상준
    public abstract boolean modify(StudyInsDTO studyIns);

    //05. 게시물 등록 : 박상준
    public abstract boolean register(StudyInsDTO studyInsDTO, MultipartFile[] uploadFile);

    //06. 게시물 번호 최대값 들고옴 : 박상준
    public abstract Integer findMaxContNo();

} // end interface

























