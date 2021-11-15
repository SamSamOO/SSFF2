package kr.or.ssff.mapper;

import java.util.HashMap;
import java.util.List;

import kr.or.ssff.applyMember.domain.ApplyMemberListVO;
import kr.or.ssff.member.domain.MemberVO;


/*
 * 최초 작성자: 신지혜
 * 목적: applyMember DAO (Data Access Object) : 지정된 테이블을 목록 조회, CRUD할 수 있는 메소드를 선언
 */


public interface ApplyMemberMapper {


	//-------------- 신지혜 스터디 참여멤버 관리 ---------------//
	// 특정 스터디의 멤버 조회 : 신지혜
	public abstract List<ApplyMemberListVO> getApplyMemberList(String r_idx);

	// 전체 회원 목록 조회 : 신지혜
	public abstract List<MemberVO> getMemberList();

	// 스터디 참여상태 변경 : 신지혜
	public abstract void applyAction(HashMap<String, String> aMember);


} // end interface
