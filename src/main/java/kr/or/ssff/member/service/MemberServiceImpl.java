package kr.or.ssff.member.service;

import java.util.ArrayList;
import java.util.List;

import kr.or.ssff.member.domain.MemberLangVO;
import kr.or.ssff.study.domain.LangVO;
import kr.or.ssff.study.domain.RecruitBoardVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ssff.mapper.MemberMapper;

import kr.or.ssff.member.Utils.MailHandler;
import kr.or.ssff.member.Utils.TempKey;
import kr.or.ssff.member.domain.MemberDTO;
import kr.or.ssff.member.domain.MemberVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


/*
 * 최초 작성자: 신지혜
 * 목적: member service impl;
 */


@Log4j2
@AllArgsConstructor


@Service("memberService")
public class MemberServiceImpl implements MemberService, InitializingBean, DisposableBean  {

    private MemberMapper mapper;

    @Autowired
    private JavaMailSender mailSender;


    // 회원가입 로직(장순형)
    @Override
    public void insertMember(MemberDTO memberDTO) throws Exception{
        log.debug("insertMember({}) is invoked", "memberDTO = " + memberDTO);
        mapper.insertMember(memberDTO);
        log.info("memberDTO = {}", memberDTO);

        // 인증키 생성
        String key = new TempKey().getKey(10, false);
        mapper.createAuthkey(memberDTO.getMember_id(), key);
        log.info("key = {}", key);
        log.info("mailSender = {}", mailSender);

        MailHandler sendMail = new MailHandler(mailSender);
        log.info("sendMail = {}", sendMail);

        sendMail.setSubject("[삼삼오오 회원가입 서비스 이메일 인증 입니다.]");
        sendMail.setText(new StringBuffer().append("<h1>삼삼오오 가입 메일인증 입니다</h1>")
            .append("<a href='http://localhost:8070/member/emailConfirm?member_id=")
            .append(memberDTO.getMember_id()).append("&key=").append(key)
            .append("' target='_blenk'>가입 완료를 위해 이메일 이곳을 눌러주세요</a>").toString());

        sendMail.setFrom("tnsgud2358@naver.com", "SAMSAMOO");
        sendMail.setTo(memberDTO.getMember_id());

        log.info("sendMail = {}", sendMail);
        sendMail.send();

        log.info("sendMail = {}", sendMail);
    }//insertMember

    // 로그인 로직
    @Override
    public MemberDTO Login(MemberDTO memberDTO) {
        log.debug("memberLogin({}) is invoked", memberDTO );

        return mapper.Login(memberDTO);
    }//Login

    // 회원가입후 가입상태를 1로 바꿔주는 로직
    @Override
    public void updateAuthstatus(String member_id) throws Exception {
        mapper.updateAuthstatus(member_id);
    } //updateAuthstatus

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

    //프로필 사진 업로드
    @Override
    public void upload(MemberDTO memberDTO) throws Exception {


    }//upload


    /*--------민주 회원정보-----------*/
    @Override
    public List<LangVO> getLangList() {

        List<LangVO> langlist = this.mapper.getLangList();

        return langlist;
    }//getLangList lang list 전체 가져오기


    @Override
    public boolean registerMemberLang(String member_name, String lang) {
        String affectedRows = mapper.insertlang(member_name, lang);

        return affectedRows == null;
    }// 회원 주력언어 등록


    //멤버 langlist 전체 가져오기
    @Override
    public List<MemberLangVO> getMemberLangList() {
        List<MemberLangVO> memberLangList = this.mapper.getMemberLangList();

        return memberLangList;
    }//getLangList

// 멤버 이름으로 lang 가져오기
    @Override
    public List<MemberLangVO> getLangByMemberByName(String member_name) {
        List<MemberLangVO> memberLangList = new ArrayList<MemberLangVO>();
        memberLangList = this.mapper.getMemberLangs(member_name);
        return memberLangList;
    }//getLangByMemberByName

    //작성후 apply 등록
    @Override
    public boolean registerApply(String member_name) {
        String affectedRows = mapper.insertApply(member_name);

        log.info("\t + affectedRows:{}", affectedRows);

        return affectedRows == null;
    }//registerApply
    
    
    // lang 지우기
    @Override
    public boolean deletelang(String member_name) {
        String affectedRows = mapper.deletelang(member_name);
        return affectedRows !=null;
    }//deleteTag

    @Override
  public boolean register() {
    return false;
  }//register

  @Override
  public boolean modify() {
    return false;
  }//modify

  @Override
  public boolean remove() {
    return false;
  }//remove

  @Override
  public String get() {
    return null;
  } //get


  @Override
  public List<String> getListPerPage() {
    return null;
  }//getListPerPage




  // ------------------------------------------------------------------------------- //

  @Override
  public void destroy() throws Exception {
    // TODO Auto-generated method stub

  } // destroy

  @Override
  public void afterPropertiesSet() throws Exception {
    // TODO Auto-generated method stub

  } //afterPropertiesSet


} // end class