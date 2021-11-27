package kr.or.ssff.manager.domain;

/*

 */

import java.sql.Date;
import lombok.Value;

@Value
public class ManagerStudyVO {

    //    스터디 --------------------
    private Integer r_Idx;
    private Character type_Pc;
    private String title;
    private String teamName;
    private String cont;
    private Integer hit;
    private Date writeDate;
    private String sido;
    private String ch_Pattern;
    private Date ch_Start;
    private Date ch_End;
    private Character removed_Ok;
    private Character closed_Ok;
    private Character dead_Ok;

}