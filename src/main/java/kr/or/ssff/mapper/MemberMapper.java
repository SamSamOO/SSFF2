package kr.or.ssff.mapper;

import java.util.HashMap;
import java.util.List;

import kr.or.ssff.member.domain.MemberDTO;

import kr.or.ssff.member.domain.MemberLangVO;
import kr.or.ssff.member.domain.MemberVO;
import kr.or.ssff.study.domain.LangVO;
import kr.or.ssff.study.domain.RecruitBoardVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


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

	//-------------- 민주 CRUD ---------------//
	//lang list 전체 가져오기
	public abstract List<LangVO> getLangList();

	//멤버 한명 가져오기
	public abstract MemberVO get(@Param("member_name") String member_name);

	//회원 이름으로 주력언어 등록하기
	public abstract String insertlang(@Param("member_name") String member_number, @Param("lang") String lang);

	//lang list 전체 가져오기
	public abstract List<MemberLangVO> getMemberLangList();

	//멤버 이름에 해당하는 언어 리스트 가져오기
	public abstract List<MemberLangVO> getMemberLangs(@Param("member_name") String member_name);

	//작성과 동시에 어플라이단에 추가하기
	public abstract String insertApply(@Param("member_name") String member_name);

	//언어 지우기
	public abstract String deletelang(@Param("member_name") String member_name);



} // end interface