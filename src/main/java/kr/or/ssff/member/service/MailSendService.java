package kr.or.ssff.member.service;

import kr.or.ssff.member.Utils.MailHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

@Service("mss")
public class MailSendService {
    public int size;

    @Autowired
    private JavaMailSenderImpl mailSender;

    //인증키 생성
    private String getKey(int size) {
        this.size = size;
        return getAuthCode();
    }

    //인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }

        return buffer.toString();
    }

    //인증메일 보내기
    public String sendAuthMail(String member_id) {
        //6자리 난수 인증번호 생성
        String authKey = getKey(6);

        //인증메일 보내기
        try {
            MailHandler sendMail = new MailHandler(mailSender);
            sendMail.setSubject("회원가입 이메일 인증");
            sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
                .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
                .append("<a href='http://localhost:8070/member/emailConfirm?member_id=")
                .append(member_id)
                .append("&authKey=")
                .append(authKey)
                .append("' target='_blenk'>이메일 인증 확인</a>")
                .toString());

            sendMail.setFrom("이메일 주소", "관리자");
            sendMail.setTo(member_id);
            sendMail.send();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return authKey;
    }
}