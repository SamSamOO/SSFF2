package kr.or.ssff.manager.domain;

/*

 */

import lombok.Value;

import java.sql.Date;

@Value
public class ManagerVO {

//    회원 --------------------
    private Integer member_no;
    private String member_name;
    private String member_id;
    private String member_pwd;
    private String member_profile;
    private String member_introduce;
    private Character member_enabled;

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