package kr.or.ssff.study.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.sql.Date;
import lombok.Value;

/*
 * 최초 작성자: 신지혜
 * 목적: recruit_board table 관리
 */

/* recruit_board table 구조 
R_IDX		NUMBER				No		1	스터디번호
MEMBER_NAME	NVARCHAR2(20 CHAR)	No		2	닉네임
TYPE_PC		CHAR(1 BYTE)		No		3	스터디타입_pc
TITLE		NVARCHAR2(30 CHAR)	No		4	스터디제목
TEAMNAME	NVARCHAR2(20 CHAR)	No		5	팀이름
CONT		NVARCHAR2(1000 CHAR)No		6	글내용
HIT			NUMBER				No		7	조회수
WRITEDATE	DATE				No		8	작성일시
SIDO		NVARCHAR2(20 CHAR)	Yes		9	챌린지지역
CH_PATTERN	NVARCHAR2(20 CHAR)	Yes		10	챌린지유형
CH_START	DATE				Yes		11	챌린지시작일
CH_END		DATE				Yes		12	챌린지종료일
REMOVED_OK	CHAR(1 BYTE)		No	'n' 	13	삭제여부
CLOSED_OK	CHAR(1 BYTE)		No	'n' 	14	마감여부
DEAD_OK		CHAR(1 BYTE)		No	'n' 	15	종료여부
 */

@Value
public class RecruitBoardJoinReplyVO {
	private Integer r_idx;
	private String member_name;
	private Character type_pc;
	private String title;
	private String teamname;
	private String cont;
	private Integer hit;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date writedate;
	private String sido;
	private String ch_pattern;
	private Date ch_start;
	private Date ch_end;
	private Character removed_ok;
	private Character closed_ok;
	private Character dead_ok;
	private Integer reply_count;
} // end class 

























