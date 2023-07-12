package com.kosmo.travary.component;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

@Component
public class WebSocketServer extends TextWebSocketHandler {
    private Map<String, Set<WebSocketSession>> chatRooms = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String url = session.getUri().getPath();
        String roomId = extractRoomId(url);

        // 해당 방(Room)에 세션 추가
        chatRooms.computeIfAbsent(roomId, key -> ConcurrentHashMap.newKeySet()).add(session);

        System.out.println(session.getId() + " 연결되었습니다.");
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String sessionId = session.getId();
        System.out.println(sessionId + "로부터 받은 메시지: " + message.getPayload());

        String url = session.getUri().getPath();
        String roomId = extractRoomId(url);

        Set<WebSocketSession> roomSessions = chatRooms.get(roomId);
        if (roomSessions != null) {
            // 해당 방(Room)에 있는 모든 세션에게 메시지 전송
            for (WebSocketSession s : roomSessions) {
                if (s.isOpen()) {
                    s.sendMessage(message);
                }
            }
        }
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable e) throws Exception {
        String sessionId = session.getId();
        System.out.println(sessionId + "와 통신장애 발생: " + e.getMessage());
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String sessionId = session.getId();

        // 모든 방(Room)에서 해당 세션 제거
        chatRooms.forEach((roomId, roomSessions) -> roomSessions.remove(session));

        System.out.println(sessionId + " 연결이 끊어졌어요.");
    }

    private String extractRoomId(String url) {
        int index = url.lastIndexOf("=");
        if (index != -1) {
            return url.substring(index + 1);
        }
        return ""; // 기본값을 빈 문자열로 설정
    }

}
