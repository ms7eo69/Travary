package com.kosmo.travary.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.kosmo.travary.component.WebSocketServer;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer{
	
	//웹소켓 서버를 생성자 인젝션으로 초기화
	private final WebSocketServer webSocketServer;
	public WebSocketConfig(WebSocketServer webSocketServer) {
		this.webSocketServer= webSocketServer;
	}
	//클리언이언트 접속을 위한 엔드 포인트 설정
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(webSocketServer, "/chat-ws").setAllowedOrigins("*");
	}

}
