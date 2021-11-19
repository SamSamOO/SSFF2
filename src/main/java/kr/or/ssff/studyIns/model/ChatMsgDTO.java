package kr.or.ssff.studyIns.model;

import java.awt.print.PrinterAbortException;
import java.util.Date;
import lombok.Data;
import org.springframework.jmx.export.annotation.ManagedAttribute;

/*

 */
@Data
public class ChatMsgDTO {

    private Integer msg_No;
    private String member_Name;
    private Integer r_Idx;
    private String msg_Cont;
    private Date send_Time;

}

























