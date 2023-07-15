package com.kosmo.travary.service.impl.chat;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.kosmo.travary.component.WebSocketHandler;

@Service
public class OpenchatService implements IOpenchatService {

    private final WebSocketHandler webSocketHandler;

    public OpenchatService(WebSocketHandler webSocketHandler) {
        this.webSocketHandler = webSocketHandler;
    }

    public void createWebSocketServer(WebSocketSession session) {
        // WebSocket 핸들러에 메시지 전송 예시
        try {
			webSocketHandler.handleTextMessage(session, new TextMessage("Hello, WebSocket!"));
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}