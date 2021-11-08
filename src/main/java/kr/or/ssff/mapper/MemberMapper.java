package kr.or.ssff.mapper;

import kr.or.ssff.member.domain.ApplyMemberDTO;
import kr.or.ssff.member.domain.MemberVO;

import java.util.List;


/*
 * 최초 작성자: 신지혜
 * 목적: member DAO (Data Access Object) : 지정된 테이블을 목록 조회, CRUD할 수 있는 메소드를 선언 
 */


public interface MemberMapper {

	// 1. 특정 스터디의 멤버 조회 : 신지혜 
	public abstract List<ApplyMemberDTO> getApplyMemberList(Integer r_idx);

	// 2. 전체 회원 목록 조회 : 신지혜 
	public abstract List<MemberVO> getMemberList();
	
} // end interface
