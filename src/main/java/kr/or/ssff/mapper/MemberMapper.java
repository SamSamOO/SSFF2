package kr.or.ssff.mapper;

import java.util.HashMap;
import kr.or.ssff.member.domain.MemberDTO;

import kr.or.ssff.member.domain.MemberVO;
import org.apache.ibatis.annotations.Mapper;


/*
 * 최초 작성자: 신지혜
 * 목적: member DAO (Data Access Object) : 지정된 테이블을 목록 조회, CRUD할 수 있는 메소드를 선언
 */


public interface MemberMapper {

	//-------------- 장순형 CRUD ---------------//
	//회원가입
	public void insertMember(MemberDTO MemberDTO)  throws Exception;
	//로그인
	public  abstract MemberDTO Login(MemberDTO MemberDTO);
	// 디비에 authkey저장
	public int createAuthkey(String member_id, String authkey) throws Exception;
	// 이메일 인증 후 authstatus 1로  변경
	public void updateAuthstatus(String member_id) throws Exception;
	// 이메일 중복체크
	public int idChk( MemberDTO memberDTO) throws Exception;
	// 닉네임 중복체크
	public int nameChk( MemberDTO memberDTO) throws Exception;
	// 이미지 수정
	public void upload(MemberDTO memberDTO) throws Exception;





} // end interface
