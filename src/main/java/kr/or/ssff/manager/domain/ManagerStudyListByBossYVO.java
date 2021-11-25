package kr.or.ssff.manager.domain;

import java.io.PipedReader;
import java.util.Date;
import lombok.Value;

/*

 */
@Value
public class ManagerStudyListByBossYVO {

    private Integer r_Idx;
    private String title;
    private Date writeDate;
    private Date ch_Start;
    private Date ch_End;
    private String ch_Pattern;
    private String sido;
    private String member_Name;
    private Character type_Pc;
    private String teamName;
    private Character dead_Ok;
    private String cont;
    private Character removed_Ok;
    private Character closed_Ok;

}

























