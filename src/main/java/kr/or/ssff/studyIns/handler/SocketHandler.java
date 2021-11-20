package kr.or.ssff.studyIns.handler;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/*

 */
@Log4j2
@Component
public class SocketHandler extends TextWebSocketHandler implements DisposableBean, InitializingBean {

    HashMap<String, WebSocketSession> sessionHashMap = new HashMap<>(); // 웹소켓 세션을 담아둘 맵

    @Override
    public void afterConnectionEstablished(WebSocketSession session,CloseStatus status) throws Exception {
        log.debug("==================================================");
        log.debug("afterConnectionEstablished(session) invoked.");
        log.debug("==================================================");
        log.info("\t+ Websocket connection established successfully.");
        log.info("\t\t+ session: " + session);
        log.info("");

        Objects.requireNonNull(session);

        sessionHashMap.remove(session.getId());
        super.afterConnectionClosed(session,status);
    } // afterConnectionEstablished


    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        //메시지 발송
        String msg = message.getPayload();
        for (String key : sessionHashMap.keySet()) {
            WebSocketSession wss = sessionHashMap.get(key);
            try {
                wss.sendMessage(new TextMessage(msg));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    } // handleTextMessage


    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        log.debug("==================================================");
        log.debug("afterConnectionClosed(session, status) invoked.");
        log.debug("==================================================");
        log.info("\t+ Websocket connection disconnected successfully.");
        log.info("\t\t+ session: " + session);
        log.info("\t\t+ status: " + status);

        super.afterConnectionEstablished(session);

        sessionHashMap.put(session.getId(), session);
    } // afterConnectionClosed

    //===================================================//

    @Override
    public void destroy() throws Exception {
        log.debug("destroy() invoked.");

    } // destroy

    @Override
    public void afterPropertiesSet() throws Exception {
        log.debug("afterPropertiesSet() invoked.");

    } // afterPropertiesSet
} // end class

























