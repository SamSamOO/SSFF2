package kr.or.ssff.member.service;

import java.util.HashMap;
import kr.or.ssff.mapper.MemberMapper;

import kr.or.ssff.member.Utils.MailHandler;
import kr.or.ssff.member.Utils.TempKey;
import kr.or.ssff.member.domain.ApplyMemberDTO;
import kr.or.ssff.member.domain.ApplyMemberListVO;
import kr.or.ssff.member.domain.MemberDTO;
import kr.or.ssff.member.domain.MemberVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;


import javax.inject.Inject;
import java.util.List;

/*
 * 최초 작성자: 신지혜
 * 목적: member service impl
 */


@Log4j2
@AllArgsConstructor


@Service("memberService")
public class MemberServiceImpl implements MemberService, InitializingBean, DisposableBean  {



    @Setter(onMethod_ = {@Autowired})
    private MemberMapper mapper;
    BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private JavaMailSender mailSender;


    // 회원가입 로직(장순형)
    @Override
    public boolean insertMember(MemberDTO memberDTO) throws Exception{
        log.debug("insertMember({}) is invoked", "memberDTO = " + memberDTO);
        memberDTO.setMember_pwd(passwordEncoder.encode(memberDTO.getMember_pwd()));
        int affectedRows = this.mapper.insertMember(memberDTO);
        // 인증키 생성
        String key = new TempKey().getKey(10, false);
        mapper.createAuthkey(memberDTO.getMember_id(),key );
        MailHandler sendMail = new MailHandler(mailSender);

        sendMail.setSubject("[삼삼오오 회원가입 서비스 이메일 인증 입니다.]");
        sendMail.setText(new StringBuffer().append("<h1>삼삼오오 가입 메일인증 입니다</h1>")
                .append("<a href='http://localhost:8070/member/emailConfirm?member_id=")
                .append(memberDTO.getMember_id()).append("&key=").append(key)
                .append("' target='_blenk'>가입 완료를 위해 이메일 이곳을 눌러주세요</a>").toString());
        sendMail.setFrom("tnsgud2358@naver.com", "SAMSAMOO");
        sendMail.setTo(memberDTO.getMember_id());
        sendMail.send();

        return affectedRows > 0;
    }//insertMember

    // 로그인 로직
    @Override
    public boolean Login(String member_id, String member_pwd) {
        log.debug("memberLogin({}) is invoked",  member_id,member_pwd);
        MemberVO memberVO = this.mapper.Login(member_id,member_pwd);

        return passwordEncoder.matches(member_pwd,memberVO.getMember_pwd());
    }//Login

    // 회원가입후 가입상태를 1로 바꿔주는 로직
    @Override
    public void updateAuthstatus(String member_id) throws Exception {
        mapper.updateAuthstatus(member_id);
    }
    // 아이디 중북체크 로직
    @Override
    public int idChk(MemberDTO memberDTO) throws Exception {
        int result = mapper.idChk(memberDTO);
        return result;

    }//iCHK

    //닉네임 중복체크
    @Override
    public int nameChk(MemberDTO memberDTO) throws Exception {
        int result = mapper.nameChk(memberDTO);
        return result;
    }//nameChk


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

