package kr.or.ssff.applyMember.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ssff.applyMember.domain.ApplyMemberListVO;
import kr.or.ssff.mapper.ApplyMemberMapper;
import kr.or.ssff.member.domain.MemberVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

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



  /* 특정 스터디의 가입 멤버를 조회 (apply_member table)
   * 매개변수: 스터디 번호
   * 반환	: 스터디 가입 멤버 리스트
   * 작성자	: 신지혜
   */
  @Override
  public List<ApplyMemberListVO> getApplyMemberList(String r_idx) {
    //TODO 추후 클릭하는 스터디로 변경해야해~
    r_idx= "9003";
    log.debug("getApplyMemberList({}) invoked");


    List<ApplyMemberListVO> allApplyMemberList = this.mapper.getApplyMemberList(r_idx);
    log.info("\t + allApplyMemberList:{}", allApplyMemberList);

    return allApplyMemberList;
  } // getApplyMemberList


  /* 특정 스터디의 가입상태를 변경(거절, 승인, 탈퇴, 가입취소, 실패)
   * 매개변수: 스터디 참여번호
   * 반환	:
   * 작성자	: 신지혜
   */
  @Override
  public void applyAction(HashMap<String, String> aMember) {
    log.debug("applyAction({}) invoked", aMember );
    this.mapper.applyAction(aMember);

  } // applyAction

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

