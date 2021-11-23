package kr.or.ssff.manager.domain;

/*

 */

import java.sql.Date;
import lombok.Value;

@Value
public class ManagerStudyVO {

    //    스터디 --------------------
    private Integer r_idx;
    private Character type_pc;
    private String title;
    private String teamname;
    private String cont;
    private Integer hit;
    private Date writedate;
    private String sido;
    private String ch_pattern;
    private Date ch_start;
    private Date ch_end;
    private Character removed_ok;
    private Character closed_ok;
    private Character dead_ok;

}