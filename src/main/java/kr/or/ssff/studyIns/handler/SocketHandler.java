package kr.or.ssff.studyIns.handler;

import kr.or.ssff.applyMember.domain.MemberDTO;
import kr.or.ssff.studyIns.service.ChattingService;
import lombok.extern.log4j.Log4j2;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/*
 
 */
@Log4j2
@Component
public class SocketHandler extends TextWebSocketHandler{
    
    
    
    
    //HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
    
    List<HashMap<String, Object>> rls = new ArrayList<>(); //웹소켓 세션을 담아둘 리스트 ---roomListSessions
    
    
    
    private static JSONObject jsonToObjectParser(String jsonStr){
        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        try{
            obj = (JSONObject) parser.parse(jsonStr);
        }catch (ParseException e){
            e.printStackTrace();
        }
        return obj;
    }
    
    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message){
        log.info("handleTextMessage({}) is invoked", "session = " + session + ", message = " + message);
        
        //메시지 발송
        String msg = message.getPayload();
        JSONObject obj = jsonToObjectParser(msg);
        
        log.info("obj = {}", obj);
    
        String rN = (String) obj.get("r_Idx");
        
        HashMap<String, Object> temp = new HashMap<String, Object>();
        
        if (rls.size() > 0){
            for (int i = 0; i < rls.size(); i++){
                String roomNumber = (String) rls.get(i).get("r_Idx"); //세션리스트의 저장된 방번호를 가져와서
                if (roomNumber.equals(rN)){ //같은값의 방이 존재한다면
                    temp = rls.get(i); //해당 방번호의 세션리스트의 존재하는 모든 object값을 가져온다.
                    break;
                }
            }
            
            //해당 방의 세션들만 찾아서 메시지를 발송해준다.
            for (String k : temp.keySet()){
                if (k.equals("r_Idx")){ //다만 방번호일 경우에는 건너뛴다.
                    continue;
                }
                
                WebSocketSession wss = (WebSocketSession) temp.get(k);
                if (wss != null){
                    try{
                        wss.sendMessage(new TextMessage(obj.toJSONString()));
                    }catch (IOException e){
                        e.printStackTrace();
                    }
                }
            }
            
        }
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception{
        log.info("afterConnectionEstablished({}) is invoked", "session = " + session);
        //소켓 연결
        super.afterConnectionEstablished(session);
        boolean flag = false;
        String url = session.getUri().toString();
    
        log.debug(url);
        
        String r_Idx = url.split("/chating/")[1];
        int idx = rls.size(); //방의 사이즈를 조사한다.
        
        if (rls.size() > 0){
            for (int i = 0; i < rls.size(); i++){
                String rN = (String) rls.get(i).get("r_Idx");
                if (rN.equals(r_Idx)){
                    flag = true;
                    idx = i;
                    break;
                }
            }
        }
        
        if (flag){ //존재하는 방이라면 세션만 추가한다.
            
            HashMap<String, Object> map = rls.get(idx);
            map.put(session.getId(), session);
            
            log.info("map = {}", map);
        }else{ //최초 생성하는 방이라면 방번호와 세션을 추가한다.
            
            
            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("r_Idx", r_Idx);
            map.put(session.getId(), session);
            
            log.info("map = {}", map);
            
            rls.add(map);
        }
        
        //세션등록이 끝나면 발급받은 세션ID값의 메시지를 발송한다.
        JSONObject obj = new JSONObject();
        obj.put("type", "getId");
        obj.put("sessionId", session.getId());
        session.sendMessage(new TextMessage(obj.toJSONString()));
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
        log.debug("afterConnectionClosed({}) is invoked", "session = " + session + ", status = " + status);
        
        
        //소켓 종료
        if (rls.size() > 0){ //소켓이 종료되면 해당 세션값들을 찾아서 지운다.
            for (HashMap<String, Object> rl : rls){
                rl.remove(session.getId());
            }
        }
        super.afterConnectionClosed(session, status);
    }
    
} // end class


























