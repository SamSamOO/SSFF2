package kr.or.ssff.studyIns.model;

import lombok.Data;

/*

 */
@Data
public class Criteria {

    private int pageNum; // 페이지 번호
    private int amount; // 페이지 출력 개수


    public Criteria() {
        this(1, 20);
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }
}

























