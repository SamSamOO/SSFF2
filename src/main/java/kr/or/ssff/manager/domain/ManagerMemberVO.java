package kr.or.ssff.manager.domain;

/*

 */

import lombok.Value;

import java.sql.Date;

@Value
public class ManagerMemberVO {

//    회원 --------------------
    private Integer member_No;
    private String member_Name;
    private String member_Id;
    private String member_Pwd;
    private String member_Profile;
    private String member_Introduce;
    private Character member_Enabled;
    private String authKey;
    private Integer authStatus;



}