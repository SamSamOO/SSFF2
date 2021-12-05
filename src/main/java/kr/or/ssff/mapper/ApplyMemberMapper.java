package kr.or.ssff.mapper;

import java.util.HashMap;
import java.util.List;

import kr.or.ssff.applyMember.domain.ApplyMemberListVO;
import kr.or.ssff.applyMember.domain.ApplyMemberVO;
import kr.or.ssff.member.domain.MemberVO;


/*
 * 최초 작성자: 신지혜
 * 목적: applyMember DAO (Data Access Object) : 지정된 테이블을 목록 조회, CRUD할 수 있는 메소드를 선언
 */


public interface ApplyMemberMapper {


	public abstract  ApplyMemberVO selectTempApplyMember();

	//-------------- 신지혜 스터디 참여멤버 관리 ---------------//
	// 특정 스터디의 멤버 조회 : 신지혜
	public abstract List<ApplyMemberListVO> getApplyMemberList(HashMap<String, String> r_idx);

	// 전체 회원 목록 조회 : 신지혜
	public abstract List<MemberVO> getMemberList();

	// 스터디 참여상태 변경 : 신지혜
	public abstract Integer applyAction(HashMap<String, String> aMember);


	// 스터디 참여신청(참여번호 생성) : 신지혜
	public abstract Integer insertApply(HashMap<String, Object> aMember);
	
	// 스터디 참여여부확인 : 신지혜
	public abstract String selectApplyMember(HashMap<String, Object> aMember);

	// 참여회원정보 조회
  ApplyMemberVO selectApplyMemberStatus(HashMap<String, Object> aMember);
} // end interface
