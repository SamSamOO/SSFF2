package kr.or.ssff.member.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import javax.servlet.http.HttpServletResponse;
import kr.or.ssff.mapper.MemberMapper;
import kr.or.ssff.member.domain.ApplyMemberDTO;
import kr.or.ssff.member.domain.ApplyMemberVO;
import kr.or.ssff.member.domain.MemberVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;

/*
 * 최초 작성자: 신지혜
 * 목적: member service impl 
 */


@Log4j2
@AllArgsConstructor

@Service("memberService")
public class MemberServiceImpl implements MemberService, InitializingBean, DisposableBean  {

  @Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;

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
    public List<String> getListPerPage() {
        return null;
    }

    @Override
    public Integer getTotal() {
        return null;
    }
    
	  /* 특정 스터디의 가입 멤버를 조회 (apply_member table) 
	   * 매개변수: 스터디 번호 
	   * 반환	: 스터디 가입 멤버 리스트 
	   * 작성자	: 신지혜 
	   */
	@Override
	public List<ApplyMemberDTO> getApplyMemberList(String r_idx) {
		//TODO 추후 클릭하는 스터디로 변경해야해~
		r_idx= "9003";
		log.debug("getApplyMemberList({}) invoked");
	
		
		List<ApplyMemberDTO> allApplyMemberList = this.mapper.getApplyMemberList(r_idx);
		log.info("\t + allApplyMemberList:{}", allApplyMemberList);		
		
		return allApplyMemberList; 
	} // getApplyMemberList

  /* 특정 스터디의 가입상태를 변경(거절, 승인, 탈퇴)
   * 매개변수: 스터디 참여번호
   * 반환	:
   * 작성자	: 신지혜
   */
  @Override
  public void applyAction(String r_idx) {
    log.debug("applyAction({}) invoked", r_idx );
    this.mapper.applyAction(r_idx);


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

