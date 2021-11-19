package kr.or.ssff.studyIns.handler;

import java.util.Map;
import java.util.Objects;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/*

 */
@Log4j2
@NoArgsConstructor
public class EchoHandler extends TextWebSocketHandler implements DisposableBean, InitializingBean {

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        log.debug("==================================================");
        log.debug("afterConnectionEstablished(session) invoked.");
        log.debug("==================================================");
        log.info("\t+ Websocket connection established successfully.");
        log.info("\t\t+ session: "+ session);
        log.info("");

        Objects.requireNonNull(session);

        //------------------------------------------------------------------//
        // Access to the all attributes binded with current Http Session Scope
        //------------------------------------------------------------------//
        Map<String, Object> sessionAttributes = session.getAttributes();
        sessionAttributes.forEach((key, value) -> {
            log.info("\t\t>> ( key, value ) = ( " + key + ", value: " + value + ")");
        });	// forEach

        sessionAttributes.clear();
        //------------------------------------------------------------------//

        session.sendMessage(new TextMessage("CONNECTION ESTABLISHED [id: " + session.getId() + "]"));
    } // afterConnectionEstablished


    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        log.debug("==================================================");
        log.debug("handleTextMessage(session, message) invoked.");
        log.debug("==================================================");
        log.info("\t+ New text message received successfully.");
        log.info("\t\t+ session: "+ session);
        log.info("\t\t+ message: "+ message);

        log.info("\t\t+ RECV: " + message.getPayload());

        Objects.requireNonNull(session);

        session.sendMessage( new TextMessage( message.getPayload() ) );
    } // handleTextMessage


    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        log.debug("==================================================");
        log.debug("afterConnectionClosed(session, status) invoked.");
        log.debug("==================================================");
        log.info("\t+ Websocket connection disconnected successfully.");
        log.info("\t\t+ session: "+ session);
        log.info("\t\t+ status: "+ status);

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

























