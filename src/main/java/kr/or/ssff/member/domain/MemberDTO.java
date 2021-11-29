package kr.or.ssff.member.domain;

import lombok.Data;

/*
 * 최초 작성자: 신지혜
 * 목적: member table 관리
 */

/* member table 구조 
MEMBER_NO	NUMBER	No		1	회원번호
MEMBER_NAME	NVARCHAR2(20 CHAR)	No		2	닉네임
MEMBER_ID	NVARCHAR2(50 CHAR)	No		3	아이디
MEMBER_PWD	NVARCHAR2(50 CHAR)	No		4	비밀번호
MEMBER_PROFILE	NVARCHAR2(200 CHAR)	No		5	프로필사진
MEMBER_INTRODUCE	NVARCHAR2(500 CHAR)	Yes		6	자기소개
MEMBER_ENABLED	CHAR(1 BYTE)	No	'y' 	7	가입상태
 */

@Data
public class MemberDTO {
	private Integer member_no;
	private String member_name;
	private String member_id;
	private String member_pwd;
	private String member_profile;
	private String member_thumimg;
	private String member_introduce;
	private Character member_enabled;
	private String Authkey;
	private Integer AuthStatus;



} // end class 

























