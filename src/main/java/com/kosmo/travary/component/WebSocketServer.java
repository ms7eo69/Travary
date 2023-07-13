package com.kosmo.travary.component;

import org.springframework.stereotype.Component;
import org.springframework.util.MultiValueMap;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

@Component
public class WebSocketServer extends TextWebSocketHandler {
    private Map<String, Set<WebSocketSession>> chatRooms = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String roomId = getRoomId(session);
        System.out.println("roomId:"+roomId);
        System.out.println("session:"+session);
        
        // 해당 방(Room)에 세션 추가
        chatRooms.computeIfAbsent(roomId, key -> ConcurrentHashMap.newKeySet()).add(session);

        System.out.println(session.getId() + " 연결되었습니다.");
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String sessionId = session.getId();
        System.out.println(sessionId + "로부터 받은 메시지: " + message.getPayload());

        String roomId = getRoomId(session);

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
        String roomId = getRoomId(session);

        // 해당 세션을 방(Room)에서 제거
        Set<WebSocketSession> roomSessions = chatRooms.get(roomId);
        if (roomSessions != null) {
            roomSessions.remove(session);
            if (roomSessions.isEmpty()) {
                // 방(Room)에 세션이 없으면 방(Room) 삭제
                chatRooms.remove(roomId);
            }
        }

        System.out.println(sessionId + " 연결이 끊어졌어요.");
    }

    private String getRoomId(WebSocketSession session) {
        UriComponents uriComponents = UriComponentsBuilder.fromUri(session.getUri()).build();
        MultiValueMap<String, String> queryParams = uriComponents.getQueryParams();
        List<String> roomIds = queryParams.get("roomId");
        System.out.println("uriComponents"+uriComponents);
        System.out.println("queryParams"+queryParams);
        System.out.println("session"+session);
        System.out.println("roomIds"+roomIds);
        if (roomIds != null && !roomIds.isEmpty()) {
            return roomIds.get(0);
        }
        return null;
    }

}

