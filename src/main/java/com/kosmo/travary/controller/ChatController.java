package com.kosmo.travary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.kosmo.travary.component.CustomWebSocketHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("chat")
public class ChatController {

    @Autowired
    private CustomWebSocketHandler customWebSocketHandler;

    @GetMapping("createOpenChat.do")
    public String openChat(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        WebSocketSession webSocketSession = (WebSocketSession) httpSession.getAttribute("webSocketSession");

        if (webSocketSession == null || !webSocketSession.isOpen()) {
            // 웹소켓 세션을 얻는 로직
            webSocketSession = createWebSocketSession(); // WebSocket 세션 생성 로직에 맞게 수정해야 함

            // 웹소켓 세션을 HttpSession에 저장
            httpSession.setAttribute("webSocketSession", webSocketSession);
        }

        // WebSocket 핸들러를 사용하여 메시지 전송
        try {
            customWebSocketHandler.handleTextMessage(webSocketSession, new TextMessage("Hello, WebSocket!"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // WebSocket 세션 생성 로직
    private WebSocketSession createWebSocketSession() {
        // WebSocket 세션 생성 로직을 구현해야 함
        // 예시: customWebSocketHandler.createSession()
        return null;
    }
}