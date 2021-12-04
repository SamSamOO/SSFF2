package kr.or.ssff.studyIns.controller;

import kr.or.ssff.member.domain.MemberDTO;
import kr.or.ssff.studyIns.Utils.UploadFileUtils;
import kr.or.ssff.studyIns.domain.StudyInsFileVO;
import kr.or.ssff.studyIns.domain.StudyInsVO;
import kr.or.ssff.studyIns.model.Criteria;
import kr.or.ssff.studyIns.model.PageDTO;
import kr.or.ssff.studyIns.model.StudyInsDTO;
import kr.or.ssff.studyIns.model.StudyInsFileDTO;
import kr.or.ssff.studyIns.service.ChattingService;
import kr.or.ssff.studyIns.service.StudyInsService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;
import org.apache.commons.logging.LogConfigurationException;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.util.*;

@Log4j2
@AllArgsConstructor

@RequestMapping("/studyIns")
@Controller("studyInsController")

public class StudyInsController implements InitializingBean, DisposableBean{
    ChattingService service1;
    HttpSession session;
    
    @Autowired
    private StudyInsService service;
    
    
    @Override
    public void destroy() throws Exception{
    
    }
    
    @Override
    public void afterPropertiesSet() throws Exception{
    
    }
    
    //-------------------------------- 민주 파일함 --------------------------------//
    
    /*
     * 게시판의 파일함(링크 모음)으로 이동
     * 매개변수: 게시판ID
     * 반환: 게시판의 파일함(링크 모음) 뷰단
     * */
    @GetMapping("/board/fileBox/link")
    public String boardFileBoxLink(String boardId){
        log.debug("boardFileBoxLink({}) is invoked", "boardId = " + boardId);
        
        return "studyIns/board/fileBoxLink";
    } // boardLink
    
    
    /*
     * 게시판의 파일함(기타파일 모음)으로 이동
     * 매개변수: 게시판ID
     * 반환: 게시판의 파일함(기타파일 모음) 뷰단
     * */
    @GetMapping("/board/fileBox/file")
    public String boardFileBoxEctFile(String boardId){
        log.debug("boardFileBoxEctFile({}) is invoked", "boardId = " + boardId);
        
        return "studyIns/board/fileBoxEctFile";
    } // boardEctFile
    
    
    /*
     * 게시판의 파일함(이미지 모음)으로 이동
     * 매개변수: 게시판ID
     * 반환: 게시판의 파일함(이미지 모음) 뷰단
     * */
    @GetMapping("/board/fileBox/photo")
    public String boardFileBoxPhoto(String boardId){
        log.debug("boardFileBoxPhoto({}) is invoked", "boardId = " + boardId);
        
        return "studyIns/board/fileBoxPhoto";
    } // boardPhoto
    
    
    /*
     * 게시판의 파일함(메인)으로 이동
     * 매개변수: 게시판ID
     * 반환: 게시판의 파일함(메인) 뷰단
     * */
    @GetMapping("/board/fileBox")
    public String boardFileBox(String boardId){
        log.debug("boardFileBox({}) is invoked", "boardId = " + boardId);
        
        return "studyIns/board/fileBox";
    } // boardFileBox
    
    /*
     * 채팅방의 파일함(링크 모음)으로 이동
     * 매개변수: 채팅방ID
     * 반환: 채팅방의 파일함(링크 모음) 뷰단
     * */
    @GetMapping("/chatRoom/fileBox/link")
    public String chatRoomFileBoxLink(String chatRoomId){
        log.debug("chatRoomFileBoxLink({}) is invoked", "chatRoomId = " + chatRoomId);
        
        return "studyIns/chatRoom/fileBoxLink";
    } // chatRoomFileBoxLink
    
    
    /*
     * 채팅방의 파일함(기타파일 모음)으로 이동
     * 매개변수: 채팅방ID
     * 반환: 채팅방의 파일함(기타파일 모음) 뷰단
     * */
    @GetMapping("/chatRoom/fileBox/file")
    public String chatRoomFileBoxEctFile(String chatRoomId){
        log.debug("chatRoomFileBoxEctFile({}) is invoked", "chatRoomId = " + chatRoomId);
        
        return "studyIns/chatRoom/fileBoxEctFile";
    } // chatRoomFileBoxEctFile
    
    
    /*
     * 채팅방의 파일함(이미지 모음)으로 이동
     * 매개변수: 채팅방ID
     * 반환: 채팅방의 파일함(이미지 모음) 뷰단
     * */
    @GetMapping("/chatRoom/fileBox/photo")
    public String chatRoomFileBoxPhoto(String chatRoomId){
        log.debug("chatRoomFileBoxPhoto({}) is invoked", "chatRoomId = " + chatRoomId);
        
        return "studyIns/chatRoom/fileBoxPhoto";
    } // chatRoomFileBoxPhoto
    
    
    /*
     * 채팅방의 파일함(메인)으로 이동
     * 매개변수: 채팅방ID
     * 반환: 채팅방의 파일함(메인) 뷰단
     * */
    @GetMapping("/chatRoom/fileBox")
    public String chatRoomFileBox(String chatRoomId){
        log.debug("chatRoomFileBox({}) is invoked", "chatRoomId = " + chatRoomId);
        
        return "studyIns/chatRoom/fileBox";
    } // chatRoomFileBox
    
    //-------------------------------- 상준 스터디메인, 게시판 --------------------------------//
    
    /*
     * 내 챌린지 스터디 메인 화면으로 이동
     * 매개변수: 닉네임, 스터디ID
     * 반환: 내 챌린지 스터디 메인 뷰단
     * */
    @GetMapping("/main/challenge")
    public String challengeMain(String studyId, String nickName){
        log.debug("challengeMain({}) is invoked", "studyId = " + studyId + ", nickName = " + nickName);
        
        return "studyIns/main/challenge";
    } // challengeMain
    
    /*
     * 내 프로젝트 스터디 메인 화면으로 이동
     * 매개변수: 닉네임, 스터디ID
     * 반환: 내 프로젝트 스터디 메인 뷰단
     * */
    @GetMapping("/main/project")
    public String projectMain(String studyId, String nickName){
        log.debug("projectMain({}) is invoked", "studyId = " + studyId + ", nickName = " + nickName);
        
        return "studyIns/main/project";
    } // projectMain
    
    
    /*
     * 내 특정 스터디 게시판 화면으로 이동
     * 매개변수: Model model
     * 반환: 내 특정 스터디 게시판 뷰단임
     * */
    @GetMapping("/board/list")
    public String studyBoardList(@RequestParam(value = "category", defaultValue = "전체") String category, Criteria criteria, @RequestParam("r_Idx") Integer r_Idx, Model model) throws Exception{
        
        log.info("studyBoardList({}) is invoked", "category = " + category + ", criteria = " + criteria + ", model = " + model);
        
        MemberDTO dto = (MemberDTO) session.getAttribute("member");
        
        HashMap<String, Object> map = new HashMap<>();
        map.put("category", category);
        map.put("pageNum", criteria.getPageNum());
        map.put("amount", criteria.getAmount());
        map.put("member", dto);
        map.put("r_Idx", r_Idx);
        log.info("map = {}", map);
        
        Objects.requireNonNull(service);
        List<StudyInsVO> list = service.getList(map);
        log.info("service.getList(criteria) = {}", service.getList(map));
        
        Integer insStudy = this.service1.checkYouInStudy(map);
        log.info("insStudy = {}", insStudy);
        
        model.addAttribute("insStudy", insStudy);
        model.addAttribute("list", list);
        model.addAttribute("map", map);
        model.addAttribute("noticeList", service.showNotice(map));
        model.addAttribute("category", category);
        model.addAttribute("pageMaker", new PageDTO(criteria, service.countArticle(map)));
        
        log.info("criteria = {}", criteria);
        
        return "studyIns/board/list";
    } // studyBoardList
    
    //-------------------------------- 상준 게시물 CRUD--------------------------------//
    
    /*
     * 스터디 게시물 상세 화면으로 이동 -- 상준
     * 매개변수: 게시물번호
     * 반환: X  ( 해당 매핑으로 이동함)
     * */
    @GetMapping("/board/detail")
    public String studyBoardDetail(@RequestParam("cont_No") Integer cont_No, @RequestParam("r_Idx") Integer r_Idx, Model model) throws Exception{
        log.debug("studyBoardDetail({}) is invoked", "cont_no = " + cont_No + ", model = " + model);
        
        MemberDTO dto = (MemberDTO) session.getAttribute("member");
        
        
        HashMap<String, Object> map = new HashMap<>();
        map.put("cont_No", cont_No);
        map.put("r_Idx", r_Idx);
        map.put("member", dto);
        
        Objects.requireNonNull(service);
        //내용물 불러오기
        StudyInsVO detail = service.get(cont_No);
        //조회수 증가 쿼리
        service.updateHit(cont_No);
        
        //파일 들고오기
        List<StudyInsFileVO> listOfFile = service.getFile(cont_No);
        
        //아이디 검증 및 .. 스터디안에 있는지
        Integer insStudy = this.service1.checkYouInStudy(map);
        log.info("insStudy = {}", insStudy);
        
        model.addAttribute("insStudy", insStudy);
        //조회수 순... > 으로 리스트를 들고옵니다..
        List<StudyInsVO> listByHit = service.getListByHit(map);
        
        log.debug("안녕하세요");
        log.debug("detail = {}", detail);
        log.debug("listOfFile = {}", listOfFile);
        
        model.addAttribute("map", map);
        model.addAttribute("insStudy", insStudy);
        
        model.addAttribute("listByHit", listByHit);
        model.addAttribute("detail", detail);
        
        model.addAttribute("fileList", listOfFile);
        return "studyIns/board/detail";
    } // studyBoardDetail
    
    /*
     * 스터디 게시물 삭제
     * 매개변수: 게시물번호
     * 반환: 스터디 게시글 리스트화면.
     * */
    @PostMapping("/board/detail/remove")
    public String studyBoardDetailRemove(@RequestParam("cont_No") Integer cont_No,
        @RequestParam("r_Idx") Integer r_Idx, RedirectAttributes rttrs){
        
        log.info("studyBoardDetailRemove({} , {}) is invoked", "cont_No = " + cont_No, ", rttrs = " + rttrs);
        
        Objects.requireNonNull(service);
        
        if (service.remove(cont_No)){
            rttrs.addFlashAttribute("result", "success");
        } // if
        rttrs.addAttribute("r_Idx", r_Idx);
        return "redirect:/studyIns/board/list";
    } // studyBoardDetailRemove
    
    /*
     * 스터디 게시물 수정페이지 화면으로 이동
     * 매개변수: 게시물번호
     * 반환: 스터디 게시물 수정페이지 뷰단
     * */
    @GetMapping("/board/detail/modifyGo")
    public String studyBoardDetailModifyGo(@RequestParam("r_Idx") Integer r_Idx, @RequestParam Integer cont_No, Model model) throws Exception{
        MemberDTO dto = (MemberDTO) session.getAttribute("member");
        
        HashMap<String, Object> map = new HashMap<>();
        map.put("r_Idx", r_Idx);
        map.put("member", dto);
        
        log.debug("studyBoardDetailModifyGo({}) is invoked", "cont_No = " + cont_No);
        
        Objects.requireNonNull(service);
        StudyInsVO detail = service.get(cont_No);
        List<StudyInsFileVO> listOfFiles = service.getFile(cont_No);
        
        Integer inStudy = service1.checkYouInStudy(map);
        log.info("inStudy = {}", inStudy);
        
        log.debug("modifyDetail = {}", detail);
        
        model.addAttribute("inStudy", inStudy);
        model.addAttribute("detail", detail);
        model.addAttribute("listOfFiles", listOfFiles);
        return "/studyIns/board/modify";
    } // studyBoardDetailModifyGo
    
    /*
     * 스터디 게시물 수정
     * 매개변수: //TODO 게시물vo?DTO?
     * 반환: 스터디 게시물 상세 뷰단
     * */
    @PostMapping("/board/detail/modify")
    public String studyBoardDetailModify(@RequestParam(value = "cont_No", required = false) Integer cont_No, StudyInsDTO studyInsDTO, @RequestParam(value = "uploadFile", required = false) MultipartFile[] uploadFile, RedirectAttributes rttrs){
    
        log.info("studyBoardDetailModify({}) is invoked", "cont_No = " + cont_No + ", studyInsDTO = " + studyInsDTO + ", uploadFile = " + Arrays.deepToString(uploadFile) + ", rttrs = " + rttrs);
        
        String uploadFolder = "C:/temp/upload";
        
        /*폴더 만들기*/
        File uploadPath = new File(uploadFolder);
        log.info("uploadPath = {}", uploadPath);
        
        /*날짜 경로입니다.*/
        String datePath = UploadFileUtils.getFolder();
        log.info("datePath = {}", datePath);
        
        log.debug("upload path : " + uploadPath);
        
        if (!uploadPath.exists()){
            uploadPath.mkdirs();
            
        } // make folder
        //make yyyy/MM/dd folder
        
        /*이미지의 정보를 담는 객체*/
        List<StudyInsFileDTO> list = new ArrayList<>();
        if (uploadFile != null){
            
            for (MultipartFile multipartFile : uploadFile){
                log.debug("------------------------------------");
                log.debug("Upload File Name : " + multipartFile.getOriginalFilename());
                log.debug("Upload File Size : " + multipartFile.getSize());
    
                /*이미지 정보 객체입니다.*/
                StudyInsFileDTO dto = new StudyInsFileDTO();
                dto.setCont_No(cont_No);
    
                String uploadFileName = multipartFile.getOriginalFilename().replace(' ', '_');
    
                dto.setFile_Name(uploadFileName);//3 : fileName
                dto.setUploadPath(uploadPath.toString());//4 : uploadPath
    
                //IE has file path
                uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
                log.debug("only file name : " + uploadFileName);
    
                String uuid = UUID.randomUUID().toString();
                dto.setUuid(uuid); // 5 : uuid
                
                uploadFileName = uuid + "_" + uploadFileName;
                
                File saveFile = new File(uploadPath, uploadFileName);
    
                try{
                    multipartFile.transferTo(saveFile);
                    log.info("saveFile = {}", saveFile);
        
                    //check image type file
                    if (UploadFileUtils.checkImageType(saveFile)){
                        FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
                        Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100); // 오류나서 잠시 막았어용 : 지혜
            
                        thumbnail.close();
                    }
                }catch (Exception e){
                    log.error(e.getMessage());
        
                } // end catch
                log.info("saveFile = {}", saveFile);
                log.info("list = {}", list);
                
                list.add(dto);
            } // end for
            studyInsDTO.setFileDTO(list);
            log.info("studyInsDTO = {}", studyInsDTO);
            
        } // if
    
    
        Objects.requireNonNull(service);
        
        if (service.modify(cont_No,studyInsDTO, uploadFile)){
            rttrs.addFlashAttribute("result", "success");
        }
        
        rttrs.addAttribute("cont_No", studyInsDTO.getCont_No());
        rttrs.addAttribute("r_Idx", studyInsDTO.getR_Idx());
        return "redirect:/studyIns/board/detail";
    } // studyBoardDetailModify
    
    /*
     * 스터디 게시물 생성페이지로 이동
     * 매개변수:
     * 반환: 스터디 게시물 생성페이지 뷰단
     * */
    @GetMapping("/board/postGo")
    public String studyBoardPostGo(@RequestParam("r_Idx") Integer r_Idx, Model model){
        log.info("studyBoardPostGo({}) is invoked", "r_Idx = " + r_Idx + ", model = " + model);
        
        MemberDTO dto = (MemberDTO) session.getAttribute("member");
        
        HashMap<String, Object> map = new HashMap<>();
        map.put("member", dto);
        map.put("r_Idx", r_Idx);
    
        log.info("map = {}", map);
        
        Objects.requireNonNull(service);
        Integer maxNumber = service.findMaxContNo();
        
        log.info("maxNumber = {}", maxNumber);
        Integer inStudy = service1.checkYouInStudy(map);
        log.info("inStudy = {}", inStudy);
        
        model.addAttribute("map", map);
        model.addAttribute("inStudy", inStudy);
        model.addAttribute("cont_No", maxNumber);
        
        return "/studyIns/board/post";
    } // studyBoardPostGo
    
    
    /*
     * 스터디 게시물 생성
     * 매개변수: //TODO 게시물vo?DTO?
     * 반환: 스터디 게시물 상세 뷰단
     * */
    @PostMapping("/board/post")
    public String studyBoardPost(@RequestParam(value = "cont_No", required = false) Integer cont_No, StudyInsDTO studyInsDTO, @RequestParam(value = "uploadFile", required = false) MultipartFile[] uploadFile,
                                 RedirectAttributes rttrs){
        
        log.info("studyBoardPost({}) is invoked", "cont_No = " + cont_No + ", studyInsDTO = " + studyInsDTO + ", uploadFile = " + Arrays.deepToString(uploadFile) + ", rttrs = " + rttrs);
    
    
        String uploadFolder = "C:/temp/upload";
        log.info("uploadFolder = {}", uploadFolder);
        
        /*폴더 만들기*/
        File uploadPath = new File(uploadFolder);
        log.info("uploadPath = {}", uploadPath);
        
        /*날짜 경로입니다.*/
        String datePath = UploadFileUtils.getFolder();
        log.info("datePath = {}", datePath);
        
        log.debug("upload path : " + uploadPath);
        
        if (!uploadPath.exists()){
            uploadPath.mkdirs();
            
        } // make folder
        //make yyyy/MM/dd folder
        
        log.info("uploadFile = {}", (Object) uploadFile);
        
        /*이미지의 정보를 담는 객체*/
        List<StudyInsFileDTO> list = new ArrayList<>();
        if (uploadFile != null){
            for (MultipartFile multipartFile : uploadFile){
                log.debug("------------------------------------");
                log.debug("Upload File Name : " + multipartFile.getOriginalFilename());
                log.debug("Upload File Size : " + multipartFile.getSize());
                
                /*이미지 정보 객체입니다.*/
                StudyInsFileDTO dto = new StudyInsFileDTO();
                dto.setCont_No(cont_No);
                
                String uploadFileName = multipartFile.getOriginalFilename().replace(' ', '_');
                
                dto.setFile_Name(uploadFileName);//3 : fileName
                dto.setUploadPath(uploadPath.toString());//4 : uploadPath
                System.out.println("업로드파일+" + uploadFileName);
                
                //IE has file path
                uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
                
                System.out.println("업로드파일+" + uploadFileName);
                
                log.debug("only file name : " + uploadFileName);
                
                String uuid = UUID.randomUUID().toString();
                dto.setUuid(uuid); // 5 : uuid
                
                uploadFileName = uuid + "_" + uploadFileName;
                
                File saveFile = new File(uploadPath, uploadFileName);
                
                try{
                    multipartFile.transferTo(saveFile);
                    
                    //check image type file
                    if (UploadFileUtils.checkImageType(saveFile)){
                        FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
                        Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100); // 오류나서 잠시 막았어용 : 지혜
                        
                        thumbnail.close();
                    }
                    
                }catch (Exception e){
                    log.error(e.getMessage());
                    
                } // end catch
                list.add(dto);
            } // end for
            studyInsDTO.setFileDTO(list);
            
        } // if
        
        
        Objects.requireNonNull(service);
        
        if (service.register(cont_No, studyInsDTO, uploadFile)){
            rttrs.addFlashAttribute("result", "success");
        } // if
        
        log.debug(service.findMaxContNo());
        
        //리다이렉트 파라미터 값 전송!
        rttrs.addAttribute("cont_No", cont_No);
        rttrs.addAttribute("r_Idx", studyInsDTO.getR_Idx());
        return "redirect:/studyIns/board/detail";
    } // studyBoardPost
    
    
    
    /* //TODO 노필요?
     * 채팅전송
     * 매개변수: 게시물번호
     * 반환: 스터디 게시물 상세 뷰단
     * */
//  @PostMapping("/chatRoom/sendMsg")
//  public String sendMsg(String MsgNo){
//    log.info("sendMsg({}) is invoked","MsgNo = " + MsgNo);
//
//    return "";
//  } // studyBoardPost


}