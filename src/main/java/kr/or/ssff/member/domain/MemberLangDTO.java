package kr.or.ssff.member.domain;

import lombok.Data;
/*
 * 최초 작성자: 전민주
 * 목적: member_lang table 관리
 */

/* member_lang table 구조
MEMBER_NAME	NVARCHAR2(20 CHAR)	No		1	닉네임
LANG_NAME	NVARCHAR2(20 CHAR)	No		2	언어이름
 */

@Data
public class MemberLangDTO {

    private String member_name;
    private String lang_name;

} // end class