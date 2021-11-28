package kr.or.ssff.applyMember.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Value;

import java.sql.Date;

/*
 * 최초 작성자: 신지혜
 * 목적: apply_member table 관리
 */

/* apply_member table 구조 
APPLY_IDX				NVARCHAR2(25 CHAR)	No		1	참여번호
R_IDX					NUMBER				Yes		2	스터디번호
MEMBER_NAME				NVARCHAR2(20 CHAR)	No		3	닉네임
STUDY_JOIN_ARCIWF		CHAR(1 BYTE)		No	'a' 4	가입상태
STUDY_JOIN_CHANGE_DATE	DATE				Yes		5	최종상태변경일자
STUDY_BOSS_YN			CHAR(1 BYTE)		No	'n' 6	개설자여부
ATTENDANCE_DAYS			NUMBER				Yes		7	누적출석일수
 */
@Value
public class ApplyMemberVO {
	private String apply_idx;
	private Integer r_idx;
	private String member_name;
	private Character study_join_arciwf;
	private Date study_join_change_date;
	private Character study_boss_yn;
	private Integer attendance_days;
	
} // end class

























