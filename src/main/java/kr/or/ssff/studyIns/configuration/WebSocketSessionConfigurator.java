package kr.or.ssff.studyIns.configuration;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

/**
 * 웹 소켓 HTTP 세션 세팅 Configurator
 */
public class WebSocketSessionConfigurator extends Configurator
{
    /**
     * 웹 소켓 세션의 UserProperties에 PRIVATE_HTTP_SESSION 으로 현재 HttpSession을 세팅해준다.
     */
    @Override
    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response)
    {
        HttpSession session = (HttpSession) request.getHttpSession();
        
        if (session != null)
        {
            sec.getUserProperties().put("PRIVATE_HTTP_SESSION", session);
        }
    }
    
}

























