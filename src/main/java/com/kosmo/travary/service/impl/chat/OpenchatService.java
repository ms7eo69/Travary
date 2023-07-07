package com.kosmo.travary.service.impl.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.kosmo.travary.component.CustomWebSocketHandler;

@Service
public class OpenchatService implements IOpenchatService {

    private final CustomWebSocketHandler customWebSocketHandler;

    @Autowired
    public OpenchatService(CustomWebSocketHandler customWebSocketHandler) {
        this.customWebSocketHandler = customWebSocketHandler;
    }

    @Override
    public void createWebSocketServer(WebSocketSession session) {
        // WebSocket 핸들러에 메시지 전송 예시
        try {
            customWebSocketHandler.handleTextMessage(session, new TextMessage("Hello, WebSocket!"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
