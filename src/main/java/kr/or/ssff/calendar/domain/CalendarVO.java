package kr.or.ssff.calendar.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import lombok.Value;

/*
    쓰지 않음
 */
@Value
public class CalendarVO {
    private Integer cal_no;
    private Integer r_idx;
    private String member_name;
    private String cal_title;
    private String cal_cont;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private Date cal_start;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private Date cal_end;
    private Character allday_ok;
    @JsonFormat(pattern = "HH:mm", timezone = "Asia/Seoul")
    private Date time_start;
    @JsonFormat(pattern = "HH:mm", timezone = "Asia/Seoul")
    private Date time_end;
    private Character removed_ok;
}

























