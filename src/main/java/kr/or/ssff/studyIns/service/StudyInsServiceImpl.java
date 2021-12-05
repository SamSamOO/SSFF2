package kr.or.ssff.studyIns.service;

import kr.or.ssff.mapper.StudyInsMapper;
import kr.or.ssff.studyIns.domain.StudyInsFileVO;
import kr.or.ssff.studyIns.domain.StudyInsVO;
import kr.or.ssff.studyIns.model.ChatMsgDTO;
import kr.or.ssff.studyIns.model.Criteria;
import kr.or.ssff.studyIns.model.StudyInsDTO;
import kr.or.ssff.studyIns.model.StudyInsFileDTO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.*;

/*
 
 */
@AllArgsConstructor
@Log4j2

@Service("studyInsService")
public class StudyInsServiceImpl implements StudyInsService, InitializingBean, DisposableBean{
    
    @Autowired
    private StudyInsMapper mapper;
    
    
    
    @Override
    public List<StudyInsVO> getListByHit(HashMap<String, Object> map){
        log.info("getListByHit({}) is invoked", "map = " + map);
        
        Objects.requireNonNull(mapper);
        
        return this.mapper.getListByHit(map);
    }
    
    /* 게시글중 removedOK 가 'n'인 게시물의 개수를 들고옵니다 (SI_BOARD table)
     * 매개변수: 없음
     * 반환	: 게시물의 갯수
     * 작성자	: 박상준
     */
    
    @Override
    public Integer countArticle(HashMap<String, Object> map){
        log.info("countArticle() is invoked");
        
        Objects.requireNonNull(mapper);
        return this.mapper.countArticle(map);
    }
    
    /* 게시글의 목록을 조회하는 함수입니다. (SI_BOARD table)
     * 매개변수: 없음
     * 반환	: 게시글 리스트
     * 작성자	: 박상준
     */
    
    @Override
    public List<StudyInsVO> getList(HashMap<String, Object> map) throws Exception{
        log.info("getList({}) is invoked", "map = " + map);
        
        Objects.requireNonNull(mapper);
        
        List<StudyInsVO> list = this.mapper.getListWithPaging(map);
        
        log.info("list = {}", list);
        
        return list;
    }
    
    /* 게시물을 조회하는 함수입니다. (SI_BOARD table)
     * 매개변수: 게시물 번호
     * 반환	:  해당 게시물 번호의 게시물 detail
     * 작성자	: 박상준
     */
    
    @Override
    public StudyInsVO get(Integer cont_No) throws Exception{
        log.info("get({}) is invoked", "cont_no = " + cont_No);
        
        Objects.requireNonNull(mapper);
        return mapper.read(cont_No);
    }
    
    /* 게시물 파일 리스트를 조회하는 함수입니다. (SI_BOARD table)
     * 매개변수: 게시물 번호
     * 반환	:  해당 게시물 번호의 게시물 fileList
     * 작성자	: 박상준
     */
    
    @Override
    public List<StudyInsFileVO> getFile(Integer cont_No) throws Exception{
        log.debug("getFile({}) is invoked", "cont_No = " + cont_No);
        
        Objects.requireNonNull(mapper);
        return this.mapper.getFileList(cont_No);
    }
    
    /* 게시물을 삭제하는 함수입니다. (SI_BOARD table)
     * 매개변수: 게시물 번호
     * 반환	:  해당 게시판
     * 작성자	: 박상준
     */
    
    @Override
    public boolean remove(Integer cont_No){
        log.info("remove({}) is invoked", "cont_No = " + cont_No);
        
        Objects.requireNonNull(mapper);
        
        return mapper.remove(cont_No);
    }
    
    /* 게시물을 수정하는 함수입니다. (SI_BOARD table)
     * 매개변수:
     * 반환	:  해당 게시물
     * 작성자	: 박상준
     */
    @Override
    public boolean register(Integer cont_No, StudyInsDTO studyInsDTO, @RequestParam(value = "uploadFile") MultipartFile[] uploadFile){
        log.info("register({}) is invoked", "cont_No = " + cont_No + ", studyInsDTO = " + studyInsDTO + ", uploadFile = " + Arrays.deepToString(uploadFile));
        Objects.requireNonNull(mapper);
        
        studyInsDTO.setCont_No(cont_No);
        /*파일 리스트를 변수에 저장합니다.*/
        List<StudyInsFileDTO> listOfFiles = new ArrayList<>();
        listOfFiles = studyInsDTO.getFileDTO();
    
        
        log.info("listOfFiles = {}", listOfFiles);
        
        /*게시물 내용 저장합니다.*/
        int affectedRows = mapper.insertBoard(studyInsDTO);
        
        log.info("listOfFiles = {}", listOfFiles);
        
        /*게시물 첨부파일을 저장합니다.*/
        if (!listOfFiles.isEmpty()){
            this.mapper.insertFiles(listOfFiles);
    
        }
        
        
        return affectedRows == 1;
    }
    
    /* 게시물을 수정하는 함수입니다. (SI_BOARD table)
     * 매개변수: 게시물 번호
     * 반환	:  해당 게시판
     * 작성자	: 박상준
     */
    @Override
    public boolean modify(Integer cont_No,StudyInsDTO studyInsDTO, @RequestParam(value = "uploadFile") MultipartFile[] uploadFile){
    
        log.info("modify({}) is invoked", "cont_No = " + cont_No + ", studyInsDTO = " + studyInsDTO + ", uploadFile = " + Arrays.deepToString(uploadFile));
        
        Objects.requireNonNull(mapper);
        studyInsDTO.setCont_No(cont_No);
        
        List<StudyInsFileDTO> listOfFiles = new ArrayList<>();
        listOfFiles = studyInsDTO.getFileDTO();
    
        log.info("listOfFiles = {}", listOfFiles);
        int affectedRows = mapper.update(studyInsDTO);
        
        /*파일 삭제후 다시 넣어줘야할 거같습니다....*/
        int deleteFiles = mapper.deleteFiles(studyInsDTO);
        log.info("deleteFiles = {}", deleteFiles);
    
        if (!listOfFiles.isEmpty()){
            this.mapper.insertFiles(listOfFiles);
    
        }
        
        return affectedRows == 1;
    } // modify
    
    @Override
    public Integer updateHit(Integer cont_No) throws Exception{
        log.debug("updateHit({}) is invoked", "cont_No = " + cont_No);
        
        Objects.requireNonNull(mapper);
        
        return this.mapper.updateHit(cont_No);
    }
    
    @Override
    public Integer findMaxContNo(){
        log.debug("findMaxContNo() is invoked" + mapper.findMaxContNo());
        
        Objects.requireNonNull(mapper);
        return mapper.findMaxContNo();
    }
    
    @Override
    public List<StudyInsVO> getListByCategory(Criteria criteria, String filterJSON){
        log.info("getListByCategory({}) is invoked", "criteria = " + criteria + ", filterJSON = " + filterJSON);
        
        Objects.requireNonNull(mapper);
        List<StudyInsVO> list = this.mapper.getListByCategory(criteria, filterJSON);
        
        log.info("list = {}", list);
        
        return list;
    }
    
    /*공지글 보이게하는 함수 -- 상준*/
    @Override
    public List<StudyInsVO> showNotice(HashMap<String, Object> map) throws Exception{
        
        log.info("showNotice({}) is invoked", "map = " + map);
        
        Objects.requireNonNull(mapper);
        List<StudyInsVO> list = this.mapper.showNotice(map);
        
        log.info("list = {}", list);
        
        return list;
    }
    
    /*채팅 리스트 r_Idx 기준으로 불러오기 sendTime 순으로 오름차순으로 불러와야합니다 (100개 까지)*/
    @Override
    public List<ChatMsgDTO> getChatList(Integer r_idx){
        
        log.info("getChatList({}) is invoked", "r_idx = " + r_idx);
        Objects.requireNonNull(mapper);
        List<ChatMsgDTO> list = this.mapper.getChatList(r_idx);
        log.info("list = {}", list);
        
        return list;
    }
    
    @Override
    public void destroy() throws Exception{
        
        log.info("destroy() is invoked");
        
    } // destroy
    
    @Override
    public void afterPropertiesSet() throws Exception{
        
        log.info("afterPropertiesSet() is invoked");
        
    } // afterPropertiesSet
    
} // end class

























