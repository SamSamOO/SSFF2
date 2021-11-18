package kr.or.ssff.member.service;

import java.util.List;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ssff.mapper.MemberMapper;
import kr.or.ssff.member.domain.MemberVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

/*
 * 최초 작성자: 신지혜
 * 목적: member service impl
 */


@Log4j2
@AllArgsConstructor

@Service("memberService")
public class MemberServiceImpl implements MemberService, InitializingBean, DisposableBean  {

  @Setter(onMethod_ = @Autowired) // 지우고
  private MemberMapper mapper;


  @Override
  public void insertMember(MemberVO memberVO) {
    log.debug("insertMember({}) is invoked", "memberVO = " + memberVO);

    mapper.insertMember(memberVO);

  }


  @Override
  public boolean register() {
    return false;
  }

  @Override
  public boolean modify() {
    return false;
  }

  @Override
  public boolean remove() {
    return false;
  }

  @Override
  public String get() {
    return null;
  }


  @Override
  public List<String> getListPerPage() {
    return null;
  }




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

