package kr.or.ssff.study.domain;

import lombok.Data;

@Data
public class StudyCriteria {
    private Integer totalPost; //게시글 총 갯수
    private Integer postPerPage; //한페이지내 최대 글 수(default:15)
    private Integer totalPage;// 페이지 총 갯수
    private Integer currentPage;//현재 페이지(default:1)
    private Integer pagePerBlock;//한번에 보여줄 페이지수(default:3)
    private Integer currentBlock;//현재 페이지 영역의 위치
    private Integer totalBlock; //페이지 영역의 총 갯수

    public StudyCriteria(){
        this.postPerPage=15;
        this.pagePerBlock=3;
        this.currentBlock=1;
    }
}//end class
