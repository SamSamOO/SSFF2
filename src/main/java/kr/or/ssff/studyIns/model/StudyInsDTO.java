package kr.or.ssff.studyIns.model;

import java.util.List;
import lombok.Data;

import java.util.Date;

/*

 */
@Data
public class StudyInsDTO {
    
    private Integer cont_No;                 //스터디 글 번호
    private String member_Name;         // 닉네임
    private Integer r_Idx;                      // 스터디의 번호
    private Date write_Date;                // 작성일자
    private Date modify_Date;              // 수정일자
    private Character removed_Ok;       // 삭제여부
    private String cont;                        //내용
    private String category;                //카테고리
    private String title;                        // 글 제목
    private Integer hit;                        //조회수
    
    private List<StudyInsFileDTO> fileDTO;

}

























