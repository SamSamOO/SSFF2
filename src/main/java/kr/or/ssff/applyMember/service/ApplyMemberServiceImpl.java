package kr.or.ssff.applyMember.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ssff.applyMember.domain.ApplyMemberVO;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ssff.applyMember.domain.ApplyMemberListVO;
import kr.or.ssff.mapper.ApplyMemberMapper;
import kr.or.ssff.member.domain.MemberVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

/*
 * 최초 작성자: 신지혜
 * 목적: applyMember service 구현
 */


@Log4j2
@AllArgsConstructor

@Service("applyMemberService")
public class ApplyMemberServiceImpl implements ApplyMemberService, InitializingBean, DisposableBean  {

  @Setter(onMethod_ = @Autowired) 
  private ApplyMemberMapper mapper;




  /* 전체 회원리스트를 조회 (member table)
   * 매개변수:
   * 반환	: 전체 회원리스트
   * 작성자	: 신지혜
   */
  @Override
  public List<MemberVO> getMemberList() {
    log.debug("getList() invoked");
    List<MemberVO> memberList = this.mapper.getMemberList();

    return memberList;
  } // getList


  @Override
  public ApplyMemberVO getApplyMember(HashMap<String, Object> aMember) {
    log.debug("getApplyMember({}) invoked", aMember);
    ApplyMemberVO applyMemberVO = this.mapper.selectApplyMemberStatus(aMember);

    return applyMemberVO;
  } // getApplyMember

  /* 특정 스터디의 가입 멤버를 조회 (apply_member table)
   * 매개변수: 스터디 번호
   * 반환	: 스터디 가입 멤버 리스트
   * 작성자	: 신지혜
   */
  @Override
  public List<ApplyMemberListVO> getApplyMemberList(HashMap<String, String> param) {
    //TODO 추후 클릭하는 스터디로 변경해야해~
//    r_idx= "9003";
    log.debug("getApplyMemberList({}) invoked", param);


    List<ApplyMemberListVO> allApplyMemberList = this.mapper.getApplyMemberList(param);
    log.info("\t + allApplyMemberList:{}", allApplyMemberList);

    return allApplyMemberList;
  } // getApplyMemberList


  /* 특정 스터디의 가입상태를 변경(거절, 승인, 탈퇴, 가입취소, 실패)
   * 매개변수: 스터디 참여번호
   * 반환	:
   * 작성자	: 신지혜
   */
  @Override
  public boolean applyAction(HashMap<String, String> aMember) {
    log.debug("applyAction({}) invoked", aMember );
    int result = this.mapper.applyAction(aMember);

    log.info("+\t result:{} ", result
    );
    return result==1;
  } // applyAction

  
  /* 가입신청(참여번호 생성)
   * 매개변수: 스터디 참여번호, 닉네임, 스터디번호
   * 반환	: 닉네임
   * 작성자	: 신지혜
   */
  @Transactional
	@Override
	public String registerApply(HashMap<String, Object> aMember) {
		log.debug("registerApply({}) invoked", aMember);
		String aMemberName = "";
    // 참여멤버에 insert
		Integer num = this.mapper.insertApply(aMember);
		log.info("\t + num({}) ", num);
		
		if(1 == num) { // 잘 insert 했아면
		aMemberName = this.mapper.selectApplyMember(aMember);

    // TODO 이렇게 조회안하고 불린 또는 인티저 일치하면 js에서 세션아이디, 스터디번호 매치해서 비활 고
		} // if 
		log.info("\t + aMemberName({}) ", aMemberName);

    // insert한 닉네임을 반환
		return aMemberName;
	} // registerApply


  // ------------------------------------------------------------------------------- //

  @Override
  public void destroy() throws Exception {
    // TODO Auto-generated method stub

  } // destroy

  @Override
  public void afterPropertiesSet() throws Exception {
    // TODO Auto-generated method stub

  }










} // end 

