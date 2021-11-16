package kr.or.ssff.study.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import lombok.Value;

@Value
public class ReplyVO {
    private Integer no;
    private Integer r_idx;
    private String member_name;
    private String c_cont;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private Date c_date;
    private Character removed_ok;
}
