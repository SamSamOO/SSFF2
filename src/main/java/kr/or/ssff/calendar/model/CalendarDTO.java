package kr.or.ssff.calendar.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import lombok.Data;

/*

 */
@Data
public class CalendarDTO {
    private Integer cal_no;
    private Integer r_idx;
    private String member_name;
    private String cal_title;
    private String cal_cont;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    private Date cal_start;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    private Date cal_end;
    private Character allday_ok;
    @JsonFormat(pattern = "HH:mm", timezone = "Asia/Seoul")
    private Date time_start;
    @JsonFormat(pattern = "HH:mm", timezone = "Asia/Seoul")
    private Date time_end;
    private Character removed_ok;
}

























