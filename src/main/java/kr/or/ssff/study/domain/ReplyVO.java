package kr.or.ssff.study.domain;

import java.util.Date;
import lombok.Value;

@Value
public class ReplyVO {
    private Integer no;
    private Integer r_idx;
    private String member_name;
    private String c_cont;
    private Date c_date;
    private Character removed_ok;
}
