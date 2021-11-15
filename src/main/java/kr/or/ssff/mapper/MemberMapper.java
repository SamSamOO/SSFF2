package kr.or.ssff.mapper;

import kr.or.ssff.member.domain.ApplyMemberDTO;
import kr.or.ssff.member.domain.MemberDTO;
import kr.or.ssff.member.domain.MemberVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


/*
 * 최초 작성자: 신지혜
 * 목적: member DAO (Data Access Object) : 지정된 테이블을 목록 조회, CRUD할 수 있는 메소드를 선언 
 */

@Mapper
public interface MemberMapper {

	//-------------- 장순형 CRUD ---------------//
	//회원가입
	public abstract Integer insertMember(MemberDTO memberDTO)  throws Exception;
	//로그인
	public abstract MemberVO Login(String member_id);
	// 디비에 authkey저장
	public int createAuthkey(String member_id, String authkey) throws Exception;
	// 이메일 인증 후 authstatus 1로  변경
	public void updateAuthstatus(String member_id) throws Exception;


//	// 이메일 중복체크
//	public int idChk(Member member) throws Exception;
//
//	// 닉네임 중복체크
//	public int nameChk(Member member) throws Exception;


	// 1. 특정 스터디의 멤버 조회 : 신지혜 
	public abstract List<ApplyMemberDTO> getApplyMemberList(Integer r_idx);

	// 2. 전체 회원 목록 조회 : 신지혜 
	public abstract List<MemberVO> getMemberList();


	
} // end interface
