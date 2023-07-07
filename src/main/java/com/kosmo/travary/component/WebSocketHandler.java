package com.kosmo.travary.component;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class WebSocketHandler extends TextWebSocketHandler {

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // 웹소켓으로부터 메시지 수신 시 처리할 로직 작성
        String receivedMessage = message.getPayload();
        System.out.println("WebSocket으로부터 메시지 수신: " + receivedMessage);
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // 웹소켓 연결이 성립된 후 처리할 로직 작성
        System.out.println("WebSocket 연결 성공");
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 웹소켓 연결이 닫힌 후 처리할 로직 작성
        System.out.println("WebSocket 연결 닫힘, 상태 코드: " + status.getCode() + ", 이유: " + status.getReason());
    }

    public void sendMessage(WebSocketSession session, String message) throws Exception {
        // WebSocket 세션으로 메시지 전송
        session.sendMessage(new TextMessage(message));
    }
}
