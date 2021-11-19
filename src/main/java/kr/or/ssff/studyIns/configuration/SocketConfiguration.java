package kr.or.ssff.studyIns.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

/*

 */
@Configuration
@EnableWebSocketMessageBroker
public class SocketConfiguration extends AbstractWebSocketMessageBrokerConfigurer {

    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        //메모리 기반 메세지 브로커가 해당 api를 구독하고 있는 클라이언트에게 메세지를 전달합니다.
        config.enableSimpleBroker("/topic");
        //서버에서 클라이언트로부터의 메세지를 받을 api의 prefix(전치) 를 설정
        config.setApplicationDestinationPrefixes("/app");
    }

    //클라이언트에서 WebSocket을 연결할 api를 설정합니다.
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        //파라메터로 넘겨받는 StompEndpointRegistry 메소드인 addEndpoint() 메소드를 통해서 여러가지의 end point를 설정할 수 있습니다.
        registry.addEndpoint("/websockethandler").withSockJS();
    }
}

























