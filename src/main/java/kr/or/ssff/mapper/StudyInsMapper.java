package kr.or.ssff.mapper;

import java.util.List;
import kr.or.ssff.studyIns.domain.StudyInsVO;
import kr.or.ssff.studyIns.model.StudyInsDTO;
import org.springframework.web.multipart.MultipartFile;


/*
 * 최초 작성자: 박상준
 * 목적: StudyIns DAO (Data Access Object) : 지정된 테이블을 목록 조회, CRUD할 수 있는 메소드를 선언
 */
public interface StudyInsMapper {

    public List<StudyInsVO> getList();

    public StudyInsVO read(Integer cont_No);

    public Boolean remove(Integer cont_No);

    public Integer update(StudyInsDTO studyInsDTO);

    public void insert(StudyInsDTO studyInsDTO);

    public void delete(String uuid);


    public List<StudyInsDTO> findByCont_No(Integer cont_No);

    //게시물 생성 .. 파일 보드..
    public Integer insertBoardAndFiles(StudyInsDTO studyInsDTO, MultipartFile[] uploadFiles);

    //cont_No가 가장 높은 게시물 번호 들고옴
    public Integer findMaxContNo();
}
