package kr.or.ssff.studyIns.model;

import lombok.Data;

/*

 */
@Data
public class AttachFileDTO {

    private String fileName;
    private String uploadPath;
    private String uuid;
    private Integer cont_No; //해당 글의 번호입니다.
}

























