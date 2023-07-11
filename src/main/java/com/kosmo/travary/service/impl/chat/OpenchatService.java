package com.kosmo.travary.service.impl.chat;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.kosmo.travary.component.WebSocketServer;

@Service
public class OpenchatService {

    private final WebSocketServer webSocketServer;

    @Autowired
    public OpenchatService(WebSocketServer webSocketServer) {
        this.webSocketServer = webSocketServer;
    }

    public String generateChatRoomId() {
        UUID uuid = UUID.randomUUID();
        System.out.println(uuid.toString());
        return uuid.toString();
    }

    public void createWebSocketServer(WebSocketSession session) {
        try {
            // WebSocket 서버 생성 및 메시지 전송
            // 원하는 로직을 구현하세요.
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
