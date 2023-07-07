package com.kosmo.travary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.WebSocketSession;

import com.kosmo.travary.component.CustomWebSocketHandler;
import com.kosmo.travary.service.impl.chat.OpenchatService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/chat")
public class ChatController {

    private final OpenchatService openchatService;
    private final CustomWebSocketHandler customWebSocketHandler;

    @Autowired
    public ChatController(OpenchatService openchatService, CustomWebSocketHandler customWebSocketHandler) {
        this.openchatService = openchatService;
        this.customWebSocketHandler = customWebSocketHandler;
    }

    @GetMapping("/createOpenChat.do")
    public String openChat(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        WebSocketSession webSocketSession = (WebSocketSession) httpSession.getAttribute("webSocketSession");

        if (webSocketSession == null || !webSocketSession.isOpen()) {
            // 웹소켓 세션을 얻는 로직
            // 이미 CustomWebSocketHandler에서 웹소켓 세션을 관리하므로 추가 작업은 필요하지 않습니다.
            // HttpSession에서 세션을 가져오는 것으로 충분합니다.
            webSocketSession = (WebSocketSession) httpSession.getAttribute("webSocketSession");

            // 웹소켓 세션을 HttpSession에 저장
            httpSession.setAttribute("webSocketSession", webSocketSession);
        }

        // WebSocket 서버 생성 및 메시지 전송
        openchatService.createWebSocketServer(webSocketSession);

        return "community/OpenChat";
    }
}
